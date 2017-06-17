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
#define INTERVAL		10000
#define ACCELERATION	3
#define DECELERATION	2
#define STARTUP_SPEED	256
#define RESTART_SPEED	192

#define STEPS			12

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
const char WAVE[STEPS] = {
	UP|VM, UP|VM, //  1,-1, 0
	WP|VM, WP|VM, //  0,-1, 1
	WP|UM, WP|UM, // -1, 0, 1
	VP|UM, VP|UM, // -1, 1, 0
	VP|WM, VP|WM, //  0, 1,-1
	UP|WM, UP|WM  //  1, 0,-1
};

const char SENS_MASK[STEPS] = {
	SU,     //  0, 1,-1
	SV, SV, //  1, 0,-1
	SW, SW, //  1,-1, 0
	SU, SU, //  0,-1, 1
	SV, SV, // -1, 0, 1
	SW, SW, // -1, 1, 0
	SU      //  0, 1,-1
};

const char SENS_SIGN[STEPS] = {
	 0,     //  0, 1,-1
	SV, SV, //  1, 0,-1
	 0,  0, //  1,-1, 0
	SU, SU, //  0,-1, 1
	 0,  0, // -1, 0, 1
	SW, SW, // -1, 1, 0
	 0      //  0, 1,-1
};

char		g_pwmMax		= 8;
char		g_pwmCount	= 0;
char		g_step		= 0;
char		g_isStartUp	= 1;

short		g_tickInc		= 16;
short		g_tickCount	= 0;
