//************************************//
//************ �R���t�B�O ************//
//************************************//
#define _XTAL_FREQ 20000000		// �N���b�N���g��
#define TIMER_INTERVAL 0xFEFF 	// TMR���W���[���̃J�E���g�����l
#define PORTA_IO 0b00011111		// RA0�`RA4����
#define PORTA_AN 0b00000001		// RA0(AN0)�A�i���O
#define PORTB_IO 0b00000000		// RB0�`RB7�o��

__CONFIG(
	FOSC_HS     
	& WDTE_OFF        // watchdog�I�t
	& PWRTE_OFF       // Power-up Timer
	& MCLRE_OFF       // MCLR�s����ėpI/O�Ƃ��Ďg�p
	& BOREN_OFF       // �d���~���ɂ�郊�Z�b�g�I�t
	& LVP_OFF         // Low-Voltage Programming�I�t
	& CPD_OFF         // EEPROM  �v���e�N�g�I�t
	& WRT_OFF         // FrashROM�v���e�N�g�I�t
	& DEBUG_OFF       // ICD�f�o�b�O���I�t�ɂ���
	& CCPMX_RB0       // RB0��CCP�Ƃ��Ďg�p
);

//************************************//
//************ ---�萔--- ************//
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
//************ �O���[�o�� ************//
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
