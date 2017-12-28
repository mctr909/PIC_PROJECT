//************************************//
//************ コンフィグ ************//
//************************************//
#define _XTAL_FREQ 20000000		// クロック周波数
#define TIMER_INTERVAL 0xFEFF 	// TMRモジュールのカウント初期値
#define PORTA_IO 0b00011111		// RA0～RA4入力
#define PORTA_AN 0b00000001		// RA0(AN0)アナログ
#define PORTB_IO 0b00000000		// RB0～RB7出力

__CONFIG(
	FOSC_HS     
	& WDTE_OFF        // watchdogオフ
	& PWRTE_OFF       // Power-up Timer
	& MCLRE_OFF       // MCLRピンを汎用I/Oとして使用
	& BOREN_OFF       // 電圧降下によるリセットオフ
	& LVP_OFF         // Low-Voltage Programmingオフ
	& CPD_OFF         // EEPROM  プロテクトオフ
	& WRT_OFF         // FrashROMプロテクトオフ
	& DEBUG_OFF       // ICDデバッグをオフにする
	& CCPMX_RB0       // RB0をCCPとして使用
);

//************************************//
//************ ---定数--- ************//
//************************************//
#define INTERVAL		5000
#define DECELERATION	5
#define START_SPEED	10
#define STARTUP_SPEED	768
#define RESTART_SPEED	512

#define STEPS			24

// PORTA     76543210
//         0b***UVW**
#define SU 0b00000100
#define SV 0b00001000
#define SW 0b00010000

// PORTB     76543210
//         0b**wWvVuU
#define UP 0b00000001
#define UM 0b00000010
#define VP 0b00000100
#define VM 0b00001000
#define WP 0b00010000
#define WM 0b00100000

//************************************//
//************ グローバル ************//
//************************************//
const signed char WAVE[3][STEPS] = { {
	 61, 62, 63, 60, 48, 27,  0,-27,
	-48,-60,-63,-62,-61,-62,-63,-60,
	-48,-27,  0, 27, 48, 60, 63, 62
}, {
	-48,-60,-63,-62,-61,-62,-63,-60,
	-48,-27,  0, 27, 48, 60, 63, 62,
	 61, 62, 63, 60, 48, 27,  0,-27
}, {
	-48,-27,  0, 27, 48, 60, 63, 62,
	 61, 62, 63, 60, 48, 27,  0,-27,
	-48,-60,-63,-62,-61,-62,-63,-60
} };

const unsigned char SENS_MASK[STEPS] = {
	SU, SU, SV, SV, SV, SV, SW, SW,
	SW, SW, SU, SU, SU, SU, SV, SV,
	SV, SV, SW, SW, SW, SW, SU, SU
};

const unsigned char SENS_SIGN[STEPS] = {
	 0,  0, SV, SV, SV, SV,  0,  0,
	 0,  0, SU, SU, SU, SU,  0,  0,
	 0,  0, SW, SW, SW, SW,  0,  0
};

char		g_pwmCount	= 4;
char		g_pwmMax		= 80;
char		g_pwmInc		= 32;
char		g_pwm		= 0;
char		g_step		= 0;
char		g_isStartUp	= 1;

short		g_tickCount	= 0;
short		g_tickInc		= START_SPEED;
