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
	FNCALL	_main,_EEPROM_Read
	FNCALL	_main,_write_to_eeprom
	FNROOT	_main
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_eeprom_done
	global	_PORTB
psect	text84,local,class=CODE,delta=2
global __ptext84
__ptext84:
_PORTB	set	6
	global	_EEIF
_EEIF	set	108
	global	_GIE
_GIE	set	95
	global	_PEIE
_PEIE	set	94
	global	_RB0
_RB0	set	48
	global	_RB1
_RB1	set	49
	global	_TRISB
_TRISB	set	134
	global	_EEIE
_EEIE	set	1132
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_EECON2
_EECON2	set	397
	global	_EEPGD
_EEPGD	set	3175
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
	file	"eeprom_write.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_eeprom_done:
       ds      1

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	global	?_EEPROM_Read
?_EEPROM_Read:	; 1 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	ds	4
	global	??_EEPROM_Read
??_EEPROM_Read:	; 0 bytes @ 0x4
	global	?_write_to_eeprom
?_write_to_eeprom:	; 0 bytes @ 0x4
	global	write_to_eeprom@data
write_to_eeprom@data:	; 1 bytes @ 0x4
	global	EEPROM_Read@address
EEPROM_Read@address:	; 1 bytes @ 0x4
	ds	1
	global	??_write_to_eeprom
??_write_to_eeprom:	; 0 bytes @ 0x5
	global	write_to_eeprom@address
write_to_eeprom@address:	; 1 bytes @ 0x5
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x6
	ds	3
	global	main@value
main@value:	; 1 bytes @ 0x9
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 1, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     10      11
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_write_to_eeprom
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 4     4      0      60
;;                                              6 COMMON     4     4      0
;;                        _EEPROM_Read
;;                    _write_to_eeprom
;; ---------------------------------------------------------------------------------
;; (1) _write_to_eeprom                                      2     1      1      30
;;                                              4 COMMON     2     1      1
;; ---------------------------------------------------------------------------------
;; (1) _EEPROM_Read                                          1     1      0      15
;;                                              4 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (2) _ISR                                                  4     4      0       0
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _EEPROM_Read
;;   _write_to_eeprom
;;
;; _ISR (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      A       B       1       78.6%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
;;ABS                  0      0       B       3        0.0%
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
;;DATA                 0      0       C      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 17 in file "C:\keerthu\Pic16f877a_Revision\EEPROMCodes\write.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  value           1    9[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2  566[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_EEPROM_Read
;;		_write_to_eeprom
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\keerthu\Pic16f877a_Revision\EEPROMCodes\write.c"
	line	17
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	18
	
l1764:	
;write.c: 18: PORTB=0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	19
;write.c: 19: TRISB=0X00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	24
	
l1766:	
;write.c: 21: unsigned char value;
;write.c: 24: value = EEPROM_Read(0x00);
	movlw	(0)
	fcall	_EEPROM_Read
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@value)
	line	26
	
l1768:	
;write.c: 26: if(value>5)
	movlw	(06h)
	subwf	(main@value),w
	skipc
	goto	u2151
	goto	u2150
u2151:
	goto	l1776
u2150:
	line	28
	
l1770:	
;write.c: 27: {
;write.c: 28: RB0=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(48/8),(48)&7
	line	29
	
l1772:	
;write.c: 29: _delay((unsigned long)((1000)*(4000000/4000.0)));
	opt asmopt_off
movlw  6
movwf	((??_main+0)+0+2),f
movlw	14
movwf	((??_main+0)+0+1),f
	movlw	176
movwf	((??_main+0)+0),f
u2177:
	decfsz	((??_main+0)+0),f
	goto	u2177
	decfsz	((??_main+0)+0+1),f
	goto	u2177
	decfsz	((??_main+0)+0+2),f
	goto	u2177
opt asmopt_on

	line	30
	
l1774:	
;write.c: 30: RB0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(48/8),(48)&7
	line	31
;write.c: 31: _delay((unsigned long)((1000)*(4000000/4000.0)));
	opt asmopt_off
movlw  6
movwf	((??_main+0)+0+2),f
movlw	14
movwf	((??_main+0)+0+1),f
	movlw	176
movwf	((??_main+0)+0),f
u2187:
	decfsz	((??_main+0)+0),f
	goto	u2187
	decfsz	((??_main+0)+0+1),f
	goto	u2187
	decfsz	((??_main+0)+0+2),f
	goto	u2187
opt asmopt_on

	goto	l1776
	line	32
	
l567:	
	line	34
	
l1776:	
;write.c: 32: }
;write.c: 34: write_to_eeprom(0x00,11);
	movlw	(0Bh)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_write_to_eeprom)
	movlw	(0)
	fcall	_write_to_eeprom
	line	36
;write.c: 36: while(!eeprom_done)
	goto	l568
	
l569:	
	line	39
;write.c: 37: {
;write.c: 39: RB1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(49/8),(49)&7
	line	40
	
l1778:	
;write.c: 40: _delay((unsigned long)((200)*(4000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_main+0)+0+2),f
movlw	3
movwf	((??_main+0)+0+1),f
	movlw	186
movwf	((??_main+0)+0),f
u2197:
	decfsz	((??_main+0)+0),f
	goto	u2197
	decfsz	((??_main+0)+0+1),f
	goto	u2197
	decfsz	((??_main+0)+0+2),f
	goto	u2197
opt asmopt_on

	line	42
	
l1780:	
;write.c: 42: RB1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(49/8),(49)&7
	line	43
;write.c: 43: _delay((unsigned long)((200)*(4000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_main+0)+0+2),f
movlw	3
movwf	((??_main+0)+0+1),f
	movlw	186
movwf	((??_main+0)+0),f
u2207:
	decfsz	((??_main+0)+0),f
	goto	u2207
	decfsz	((??_main+0)+0+1),f
	goto	u2207
	decfsz	((??_main+0)+0+2),f
	goto	u2207
opt asmopt_on

	line	44
	
l568:	
	line	36
	movf	(_eeprom_done),w
	skipz
	goto	u2160
	goto	l569
u2160:
	goto	l571
	
l570:	
	line	45
	
l571:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_write_to_eeprom
psect	text85,local,class=CODE,delta=2
global __ptext85
__ptext85:

;; *************** function _write_to_eeprom *****************
;; Defined at:
;;		line 48 in file "C:\keerthu\Pic16f877a_Revision\EEPROMCodes\write.c"
;; Parameters:    Size  Location     Type
;;  address         1    wreg     unsigned char 
;;  data            1    4[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  address         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text85
	file	"C:\keerthu\Pic16f877a_Revision\EEPROMCodes\write.c"
	line	48
	global	__size_of_write_to_eeprom
	__size_of_write_to_eeprom	equ	__end_of_write_to_eeprom-_write_to_eeprom
	
_write_to_eeprom:	
	opt	stack 6
; Regs used in _write_to_eeprom: [wreg]
;write_to_eeprom@address stored from wreg
	line	50
	movwf	(write_to_eeprom@address)
	
l958:	
;write.c: 50: EEADR = address;
	movf	(write_to_eeprom@address),w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(269)^0100h	;volatile
	line	51
;write.c: 51: EEDATA = data;
	movf	(write_to_eeprom@data),w
	movwf	(268)^0100h	;volatile
	line	52
	
l960:	
;write.c: 52: EEPGD = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3175/8)^0180h,(3175)&7
	line	53
	
l962:	
;write.c: 53: WREN = 1;
	bsf	(3170/8)^0180h,(3170)&7
	line	54
	
l964:	
;write.c: 54: GIE = 1;
	bsf	(95/8),(95)&7
	line	55
	
l966:	
;write.c: 55: PEIE = 1;
	bsf	(94/8),(94)&7
	line	56
	
l968:	
;write.c: 56: EEIE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1132/8)^080h,(1132)&7
	line	57
;write.c: 57: EECON2 = 0x55;
	movlw	(055h)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(397)^0180h	;volatile
	line	58
;write.c: 58: EECON2 = 0xAA;
	movlw	(0AAh)
	movwf	(397)^0180h	;volatile
	line	59
	
l970:	
;write.c: 59: WR = 1;
	bsf	(3169/8)^0180h,(3169)&7
	line	61
	
l574:	
	return
	opt stack 0
GLOBAL	__end_of_write_to_eeprom
	__end_of_write_to_eeprom:
;; =============== function _write_to_eeprom ends ============

	signat	_write_to_eeprom,8312
	global	_EEPROM_Read
psect	text86,local,class=CODE,delta=2
global __ptext86
__ptext86:

;; *************** function _EEPROM_Read *****************
;; Defined at:
;;		line 64 in file "C:\keerthu\Pic16f877a_Revision\EEPROMCodes\write.c"
;; Parameters:    Size  Location     Type
;;  address         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  address         1    4[COMMON] unsigned char 
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text86
	file	"C:\keerthu\Pic16f877a_Revision\EEPROMCodes\write.c"
	line	64
	global	__size_of_EEPROM_Read
	__size_of_EEPROM_Read	equ	__end_of_EEPROM_Read-_EEPROM_Read
	
_EEPROM_Read:	
	opt	stack 6
; Regs used in _EEPROM_Read: [wreg]
;EEPROM_Read@address stored from wreg
	movwf	(EEPROM_Read@address)
	line	65
	
l950:	
;write.c: 65: EEADR = address;
	movf	(EEPROM_Read@address),w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(269)^0100h	;volatile
	line	66
	
l952:	
;write.c: 66: EEPGD = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3175/8)^0180h,(3175)&7
	line	69
	
l954:	
;write.c: 69: RD = 1;
	bsf	(3168/8)^0180h,(3168)&7
	line	70
;write.c: 70: return EEDATA;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(268)^0100h,w	;volatile
	goto	l577
	
l956:	
	line	71
	
l577:	
	return
	opt stack 0
GLOBAL	__end_of_EEPROM_Read
	__end_of_EEPROM_Read:
;; =============== function _EEPROM_Read ends ============

	signat	_EEPROM_Read,4217
	global	_ISR
psect	text87,local,class=CODE,delta=2
global __ptext87
__ptext87:

;; *************** function _ISR *****************
;; Defined at:
;;		line 75 in file "C:\keerthu\Pic16f877a_Revision\EEPROMCodes\write.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text87
	file	"C:\keerthu\Pic16f877a_Revision\EEPROMCodes\write.c"
	line	75
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 6
; Regs used in _ISR: [status]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	movf	status,w
	movwf	(??_ISR+0)
	movf	fsr0,w
	movwf	(??_ISR+1)
	movf	pclath,w
	movwf	(??_ISR+2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_ISR+3)
	ljmp	_ISR
psect	text87
	line	76
	
i1l972:	
;write.c: 76: if(EEIF)
	btfss	(108/8),(108)&7
	goto	u1_21
	goto	u1_20
u1_21:
	goto	i1l581
u1_20:
	line	78
	
i1l974:	
;write.c: 77: {
;write.c: 78: EEIF = 0;
	bcf	(108/8),(108)&7
	line	79
;write.c: 79: WREN = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3170/8)^0180h,(3170)&7
	line	80
	
i1l976:	
;write.c: 80: eeprom_done = 1;
	clrf	(_eeprom_done)
	bsf	status,0
	rlf	(_eeprom_done),f
	goto	i1l581
	line	81
	
i1l580:	
	line	82
	
i1l581:	
	movf	(??_ISR+3),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	movf	(??_ISR+2),w
	movwf	pclath
	movf	(??_ISR+1),w
	movwf	fsr0
	movf	(??_ISR+0),w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
;; =============== function _ISR ends ============

	signat	_ISR,88
psect	text88,local,class=CODE,delta=2
global __ptext88
__ptext88:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
