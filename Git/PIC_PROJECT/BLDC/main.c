#include <htc.h>
#include <pic16f88.h>
#include "main.h"

//************************************//
//************ -main関数- ************//
//************************************//
void main()
{
	//********** --ポート設定-- **********//
	TRISA = PORTA_IO;	// ポートA I/O
	TRISB = PORTB_IO;	// ポートB I/O
 	ANSEL = PORTA_AN;	// アナログ入力

	ADCS0 = 1;	// AD変換クロック値設定
	ADCS1 = 0;
	ADCS2 = 0;
	VCFG1 = 0;	// 基準電圧はVddとVss
	VCFG0 = 0;
	ADFM = 0;		// AD変換結果を左詰めで格納
	
	//********** -割り込み設定- **********//
	INTCONbits.GIE  = 1;	// Grobal interruptを有効
	INTCONbits.PEIE = 1;	// 外部割り込みを有効

	PIR1bits.TMR1IF = 0;	// Timer1割り込みフラグを落とす
	PIE1bits.TMR1IE = 1;	// Timer1割り込みを有効

 	TMR1 = TIMER_INTERVAL;	// タイマー値をセット
	T1CONbits.T1CKPS = 0;	// プリスケーラを1/1にする
	T1CONbits.TMR1ON = 1;	// Timer1を有効
	
	while (1) {
		//*** 鋸歯波生成 ***//
		g_pwmCount += g_pwmInc;
		if (g_pwmMax <= g_pwmCount) {
			g_pwmCount -= g_pwmMax;
		}

		//*** PWM出力 ***//
		g_pwm = 0;
		if (g_pwmCount < WAVE[0][g_step]) g_pwm |= UP;
		if (WAVE[0][g_step] < -g_pwmCount) g_pwm |= UM;
		
		if (g_pwmCount < WAVE[1][g_step]) g_pwm |= VP;
		if (WAVE[1][g_step] < -g_pwmCount) g_pwm |= VM;
		
		if (g_pwmCount < WAVE[2][g_step]) g_pwm |= WP;
		if (WAVE[2][g_step] < -g_pwmCount) g_pwm |= WM;
		
		PORTB = g_pwm;
	}
}

//************************************//
//************ --AD変換-- ************//
//************************************//
short adc()
{
	// AD変換ポート設定
	CHS0 = 0;
	CHS1 = 0;
	CHS2 = 0;
	
	// AD変換ON
	ADON = 1;
	
	__delay_us(20);		// アクィジョン時間　20us
	ADCON0bits.GO = 1;		// AD変換開始
	while(ADCON0bits.GO);	// 変換完了待ち
	return ADRESH;
}

//************************************//
//************ -割り込み- ************//
//************************************//
static void interrupt intr()
{
	// Timer1割り込みが発生したときに処理
	if (PIR1bits.TMR1IF != 1) { return; }
	
	TMR1 = TIMER_INTERVAL;	// Timer1をリセット
	PIR1bits.TMR1IF = 0;	// 割り込みフラグを落とす
	
	g_tickCount += g_tickInc;
	if (g_tickCount < INTERVAL) { return; }
	g_tickCount -= INTERVAL;
	
	if (g_isStartUp == 1) {
		//*** 強制励磁 ***//	
		g_step = (g_step + 1) % STEPS;
		//*** 加速 ***//
		++g_tickInc;
	}
	else {
		//*** 同期励磁 ***//
		if ((PORTA & SENS_MASK[g_step]) ^ SENS_SIGN[g_step]) {
			//*** 加速 ***//
			++g_tickInc;
			if (INTERVAL < g_tickInc) { g_tickInc = INTERVAL; }
			g_step = (g_step + 1) % STEPS;
		}
		else {
			//*** 減速 ***//
			g_tickInc -= DECELERATION;
		}
	}
	
	//*** 起動・定常切り替え ***//
	if ((g_isStartUp == 1) && (STARTUP_SPEED < g_tickInc)) {
		g_isStartUp = 0;
		g_pwmMax = 64;
		g_pwmInc = 40;
		g_pwmCount = 4;
	}
	else if ((g_isStartUp == 0) && (g_tickInc < RESTART_SPEED)) {
		g_isStartUp = 1;
		g_tickInc = START_SPEED;
		g_pwmMax = 80;
		g_pwmInc = 32;
		g_pwmCount = 4;
		
		PORTB = 0;
		__delay_ms(2000);
	}
}
