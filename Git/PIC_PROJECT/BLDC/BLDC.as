opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 7117"

opt pagewidth 120

	opt lm

	processor	16F88
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 10 "C:\Users\owner\Desktop\Git\PIC_PROJECT\BLDC\main.h"
	psect config,class=CONFIG,delta=2 ;#
# 10 "C:\Users\owner\Desktop\Git\PIC_PROJECT\BLDC\main.h"
	dw 0xFFEE & 0xFFFB & 0xFFFF & 0xFFDF & 0xFFBF & 0xFF7F & 0xFFFF & 0xFFFF & 0xFFFF & 0xFFFF ;#
	FNROOT	_main
	FNCALL	_intr,___awmod
	FNCALL	intlevel1,_intr
	global	intlevel1
	FNROOT	intlevel1
	global	_g_tickInc
	global	_g_isStartUp
	global	_g_pwmMax
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\Users\owner\Desktop\Git\PIC_PROJECT\BLDC\main.h"
	line	90

;initializer for _g_tickInc
	retlw	010h
	retlw	0

	line	84

;initializer for _g_isStartUp
	retlw	01h
	line	81

;initializer for _g_pwmMax
	retlw	08h
	global	_SENS_MASK
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	file	"C:\Users\owner\Desktop\Git\PIC_PROJECT\BLDC\main.h"
	line	61
_SENS_MASK:
	retlw	04h
	retlw	08h
	retlw	08h
	retlw	010h
	retlw	010h
	retlw	04h
	retlw	04h
	retlw	08h
	retlw	08h
	retlw	010h
	retlw	010h
	retlw	04h
	global	_SENS_SIGN
psect	strings
	file	"C:\Users\owner\Desktop\Git\PIC_PROJECT\BLDC\main.h"
	line	71
_SENS_SIGN:
	retlw	0
	retlw	08h
	retlw	08h
	retlw	0
	retlw	0
	retlw	04h
	retlw	04h
	retlw	0
	retlw	0
	retlw	010h
	retlw	010h
	retlw	0
	global	_WAVE
psect	strings
	file	"C:\Users\owner\Desktop\Git\PIC_PROJECT\BLDC\main.h"
	line	52
_WAVE:
	retlw	09h
	retlw	09h
	retlw	018h
	retlw	018h
	retlw	012h
	retlw	012h
	retlw	06h
	retlw	06h
	retlw	024h
	retlw	024h
	retlw	021h
	retlw	021h
	global	_SENS_MASK
	global	_SENS_SIGN
	global	_WAVE
	global	_g_tickCount
	global	_g_pwmCount
	global	_g_step
	global	_g_u
	global	_g_v
	global	_g_w
	global	_TMR1
_TMR1	set	14
	global	_ADCON0bits
_ADCON0bits	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_INTCONbits
_INTCONbits	set	11
	global	_PIR1bits
_PIR1bits	set	12
	global	_PORTA
_PORTA	set	5
	global	_PORTB
_PORTB	set	6
	global	_T1CONbits
_T1CONbits	set	16
	global	_ADCS0
_ADCS0	set	254
	global	_ADCS1
_ADCS1	set	255
	global	_ADON
_ADON	set	248
	global	_CHS0
_CHS0	set	251
	global	_CHS1
_CHS1	set	252
	global	_CHS2
_CHS2	set	253
	global	_RB0
_RB0	set	48
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_RB3
_RB3	set	51
	global	_RB4
_RB4	set	52
	global	_RB5
_RB5	set	53
	global	_ANSEL
_ANSEL	set	155
	global	_PIE1bits
_PIE1bits	set	140
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_ADCS2
_ADCS2	set	1278
	global	_ADFM
_ADFM	set	1279
	global	_VCFG0
_VCFG0	set	1276
	global	_VCFG1
_VCFG1	set	1277
	file	"BLDC.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_g_tickCount:
       ds      2

_g_pwmCount:
       ds      1

_g_step:
       ds      1

_g_u:
       ds      1

_g_v:
       ds      1

_g_w:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\Users\owner\Desktop\Git\PIC_PROJECT\BLDC\main.h"
	line	90
_g_tickInc:
       ds      2

psect	dataBANK0
	file	"C:\Users\owner\Desktop\Git\PIC_PROJECT\BLDC\main.h"
	line	84
_g_isStartUp:
       ds      1

psect	dataBANK0
	file	"C:\Users\owner\Desktop\Git\PIC_PROJECT\BLDC\main.h"
	line	81
_g_pwmMax:
       ds      1

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
	clrf	((__pbssBANK0)+6)&07Fh
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
	fcall	__pidataBANK0+2		;fetch initializer
	movwf	__pdataBANK0+2&07fh		
	fcall	__pidataBANK0+3		;fetch initializer
	movwf	__pdataBANK0+3&07fh		
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_intr
?_intr:	; 0 bytes @ 0x0
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x0
	ds	2
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x2
	ds	2
	global	??___awmod
??___awmod:	; 0 bytes @ 0x4
	ds	1
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x5
	ds	1
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x6
	ds	1
	global	??_intr
??_intr:	; 0 bytes @ 0x7
	ds	7
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_main
??_main:	; 0 bytes @ 0x0
	ds	5
;;Data sizes: Strings 0, constant 36, data 4, bss 7, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80      5      16
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___awmod	int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _intr in COMMON
;;
;;   _intr->___awmod
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _intr in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _intr in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _intr in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _intr in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 5, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 5     5      0       0
;;                                              0 BANK0      5     5      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 0
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (1) _intr                                                 7     7      0     296
;;                                              7 COMMON     7     7      0
;;                            ___awmod
;; ---------------------------------------------------------------------------------
;; (2) ___awmod                                              7     3      4     296
;;                                              0 COMMON     7     3      4
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;
;; _intr (ROOT)
;;   ___awmod
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0       0       9        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      22      12        0.0%
;;ABS                  0      0      1E       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       4       2        0.0%
;;BANK0               50      5      10       5       20.0%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      E       E       1      100.0%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 9 in file "C:\Users\owner\Desktop\Git\PIC_PROJECT\BLDC\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       5       0       0       0
;;      Totals:         0       5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\owner\Desktop\Git\PIC_PROJECT\BLDC\main.c"
	line	9
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0]
	line	11
	
l1999:	
;main.c: 11: TRISA = 0b00011111;
	movlw	(01Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	12
	
l2001:	
;main.c: 12: TRISB = 0b00000000;
	clrf	(134)^080h	;volatile
	line	13
	
l2003:	
;main.c: 13: ANSEL = 0b00000001;
	movlw	(01h)
	movwf	(155)^080h	;volatile
	line	15
	
l2005:	
;main.c: 15: ADCS0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(254/8),(254)&7
	line	16
	
l2007:	
;main.c: 16: ADCS1 = 0;
	bcf	(255/8),(255)&7
	line	17
	
l2009:	
;main.c: 17: ADCS2 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1278/8)^080h,(1278)&7
	line	18
	
l2011:	
;main.c: 18: VCFG1 = 0;
	bcf	(1277/8)^080h,(1277)&7
	line	19
	
l2013:	
;main.c: 19: VCFG0 = 0;
	bcf	(1276/8)^080h,(1276)&7
	line	20
	
l2015:	
;main.c: 20: ADFM = 0;
	bcf	(1279/8)^080h,(1279)&7
	line	23
	
l2017:	
;main.c: 23: INTCONbits.GIE = 1;
	bsf	(11),7	;volatile
	line	24
	
l2019:	
;main.c: 24: INTCONbits.PEIE = 1;
	bsf	(11),6	;volatile
	line	26
	
l2021:	
;main.c: 26: PIR1bits.TMR1IF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(12),0	;volatile
	line	27
	
l2023:	
;main.c: 27: PIE1bits.TMR1IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(140)^080h,0	;volatile
	line	29
	
l2025:	
;main.c: 29: TMR1 = 0xFEFF;
	movlw	low(0FEFFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(14)	;volatile
	movlw	high(0FEFFh)
	movwf	((14))+1	;volatile
	line	30
	
l2027:	
;main.c: 30: T1CONbits.T1CKPS = 0;
	movlw	((0 & ((1<<2)-1))<<4)|not (((1<<2)-1)<<4)
	andwf	(16),f	;volatile
	line	31
	
l2029:	
;main.c: 31: T1CONbits.TMR1ON = 1;
	bsf	(16),0	;volatile
	goto	l2031
	line	33
;main.c: 33: while (1) {
	
l657:	
	line	35
	
l2031:	
;main.c: 35: ++g_pwmCount;
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(_g_pwmCount),f
	line	36
	
l2033:	
;main.c: 36: if (g_pwmMax <= g_pwmCount) { g_pwmCount -= g_pwmMax; }
	movf	(_g_pwmMax),w
	subwf	(_g_pwmCount),w
	skipc
	goto	u2431
	goto	u2430
u2431:
	goto	l2037
u2430:
	
l2035:	
	movf	(_g_pwmMax),w
	subwf	(_g_pwmCount),f
	goto	l2037
	
l658:	
	line	39
	
l2037:	
;main.c: 39: RB0 = g_u > g_pwmCount;
	movf	(_g_u),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	btfsc	(??_main+0)+0,7
	decf	(??_main+0)+0+1,f
	movf	1+(??_main+0)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u2445
	movf	0+(??_main+0)+0,w
	subwf	(_g_pwmCount),w
u2445:

	skipc
	goto	u2441
	goto	u2440
	
u2441:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(48/8),(48)&7
	goto	u2454
u2440:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(48/8),(48)&7
u2454:
	line	40
	
l2039:	
;main.c: 40: RB1 = g_u < -g_pwmCount;
	movf	(_g_pwmCount),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	comf	(??_main+0)+0,f
	comf	(??_main+0)+1,f
	incf	(??_main+0)+0,f
	skipnz
	incf	(??_main+0)+1,f
	movf	(_g_u),w
	movwf	(??_main+2)+0
	clrf	(??_main+2)+0+1
	btfsc	(??_main+2)+0,7
	decf	(??_main+2)+0+1,f
	movf	1+(??_main+2)+0,w
	xorlw	80h
	movwf	(??_main+4)+0
	movf	1+(??_main+0)+0,w
	xorlw	80h
	subwf	(??_main+4)+0,w
	skipz
	goto	u2465
	movf	0+(??_main+0)+0,w
	subwf	0+(??_main+2)+0,w
u2465:

	skipc
	goto	u2461
	goto	u2460
	
u2461:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(49/8),(49)&7
	goto	u2474
u2460:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(49/8),(49)&7
u2474:
	line	41
;main.c: 41: RB2 = g_v > g_pwmCount;
	movf	(_g_v),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	btfsc	(??_main+0)+0,7
	decf	(??_main+0)+0+1,f
	movf	1+(??_main+0)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u2485
	movf	0+(??_main+0)+0,w
	subwf	(_g_pwmCount),w
u2485:

	skipc
	goto	u2481
	goto	u2480
	
u2481:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(50/8),(50)&7
	goto	u2494
u2480:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(50/8),(50)&7
u2494:
	line	42
	
l2041:	
;main.c: 42: RB3 = g_v < -g_pwmCount;
	movf	(_g_pwmCount),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	comf	(??_main+0)+0,f
	comf	(??_main+0)+1,f
	incf	(??_main+0)+0,f
	skipnz
	incf	(??_main+0)+1,f
	movf	(_g_v),w
	movwf	(??_main+2)+0
	clrf	(??_main+2)+0+1
	btfsc	(??_main+2)+0,7
	decf	(??_main+2)+0+1,f
	movf	1+(??_main+2)+0,w
	xorlw	80h
	movwf	(??_main+4)+0
	movf	1+(??_main+0)+0,w
	xorlw	80h
	subwf	(??_main+4)+0,w
	skipz
	goto	u2505
	movf	0+(??_main+0)+0,w
	subwf	0+(??_main+2)+0,w
u2505:

	skipc
	goto	u2501
	goto	u2500
	
u2501:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(51/8),(51)&7
	goto	u2514
u2500:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(51/8),(51)&7
u2514:
	line	43
	
l2043:	
;main.c: 43: RB4 = g_w > g_pwmCount;
	movf	(_g_w),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	btfsc	(??_main+0)+0,7
	decf	(??_main+0)+0+1,f
	movf	1+(??_main+0)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u2525
	movf	0+(??_main+0)+0,w
	subwf	(_g_pwmCount),w
u2525:

	skipc
	goto	u2521
	goto	u2520
	
u2521:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(52/8),(52)&7
	goto	u2534
u2520:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(52/8),(52)&7
u2534:
	line	44
;main.c: 44: RB5 = g_w < -g_pwmCount;
	movf	(_g_pwmCount),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	comf	(??_main+0)+0,f
	comf	(??_main+0)+1,f
	incf	(??_main+0)+0,f
	skipnz
	incf	(??_main+0)+1,f
	movf	(_g_w),w
	movwf	(??_main+2)+0
	clrf	(??_main+2)+0+1
	btfsc	(??_main+2)+0,7
	decf	(??_main+2)+0+1,f
	movf	1+(??_main+2)+0,w
	xorlw	80h
	movwf	(??_main+4)+0
	movf	1+(??_main+0)+0,w
	xorlw	80h
	subwf	(??_main+4)+0,w
	skipz
	goto	u2545
	movf	0+(??_main+0)+0,w
	subwf	0+(??_main+2)+0,w
u2545:

	skipc
	goto	u2541
	goto	u2540
	
u2541:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(53/8),(53)&7
	goto	u2554
u2540:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(53/8),(53)&7
u2554:
	goto	l2031
	line	45
	
l659:	
	line	33
	goto	l2031
	
l660:	
	line	46
	
l661:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_intr
psect	text104,local,class=CODE,delta=2
global __ptext104
__ptext104:

;; *************** function _intr *****************
;; Defined at:
;;		line 71 in file "C:\Users\owner\Desktop\Git\PIC_PROJECT\BLDC\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          7       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___awmod
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text104
	file	"C:\Users\owner\Desktop\Git\PIC_PROJECT\BLDC\main.c"
	line	71
	global	__size_of_intr
	__size_of_intr	equ	__end_of_intr-_intr
	
_intr:	
	opt	stack 6
; Regs used in _intr: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	movf	status,w
	movwf	(??_intr+3)
	movf	fsr0,w
	movwf	(??_intr+4)
	movf	pclath,w
	movwf	(??_intr+5)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_intr+6)
	ljmp	_intr
psect	text104
	line	73
	
i1l2045:	
;main.c: 73: if (PIR1bits.TMR1IF != 1) { return; }
	btfsc	(12),0	;volatile
	goto	u256_21
	goto	u256_20
u256_21:
	goto	i1l2049
u256_20:
	goto	i1l671
	
i1l2047:	
	goto	i1l671
	
i1l670:	
	line	75
	
i1l2049:	
;main.c: 75: TMR1 = 0xFEFF;
	movlw	low(0FEFFh)
	movwf	(14)	;volatile
	movlw	high(0FEFFh)
	movwf	((14))+1	;volatile
	line	76
	
i1l2051:	
;main.c: 76: PIR1bits.TMR1IF = 0;
	bcf	(12),0	;volatile
	line	78
;main.c: 78: g_tickCount += g_tickInc;
	movf	(_g_tickInc),w
	addwf	(_g_tickCount),f
	skipnc
	incf	(_g_tickCount+1),f
	movf	(_g_tickInc+1),w
	addwf	(_g_tickCount+1),f
	line	79
	
i1l2053:	
;main.c: 79: if (g_tickCount < 10000) { return; }
	movf	(_g_tickCount+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(02710h))^80h
	subwf	btemp+1,w
	skipz
	goto	u257_25
	movlw	low(02710h)
	subwf	(_g_tickCount),w
u257_25:

	skipnc
	goto	u257_21
	goto	u257_20
u257_21:
	goto	i1l2057
u257_20:
	goto	i1l671
	
i1l2055:	
	goto	i1l671
	
i1l672:	
	line	80
	
i1l2057:	
;main.c: 80: g_tickCount -= 10000;
	movlw	low(-10000)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_g_tickCount),f
	skipnc
	incf	(_g_tickCount+1),f
	movlw	high(-10000)
	addwf	(_g_tickCount+1),f
	line	82
;main.c: 82: if (g_isStartUp == 1) {
	movf	(_g_isStartUp),w
	xorlw	01h
	skipz
	goto	u258_21
	goto	u258_20
u258_21:
	goto	i1l2063
u258_20:
	line	85
	
i1l2059:	
;main.c: 85: g_tickInc += 5;
	movlw	low(05h)
	addwf	(_g_tickInc),f
	skipnc
	incf	(_g_tickInc+1),f
	movlw	high(05h)
	addwf	(_g_tickInc+1),f
	line	86
	
i1l2061:	
;main.c: 86: g_step = (g_step + 1) % 12;
	movlw	low(0Ch)
	movwf	(?___awmod)
	movlw	high(0Ch)
	movwf	((?___awmod))+1
	movf	(_g_step),w
	addlw	low(01h)
	movwf	0+(?___awmod)+02h
	movlw	high(01h)
	skipnc
	movlw	(high(01h)+1)&0ffh
	movwf	(0+(?___awmod)+02h)+1
	fcall	___awmod
	movf	(0+(?___awmod)),w
	movwf	(??_intr+0)+0
	movf	(??_intr+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_g_step)
	line	87
;main.c: 87: }
	goto	i1l674
	line	88
	
i1l673:	
	line	90
	
i1l2063:	
;main.c: 88: else {
;main.c: 90: if ((PORTA & SENS_MASK[g_step]) ^ SENS_SIGN[g_step]) {
	movf	(_g_step),w
	addlw	low((_SENS_SIGN-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(??_intr+0)+0
	movf	(_g_step),w
	addlw	low((_SENS_MASK-__stringbase))
	movwf	fsr0
	fcall	stringdir
	andwf	(5),w	;volatile
	xorwf	(??_intr+0)+0,w
	btfsc	status,2
	goto	u259_21
	goto	u259_20
u259_21:
	goto	i1l2073
u259_20:
	line	92
	
i1l2065:	
;main.c: 92: g_tickInc += 5;
	movlw	low(05h)
	addwf	(_g_tickInc),f
	skipnc
	incf	(_g_tickInc+1),f
	movlw	high(05h)
	addwf	(_g_tickInc+1),f
	line	93
	
i1l2067:	
;main.c: 93: if (10000 < g_tickInc) { g_tickInc = 10000; }
	movf	(_g_tickInc+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(02711h))^80h
	subwf	btemp+1,w
	skipz
	goto	u260_25
	movlw	low(02711h)
	subwf	(_g_tickInc),w
u260_25:

	skipc
	goto	u260_21
	goto	u260_20
u260_21:
	goto	i1l2071
u260_20:
	
i1l2069:	
	movlw	low(02710h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_g_tickInc)
	movlw	high(02710h)
	movwf	((_g_tickInc))+1
	goto	i1l2071
	
i1l676:	
	line	94
	
i1l2071:	
;main.c: 94: g_step = (g_step + 1) % 12;
	movlw	low(0Ch)
	movwf	(?___awmod)
	movlw	high(0Ch)
	movwf	((?___awmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_g_step),w
	addlw	low(01h)
	movwf	0+(?___awmod)+02h
	movlw	high(01h)
	skipnc
	movlw	(high(01h)+1)&0ffh
	movwf	(0+(?___awmod)+02h)+1
	fcall	___awmod
	movf	(0+(?___awmod)),w
	movwf	(??_intr+0)+0
	movf	(??_intr+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_g_step)
	line	95
;main.c: 95: }
	goto	i1l674
	line	96
	
i1l675:	
	line	98
	
i1l2073:	
;main.c: 96: else {
;main.c: 98: g_tickInc -= 4;
	movlw	low(-4)
	addwf	(_g_tickInc),f
	skipnc
	incf	(_g_tickInc+1),f
	movlw	high(-4)
	addwf	(_g_tickInc+1),f
	goto	i1l674
	line	99
	
i1l677:	
	line	100
	
i1l674:	
	line	103
;main.c: 99: }
;main.c: 100: }
;main.c: 103: if ((g_isStartUp == 1) && (256 < g_tickInc)) {
	movf	(_g_isStartUp),w
	xorlw	01h
	skipz
	goto	u261_21
	goto	u261_20
u261_21:
	goto	i1l2079
u261_20:
	
i1l2075:	
	movf	(_g_tickInc+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0101h))^80h
	subwf	btemp+1,w
	skipz
	goto	u262_25
	movlw	low(0101h)
	subwf	(_g_tickInc),w
u262_25:

	skipc
	goto	u262_21
	goto	u262_20
u262_21:
	goto	i1l2079
u262_20:
	line	104
	
i1l2077:	
;main.c: 104: g_isStartUp = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_g_isStartUp)
	line	105
;main.c: 105: }
	goto	i1l2091
	line	106
	
i1l678:	
	
i1l2079:	
;main.c: 106: else if ((g_isStartUp == 0) && (g_tickInc < 192)) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_g_isStartUp),f
	skipz
	goto	u263_21
	goto	u263_20
u263_21:
	goto	i1l2091
u263_20:
	
i1l2081:	
	movf	(_g_tickInc+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0C0h))^80h
	subwf	btemp+1,w
	skipz
	goto	u264_25
	movlw	low(0C0h)
	subwf	(_g_tickInc),w
u264_25:

	skipnc
	goto	u264_21
	goto	u264_20
u264_21:
	goto	i1l2091
u264_20:
	line	107
	
i1l2083:	
;main.c: 107: g_isStartUp = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_g_isStartUp)
	bsf	status,0
	rlf	(_g_isStartUp),f
	line	108
	
i1l2085:	
;main.c: 108: g_tickInc = 16;
	movlw	low(010h)
	movwf	(_g_tickInc)
	movlw	high(010h)
	movwf	((_g_tickInc))+1
	line	110
	
i1l2087:	
;main.c: 110: PORTB = 0;
	clrf	(6)	;volatile
	line	111
	
i1l2089:	
;main.c: 111: _delay((unsigned long)((2000)*(20000000/4000.0)));
	opt asmopt_off
movlw  51
movwf	((??_intr+0)+0+2),f
movlw	137
movwf	((??_intr+0)+0+1),f
	movlw	256
movwf	((??_intr+0)+0),f
u280_27:
	decfsz	((??_intr+0)+0),f
	goto	u280_27
	decfsz	((??_intr+0)+0+1),f
	goto	u280_27
	decfsz	((??_intr+0)+0+2),f
	goto	u280_27
opt asmopt_on

	goto	i1l2091
	line	112
	
i1l680:	
	goto	i1l2091
	line	115
	
i1l679:	
	
i1l2091:	
;main.c: 112: }
;main.c: 115: g_u = g_v = g_w = 0;
	movlw	(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_g_w)
	movwf	(_g_v)
	movwf	(??_intr+0)+0
	movf	(??_intr+0)+0,w
	movwf	(_g_u)
	line	116
	
i1l2093:	
;main.c: 116: if (WAVE[g_step] & 0b00000001) g_u = 5;
	movf	(_g_step),w
	addlw	low((_WAVE-__stringbase))
	movwf	fsr0
	fcall	stringdir
	andlw	01h
	btfsc	status,2
	goto	u265_21
	goto	u265_20
u265_21:
	goto	i1l2097
u265_20:
	
i1l2095:	
	movlw	(05h)
	movwf	(??_intr+0)+0
	movf	(??_intr+0)+0,w
	movwf	(_g_u)
	goto	i1l2097
	
i1l681:	
	line	117
	
i1l2097:	
;main.c: 117: if (WAVE[g_step] & 0b00000010) g_u = -5;
	movf	(_g_step),w
	addlw	low((_WAVE-__stringbase))
	movwf	fsr0
	fcall	stringdir
	andlw	02h
	btfsc	status,2
	goto	u266_21
	goto	u266_20
u266_21:
	goto	i1l2101
u266_20:
	
i1l2099:	
	movlw	(-5)
	movwf	(??_intr+0)+0
	movf	(??_intr+0)+0,w
	movwf	(_g_u)
	goto	i1l2101
	
i1l682:	
	line	118
	
i1l2101:	
;main.c: 118: if (WAVE[g_step] & 0b00000100) g_v = 5;
	movf	(_g_step),w
	addlw	low((_WAVE-__stringbase))
	movwf	fsr0
	fcall	stringdir
	andlw	04h
	btfsc	status,2
	goto	u267_21
	goto	u267_20
u267_21:
	goto	i1l2105
u267_20:
	
i1l2103:	
	movlw	(05h)
	movwf	(??_intr+0)+0
	movf	(??_intr+0)+0,w
	movwf	(_g_v)
	goto	i1l2105
	
i1l683:	
	line	119
	
i1l2105:	
;main.c: 119: if (WAVE[g_step] & 0b00001000) g_v = -5;
	movf	(_g_step),w
	addlw	low((_WAVE-__stringbase))
	movwf	fsr0
	fcall	stringdir
	andlw	08h
	btfsc	status,2
	goto	u268_21
	goto	u268_20
u268_21:
	goto	i1l2109
u268_20:
	
i1l2107:	
	movlw	(-5)
	movwf	(??_intr+0)+0
	movf	(??_intr+0)+0,w
	movwf	(_g_v)
	goto	i1l2109
	
i1l684:	
	line	120
	
i1l2109:	
;main.c: 120: if (WAVE[g_step] & 0b00010000) g_w = 5;
	movf	(_g_step),w
	addlw	low((_WAVE-__stringbase))
	movwf	fsr0
	fcall	stringdir
	andlw	010h
	btfsc	status,2
	goto	u269_21
	goto	u269_20
u269_21:
	goto	i1l2113
u269_20:
	
i1l2111:	
	movlw	(05h)
	movwf	(??_intr+0)+0
	movf	(??_intr+0)+0,w
	movwf	(_g_w)
	goto	i1l2113
	
i1l685:	
	line	121
	
i1l2113:	
;main.c: 121: if (WAVE[g_step] & 0b00100000) g_w = -5;
	movf	(_g_step),w
	addlw	low((_WAVE-__stringbase))
	movwf	fsr0
	fcall	stringdir
	andlw	020h
	btfsc	status,2
	goto	u270_21
	goto	u270_20
u270_21:
	goto	i1l671
u270_20:
	
i1l2115:	
	movlw	(-5)
	movwf	(??_intr+0)+0
	movf	(??_intr+0)+0,w
	movwf	(_g_w)
	goto	i1l671
	
i1l686:	
	line	122
	
i1l671:	
	movf	(??_intr+6),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	movf	(??_intr+5),w
	movwf	pclath
	movf	(??_intr+4),w
	movwf	fsr0
	movf	(??_intr+3),w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_intr
	__end_of_intr:
;; =============== function _intr ends ============

	signat	_intr,88
	global	___awmod
psect	text105,local,class=CODE,delta=2
global __ptext105
__ptext105:

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.80a\sources\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  sign            1    6[COMMON] unsigned char 
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_intr
;; This function uses a non-reentrant model
;;
psect	text105
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.80a\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 6
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
i1l2117:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(___awmod@sign)
	line	9
	
i1l2119:	
	btfss	(___awmod@dividend+1),7
	goto	u271_21
	goto	u271_20
u271_21:
	goto	i1l2123
u271_20:
	line	10
	
i1l2121:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	i1l2123
	line	12
	
i1l903:	
	line	13
	
i1l2123:	
	btfss	(___awmod@divisor+1),7
	goto	u272_21
	goto	u272_20
u272_21:
	goto	i1l2127
u272_20:
	line	14
	
i1l2125:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	i1l2127
	
i1l904:	
	line	15
	
i1l2127:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u273_21
	goto	u273_20
u273_21:
	goto	i1l2145
u273_20:
	line	16
	
i1l2129:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	i1l2135
	
i1l907:	
	line	18
	
i1l2131:	
	movlw	01h
	
u274_25:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u274_25
	line	19
	
i1l2133:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	i1l2135
	line	20
	
i1l906:	
	line	17
	
i1l2135:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u275_21
	goto	u275_20
u275_21:
	goto	i1l2131
u275_20:
	goto	i1l2137
	
i1l908:	
	goto	i1l2137
	line	21
	
i1l909:	
	line	22
	
i1l2137:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u276_25
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u276_25:
	skipc
	goto	u276_21
	goto	u276_20
u276_21:
	goto	i1l2141
u276_20:
	line	23
	
i1l2139:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	i1l2141
	
i1l910:	
	line	24
	
i1l2141:	
	movlw	01h
	
u277_25:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u277_25
	line	25
	
i1l2143:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u278_21
	goto	u278_20
u278_21:
	goto	i1l2137
u278_20:
	goto	i1l2145
	
i1l911:	
	goto	i1l2145
	line	26
	
i1l905:	
	line	27
	
i1l2145:	
	movf	(___awmod@sign),w
	skipz
	goto	u279_20
	goto	i1l2149
u279_20:
	line	28
	
i1l2147:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	i1l2149
	
i1l912:	
	line	29
	
i1l2149:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	i1l913
	
i1l2151:	
	line	30
	
i1l913:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
psect	text106,local,class=CODE,delta=2
global __ptext106
__ptext106:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
