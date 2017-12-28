#include <htc.h>
#include <pic16f88.h>
#include "main.h"

//************************************//
//************ -main�֐�- ************//
//************************************//
void main()
{
	//********** --�|�[�g�ݒ�-- **********//
	TRISA = PORTA_IO;	// �|�[�gA I/O
	TRISB = PORTB_IO;	// �|�[�gB I/O
 	ANSEL = PORTA_AN;	// �A�i���O����

	ADCS0 = 1;	// AD�ϊ��N���b�N�l�ݒ�
	ADCS1 = 0;
	ADCS2 = 0;
	VCFG1 = 0;	// ��d����Vdd��Vss
	VCFG0 = 0;
	ADFM = 0;		// AD�ϊ����ʂ����l�߂Ŋi�[
	
	//********** -���荞�ݐݒ�- **********//
	INTCONbits.GIE  = 1;	// Grobal interrupt��L��
	INTCONbits.PEIE = 1;	// �O�����荞�݂�L��

	PIR1bits.TMR1IF = 0;	// Timer1���荞�݃t���O�𗎂Ƃ�
	PIE1bits.TMR1IE = 1;	// Timer1���荞�݂�L��

 	TMR1 = TIMER_INTERVAL;	// �^�C�}�[�l���Z�b�g
	T1CONbits.T1CKPS = 0;	// �v���X�P�[����1/1�ɂ���
	T1CONbits.TMR1ON = 1;	// Timer1��L��
	
	while (1) {
		//*** �����g���� ***//
		g_pwmCount += g_pwmInc;
		if (g_pwmMax <= g_pwmCount) {
			g_pwmCount -= g_pwmMax;
		}

		//*** PWM�o�� ***//
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
//************ --AD�ϊ�-- ************//
//************************************//
short adc()
{
	// AD�ϊ��|�[�g�ݒ�
	CHS0 = 0;
	CHS1 = 0;
	CHS2 = 0;
	
	// AD�ϊ�ON
	ADON = 1;
	
	__delay_us(20);		// �A�N�B�W�������ԁ@20us
	ADCON0bits.GO = 1;		// AD�ϊ��J�n
	while(ADCON0bits.GO);	// �ϊ������҂�
	return ADRESH;
}

//************************************//
//************ -���荞��- ************//
//************************************//
static void interrupt intr()
{
	// Timer1���荞�݂����������Ƃ��ɏ���
	if (PIR1bits.TMR1IF != 1) { return; }
	
	TMR1 = TIMER_INTERVAL;	// Timer1�����Z�b�g
	PIR1bits.TMR1IF = 0;	// ���荞�݃t���O�𗎂Ƃ�
	
	g_tickCount += g_tickInc;
	if (g_tickCount < INTERVAL) { return; }
	g_tickCount -= INTERVAL;
	
	if (g_isStartUp == 1) {
		//*** �����㎥ ***//	
		g_step = (g_step + 1) % STEPS;
		//*** ���� ***//
		++g_tickInc;
	}
	else {
		//*** �����㎥ ***//
		if ((PORTA & SENS_MASK[g_step]) ^ SENS_SIGN[g_step]) {
			//*** ���� ***//
			++g_tickInc;
			if (INTERVAL < g_tickInc) { g_tickInc = INTERVAL; }
			g_step = (g_step + 1) % STEPS;
		}
		else {
			//*** ���� ***//
			g_tickInc -= DECELERATION;
		}
	}
	
	//*** �N���E���؂�ւ� ***//
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
