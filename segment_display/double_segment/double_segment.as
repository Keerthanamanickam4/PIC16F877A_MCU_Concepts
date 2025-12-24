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
	FNCALL	_main,___awdiv
	FNCALL	_main,___awmod
	FNCALL	_main,_display
	FNROOT	_main
	global	_seg_hex
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.80\sources\double.c"
	line	8

;initializer for _seg_hex
	retlw	03Fh
	retlw	06h
	retlw	05Bh
	retlw	04Fh
	retlw	066h
	retlw	06Dh
	retlw	07Dh
	retlw	07h
	retlw	07Fh
	retlw	06Fh
	global	_PORTB
_PORTB	set	6
	global	_PORTD
_PORTD	set	8
	global	_RD0
_RD0	set	64
	global	_RD1
_RD1	set	65
	global	_TRISB
_TRISB	set	134
	global	_TRISD
_TRISD	set	136
	file	"double_segment.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.80\sources\double.c"
_seg_hex:
       ds      10

global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK0+10)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_display
?_display:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x0
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	display@tens
display@tens:	; 2 bytes @ 0x0
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x0
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x0
	ds	2
	global	display@ones
display@ones:	; 2 bytes @ 0x2
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x2
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x2
	ds	2
	global	??_display
??_display:	; 0 bytes @ 0x4
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0x4
	global	??___awmod
??___awmod:	; 0 bytes @ 0x4
	ds	1
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x5
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x5
	ds	1
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x6
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x6
	ds	1
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x7
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x9
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	main@tens
main@tens:	; 2 bytes @ 0x0
	ds	2
	global	main@ones
main@ones:	; 2 bytes @ 0x2
	ds	2
	global	main@counts
main@counts:	; 2 bytes @ 0x4
	ds	2
	global	main@num
main@num:	; 2 bytes @ 0x6
	ds	2
;;Data sizes: Strings 0, constant 0, data 10, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      9       9
;; BANK0           80      8      18
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___awmod	int  size(1) Largest target is 0
;;
;; ?___awdiv	int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->___awdiv
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
;; (0) _main                                                 8     8      0     822
;;                                              0 BANK0      8     8      0
;;                            ___awdiv
;;                            ___awmod
;;                            _display
;; ---------------------------------------------------------------------------------
;; (1) _display                                              6     2      4      44
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; (1) ___awmod                                              7     3      4     296
;;                                              0 COMMON     7     3      4
;; ---------------------------------------------------------------------------------
;; (1) ___awdiv                                              9     5      4     300
;;                                              0 COMMON     9     5      4
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   ___awdiv
;;   ___awmod
;;   _display
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
;;DATA                 0      0      1C      12        0.0%
;;ABS                  0      0      1B       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       1       2        0.0%
;;BANK0               50      8      12       5       22.5%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      9       9       1       64.3%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 26 in file "C:\keerthu\Pic16f877a_Revision\segment_display\double_segment\double.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  counts          2    4[BANK0 ] int 
;;  ones            2    2[BANK0 ] int 
;;  tens            2    0[BANK0 ] int 
;;  num             2    6[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       8       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___awdiv
;;		___awmod
;;		_display
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\keerthu\Pic16f877a_Revision\segment_display\double_segment\double.c"
	line	26
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	27
	
l1884:	
;double.c: 27: TRISB = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	28
;double.c: 28: TRISD = 0x00;
	clrf	(136)^080h	;volatile
	line	29
;double.c: 29: PORTB = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	30
;double.c: 30: PORTD = 0x00;
	clrf	(8)	;volatile
	goto	l1886
	line	32
;double.c: 32: while(1)
	
l566:	
	line	34
	
l1886:	
;double.c: 33: {
;double.c: 34: for(int num = 0; num < 100; num++)
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@num)
	movlw	high(0)
	movwf	((main@num))+1
	
l1888:	
	movf	(main@num+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(064h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2375
	movlw	low(064h)
	subwf	(main@num),w
u2375:

	skipc
	goto	u2371
	goto	u2370
u2371:
	goto	l1892
u2370:
	goto	l1886
	
l1890:	
	goto	l1886
	line	35
	
l567:	
	line	36
	
l1892:	
;double.c: 35: {
;double.c: 36: int tens = num / 10;
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@num+1),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(main@num),w
	clrf	0+(?___awdiv)+02h
	addwf	0+(?___awdiv)+02h

	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@tens+1)
	addwf	(main@tens+1)
	movf	(0+(?___awdiv)),w
	clrf	(main@tens)
	addwf	(main@tens)

	line	37
;double.c: 37: int ones = num % 10;
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	movf	(main@num+1),w
	clrf	1+(?___awmod)+02h
	addwf	1+(?___awmod)+02h
	movf	(main@num),w
	clrf	0+(?___awmod)+02h
	addwf	0+(?___awmod)+02h

	fcall	___awmod
	movf	(1+(?___awmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@ones+1)
	addwf	(main@ones+1)
	movf	(0+(?___awmod)),w
	clrf	(main@ones)
	addwf	(main@ones)

	line	40
	
l1894:	
;double.c: 40: for(int counts = 0; counts < 50; counts++)
	movlw	low(0)
	movwf	(main@counts)
	movlw	high(0)
	movwf	((main@counts))+1
	
l1896:	
	movf	(main@counts+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(032h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2385
	movlw	low(032h)
	subwf	(main@counts),w
u2385:

	skipc
	goto	u2381
	goto	u2380
u2381:
	goto	l1900
u2380:
	goto	l1906
	
l1898:	
	goto	l1906
	line	41
	
l569:	
	line	42
	
l1900:	
;double.c: 41: {
;double.c: 42: display(tens, ones);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@tens+1),w
	clrf	(?_display+1)
	addwf	(?_display+1)
	movf	(main@tens),w
	clrf	(?_display)
	addwf	(?_display)

	movf	(main@ones+1),w
	clrf	1+(?_display)+02h
	addwf	1+(?_display)+02h
	movf	(main@ones),w
	clrf	0+(?_display)+02h
	addwf	0+(?_display)+02h

	fcall	_display
	line	40
	
l1902:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@counts),f
	skipnc
	incf	(main@counts+1),f
	movlw	high(01h)
	addwf	(main@counts+1),f
	
l1904:	
	movf	(main@counts+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(032h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2395
	movlw	low(032h)
	subwf	(main@counts),w
u2395:

	skipc
	goto	u2391
	goto	u2390
u2391:
	goto	l1900
u2390:
	goto	l1906
	
l570:	
	line	34
	
l1906:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@num),f
	skipnc
	incf	(main@num+1),f
	movlw	high(01h)
	addwf	(main@num+1),f
	
l1908:	
	movf	(main@num+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(064h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2405
	movlw	low(064h)
	subwf	(main@num),w
u2405:

	skipc
	goto	u2401
	goto	u2400
u2401:
	goto	l1892
u2400:
	goto	l1886
	
l568:	
	goto	l1886
	line	45
	
l571:	
	line	32
	goto	l1886
	
l572:	
	line	46
	
l573:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_display
psect	text107,local,class=CODE,delta=2
global __ptext107
__ptext107:

;; *************** function _display *****************
;; Defined at:
;;		line 11 in file "C:\keerthu\Pic16f877a_Revision\segment_display\double_segment\double.c"
;; Parameters:    Size  Location     Type
;;  tens            2    0[COMMON] int 
;;  ones            2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text107
	file	"C:\keerthu\Pic16f877a_Revision\segment_display\double_segment\double.c"
	line	11
	global	__size_of_display
	__size_of_display	equ	__end_of_display-_display
	
_display:	
	opt	stack 7
; Regs used in _display: [wreg-fsr0h+status,2+status,0]
	line	13
	
l1872:	
;double.c: 13: RD0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(64/8),(64)&7
	line	14
;double.c: 14: RD1 = 0;
	bcf	(65/8),(65)&7
	line	15
	
l1874:	
;double.c: 15: PORTB = seg_hex[tens];
	movf	(display@tens),w
	addlw	_seg_hex&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(6)	;volatile
	line	16
	
l1876:	
;double.c: 16: _delay((unsigned long)((5)*(2000000/4000.0)));
	opt asmopt_off
movlw	4
movwf	((??_display+0)+0+1),f
	movlw	61
movwf	((??_display+0)+0),f
u2417:
	decfsz	((??_display+0)+0),f
	goto	u2417
	decfsz	((??_display+0)+0+1),f
	goto	u2417
	nop2
opt asmopt_on

	line	19
	
l1878:	
;double.c: 19: RD0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(64/8),(64)&7
	line	20
	
l1880:	
;double.c: 20: RD1 = 1;
	bsf	(65/8),(65)&7
	line	21
	
l1882:	
;double.c: 21: PORTB = seg_hex[ones];
	movf	(display@ones),w
	addlw	_seg_hex&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(6)	;volatile
	line	22
;double.c: 22: _delay((unsigned long)((5)*(2000000/4000.0)));
	opt asmopt_off
movlw	4
movwf	((??_display+0)+0+1),f
	movlw	61
movwf	((??_display+0)+0),f
u2427:
	decfsz	((??_display+0)+0),f
	goto	u2427
	decfsz	((??_display+0)+0+1),f
	goto	u2427
	nop2
opt asmopt_on

	line	23
	
l563:	
	return
	opt stack 0
GLOBAL	__end_of_display
	__end_of_display:
;; =============== function _display ends ============

	signat	_display,8312
	global	___awmod
psect	text108,local,class=CODE,delta=2
global __ptext108
__ptext108:

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.80\sources\awmod.c"
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text108
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.80\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 7
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l1836:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(___awmod@sign)
	line	9
	
l1838:	
	btfss	(___awmod@dividend+1),7
	goto	u2281
	goto	u2280
u2281:
	goto	l1842
u2280:
	line	10
	
l1840:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l1842
	line	12
	
l790:	
	line	13
	
l1842:	
	btfss	(___awmod@divisor+1),7
	goto	u2291
	goto	u2290
u2291:
	goto	l1846
u2290:
	line	14
	
l1844:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l1846
	
l791:	
	line	15
	
l1846:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u2301
	goto	u2300
u2301:
	goto	l1864
u2300:
	line	16
	
l1848:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l1854
	
l794:	
	line	18
	
l1850:	
	movlw	01h
	
u2315:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u2315
	line	19
	
l1852:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l1854
	line	20
	
l793:	
	line	17
	
l1854:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u2321
	goto	u2320
u2321:
	goto	l1850
u2320:
	goto	l1856
	
l795:	
	goto	l1856
	line	21
	
l796:	
	line	22
	
l1856:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u2335
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u2335:
	skipc
	goto	u2331
	goto	u2330
u2331:
	goto	l1860
u2330:
	line	23
	
l1858:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	l1860
	
l797:	
	line	24
	
l1860:	
	movlw	01h
	
u2345:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u2345
	line	25
	
l1862:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u2351
	goto	u2350
u2351:
	goto	l1856
u2350:
	goto	l1864
	
l798:	
	goto	l1864
	line	26
	
l792:	
	line	27
	
l1864:	
	movf	(___awmod@sign),w
	skipz
	goto	u2360
	goto	l1868
u2360:
	line	28
	
l1866:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l1868
	
l799:	
	line	29
	
l1868:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l800
	
l1870:	
	line	30
	
l800:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___awdiv
psect	text109,local,class=CODE,delta=2
global __ptext109
__ptext109:

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.80\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    7[COMMON] int 
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
;;      Locals:         4       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         9       0       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text109
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.80\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 7
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l1798:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(___awdiv@sign)
	line	10
	
l1800:	
	btfss	(___awdiv@divisor+1),7
	goto	u2181
	goto	u2180
u2181:
	goto	l1804
u2180:
	line	11
	
l1802:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l1804
	line	13
	
l722:	
	line	14
	
l1804:	
	btfss	(___awdiv@dividend+1),7
	goto	u2191
	goto	u2190
u2191:
	goto	l723
u2190:
	line	15
	
l1806:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l1808:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	line	17
	
l723:	
	line	18
	movlw	low(0)
	movwf	(___awdiv@quotient)
	movlw	high(0)
	movwf	((___awdiv@quotient))+1
	line	19
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u2201
	goto	u2200
u2201:
	goto	l1828
u2200:
	line	20
	
l1810:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l1816
	
l726:	
	line	22
	
l1812:	
	movlw	01h
	
u2215:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2215
	line	23
	
l1814:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l1816
	line	24
	
l725:	
	line	21
	
l1816:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u2221
	goto	u2220
u2221:
	goto	l1812
u2220:
	goto	l1818
	
l727:	
	goto	l1818
	line	25
	
l728:	
	line	26
	
l1818:	
	movlw	01h
	
u2235:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2235
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u2245
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u2245:
	skipc
	goto	u2241
	goto	u2240
u2241:
	goto	l1824
u2240:
	line	28
	
l1820:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l1822:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l1824
	line	30
	
l729:	
	line	31
	
l1824:	
	movlw	01h
	
u2255:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u2255
	line	32
	
l1826:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u2261
	goto	u2260
u2261:
	goto	l1818
u2260:
	goto	l1828
	
l730:	
	goto	l1828
	line	33
	
l724:	
	line	34
	
l1828:	
	movf	(___awdiv@sign),w
	skipz
	goto	u2270
	goto	l1832
u2270:
	line	35
	
l1830:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l1832
	
l731:	
	line	36
	
l1832:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l732
	
l1834:	
	line	37
	
l732:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
psect	text110,local,class=CODE,delta=2
global __ptext110
__ptext110:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
