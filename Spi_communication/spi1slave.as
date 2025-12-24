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
	FNCALL	_main,_SPI_Init
	FNCALL	_main,_EEPROM_Write
	FNCALL	_EEPROM_Write,_SPI_Transfer
	FNROOT	_main
	global	_SSPBUF
psect	text84,local,class=CODE,delta=2
global __ptext84
__ptext84:
_SSPBUF	set	19
	global	_SSPCON
_SSPCON	set	20
	global	_RB0
_RB0	set	48
	global	_RC0
_RC0	set	56
	global	_SSPIF
_SSPIF	set	99
	global	_SSPSTAT
_SSPSTAT	set	148
	global	_TRISB0
_TRISB0	set	1072
	global	_TRISC0
_TRISC0	set	1080
	global	_TRISC3
_TRISC3	set	1083
	global	_TRISC4
_TRISC4	set	1084
	global	_TRISC5
_TRISC5	set	1085
	file	"spi1slave.as"
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
	global	?_SPI_Init
?_SPI_Init:	; 0 bytes @ 0x0
	global	??_SPI_Init
??_SPI_Init:	; 0 bytes @ 0x0
	global	??_SPI_Transfer
??_SPI_Transfer:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_SPI_Transfer
?_SPI_Transfer:	; 1 bytes @ 0x0
	global	SPI_Transfer@data
SPI_Transfer@data:	; 1 bytes @ 0x0
	ds	1
	global	?_EEPROM_Write
?_EEPROM_Write:	; 0 bytes @ 0x1
	global	EEPROM_Write@addr
EEPROM_Write@addr:	; 2 bytes @ 0x1
	ds	2
	global	EEPROM_Write@data
EEPROM_Write@data:	; 1 bytes @ 0x3
	ds	1
	global	??_EEPROM_Write
??_EEPROM_Write:	; 0 bytes @ 0x4
	global	??_main
??_main:	; 0 bytes @ 0x4
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5       5
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_EEPROM_Write
;;   _EEPROM_Write->_SPI_Transfer
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
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 1     1      0      30
;;                                              4 COMMON     1     1      0
;;                           _SPI_Init
;;                       _EEPROM_Write
;; ---------------------------------------------------------------------------------
;; (1) _EEPROM_Write                                         3     0      3      30
;;                                              1 COMMON     3     0      3
;;                       _SPI_Transfer
;; ---------------------------------------------------------------------------------
;; (2) _SPI_Transfer                                         1     1      0      15
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _SPI_Init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _SPI_Init
;;   _EEPROM_Write
;;     _SPI_Transfer
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      5       5       1       35.7%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
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
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 51 in file "C:\keerthu\Pic16f877a_Revision\Spicommunication\spi1slave.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_SPI_Init
;;		_EEPROM_Write
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\keerthu\Pic16f877a_Revision\Spicommunication\spi1slave.c"
	line	51
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	52
	
l1757:	
;spi1slave.c: 52: SPI_Init();
	fcall	_SPI_Init
	goto	l1759
	line	54
;spi1slave.c: 54: while(1)
	
l571:	
	line	56
	
l1759:	
;spi1slave.c: 55: {
;spi1slave.c: 56: if(RC0==0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(56/8),(56)&7
	goto	u2151
	goto	u2150
u2151:
	goto	l1759
u2150:
	line	58
	
l1761:	
;spi1slave.c: 57: {
;spi1slave.c: 58: EEPROM_Write(0x0000, 0x41);
	movlw	low(0)
	movwf	(?_EEPROM_Write)
	movlw	high(0)
	movwf	((?_EEPROM_Write))+1
	movlw	(041h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_EEPROM_Write)+02h
	fcall	_EEPROM_Write
	line	59
;spi1slave.c: 59: while(RC0);
	goto	l573
	
l574:	
	
l573:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(56/8),(56)&7
	goto	u2161
	goto	u2160
u2161:
	goto	l573
u2160:
	goto	l1759
	
l575:	
	goto	l1759
	line	60
	
l572:	
	goto	l1759
	line	61
	
l576:	
	line	54
	goto	l1759
	
l577:	
	line	62
	
l578:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_EEPROM_Write
psect	text85,local,class=CODE,delta=2
global __ptext85
__ptext85:

;; *************** function _EEPROM_Write *****************
;; Defined at:
;;		line 34 in file "C:\keerthu\Pic16f877a_Revision\Spicommunication\spi1slave.c"
;; Parameters:    Size  Location     Type
;;  addr            2    1[COMMON] unsigned int 
;;  data            1    3[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         3       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_SPI_Transfer
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text85
	file	"C:\keerthu\Pic16f877a_Revision\Spicommunication\spi1slave.c"
	line	34
	global	__size_of_EEPROM_Write
	__size_of_EEPROM_Write	equ	__end_of_EEPROM_Write-_EEPROM_Write
	
_EEPROM_Write:	
	opt	stack 6
; Regs used in _EEPROM_Write: [wreg+status,2+status,0+pclath+cstack]
	line	36
	
l1747:	
;spi1slave.c: 36: RB0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(48/8),(48)&7
	line	37
	
l1749:	
;spi1slave.c: 37: SPI_Transfer(0x06);
	movlw	(06h)
	fcall	_SPI_Transfer
	line	38
	
l1751:	
;spi1slave.c: 38: RB0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(48/8),(48)&7
	line	41
	
l1753:	
;spi1slave.c: 41: RB0 = 0;
	bcf	(48/8),(48)&7
	line	42
;spi1slave.c: 42: SPI_Transfer(0x02);
	movlw	(02h)
	fcall	_SPI_Transfer
	line	43
;spi1slave.c: 43: SPI_Transfer(0X00);
	movlw	(0)
	fcall	_SPI_Transfer
	line	44
;spi1slave.c: 44: SPI_Transfer(data);
	movf	(EEPROM_Write@data),w
	fcall	_SPI_Transfer
	line	45
	
l1755:	
;spi1slave.c: 45: RB0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(48/8),(48)&7
	line	48
	
l568:	
	return
	opt stack 0
GLOBAL	__end_of_EEPROM_Write
	__end_of_EEPROM_Write:
;; =============== function _EEPROM_Write ends ============

	signat	_EEPROM_Write,8312
	global	_SPI_Transfer
psect	text86,local,class=CODE,delta=2
global __ptext86
__ptext86:

;; *************** function _SPI_Transfer *****************
;; Defined at:
;;		line 26 in file "C:\keerthu\Pic16f877a_Revision\Spicommunication\spi1slave.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_EEPROM_Write
;; This function uses a non-reentrant model
;;
psect	text86
	file	"C:\keerthu\Pic16f877a_Revision\Spicommunication\spi1slave.c"
	line	26
	global	__size_of_SPI_Transfer
	__size_of_SPI_Transfer	equ	__end_of_SPI_Transfer-_SPI_Transfer
	
_SPI_Transfer:	
	opt	stack 6
; Regs used in _SPI_Transfer: [wreg]
;SPI_Transfer@data stored from wreg
	movwf	(SPI_Transfer@data)
	line	27
	
l953:	
;spi1slave.c: 27: SSPIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(99/8),(99)&7
	line	28
	
l955:	
;spi1slave.c: 28: SSPBUF = data;
	movf	(SPI_Transfer@data),w
	movwf	(19)	;volatile
	line	29
;spi1slave.c: 29: while(!SSPIF);
	goto	l562
	
l563:	
	
l562:	
	btfss	(99/8),(99)&7
	goto	u11
	goto	u10
u11:
	goto	l562
u10:
	goto	l957
	
l564:	
	line	30
	
l957:	
;spi1slave.c: 30: return SSPBUF;
;	Return value of _SPI_Transfer is never used
	movf	(19),w	;volatile
	goto	l565
	
l959:	
	line	31
	
l565:	
	return
	opt stack 0
GLOBAL	__end_of_SPI_Transfer
	__end_of_SPI_Transfer:
;; =============== function _SPI_Transfer ends ============

	signat	_SPI_Transfer,4217
	global	_SPI_Init
psect	text87,local,class=CODE,delta=2
global __ptext87
__ptext87:

;; *************** function _SPI_Init *****************
;; Defined at:
;;		line 9 in file "C:\keerthu\Pic16f877a_Revision\Spicommunication\spi1slave.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text87
	file	"C:\keerthu\Pic16f877a_Revision\Spicommunication\spi1slave.c"
	line	9
	global	__size_of_SPI_Init
	__size_of_SPI_Init	equ	__end_of_SPI_Init-_SPI_Init
	
_SPI_Init:	
	opt	stack 7
; Regs used in _SPI_Init: [wreg]
	line	10
	
l947:	
;spi1slave.c: 10: TRISC3 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1083/8)^080h,(1083)&7
	line	11
;spi1slave.c: 11: TRISC4 = 1;
	bsf	(1084/8)^080h,(1084)&7
	line	12
;spi1slave.c: 12: TRISC5 = 0;
	bcf	(1085/8)^080h,(1085)&7
	line	13
;spi1slave.c: 13: TRISC0 = 1;
	bsf	(1080/8)^080h,(1080)&7
	line	15
;spi1slave.c: 15: TRISB0 = 0;
	bcf	(1072/8)^080h,(1072)&7
	line	17
;spi1slave.c: 17: RB0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(48/8),(48)&7
	line	19
	
l949:	
;spi1slave.c: 19: SSPSTAT = 0x40;
	movlw	(040h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(148)^080h	;volatile
	line	20
;spi1slave.c: 20: SSPCON = 0x21;
	movlw	(021h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	22
	
l951:	
;spi1slave.c: 22: SSPIF = 0;
	bcf	(99/8),(99)&7
	line	23
	
l559:	
	return
	opt stack 0
GLOBAL	__end_of_SPI_Init
	__end_of_SPI_Init:
;; =============== function _SPI_Init ends ============

	signat	_SPI_Init,88
psect	text88,local,class=CODE,delta=2
global __ptext88
__ptext88:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
