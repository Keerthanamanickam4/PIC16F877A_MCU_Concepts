opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 6738"

opt pagewidth 120

	opt lm

	processor	16F877A
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
	FNROOT	_main
	global	_SSPBUF
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:
_SSPBUF	set	19
	global	_SSPCON
_SSPCON	set	20
	global	_RB0
_RB0	set	48
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RC2
_RC2	set	58
	global	_SSPIF
_SSPIF	set	99
	global	_SSPSTAT
_SSPSTAT	set	148
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_TRISC3
_TRISC3	set	1083
	global	_TRISC4
_TRISC4	set	1084
	global	_TRISC5
_TRISC5	set	1085
	file	"spiwith3slave.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

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
	global	??_main
??_main:	; 0 bytes @ 0x0
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      0       0
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 0
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       0       2        0.0%
;;ABS                  0      0       0       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0       0      12        0.0%

	global	_main
psect	maintext

;; *************** function _main *****************
;; Defined at:
;;		line 12 in file "C:\keerthu\Pic16f877a_Revision\Spicommunication\spiwith3slave.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\keerthu\Pic16f877a_Revision\Spicommunication\spiwith3slave.c"
	line	12
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg+status,2]
	line	14
	
l943:	
;spiwith3slave.c: 14: TRISB = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	15
	
l945:	
;spiwith3slave.c: 15: TRISC = 0x07;
	movlw	(07h)
	movwf	(135)^080h	;volatile
	line	17
	
l947:	
;spiwith3slave.c: 17: TRISC3 = 0;
	bcf	(1083/8)^080h,(1083)&7
	line	18
	
l949:	
;spiwith3slave.c: 18: TRISC4 = 1;
	bsf	(1084/8)^080h,(1084)&7
	line	19
	
l951:	
;spiwith3slave.c: 19: TRISC5 = 0;
	bcf	(1085/8)^080h,(1085)&7
	line	22
	
l953:	
;spiwith3slave.c: 22: RB0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(48/8),(48)&7
	line	23
	
l955:	
;spiwith3slave.c: 23: RB1 = 1;
	bsf	(49/8),(49)&7
	line	24
	
l957:	
;spiwith3slave.c: 24: RB2 = 1;
	bsf	(50/8),(50)&7
	line	27
	
l959:	
;spiwith3slave.c: 27: SSPSTAT = 0x40;
	movlw	(040h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(148)^080h	;volatile
	line	28
	
l961:	
;spiwith3slave.c: 28: SSPCON = 0x21;
	movlw	(021h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	30
	
l963:	
;spiwith3slave.c: 30: SSPIF = 0;
	bcf	(99/8),(99)&7
	goto	l965
	line	32
;spiwith3slave.c: 32: while(1)
	
l559:	
	line	34
	
l965:	
;spiwith3slave.c: 33: {
;spiwith3slave.c: 34: if(RC0)
	btfss	(56/8),(56)&7
	goto	u11
	goto	u10
u11:
	goto	l560
u10:
	line	36
	
l967:	
;spiwith3slave.c: 35: {
;spiwith3slave.c: 36: RB0 = 0; RB1 = 1; RB2 = 1;
	bcf	(48/8),(48)&7
	bsf	(49/8),(49)&7
	bsf	(50/8),(50)&7
	line	37
;spiwith3slave.c: 37: SSPIF = 0;
	bcf	(99/8),(99)&7
	line	38
	
l969:	
;spiwith3slave.c: 38: SSPBUF = 'A';
	movlw	(041h)
	movwf	(19)	;volatile
	line	39
;spiwith3slave.c: 39: while(!SSPIF);
	goto	l561
	
l562:	
	
l561:	
	btfss	(99/8),(99)&7
	goto	u21
	goto	u20
u21:
	goto	l561
u20:
	
l563:	
	line	40
;spiwith3slave.c: 40: SSPIF=0;
	bcf	(99/8),(99)&7
	line	41
;spiwith3slave.c: 41: RB0 = 1;
	bsf	(48/8),(48)&7
	line	42
	
l560:	
	line	44
;spiwith3slave.c: 42: }
;spiwith3slave.c: 44: if(RC1)
	btfss	(57/8),(57)&7
	goto	u31
	goto	u30
u31:
	goto	l564
u30:
	line	46
	
l971:	
;spiwith3slave.c: 45: {
;spiwith3slave.c: 46: RB1 = 0; RB0 = 1; RB2 = 1;
	bcf	(49/8),(49)&7
	bsf	(48/8),(48)&7
	bsf	(50/8),(50)&7
	line	47
;spiwith3slave.c: 47: SSPIF = 0;
	bcf	(99/8),(99)&7
	line	48
	
l973:	
;spiwith3slave.c: 48: SSPBUF = 'B';
	movlw	(042h)
	movwf	(19)	;volatile
	line	49
;spiwith3slave.c: 49: while(!SSPIF);
	goto	l565
	
l566:	
	
l565:	
	btfss	(99/8),(99)&7
	goto	u41
	goto	u40
u41:
	goto	l565
u40:
	
l567:	
	line	50
;spiwith3slave.c: 50: SSPIF=0;
	bcf	(99/8),(99)&7
	line	51
;spiwith3slave.c: 51: RB1 = 1;
	bsf	(49/8),(49)&7
	line	52
	
l564:	
	line	54
;spiwith3slave.c: 52: }
;spiwith3slave.c: 54: if(RC2)
	btfss	(58/8),(58)&7
	goto	u51
	goto	u50
u51:
	goto	l965
u50:
	line	56
	
l975:	
;spiwith3slave.c: 55: {
;spiwith3slave.c: 56: RB2 = 0; RB0 = 1; RB1 = 1;
	bcf	(50/8),(50)&7
	bsf	(48/8),(48)&7
	bsf	(49/8),(49)&7
	line	57
;spiwith3slave.c: 57: SSPIF = 0;
	bcf	(99/8),(99)&7
	line	58
	
l977:	
;spiwith3slave.c: 58: SSPBUF = 'C';
	movlw	(043h)
	movwf	(19)	;volatile
	line	59
;spiwith3slave.c: 59: while(!SSPIF);
	goto	l569
	
l570:	
	
l569:	
	btfss	(99/8),(99)&7
	goto	u61
	goto	u60
u61:
	goto	l569
u60:
	
l571:	
	line	60
;spiwith3slave.c: 60: SSPIF=0;
	bcf	(99/8),(99)&7
	line	61
;spiwith3slave.c: 61: RB2 = 1;
	bsf	(50/8),(50)&7
	goto	l965
	line	62
	
l568:	
	goto	l965
	line	63
	
l572:	
	line	32
	goto	l965
	
l573:	
	line	64
	
l574:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
psect	maintext
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
