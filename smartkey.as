opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F685
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
	FNCALL	_main,_sys_init
	FNCALL	_main,_gpio_init
	FNCALL	_main,_timer_init
	FNCALL	_main,_int_init
	FNCALL	_main,_eepromWriteByte
	FNCALL	_main,_SET_EPWM_ON
	FNCALL	_main,_eepromReadByte
	FNCALL	_main,_eepromReadBlock
	FNCALL	_main,_setState
	FNCALL	_main,_beep
	FNCALL	_main,_get_RFID
	FNCALL	_main,_swUartSendString
	FNCALL	_main,_SendNum
	FNCALL	_main,_id_search
	FNCALL	_main,_id_clear
	FNCALL	_main,_id_replate
	FNCALL	_id_clear,_id_replate
	FNCALL	_id_replate,___bmul
	FNCALL	_id_replate,_eepromWriteBlock
	FNCALL	_SendNum,_swUartSendByte
	FNCALL	_swUartSendString,_swUartSendByte
	FNCALL	_beep,_delay_x10ms
	FNCALL	_eepromWriteBlock,_eepromWriteByte
	FNCALL	_id_search,_comArr
	FNCALL	_id_search,___lbdiv
	FNCALL	_get_RFID,_timerOut
	FNCALL	_get_RFID,___lbdiv
	FNCALL	_eepromReadBlock,_eepromReadByte
	FNROOT	_main
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	id_clear@F971
	global	_buzFre
	global	_buffTag
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"MAIN.C"
	line	147

;initializer for id_clear@F971
	retlw	0FFh
	retlw	0FFh
	retlw	0FFh
	retlw	0FFh
	retlw	0FFh
	line	24

;initializer for _buzFre
	retlw	0Ch
	line	28

;initializer for _buffTag
	retlw	0
	retlw	0
	retlw	011h
	retlw	0Bh
	retlw	04Fh
	retlw	0
	retlw	0
	retlw	081h
	retlw	02Fh
	retlw	022h
	retlw	0
	retlw	0
	retlw	07Dh
	retlw	067h
	retlw	05h
	retlw	0
	retlw	0
	retlw	07Eh
	retlw	031h
	retlw	0E7h
	retlw	0
	retlw	0
	retlw	07Eh
	retlw	051h
	retlw	0E6h
	global	_timeOut
	global	_timeTick
	global	_PwInNum
	global	_mtState
	global	_keyID
	global	_PSTRCON
_PSTRCON	set	413
	DABS	1,413,1	;_PSTRCON

	global	_SRCON
_SRCON	set	414
	DABS	1,414,1	;_SRCON

	global	_C1SEN
_C1SEN	set	3317
	DABS	1,414,1	;_C1SEN

	global	_C2REN
_C2REN	set	3316
	DABS	1,414,1	;_C2REN

	global	_EEPGD
_EEPGD	set	3175
	DABS	1,396,1	;_EEPGD

	global	_PULSR
_PULSR	set	3314
	DABS	1,414,1	;_PULSR

	global	_PULSS
_PULSS	set	3315
	DABS	1,414,1	;_PULSS

	global	_SR0
_SR0	set	3318
	DABS	1,414,1	;_SR0

	global	_SR1
_SR1	set	3319
	DABS	1,414,1	;_SR1

	global	_STRA
_STRA	set	3304
	DABS	1,413,1	;_STRA

	global	_STRB
_STRB	set	3305
	DABS	1,413,1	;_STRB

	global	_STRC
_STRC	set	3306
	DABS	1,413,1	;_STRC

	global	_STRD
_STRD	set	3307
	DABS	1,413,1	;_STRD

	global	_STRSYNC
_STRSYNC	set	3308
	DABS	1,413,1	;_STRSYNC

	global	_WREN
_WREN	set	3170
	DABS	1,396,1	;_WREN

	global	_EPWM1CON
_EPWM1CON	set	21
	global	_EPWMR1L
_EPWMR1L	set	19
	global	_INTCON
_INTCON	set	11
	global	_PIR1
_PIR1	set	12
	global	_PORTA
_PORTA	set	5
	global	_PORTC
_PORTC	set	7
	global	_PWM1CON
_PWM1CON	set	22
	global	_T1CON
_T1CON	set	16
	global	_T2CON
_T2CON	set	18
	global	_TMR0
_TMR0	set	1
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_TMR2
_TMR2	set	17
	global	_EEIF
_EEIF	set	103
	global	_GIE
_GIE	set	95
	global	_PEIE
_PEIE	set	94
	global	_RA2
_RA2	set	42
	global	_RA3
_RA3	set	43
	global	_RA4
_RA4	set	44
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_T0IE
_T0IE	set	93
	global	_T0IF
_T0IF	set	90
	global	_TMR1IF
_TMR1IF	set	96
	global	_TMR1ON
_TMR1ON	set	128
	global	_TMR2IF
_TMR2IF	set	97
	global	_EEADR
_EEADR	set	155
	global	_EECON1
_EECON1	set	156
	global	_EEDAT
_EEDAT	set	154
	global	_EPWM1AUX
_EPWM1AUX	set	144
	global	_OPTION
_OPTION	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_PIE1
_PIE1	set	140
	global	_PR2
_PR2	set	146
	global	_TRISA
_TRISA	set	133
	global	_TRISC
_TRISC	set	135
	global	_WPUA
_WPUA	set	149
	global	_WPUC
_WPUC	set	136
	global	_HTS
_HTS	set	1146
	global	_RD
_RD	set	1248
	global	_TMR1IE
_TMR1IE	set	1120
	global	_TMR2IE
_TMR2IE	set	1121
	global	_WR
_WR	set	1256
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
	
STR_1:	
	retlw	10
	retlw	84	;'T'
	retlw	97	;'a'
	retlw	103	;'g'
	retlw	58	;':'
	retlw	32	;' '
	retlw	0
psect	strings
	file	"smartkey.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_timeOut:
       ds      2

_timeTick:
       ds      2

_PwInNum:
       ds      1

_mtState:
       ds      1

_keyID:
       ds      5

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"MAIN.C"
	line	147
id_clear@F971:
       ds      5

psect	dataBANK0
	file	"MAIN.C"
	line	24
_buzFre:
       ds      1

psect	dataBANK0
	file	"MAIN.C"
	line	28
_buffTag:
       ds      25

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
	clrf	((__pbssBANK0)+6)&07Fh
	clrf	((__pbssBANK0)+7)&07Fh
	clrf	((__pbssBANK0)+8)&07Fh
	clrf	((__pbssBANK0)+9)&07Fh
	clrf	((__pbssBANK0)+10)&07Fh
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
	movlw low(__pdataBANK0+31)
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
	global	?_swUartSendString
?_swUartSendString:	; 0 bytes @ 0x0
	global	?_SendNum
?_SendNum:	; 0 bytes @ 0x0
	global	?_sys_init
?_sys_init:	; 0 bytes @ 0x0
	global	?_gpio_init
?_gpio_init:	; 0 bytes @ 0x0
	global	?_timer_init
?_timer_init:	; 0 bytes @ 0x0
	global	?_int_init
?_int_init:	; 0 bytes @ 0x0
	global	?_SET_EPWM_ON
?_SET_EPWM_ON:	; 0 bytes @ 0x0
	global	?_delay_x10ms
?_delay_x10ms:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_swUartSendByte
?_swUartSendByte:	; 0 bytes @ 0x0
	global	?_eepromReadByte
?_eepromReadByte:	; 1 bytes @ 0x0
	global	?_get_RFID
?_get_RFID:	; 1 bytes @ 0x0
	ds	2
	global	??_sys_init
??_sys_init:	; 0 bytes @ 0x2
	global	??_gpio_init
??_gpio_init:	; 0 bytes @ 0x2
	global	??_timer_init
??_timer_init:	; 0 bytes @ 0x2
	global	??_int_init
??_int_init:	; 0 bytes @ 0x2
	global	??_eepromReadByte
??_eepromReadByte:	; 0 bytes @ 0x2
	global	?_eepromWriteByte
?_eepromWriteByte:	; 0 bytes @ 0x2
	global	??_SET_EPWM_ON
??_SET_EPWM_ON:	; 0 bytes @ 0x2
	global	??_delay_x10ms
??_delay_x10ms:	; 0 bytes @ 0x2
	global	?_setState
?_setState:	; 0 bytes @ 0x2
	global	??_swUartSendByte
??_swUartSendByte:	; 0 bytes @ 0x2
	global	?_comArr
?_comArr:	; 1 bytes @ 0x2
	global	?___bmul
?___bmul:	; 1 bytes @ 0x2
	global	?___lbdiv
?___lbdiv:	; 1 bytes @ 0x2
	global	?_timerOut
?_timerOut:	; 2 bytes @ 0x2
	global	eepromReadByte@EEAddr
eepromReadByte@EEAddr:	; 1 bytes @ 0x2
	global	eepromWriteByte@EEData
eepromWriteByte@EEData:	; 1 bytes @ 0x2
	global	comArr@arr2
comArr@arr2:	; 1 bytes @ 0x2
	global	___bmul@multiplicand
___bmul@multiplicand:	; 1 bytes @ 0x2
	global	___lbdiv@divisor
___lbdiv@divisor:	; 1 bytes @ 0x2
	global	timerOut@time
timerOut@time:	; 2 bytes @ 0x2
	global	setState@_tOut
setState@_tOut:	; 2 bytes @ 0x2
	ds	1
	global	??_eepromWriteByte
??_eepromWriteByte:	; 0 bytes @ 0x3
	global	??___bmul
??___bmul:	; 0 bytes @ 0x3
	global	??___lbdiv
??___lbdiv:	; 0 bytes @ 0x3
	global	eepromReadByte@ReEepromData
eepromReadByte@ReEepromData:	; 1 bytes @ 0x3
	global	comArr@len1
comArr@len1:	; 1 bytes @ 0x3
	global	swUartSendByte@dat
swUartSendByte@dat:	; 1 bytes @ 0x3
	global	___bmul@product
___bmul@product:	; 1 bytes @ 0x3
	global	___lbdiv@dividend
___lbdiv@dividend:	; 1 bytes @ 0x3
	ds	1
	global	?_eepromReadBlock
?_eepromReadBlock:	; 0 bytes @ 0x4
	global	??_timerOut
??_timerOut:	; 0 bytes @ 0x4
	global	??_setState
??_setState:	; 0 bytes @ 0x4
	global	eepromReadBlock@buff
eepromReadBlock@buff:	; 1 bytes @ 0x4
	global	comArr@len2
comArr@len2:	; 1 bytes @ 0x4
	global	timerOut@Logic
timerOut@Logic:	; 1 bytes @ 0x4
	global	delay_x10ms@t
delay_x10ms@t:	; 1 bytes @ 0x4
	global	setState@stt
setState@stt:	; 1 bytes @ 0x4
	global	swUartSendByte@i
swUartSendByte@i:	; 1 bytes @ 0x4
	global	___bmul@multiplier
___bmul@multiplier:	; 1 bytes @ 0x4
	global	___lbdiv@counter
___lbdiv@counter:	; 1 bytes @ 0x4
	ds	1
	global	??_swUartSendString
??_swUartSendString:	; 0 bytes @ 0x5
	global	??_SendNum
??_SendNum:	; 0 bytes @ 0x5
	global	??_comArr
??_comArr:	; 0 bytes @ 0x5
	global	?_beep
?_beep:	; 0 bytes @ 0x5
	global	eepromReadBlock@len
eepromReadBlock@len:	; 1 bytes @ 0x5
	global	eepromWriteByte@EEAddr
eepromWriteByte@EEAddr:	; 1 bytes @ 0x5
	global	beep@rep
beep@rep:	; 1 bytes @ 0x5
	global	swUartSendString@str
swUartSendString@str:	; 1 bytes @ 0x5
	global	___lbdiv@quotient
___lbdiv@quotient:	; 1 bytes @ 0x5
	global	timerOut@CurTimer
timerOut@CurTimer:	; 2 bytes @ 0x5
	global	_SendNum$4581
_SendNum$4581:	; 2 bytes @ 0x5
	ds	1
	global	??_eepromReadBlock
??_eepromReadBlock:	; 0 bytes @ 0x6
	global	?_eepromWriteBlock
?_eepromWriteBlock:	; 0 bytes @ 0x6
	global	??_beep
??_beep:	; 0 bytes @ 0x6
	global	eepromWriteBlock@buff
eepromWriteBlock@buff:	; 1 bytes @ 0x6
	global	beep@delay
beep@delay:	; 1 bytes @ 0x6
	ds	1
	global	??_get_RFID
??_get_RFID:	; 0 bytes @ 0x7
	global	eepromReadBlock@addStart
eepromReadBlock@addStart:	; 1 bytes @ 0x7
	global	eepromWriteBlock@len
eepromWriteBlock@len:	; 1 bytes @ 0x7
	global	_SendNum$4582
_SendNum$4582:	; 2 bytes @ 0x7
	ds	1
	global	??_eepromWriteBlock
??_eepromWriteBlock:	; 0 bytes @ 0x8
	global	eepromReadBlock@i
eepromReadBlock@i:	; 1 bytes @ 0x8
	global	comArr@arr1
comArr@arr1:	; 1 bytes @ 0x8
	ds	1
	global	eepromWriteBlock@addStart
eepromWriteBlock@addStart:	; 1 bytes @ 0x9
	global	comArr@i
comArr@i:	; 1 bytes @ 0x9
	global	SendNum@num
SendNum@num:	; 1 bytes @ 0x9
	ds	1
	global	?_id_search
?_id_search:	; 1 bytes @ 0xA
	global	eepromWriteBlock@i
eepromWriteBlock@i:	; 1 bytes @ 0xA
	global	id_search@buff
id_search@buff:	; 1 bytes @ 0xA
	global	SendNum@nib
SendNum@nib:	; 1 bytes @ 0xA
	ds	1
	global	??_id_search
??_id_search:	; 0 bytes @ 0xB
	global	id_replate@id
id_replate@id:	; 1 bytes @ 0xB
	ds	1
	global	??_id_clear
??_id_clear:	; 0 bytes @ 0xC
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_id_replate
?_id_replate:	; 0 bytes @ 0x0
	global	id_search@id_input
id_search@id_input:	; 1 bytes @ 0x0
	global	id_replate@Cont
id_replate@Cont:	; 1 bytes @ 0x0
	global	get_RFID@RF_serial_55bits
get_RFID@RF_serial_55bits:	; 11 bytes @ 0x0
	ds	1
	global	id_search@i
id_search@i:	; 1 bytes @ 0x1
	global	id_replate@buff
id_replate@buff:	; 1 bytes @ 0x1
	ds	1
	global	??_id_replate
??_id_replate:	; 0 bytes @ 0x2
	ds	2
	global	?_id_clear
?_id_clear:	; 0 bytes @ 0x4
	global	id_clear@idMax
id_clear@idMax:	; 1 bytes @ 0x4
	ds	1
	global	id_clear@tmp
id_clear@tmp:	; 5 bytes @ 0x5
	ds	5
	global	id_clear@idMin
id_clear@idMin:	; 1 bytes @ 0xA
	ds	1
	global	get_RFID@flag_RFID_syn
get_RFID@flag_RFID_syn:	; 1 bytes @ 0xB
	ds	1
	global	get_RFID@even_col
get_RFID@even_col:	; 1 bytes @ 0xC
	ds	1
	global	get_RFID@even_row
get_RFID@even_row:	; 1 bytes @ 0xD
	ds	1
	global	get_RFID@j
get_RFID@j:	; 1 bytes @ 0xE
	ds	1
	global	get_RFID@i
get_RFID@i:	; 1 bytes @ 0xF
	ds	1
	global	get_RFID@flag_RFID_last
get_RFID@flag_RFID_last:	; 1 bytes @ 0x10
	ds	1
	global	get_RFID@timeOutVal
get_RFID@timeOutVal:	; 2 bytes @ 0x11
	ds	2
	global	get_RFID@ii
get_RFID@ii:	; 1 bytes @ 0x13
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x14
	ds	3
	global	main@t1
main@t1:	; 1 bytes @ 0x17
	ds	1
	global	main@idState
main@idState:	; 1 bytes @ 0x18
	ds	1
	global	main@idop
main@idop:	; 1 bytes @ 0x19
	ds	1
	global	main@tmp
main@tmp:	; 1 bytes @ 0x1A
	ds	1
;;Data sizes: Strings 7, constant 0, data 31, bss 11, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     12      12
;; BANK0           80     27      69
;; BANK1           32      0       0

;;
;; Pointer list with targets:

;; ?_timerOut	unsigned int  size(1) Largest target is 0
;;
;; swUartSendString@str	PTR unsigned char  size(1) Largest target is 7
;;		 -> STR_1(CODE[7]), 
;;
;; id_replate@Cont	PTR unsigned char  size(1) Largest target is 5
;;		 -> id_clear@tmp(BANK0[5]), keyID(BANK0[5]), 
;;
;; id_replate@buff	PTR unsigned char  size(1) Largest target is 25
;;		 -> buffTag(BANK0[25]), 
;;
;; id_search@buff	PTR unsigned char  size(1) Largest target is 25
;;		 -> buffTag(BANK0[25]), 
;;
;; id_search@id_input	PTR unsigned char  size(1) Largest target is 5
;;		 -> keyID(BANK0[5]), 
;;
;; comArr@arr2	PTR unsigned char  size(1) Largest target is 25
;;		 -> buffTag(BANK0[25]), 
;;
;; comArr@arr1	PTR unsigned char  size(1) Largest target is 5
;;		 -> keyID(BANK0[5]), 
;;
;; eepromWriteBlock@buff	PTR unsigned char  size(1) Largest target is 25
;;		 -> buffTag(BANK0[25]), 
;;
;; eepromReadBlock@buff	PTR unsigned char  size(1) Largest target is 25
;;		 -> buffTag(BANK0[25]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_id_search
;;   _main->_id_replate
;;   _id_clear->_id_replate
;;   _id_replate->_eepromWriteBlock
;;   _SendNum->_swUartSendByte
;;   _swUartSendString->_swUartSendByte
;;   _beep->_delay_x10ms
;;   _eepromWriteBlock->_eepromWriteByte
;;   _id_search->_comArr
;;   _get_RFID->_timerOut
;;   _eepromReadBlock->_eepromReadByte
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_get_RFID
;;   _id_clear->_id_replate
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
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 7     7      0    5135
;;                                             20 BANK0      7     7      0
;;                           _sys_init
;;                          _gpio_init
;;                         _timer_init
;;                           _int_init
;;                    _eepromWriteByte
;;                        _SET_EPWM_ON
;;                     _eepromReadByte
;;                    _eepromReadBlock
;;                           _setState
;;                               _beep
;;                           _get_RFID
;;                   _swUartSendString
;;                            _SendNum
;;                          _id_search
;;                           _id_clear
;;                         _id_replate
;; ---------------------------------------------------------------------------------
;; (1) _id_clear                                             7     6      1     718
;;                                              4 BANK0      7     6      1
;;                         _id_replate
;; ---------------------------------------------------------------------------------
;; (1) _id_replate                                           5     3      2     623
;;                                             11 COMMON     1     1      0
;;                                              0 BANK0      4     2      2
;;                             ___bmul
;;                   _eepromWriteBlock
;; ---------------------------------------------------------------------------------
;; (1) _SendNum                                              6     6      0     300
;;                                              5 COMMON     6     6      0
;;                     _swUartSendByte
;; ---------------------------------------------------------------------------------
;; (1) _swUartSendString                                     1     1      0     114
;;                                              5 COMMON     1     1      0
;;                     _swUartSendByte
;; ---------------------------------------------------------------------------------
;; (1) _beep                                                 2     1      1      66
;;                                              5 COMMON     2     1      1
;;                        _delay_x10ms
;; ---------------------------------------------------------------------------------
;; (2) _eepromWriteBlock                                     5     3      2     178
;;                                              6 COMMON     5     3      2
;;                    _eepromWriteByte
;; ---------------------------------------------------------------------------------
;; (2) _swUartSendByte                                       3     3      0      69
;;                                              2 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _id_search                                            4     3      1     518
;;                                             10 COMMON     2     1      1
;;                                              0 BANK0      2     2      0
;;                             _comArr
;;                            ___lbdiv
;; ---------------------------------------------------------------------------------
;; (2) _delay_x10ms                                          3     3      0      22
;;                                              2 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _get_RFID                                            21    21      0    1917
;;                                              7 COMMON     1     1      0
;;                                              0 BANK0     20    20      0
;;                           _timerOut
;;                            ___lbdiv
;; ---------------------------------------------------------------------------------
;; (3) _eepromWriteByte                                      4     3      1      44
;;                                              2 COMMON     4     3      1
;; ---------------------------------------------------------------------------------
;; (1) _eepromReadBlock                                      5     3      2     179
;;                                              4 COMMON     5     3      2
;;                     _eepromReadByte
;; ---------------------------------------------------------------------------------
;; (1) _sys_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) ___lbdiv                                              4     3      1     162
;;                                              2 COMMON     4     3      1
;; ---------------------------------------------------------------------------------
;; (2) ___bmul                                               3     2      1      92
;;                                              2 COMMON     3     2      1
;; ---------------------------------------------------------------------------------
;; (1) _setState                                             3     1      2      44
;;                                              2 COMMON     3     1      2
;; ---------------------------------------------------------------------------------
;; (1) _SET_EPWM_ON                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _timerOut                                             5     3      2      90
;;                                              2 COMMON     5     3      2
;; ---------------------------------------------------------------------------------
;; (2) _comArr                                               8     5      3     222
;;                                              2 COMMON     8     5      3
;; ---------------------------------------------------------------------------------
;; (2) _eepromReadByte                                       2     2      0      45
;;                                              2 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _int_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _timer_init                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _gpio_init                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (5) _ISR                                                  2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 5
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _sys_init
;;   _gpio_init
;;   _timer_init
;;   _int_init
;;   _eepromWriteByte
;;   _SET_EPWM_ON
;;   _eepromReadByte
;;   _eepromReadBlock
;;     _eepromReadByte
;;   _setState
;;   _beep
;;     _delay_x10ms
;;   _get_RFID
;;     _timerOut
;;     ___lbdiv
;;   _swUartSendString
;;     _swUartSendByte
;;   _SendNum
;;     _swUartSendByte
;;   _id_search
;;     _comArr
;;     ___lbdiv
;;   _id_clear
;;     _id_replate
;;       ___bmul
;;       _eepromWriteBlock
;;         _eepromWriteByte
;;   _id_replate
;;     ___bmul
;;     _eepromWriteBlock
;;       _eepromWriteByte
;;
;; _ISR (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               20      0       0       6        0.0%
;;BITBANK1            20      0       0       5        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      55       8        0.0%
;;ABS                  0      0      51       7        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       4       2        0.0%
;;BANK0               50     1B      45       4       86.3%
;;BITBANK0            50      0       0       3        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      C       C       1       85.7%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA              80      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 153 in file "MAIN.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  tmp             1   26[BANK0 ] unsigned char 
;;  idop            1   25[BANK0 ] unsigned char 
;;  idState         1   24[BANK0 ] unsigned char 
;;  t1              1   23[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       4       0
;;      Temps:          0       3       0
;;      Totals:         0       7       0
;;Total ram usage:        7 bytes
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_sys_init
;;		_gpio_init
;;		_timer_init
;;		_int_init
;;		_eepromWriteByte
;;		_SET_EPWM_ON
;;		_eepromReadByte
;;		_eepromReadBlock
;;		_setState
;;		_beep
;;		_get_RFID
;;		_swUartSendString
;;		_SendNum
;;		_id_search
;;		_id_clear
;;		_id_replate
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"MAIN.C"
	line	153
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	156
	
l6637:	
# 156 "MAIN.C"
 MOVLW 0x07 ;#
	line	157
# 157 "MAIN.C"
 MOVWF 0x19 ;#
psect	maintext
	line	160
	
l6639:	
;MAIN.C: 160: unsigned char idop,tmp,idState=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@idState)
	line	162
	
l6641:	
# 162 "MAIN.C"
clrwdt ;#
psect	maintext
	line	164
	
l6643:	
;MAIN.C: 164: sys_init();
	fcall	_sys_init
	line	165
	
l6645:	
;MAIN.C: 165: gpio_init();
	fcall	_gpio_init
	line	167
	
l6647:	
;MAIN.C: 167: timer_init();
	fcall	_timer_init
	line	168
	
l6649:	
;MAIN.C: 168: int_init();
	fcall	_int_init
	line	174
	
l6651:	
;MAIN.C: 174: eepromWriteByte(0x7F,0xAA);
	movlw	(0AAh)
	movwf	(?_eepromWriteByte)
	movlw	(07Fh)
	fcall	_eepromWriteByte
	line	175
	
l6653:	
;MAIN.C: 175: eepromWriteByte(0x7F,0xAA);
	movlw	(0AAh)
	movwf	(?_eepromWriteByte)
	movlw	(07Fh)
	fcall	_eepromWriteByte
	line	178
	
l6655:	
;MAIN.C: 178: TRISC &=0xfe;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(135)^080h+(0/8),(0)&7	;volatile
	line	180
	
l6657:	
;MAIN.C: 180: SET_EPWM_ON();
	fcall	_SET_EPWM_ON
	line	184
	
l6659:	
;MAIN.C: 184: _delay((unsigned long)((20)*(8000000/4000.0)));
	opt asmopt_off
movlw	52
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	241
movwf	((??_main+0)+0),f
u2237:
	decfsz	((??_main+0)+0),f
	goto	u2237
	decfsz	((??_main+0)+0+1),f
	goto	u2237
	nop2
opt asmopt_on

	line	189
	
l6661:	
;MAIN.C: 189: if(eepromReadByte(0x02) == 0xff) eepromWriteByte(0x02,0);
	movlw	(02h)
	fcall	_eepromReadByte
	xorlw	0FFh
	skipz
	goto	u1861
	goto	u1860
u1861:
	goto	l6665
u1860:
	
l6663:	
	clrf	(?_eepromWriteByte)
	movlw	(02h)
	fcall	_eepromWriteByte
	line	190
	
l6665:	
;MAIN.C: 190: if(eepromReadByte(0x01)==0xff)eepromWriteByte(0x01,0);
	movlw	(01h)
	fcall	_eepromReadByte
	xorlw	0FFh
	skipz
	goto	u1871
	goto	u1870
u1871:
	goto	l6669
u1870:
	
l6667:	
	clrf	(?_eepromWriteByte)
	movlw	(01h)
	fcall	_eepromWriteByte
	line	192
	
l6669:	
;MAIN.C: 192: if(eepromReadByte(0x06)!=0){
	movlw	(06h)
	fcall	_eepromReadByte
	xorlw	0
	skipnz
	goto	u1881
	goto	u1880
u1881:
	goto	l6673
u1880:
	line	196
	
l6671:	
;MAIN.C: 196: eepromWriteByte(0x06,0);
	clrf	(?_eepromWriteByte)
	movlw	(06h)
	fcall	_eepromWriteByte
	line	197
;MAIN.C: 197: eepromWriteByte(0x06+1,0);
	clrf	(?_eepromWriteByte)
	movlw	(07h)
	fcall	_eepromWriteByte
	line	198
;MAIN.C: 198: eepromWriteByte(0x06+2,0x87);
	movlw	(087h)
	movwf	(?_eepromWriteByte)
	movlw	(08h)
	fcall	_eepromWriteByte
	line	199
;MAIN.C: 199: eepromWriteByte(0x06+3,0x3a);
	movlw	(03Ah)
	movwf	(?_eepromWriteByte)
	movlw	(09h)
	fcall	_eepromWriteByte
	line	200
;MAIN.C: 200: eepromWriteByte(0x06+4,0xf8);
	movlw	(0F8h)
	movwf	(?_eepromWriteByte)
	movlw	(0Ah)
	fcall	_eepromWriteByte
	line	203
	
l6673:	
;MAIN.C: 202: }
;MAIN.C: 203: eepromReadBlock(0x06,buffTag,5*5);
	movlw	(_buffTag)&0ffh
	movwf	(?_eepromReadBlock)
	movlw	(019h)
	movwf	0+(?_eepromReadBlock)+01h
	movlw	(06h)
	fcall	_eepromReadBlock
	line	207
	
l6675:	
;MAIN.C: 206: {
;MAIN.C: 207: if( eepromReadByte(0x00) == 7){
	movlw	(0)
	fcall	_eepromReadByte
	xorlw	07h
	skipz
	goto	u1891
	goto	u1890
u1891:
	goto	l6701
u1890:
	line	208
	
l6677:	
;MAIN.C: 208: tmp = eepromReadByte(0x02);
	movlw	(02h)
	fcall	_eepromReadByte
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@tmp)
	line	209
	
l6679:	
;MAIN.C: 209: t1 = tmp;
	movf	(main@tmp),w
	movwf	(main@t1)
	line	211
	
l6681:	
;MAIN.C: 211: if(t1 == 3){
	movf	(main@t1),w
	xorlw	03h
	skipz
	goto	u1901
	goto	u1900
u1901:
	goto	l6693
u1900:
	line	216
	
l6683:	
;MAIN.C: 216: if((eepromReadByte(0x03)==8) && (eepromReadByte(0x04)==3)&&(eepromReadByte(0x05)==3)){
	movlw	(03h)
	fcall	_eepromReadByte
	xorlw	08h
	skipz
	goto	u1911
	goto	u1910
u1911:
	goto	l6691
u1910:
	
l6685:	
	movlw	(04h)
	fcall	_eepromReadByte
	xorlw	03h
	skipz
	goto	u1921
	goto	u1920
u1921:
	goto	l6691
u1920:
	
l6687:	
	movlw	(05h)
	fcall	_eepromReadByte
	xorlw	03h
	skipz
	goto	u1931
	goto	u1930
u1931:
	goto	l6691
u1930:
	line	217
	
l6689:	
;MAIN.C: 217: eepromWriteByte(0x01,1);
	clrf	(?_eepromWriteByte)
	incf	(?_eepromWriteByte),f
	movlw	(01h)
	fcall	_eepromWriteByte
	line	218
;MAIN.C: 218: setState(0,0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(0)
	fcall	_setState
	line	219
;MAIN.C: 219: beep(20,2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(014h)
	fcall	_beep
	line	220
;MAIN.C: 220: }
	goto	l3486
	line	222
	
l6691:	
;MAIN.C: 221: else{
;MAIN.C: 222: setState(1,45);
	movlw	02Dh
	movwf	(?_setState)
	clrf	(?_setState+1)
	movlw	(01h)
	fcall	_setState
	line	223
;MAIN.C: 223: beep(10,5);
	movlw	(05h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	224
	
l3486:	
	line	226
;MAIN.C: 224: }
;MAIN.C: 226: eepromWriteByte(0x00,0);
	clrf	(?_eepromWriteByte)
	movlw	(0)
	fcall	_eepromWriteByte
	line	227
;MAIN.C: 227: eepromWriteByte(0x02,0);
	clrf	(?_eepromWriteByte)
	movlw	(02h)
	fcall	_eepromWriteByte
	line	228
;MAIN.C: 228: eepromWriteByte(0x05,0);
	clrf	(?_eepromWriteByte)
	movlw	(05h)
	fcall	_eepromWriteByte
	line	229
;MAIN.C: 229: eepromWriteByte(0x04,0);
	clrf	(?_eepromWriteByte)
	movlw	(04h)
	fcall	_eepromWriteByte
	line	230
;MAIN.C: 230: eepromWriteByte(0x03,0);
	clrf	(?_eepromWriteByte)
	movlw	(03h)
	fcall	_eepromWriteByte
	line	232
;MAIN.C: 232: }
	goto	l6703
	line	234
	
l6693:	
;MAIN.C: 233: else{
;MAIN.C: 234: tmp = eepromReadByte(0x02) ;
	movlw	(02h)
	fcall	_eepromReadByte
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@tmp)
	line	235
	
l6695:	
;MAIN.C: 235: tmp++;
	incf	(main@tmp),f
	line	236
;MAIN.C: 236: eepromWriteByte(0x02,tmp);
	movf	(main@tmp),w
	movwf	(?_eepromWriteByte)
	movlw	(02h)
	fcall	_eepromWriteByte
	line	237
	
l6697:	
;MAIN.C: 237: PwInNum=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_PwInNum)
	line	238
	
l6699:	
;MAIN.C: 238: setState(7,10);
	movlw	0Ah
	movwf	(?_setState)
	clrf	(?_setState+1)
	movlw	(07h)
	fcall	_setState
	goto	l6703
	line	243
	
l6701:	
;MAIN.C: 242: else{
;MAIN.C: 243: setState(1,45);
	movlw	02Dh
	movwf	(?_setState)
	clrf	(?_setState+1)
	movlw	(01h)
	fcall	_setState
	line	246
	
l6703:	
;MAIN.C: 244: }
;MAIN.C: 246: if(eepromReadByte(0x01)== 1){
	movlw	(01h)
	fcall	_eepromReadByte
	xorlw	01h
	skipz
	goto	u1941
	goto	u1940
u1941:
	goto	l6707
u1940:
	line	247
	
l6705:	
;MAIN.C: 247: setState(0,0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(0)
	fcall	_setState
	line	254
	
l6707:	
;MAIN.C: 248: }
;MAIN.C: 249: }
;MAIN.C: 254: tmp=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@tmp)
	line	258
	
l6709:	
;MAIN.C: 258: idop = get_RFID();
	fcall	_get_RFID
	movwf	(main@idop)
	line	260
	
l6711:	
;MAIN.C: 260: if(idop){
	movf	(main@idop),w
	skipz
	goto	u1950
	goto	l6817
u1950:
	line	261
	
l6713:	
;MAIN.C: 261: swUartSendString("\nTag: ");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_swUartSendString
	line	263
	
l6715:	
;MAIN.C: 263: SendNum(keyID[1]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_keyID)+01h,w
	fcall	_SendNum
	line	264
	
l6717:	
;MAIN.C: 264: SendNum(keyID[2]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_keyID)+02h,w
	fcall	_SendNum
	line	265
	
l6719:	
;MAIN.C: 265: SendNum(keyID[3]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_keyID)+03h,w
	fcall	_SendNum
	line	266
	
l6721:	
;MAIN.C: 266: SendNum(keyID[4]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_keyID)+04h,w
	fcall	_SendNum
	line	267
;MAIN.C: 267: idop = id_search(keyID,buffTag);
	movlw	(_buffTag)&0ffh
	movwf	(?_id_search)
	movlw	(_keyID)&0ffh
	fcall	_id_search
	movwf	(main@idop)
	line	268
;MAIN.C: 268: switch (mtState){
	goto	l6813
	line	274
	
l6723:	
;MAIN.C: 271: case 1:
;MAIN.C: 272: case 2:
;MAIN.C: 274: if((idop>1) && (idop <6))
	movlw	(02h)
	subwf	(main@idop),w
	skipc
	goto	u1961
	goto	u1960
u1961:
	goto	l6735
u1960:
	
l6725:	
	movlw	(06h)
	subwf	(main@idop),w
	skipnc
	goto	u1971
	goto	u1970
u1971:
	goto	l6735
u1970:
	line	276
	
l6727:	
;MAIN.C: 275: {
;MAIN.C: 276: if( eepromReadByte(0x00) == 7) eepromWriteByte(0x00,0);
	movlw	(0)
	fcall	_eepromReadByte
	xorlw	07h
	skipz
	goto	u1981
	goto	u1980
u1981:
	goto	l6731
u1980:
	
l6729:	
	clrf	(?_eepromWriteByte)
	movlw	(0)
	fcall	_eepromWriteByte
	line	277
	
l6731:	
;MAIN.C: 277: if(mtState==7){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_mtState),w
	xorlw	07h
	skipz
	goto	u1991
	goto	u1990
u1991:
	goto	l3498
u1990:
	line	278
	
l6733:	
;MAIN.C: 278: eepromWriteByte(0x02,0);
	clrf	(?_eepromWriteByte)
	movlw	(02h)
	fcall	_eepromWriteByte
	line	279
;MAIN.C: 279: eepromWriteByte(0x05,0);
	clrf	(?_eepromWriteByte)
	movlw	(05h)
	fcall	_eepromWriteByte
	line	280
;MAIN.C: 280: eepromWriteByte(0x04,0);
	clrf	(?_eepromWriteByte)
	movlw	(04h)
	fcall	_eepromWriteByte
	line	281
;MAIN.C: 281: eepromWriteByte(0x03,0);
	clrf	(?_eepromWriteByte)
	movlw	(03h)
	fcall	_eepromWriteByte
	line	282
	
l3498:	
	line	283
;MAIN.C: 282: }
;MAIN.C: 283: setState(0,0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(0)
	fcall	_setState
	line	284
;MAIN.C: 284: beep(10,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	285
;MAIN.C: 285: }
	goto	l3501
	line	287
	
l6735:	
;MAIN.C: 287: else if(idop==1)
	decf	(main@idop),w
	skipz
	goto	u2001
	goto	u2000
u2001:
	goto	l3501
u2000:
	line	290
	
l6737:	
;MAIN.C: 288: {
;MAIN.C: 290: id_clear(2,5);
	movlw	(05h)
	movwf	(?_id_clear)
	movlw	(02h)
	fcall	_id_clear
	line	291
	
l6739:	
;MAIN.C: 291: setState(3,0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(03h)
	fcall	_setState
	line	292
	
l6741:	
;MAIN.C: 292: tmp=1;
	clrf	(main@tmp)
	incf	(main@tmp),f
	line	293
	
l6743:	
;MAIN.C: 293: beep(10,3);
	movlw	(03h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	goto	l3501
	line	299
	
l6745:	
;MAIN.C: 299: if(idop<=5 && idop!=1 ){
	movlw	(06h)
	subwf	(main@idop),w
	skipnc
	goto	u2011
	goto	u2010
u2011:
	goto	l3501
u2010:
	
l6747:	
	decf	(main@idop),w
	skipnz
	goto	u2021
	goto	u2020
u2021:
	goto	l3501
u2020:
	line	300
	
l6749:	
;MAIN.C: 300: if(eepromReadByte(0x01)==1){
	movlw	(01h)
	fcall	_eepromReadByte
	xorlw	01h
	skipz
	goto	u2031
	goto	u2030
u2031:
	goto	l3501
u2030:
	line	301
	
l6751:	
;MAIN.C: 301: eepromWriteByte(0x01,0);
	clrf	(?_eepromWriteByte)
	movlw	(01h)
	fcall	_eepromWriteByte
	line	302
;MAIN.C: 302: beep(10,2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	goto	l3501
	line	313
	
l6755:	
;MAIN.C: 313: if(idop==1 && idState == 0){
	decf	(main@idop),w
	skipz
	goto	u2041
	goto	u2040
u2041:
	goto	l6767
u2040:
	
l6757:	
	movf	(main@idState),f
	skipz
	goto	u2051
	goto	u2050
u2051:
	goto	l6767
u2050:
	line	315
	
l6759:	
;MAIN.C: 315: id_clear(2,5);
	movlw	(05h)
	movwf	(?_id_clear)
	movlw	(02h)
	fcall	_id_clear
	line	316
	
l6761:	
;MAIN.C: 316: setState(3,0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(03h)
	fcall	_setState
	line	317
	
l6763:	
;MAIN.C: 317: tmp=1;
	clrf	(main@tmp)
	incf	(main@tmp),f
	line	318
	
l6765:	
;MAIN.C: 318: beep(10,3);
	movlw	(03h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	319
;MAIN.C: 319: }
	goto	l3501
	line	321
	
l6767:	
;MAIN.C: 321: else if(idop==2 && idState == 0){
	movf	(main@idop),w
	xorlw	02h
	skipz
	goto	u2061
	goto	u2060
u2061:
	goto	l3501
u2060:
	
l6769:	
	movf	(main@idState),f
	skipz
	goto	u2071
	goto	u2070
u2071:
	goto	l3501
u2070:
	line	323
	
l6771:	
;MAIN.C: 323: id_clear(3,5);
	movlw	(05h)
	movwf	(?_id_clear)
	movlw	(03h)
	fcall	_id_clear
	line	324
	
l6773:	
;MAIN.C: 324: setState(5,0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(05h)
	fcall	_setState
	line	325
	
l6775:	
;MAIN.C: 325: tmp=2;
	movlw	(02h)
	movwf	(main@tmp)
	line	326
	
l6777:	
;MAIN.C: 326: beep(10,2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	goto	l3501
	line	332
	
l6779:	
;MAIN.C: 332: if (idState == 0){
	movf	(main@idState),f
	skipz
	goto	u2081
	goto	u2080
u2081:
	goto	l6793
u2080:
	line	339
	
l6781:	
;MAIN.C: 339: if( idop !=1){
	decf	(main@idop),w
	skipnz
	goto	u2091
	goto	u2090
u2091:
	goto	l3501
u2090:
	line	340
	
l6783:	
;MAIN.C: 340: tmp++;
	incf	(main@tmp),f
	line	342
	
l6785:	
;MAIN.C: 342: if(tmp <=5){
	movlw	(06h)
	subwf	(main@tmp),w
	skipnc
	goto	u2101
	goto	u2100
u2101:
	goto	l3501
u2100:
	line	343
	
l6787:	
;MAIN.C: 343: id_replate(tmp,keyID,buffTag);
	movlw	(_keyID)&0ffh
	movwf	(?_id_replate)
	movlw	(_buffTag)&0ffh
	movwf	(0+?_id_replate+01h)
	movf	(main@tmp),w
	fcall	_id_replate
	line	344
	
l6789:	
;MAIN.C: 344: timeTick=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	345
	
l6791:	
;MAIN.C: 345: beep(10,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	goto	l3501
	line	351
	
l6793:	
;MAIN.C: 351: beep(10,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	goto	l3501
	line	357
	
l6795:	
;MAIN.C: 357: if(idState == 0){
	movf	(main@idState),f
	skipz
	goto	u2111
	goto	u2110
u2111:
	goto	l6809
u2110:
	line	358
	
l6797:	
;MAIN.C: 358: if( idop >2){
	movlw	(03h)
	subwf	(main@idop),w
	skipc
	goto	u2121
	goto	u2120
u2121:
	goto	l3501
u2120:
	line	359
	
l6799:	
;MAIN.C: 359: tmp++;
	incf	(main@tmp),f
	line	361
	
l6801:	
;MAIN.C: 361: if(tmp <=5){
	movlw	(06h)
	subwf	(main@tmp),w
	skipnc
	goto	u2131
	goto	u2130
u2131:
	goto	l3501
u2130:
	line	362
	
l6803:	
;MAIN.C: 362: id_replate(tmp,keyID,buffTag);
	movlw	(_keyID)&0ffh
	movwf	(?_id_replate)
	movlw	(_buffTag)&0ffh
	movwf	(0+?_id_replate+01h)
	movf	(main@tmp),w
	fcall	_id_replate
	line	363
	
l6805:	
;MAIN.C: 363: timeTick=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	364
	
l6807:	
;MAIN.C: 364: beep(10,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	goto	l3501
	line	370
	
l6809:	
;MAIN.C: 370: beep(10,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	goto	l3501
	line	268
	
l6813:	
	movf	(_mtState),w
	; Switch size 1, requested type "space"
; Number of cases is 7, Range of values is 0 to 7
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           14     6 (fixed)
; simple_byte           22    12 (average)
; jumptable            260     6 (fixed)
; rangetable            12     6 (fixed)
; spacedrange           22     9 (fixed)
; locatedrange           8     3 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	8
	subwf	fsr,w
skipnc
goto l3501
movlw high(S6915)
movwf pclath
	movlw low(S6915)
	addwf fsr,w
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S6915:
	ljmp	l6745
	ljmp	l6723
	ljmp	l6723
	ljmp	l6779
	ljmp	l3501
	ljmp	l6795
	ljmp	l6755
	ljmp	l6723
psect	maintext

	line	393
	
l3501:	
	line	395
;MAIN.C: 395: idState = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@idState)
	incf	(main@idState),f
	line	396
	
l6815:	
;MAIN.C: 396: _delay((unsigned long)((61)*(8000000/4000.0)));
	opt asmopt_off
movlw	159
movwf	((??_main+0)+0+1),f
	movlw	111
movwf	((??_main+0)+0),f
u2247:
	decfsz	((??_main+0)+0),f
	goto	u2247
	decfsz	((??_main+0)+0+1),f
	goto	u2247
	nop2
opt asmopt_on

	line	397
;MAIN.C: 397: }
	goto	l6821
	line	399
	
l6817:	
;MAIN.C: 398: else{
;MAIN.C: 399: idState =0;
	clrf	(main@idState)
	line	400
	
l6819:	
;MAIN.C: 400: _delay((unsigned long)((150)*(8000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_main+0)+0+2),f
movlw	134
movwf	((??_main+0)+0+1),f
	movlw	153
movwf	((??_main+0)+0),f
u2257:
	decfsz	((??_main+0)+0),f
	goto	u2257
	decfsz	((??_main+0)+0+1),f
	goto	u2257
	decfsz	((??_main+0)+0+2),f
	goto	u2257
opt asmopt_on

	line	405
	
l6821:	
;MAIN.C: 401: }
;MAIN.C: 405: if((timeOut!=0)&&( timeTick > timeOut)){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_timeOut+1),w
	iorwf	(_timeOut),w
	skipnz
	goto	u2141
	goto	u2140
u2141:
	goto	l6861
u2140:
	
l6823:	
	movf	(_timeTick+1),w
	subwf	(_timeOut+1),w
	skipz
	goto	u2155
	movf	(_timeTick),w
	subwf	(_timeOut),w
u2155:
	skipnc
	goto	u2151
	goto	u2150
u2151:
	goto	l6861
u2150:
	goto	l6859
	line	410
	
l6827:	
;MAIN.C: 410: setState(2,80);
	movlw	050h
	movwf	(?_setState)
	clrf	(?_setState+1)
	movlw	(02h)
	fcall	_setState
	line	411
	
l6829:	
;MAIN.C: 411: buzFre=0x6a;
	movlw	(06Ah)
	movwf	(_buzFre)
	line	412
;MAIN.C: 412: break;
	goto	l6861
	line	414
	
l6831:	
;MAIN.C: 414: setState(6,35);
	movlw	023h
	movwf	(?_setState)
	clrf	(?_setState+1)
	movlw	(06h)
	fcall	_setState
	line	415
;MAIN.C: 415: break;
	goto	l6861
	line	417
	
l6833:	
;MAIN.C: 417: setState(2,0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(02h)
	fcall	_setState
	line	418
	
l6835:	
;MAIN.C: 418: buzFre=0x6a;
	movlw	(06Ah)
	movwf	(_buzFre)
	line	419
	
l6837:	
;MAIN.C: 419: eepromWriteByte(0x00,7);
	movlw	(07h)
	movwf	(?_eepromWriteByte)
	movlw	(0)
	fcall	_eepromWriteByte
	line	420
	
l6839:	
;MAIN.C: 420: eepromWriteByte(0x02,0);
	clrf	(?_eepromWriteByte)
	movlw	(02h)
	fcall	_eepromWriteByte
	line	421
;MAIN.C: 421: break;
	goto	l6861
	line	422
;MAIN.C: 422: case 7:
	
l3530:	
	line	424
;MAIN.C: 424: if(RC1==1){
	btfss	(57/8),(57)&7
	goto	u2161
	goto	u2160
u2161:
	goto	l6861
u2160:
	line	425
	
l6841:	
;MAIN.C: 425: PwInNum++;
	incf	(_PwInNum),f
	line	426
	
l6843:	
;MAIN.C: 426: tmp = eepromReadByte(0x02);
	movlw	(02h)
	fcall	_eepromReadByte
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@tmp)
	line	427
	
l6845:	
;MAIN.C: 427: if(tmp>0&&tmp<4){
	movf	(main@tmp),w
	skipz
	goto	u2170
	goto	l6853
u2170:
	
l6847:	
	movlw	(04h)
	subwf	(main@tmp),w
	skipnc
	goto	u2181
	goto	u2180
u2181:
	goto	l6853
u2180:
	line	428
	
l6849:	
;MAIN.C: 428: tmp--;
	decf	(main@tmp),f
	line	429
	
l6851:	
;MAIN.C: 429: eepromWriteByte(0x03+tmp,PwInNum);
	movf	(_PwInNum),w
	movwf	(?_eepromWriteByte)
	movf	(main@tmp),w
	addlw	03h
	fcall	_eepromWriteByte
	line	432
	
l6853:	
;MAIN.C: 430: }
;MAIN.C: 432: beep(10,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	433
	
l6855:	
;MAIN.C: 433: setState(7,10);
	movlw	0Ah
	movwf	(?_setState)
	clrf	(?_setState+1)
	movlw	(07h)
	fcall	_setState
	goto	l6861
	line	407
	
l6859:	
	movf	(_mtState),w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 1 to 7
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
; direct_byte           16     9 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	1^0	; case 1
	skipnz
	goto	l6827
	xorlw	2^1	; case 2
	skipnz
	goto	l6831
	xorlw	6^2	; case 6
	skipnz
	goto	l6833
	xorlw	7^6	; case 7
	skipnz
	goto	l3530
	goto	l6861
	opt asmopt_on

	line	454
	
l6861:	
;MAIN.C: 451: }
;MAIN.C: 454: if(mtState==0) RA3 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_mtState),f
	skipz
	goto	u2191
	goto	u2190
u2191:
	goto	l3533
u2190:
	
l6863:	
	bsf	(43/8),(43)&7
	goto	l6865
	line	455
	
l3533:	
;MAIN.C: 455: else RA3 =0;
	bcf	(43/8),(43)&7
	line	462
	
l6865:	
;MAIN.C: 462: if(mtState == 2) {
	movf	(_mtState),w
	xorlw	02h
	skipz
	goto	u2201
	goto	u2200
u2201:
	goto	l3535
u2200:
	line	464
	
l6867:	
;MAIN.C: 464: TMR1ON = 1;T0IE = 1;
	bsf	(128/8),(128)&7
	bsf	(93/8),(93)&7
	line	465
	
l6869:	
;MAIN.C: 465: if(timeTick%4 ==0){
	movf	(_timeTick),w
	andlw	03h
	btfss	status,2
	goto	u2211
	goto	u2210
u2211:
	goto	l6877
u2210:
	line	467
	
l6871:	
;MAIN.C: 467: if(buzFre==0x6a){
	movf	(_buzFre),w
	xorlw	06Ah
	skipz
	goto	u2221
	goto	u2220
u2221:
	goto	l6875
u2220:
	line	468
	
l6873:	
;MAIN.C: 468: buzFre=12;
	movlw	(0Ch)
	movwf	(_buzFre)
	line	469
;MAIN.C: 469: }else{
	goto	l6877
	line	470
	
l6875:	
;MAIN.C: 470: buzFre=0x6a;
	movlw	(06Ah)
	movwf	(_buzFre)
	goto	l6877
	line	474
	
l3535:	
	bcf	(128/8),(128)&7
	bcf	(93/8),(93)&7
	line	477
	
l6877:	
;MAIN.C: 477: timeTick++;
	incf	(_timeTick),f
	skipnz
	incf	(_timeTick+1),f
	goto	l6709
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	481
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_id_clear
psect	text570,local,class=CODE,delta=2
global __ptext570
__ptext570:

;; *************** function _id_clear *****************
;; Defined at:
;;		line 146 in file "MAIN.C"
;; Parameters:    Size  Location     Type
;;  idMin           1    wreg     unsigned char 
;;  idMax           1    4[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  idMin           1   10[BANK0 ] unsigned char 
;;  tmp             5    5[BANK0 ] unsigned char [5]
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       1       0
;;      Locals:         0       6       0
;;      Temps:          0       0       0
;;      Totals:         0       7       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_id_replate
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text570
	file	"MAIN.C"
	line	146
	global	__size_of_id_clear
	__size_of_id_clear	equ	__end_of_id_clear-_id_clear
	
_id_clear:	
	opt	stack 3
; Regs used in _id_clear: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;id_clear@idMin stored from wreg
	line	147
	movwf	(id_clear@idMin)
	
l6629:	
;MAIN.C: 147: unsigned char tmp[5]={0xff,0xff,0xff,0xff,0xff};
	movlw	(id_clear@tmp)&0ffh
	movwf	fsr0
	movf	(id_clear@F971),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movf	(id_clear@F971)+1,w
	movwf	indf
	incf	fsr0,f
	movf	(id_clear@F971)+2,w
	movwf	indf
	incf	fsr0,f
	movf	(id_clear@F971)+3,w
	movwf	indf
	incf	fsr0,f
	movf	(id_clear@F971)+4,w
	movwf	indf
	line	148
	goto	l6635
	line	149
	
l6631:	
;MAIN.C: 149: id_replate(idMin,tmp,buffTag);
	movlw	(id_clear@tmp)&0ffh
	movwf	(?_id_replate)
	movlw	(_buffTag)&0ffh
	movwf	(0+?_id_replate+01h)
	movf	(id_clear@idMin),w
	fcall	_id_replate
	line	148
	
l6633:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(id_clear@idMin),f
	
l6635:	
	movf	(id_clear@idMin),w
	subwf	(id_clear@idMax),w
	skipnc
	goto	u1851
	goto	u1850
u1851:
	goto	l6631
u1850:
	line	150
	
l3477:	
	return
	opt stack 0
GLOBAL	__end_of_id_clear
	__end_of_id_clear:
;; =============== function _id_clear ends ============

	signat	_id_clear,8312
	global	_id_replate
psect	text571,local,class=CODE,delta=2
global __ptext571
__ptext571:

;; *************** function _id_replate *****************
;; Defined at:
;;		line 132 in file "MAIN.C"
;; Parameters:    Size  Location     Type
;;  id              1    wreg     unsigned char 
;;  Cont            1    0[BANK0 ] PTR unsigned char 
;;		 -> id_clear@tmp(5), keyID(5), 
;;  buff            1    1[BANK0 ] PTR unsigned char 
;;		 -> buffTag(25), 
;; Auto vars:     Size  Location     Type
;;  id              1   11[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         1       0       0
;;      Temps:          0       2       0
;;      Totals:         1       4       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___bmul
;;		_eepromWriteBlock
;; This function is called by:
;;		_id_clear
;;		_main
;; This function uses a non-reentrant model
;;
psect	text571
	file	"MAIN.C"
	line	132
	global	__size_of_id_replate
	__size_of_id_replate	equ	__end_of_id_replate-_id_replate
	
_id_replate:	
	opt	stack 4
; Regs used in _id_replate: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;id_replate@id stored from wreg
	movwf	(id_replate@id)
	line	133
	
l6615:	
;MAIN.C: 133: id=(id-1)*5;
	movlw	(05h)
	movwf	(?___bmul)
	movf	(id_replate@id),w
	addlw	0FFh
	fcall	___bmul
	movwf	(id_replate@id)
	line	136
	
l6617:	
;MAIN.C: 134: {
;MAIN.C: 135: {
;MAIN.C: 136: *(buff+id) = *Cont;
	movf	(id_replate@Cont),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_id_replate+0)+0
	movf	(id_replate@id),w
	addwf	(id_replate@buff),w
	movwf	(??_id_replate+1)+0
	movf	0+(??_id_replate+1)+0,w
	movwf	fsr0
	movf	(??_id_replate+0)+0,w
	movwf	indf
	line	137
	
l6619:	
;MAIN.C: 137: *(buff+1+id) = *(Cont+1);
	movf	(id_replate@Cont),w
	addlw	01h
	movwf	fsr0
	movf	indf,w
	movwf	(??_id_replate+0)+0
	movf	(id_replate@id),w
	addwf	(id_replate@buff),w
	movwf	(??_id_replate+1)+0
	movf	0+(??_id_replate+1)+0,w
	addlw	01h
	movwf	fsr0
	movf	(??_id_replate+0)+0,w
	movwf	indf
	line	138
	
l6621:	
;MAIN.C: 138: *(buff+2+id) = *(Cont+2);
	movf	(id_replate@Cont),w
	addlw	02h
	movwf	fsr0
	movf	indf,w
	movwf	(??_id_replate+0)+0
	movf	(id_replate@id),w
	addwf	(id_replate@buff),w
	movwf	(??_id_replate+1)+0
	movf	0+(??_id_replate+1)+0,w
	addlw	02h
	movwf	fsr0
	movf	(??_id_replate+0)+0,w
	movwf	indf
	line	139
	
l6623:	
;MAIN.C: 139: *(buff+3+id) = *(Cont+3);
	movf	(id_replate@Cont),w
	addlw	03h
	movwf	fsr0
	movf	indf,w
	movwf	(??_id_replate+0)+0
	movf	(id_replate@id),w
	addwf	(id_replate@buff),w
	movwf	(??_id_replate+1)+0
	movf	0+(??_id_replate+1)+0,w
	addlw	03h
	movwf	fsr0
	movf	(??_id_replate+0)+0,w
	movwf	indf
	line	140
	
l6625:	
;MAIN.C: 140: *(buff+4+id) = *(Cont+4);
	movf	(id_replate@Cont),w
	addlw	04h
	movwf	fsr0
	movf	indf,w
	movwf	(??_id_replate+0)+0
	movf	(id_replate@id),w
	addwf	(id_replate@buff),w
	movwf	(??_id_replate+1)+0
	movf	0+(??_id_replate+1)+0,w
	addlw	04h
	movwf	fsr0
	movf	(??_id_replate+0)+0,w
	movwf	indf
	line	144
	
l6627:	
;MAIN.C: 141: }
;MAIN.C: 142: }
;MAIN.C: 144: eepromWriteBlock(0x06,buffTag,25);
	movlw	(_buffTag)&0ffh
	movwf	(?_eepromWriteBlock)
	movlw	(019h)
	movwf	0+(?_eepromWriteBlock)+01h
	movlw	(06h)
	fcall	_eepromWriteBlock
	line	145
	
l3469:	
	return
	opt stack 0
GLOBAL	__end_of_id_replate
	__end_of_id_replate:
;; =============== function _id_replate ends ============

	signat	_id_replate,12408
	global	_SendNum
psect	text572,local,class=CODE,delta=2
global __ptext572
__ptext572:

;; *************** function _SendNum *****************
;; Defined at:
;;		line 42 in file "SWUART.C"
;; Parameters:    Size  Location     Type
;;  num             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  num             1    9[COMMON] unsigned char 
;;  nib             1   10[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         6       0       0
;;      Temps:          0       0       0
;;      Totals:         6       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_swUartSendByte
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text572
	file	"SWUART.C"
	line	42
	global	__size_of_SendNum
	__size_of_SendNum	equ	__end_of_SendNum-_SendNum
	
_SendNum:	
	opt	stack 5
; Regs used in _SendNum: [wreg+status,2+status,0+pclath+cstack]
;SendNum@num stored from wreg
	movwf	(SendNum@num)
	line	43
	
l6593:	
;SWUART.C: 43: unsigned char nib = num>>4;
	swapf	(SendNum@num),w
	andlw	(0ffh shr 4) & 0ffh
	movwf	(SendNum@nib)
	line	44
	
l6595:	
;SWUART.C: 44: swUartSendByte(nib <10 ? (nib+'0') :(nib+'A'-10));
	movlw	(0Ah)
	subwf	(SendNum@nib),w
	skipc
	goto	u1831
	goto	u1830
u1831:
	goto	l6599
u1830:
	
l6597:	
	movf	(SendNum@nib),w
	movwf	(_SendNum$4581)
	clrf	(_SendNum$4581+1)
	movlw	037h
	addwf	(_SendNum$4581),f
	skipnc
	incf	(_SendNum$4581+1),f
	goto	l6601
	
l6599:	
	movf	(SendNum@nib),w
	movwf	(_SendNum$4581)
	clrf	(_SendNum$4581+1)
	movlw	030h
	addwf	(_SendNum$4581),f
	skipnc
	incf	(_SendNum$4581+1),f
	
l6601:	
	movf	(_SendNum$4581),w
	fcall	_swUartSendByte
	line	45
	
l6603:	
;SWUART.C: 45: nib = num&0x0f;
	movf	(SendNum@num),w
	movwf	(SendNum@nib)
	
l6605:	
	movlw	(0Fh)
	andwf	(SendNum@nib),f
	line	46
	
l6607:	
;SWUART.C: 46: swUartSendByte(nib <10 ? (nib+'0') :(nib+'A'-10));
	movlw	(0Ah)
	subwf	(SendNum@nib),w
	skipc
	goto	u1841
	goto	u1840
u1841:
	goto	l6611
u1840:
	
l6609:	
	movf	(SendNum@nib),w
	movwf	(_SendNum$4582)
	clrf	(_SendNum$4582+1)
	movlw	037h
	addwf	(_SendNum$4582),f
	skipnc
	incf	(_SendNum$4582+1),f
	goto	l6613
	
l6611:	
	movf	(SendNum@nib),w
	movwf	(_SendNum$4582)
	clrf	(_SendNum$4582+1)
	movlw	030h
	addwf	(_SendNum$4582),f
	skipnc
	incf	(_SendNum$4582+1),f
	
l6613:	
	movf	(_SendNum$4582),w
	fcall	_swUartSendByte
	line	47
	
l4218:	
	return
	opt stack 0
GLOBAL	__end_of_SendNum
	__end_of_SendNum:
;; =============== function _SendNum ends ============

	signat	_SendNum,4216
	global	_swUartSendString
psect	text573,local,class=CODE,delta=2
global __ptext573
__ptext573:

;; *************** function _swUartSendString *****************
;; Defined at:
;;		line 35 in file "SWUART.C"
;; Parameters:    Size  Location     Type
;;  str             1    wreg     PTR unsigned char 
;;		 -> STR_1(7), 
;; Auto vars:     Size  Location     Type
;;  str             1    5[COMMON] PTR unsigned char 
;;		 -> STR_1(7), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_swUartSendByte
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text573
	file	"SWUART.C"
	line	35
	global	__size_of_swUartSendString
	__size_of_swUartSendString	equ	__end_of_swUartSendString-_swUartSendString
	
_swUartSendString:	
	opt	stack 5
; Regs used in _swUartSendString: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;swUartSendString@str stored from wreg
	movwf	(swUartSendString@str)
	line	36
	
l6585:	
;SWUART.C: 36: while(*str){
	goto	l6591
	line	37
	
l6587:	
;SWUART.C: 37: swUartSendByte((char)*str);
	movf	(swUartSendString@str),w
	movwf	fsr0
	fcall	stringdir
	fcall	_swUartSendByte
	line	38
	
l6589:	
;SWUART.C: 38: str++;
	incf	(swUartSendString@str),f
	line	36
	
l6591:	
	movf	(swUartSendString@str),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u1821
	goto	u1820
u1821:
	goto	l6587
u1820:
	line	40
	
l4207:	
	return
	opt stack 0
GLOBAL	__end_of_swUartSendString
	__end_of_swUartSendString:
;; =============== function _swUartSendString ends ============

	signat	_swUartSendString,4216
	global	_beep
psect	text574,local,class=CODE,delta=2
global __ptext574
__ptext574:

;; *************** function _beep *****************
;; Defined at:
;;		line 45 in file "MAIN.C"
;; Parameters:    Size  Location     Type
;;  delay           1    wreg     unsigned char 
;;  rep             1    5[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  delay           1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay_x10ms
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text574
	file	"MAIN.C"
	line	45
	global	__size_of_beep
	__size_of_beep	equ	__end_of_beep-_beep
	
_beep:	
	opt	stack 5
; Regs used in _beep: [wreg+status,2+status,0+pclath+cstack]
;beep@delay stored from wreg
	movwf	(beep@delay)
	line	46
	
l6569:	
;MAIN.C: 46: TMR1ON = 1;T0IE = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(128/8),(128)&7
	bsf	(93/8),(93)&7
	line	48
;MAIN.C: 48: while(rep--){
	goto	l6583
	
l3451:	
	line	49
;MAIN.C: 49: TMR1ON = 1;T0IE = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(128/8),(128)&7
	bsf	(93/8),(93)&7
	line	50
	
l6571:	
;MAIN.C: 50: buzFre=42;
	movlw	(02Ah)
	movwf	(_buzFre)
	line	51
	
l6573:	
;MAIN.C: 51: delay_x10ms(delay);
	movf	(beep@delay),w
	fcall	_delay_x10ms
	line	52
	
l6575:	
;MAIN.C: 52: T0IE = 0;
	bcf	(93/8),(93)&7
	line	53
	
l6577:	
;MAIN.C: 53: TMR1ON = 0;RC0 =0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(128/8),(128)&7
	
l6579:	
	bcf	(56/8),(56)&7
	line	54
	
l6581:	
;MAIN.C: 54: delay_x10ms(20);
	movlw	(014h)
	fcall	_delay_x10ms
	line	48
	
l6583:	
	decf	(beep@rep),f
	movf	((beep@rep)),w
	xorlw	0FFh
	skipz
	goto	u1811
	goto	u1810
u1811:
	goto	l3451
u1810:
	
l3452:	
	line	57
;MAIN.C: 55: }
;MAIN.C: 57: T0IE = 0;
	bcf	(93/8),(93)&7
	line	58
	
l3453:	
	return
	opt stack 0
GLOBAL	__end_of_beep
	__end_of_beep:
;; =============== function _beep ends ============

	signat	_beep,8312
	global	_eepromWriteBlock
psect	text575,local,class=CODE,delta=2
global __ptext575
__ptext575:

;; *************** function _eepromWriteBlock *****************
;; Defined at:
;;		line 43 in file "ms82_eeprom.c"
;; Parameters:    Size  Location     Type
;;  addStart        1    wreg     unsigned char 
;;  buff            1    6[COMMON] PTR unsigned char 
;;		 -> buffTag(25), 
;;  len             1    7[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  addStart        1    9[COMMON] unsigned char 
;;  i               1   10[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         2       0       0
;;      Temps:          1       0       0
;;      Totals:         5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_eepromWriteByte
;; This function is called by:
;;		_id_replate
;; This function uses a non-reentrant model
;;
psect	text575
	file	"ms82_eeprom.c"
	line	43
	global	__size_of_eepromWriteBlock
	__size_of_eepromWriteBlock	equ	__end_of_eepromWriteBlock-_eepromWriteBlock
	
_eepromWriteBlock:	
	opt	stack 4
; Regs used in _eepromWriteBlock: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;eepromWriteBlock@addStart stored from wreg
	line	45
	movwf	(eepromWriteBlock@addStart)
	
l6561:	
;ms82_eeprom.c: 44: unsigned char i;
;ms82_eeprom.c: 45: for(i=0;i<len;i++){
	clrf	(eepromWriteBlock@i)
	goto	l6567
	line	46
	
l6563:	
;ms82_eeprom.c: 46: eepromWriteByte(addStart+i,buff[i]);
	movf	(eepromWriteBlock@i),w
	addwf	(eepromWriteBlock@buff),w
	movwf	(??_eepromWriteBlock+0)+0
	movf	0+(??_eepromWriteBlock+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(?_eepromWriteByte)
	movf	(eepromWriteBlock@i),w
	addwf	(eepromWriteBlock@addStart),w
	fcall	_eepromWriteByte
	line	45
	
l6565:	
	incf	(eepromWriteBlock@i),f
	
l6567:	
	movf	(eepromWriteBlock@len),w
	subwf	(eepromWriteBlock@i),w
	skipc
	goto	u1801
	goto	u1800
u1801:
	goto	l6563
u1800:
	line	49
	
l1337:	
	return
	opt stack 0
GLOBAL	__end_of_eepromWriteBlock
	__end_of_eepromWriteBlock:
;; =============== function _eepromWriteBlock ends ============

	signat	_eepromWriteBlock,12408
	global	_swUartSendByte
psect	text576,local,class=CODE,delta=2
global __ptext576
__ptext576:

;; *************** function _swUartSendByte *****************
;; Defined at:
;;		line 13 in file "SWUART.C"
;; Parameters:    Size  Location     Type
;;  dat             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  dat             1    3[COMMON] unsigned char 
;;  i               1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         2       0       0
;;      Temps:          1       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_swUartSendString
;;		_SendNum
;; This function uses a non-reentrant model
;;
psect	text576
	file	"SWUART.C"
	line	13
	global	__size_of_swUartSendByte
	__size_of_swUartSendByte	equ	__end_of_swUartSendByte-_swUartSendByte
	
_swUartSendByte:	
	opt	stack 5
; Regs used in _swUartSendByte: [wreg+status,2+status,0]
;swUartSendByte@dat stored from wreg
	line	16
	movwf	(swUartSendByte@dat)
	
l6543:	
;SWUART.C: 14: unsigned char i;
;SWUART.C: 16: RA2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(42/8),(42)&7
	line	18
	
l6545:	
;SWUART.C: 18: _delay((unsigned long)(((2000000/9600))*(8000000/4000000.0)));
	opt asmopt_off
movlw	138
movwf	(??_swUartSendByte+0)+0,f
u2267:
decfsz	(??_swUartSendByte+0)+0,f
	goto	u2267
	clrwdt
opt asmopt_on

	line	19
	
l6547:	
;SWUART.C: 19: for(i=0;i<8;i++){
	clrf	(swUartSendByte@i)
	
l4199:	
	line	20
;SWUART.C: 20: RA2 = (dat&1);
	btfsc	(swUartSendByte@dat),0
	goto	u1771
	goto	u1770
	
u1771:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(42/8),(42)&7
	goto	u1784
u1770:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(42/8),(42)&7
u1784:
	line	21
;SWUART.C: 21: dat=dat>>1;
	clrc
	rrf	(swUartSendByte@dat),f
	line	23
	
l6553:	
;SWUART.C: 23: _delay((unsigned long)(((2000000/9600))*(8000000/4000000.0)));
	opt asmopt_off
movlw	138
movwf	(??_swUartSendByte+0)+0,f
u2277:
decfsz	(??_swUartSendByte+0)+0,f
	goto	u2277
	clrwdt
opt asmopt_on

	line	19
	
l6555:	
	incf	(swUartSendByte@i),f
	
l6557:	
	movlw	(08h)
	subwf	(swUartSendByte@i),w
	skipc
	goto	u1791
	goto	u1790
u1791:
	goto	l4199
u1790:
	
l4200:	
	line	29
;SWUART.C: 24: }
;SWUART.C: 29: RA2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(42/8),(42)&7
	line	31
	
l6559:	
;SWUART.C: 31: _delay((unsigned long)(((2000000/9600))*(8000000/4000000.0)));
	opt asmopt_off
movlw	138
movwf	(??_swUartSendByte+0)+0,f
u2287:
decfsz	(??_swUartSendByte+0)+0,f
	goto	u2287
	clrwdt
opt asmopt_on

	line	33
	
l4201:	
	return
	opt stack 0
GLOBAL	__end_of_swUartSendByte
	__end_of_swUartSendByte:
;; =============== function _swUartSendByte ends ============

	signat	_swUartSendByte,4216
	global	_id_search
psect	text577,local,class=CODE,delta=2
global __ptext577
__ptext577:

;; *************** function _id_search *****************
;; Defined at:
;;		line 124 in file "MAIN.C"
;; Parameters:    Size  Location     Type
;;  id_input        1    wreg     PTR unsigned char 
;;		 -> keyID(5), 
;;  buff            1   10[COMMON] PTR unsigned char 
;;		 -> buffTag(25), 
;; Auto vars:     Size  Location     Type
;;  id_input        1    0[BANK0 ] PTR unsigned char 
;;		 -> keyID(5), 
;;  i               1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         0       2       0
;;      Temps:          1       0       0
;;      Totals:         2       2       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_comArr
;;		___lbdiv
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text577
	file	"MAIN.C"
	line	124
	global	__size_of_id_search
	__size_of_id_search	equ	__end_of_id_search-_id_search
	
_id_search:	
	opt	stack 5
; Regs used in _id_search: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;id_search@id_input stored from wreg
	line	126
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(id_search@id_input)
	
l6523:	
;MAIN.C: 125: unsigned char i;
;MAIN.C: 126: for(i=0;i<21;i+=5){
	clrf	(id_search@i)
	line	127
	
l6529:	
;MAIN.C: 127: if(comArr(id_input,buff+i,5,5))
	movf	(id_search@i),w
	addwf	(id_search@buff),w
	movwf	(?_comArr)
	movlw	(05h)
	movwf	0+(?_comArr)+01h
	movlw	(05h)
	movwf	0+(?_comArr)+02h
	movf	(id_search@id_input),w
	fcall	_comArr
	xorlw	0
	skipnz
	goto	u1751
	goto	u1750
u1751:
	goto	l6535
u1750:
	line	128
	
l6531:	
;MAIN.C: 128: return i/5 +1;
	movlw	(05h)
	movwf	(?___lbdiv)
	movf	(id_search@i),w
	fcall	___lbdiv
	movwf	(??_id_search+0)+0
	incf	0+(??_id_search+0)+0,w
	goto	l3466
	line	126
	
l6535:	
	movlw	(05h)
	addwf	(id_search@i),f
	
l6537:	
	movlw	(015h)
	subwf	(id_search@i),w
	skipc
	goto	u1761
	goto	u1760
u1761:
	goto	l6529
u1760:
	line	130
	
l6539:	
;MAIN.C: 129: }
;MAIN.C: 130: return 255;
	movlw	(0FFh)
	line	131
	
l3466:	
	return
	opt stack 0
GLOBAL	__end_of_id_search
	__end_of_id_search:
;; =============== function _id_search ends ============

	signat	_id_search,8313
	global	_delay_x10ms
psect	text578,local,class=CODE,delta=2
global __ptext578
__ptext578:

;; *************** function _delay_x10ms *****************
;; Defined at:
;;		line 41 in file "MAIN.C"
;; Parameters:    Size  Location     Type
;;  t               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  t               1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          2       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_beep
;; This function uses a non-reentrant model
;;
psect	text578
	file	"MAIN.C"
	line	41
	global	__size_of_delay_x10ms
	__size_of_delay_x10ms	equ	__end_of_delay_x10ms-_delay_x10ms
	
_delay_x10ms:	
	opt	stack 5
; Regs used in _delay_x10ms: [wreg+status,2+status,0]
;delay_x10ms@t stored from wreg
	movwf	(delay_x10ms@t)
	line	42
	
l6517:	
;MAIN.C: 42: while(t--)
	goto	l6521
	line	43
	
l6519:	
;MAIN.C: 43: _delay((unsigned long)((10)*(8000000/4000.0)));
	opt asmopt_off
movlw	26
movwf	((??_delay_x10ms+0)+0+1),f
	movlw	248
movwf	((??_delay_x10ms+0)+0),f
u2297:
	decfsz	((??_delay_x10ms+0)+0),f
	goto	u2297
	decfsz	((??_delay_x10ms+0)+0+1),f
	goto	u2297
	clrwdt
opt asmopt_on

	line	42
	
l6521:	
	decf	(delay_x10ms@t),f
	movf	((delay_x10ms@t)),w
	xorlw	0FFh
	skipz
	goto	u1741
	goto	u1740
u1741:
	goto	l6519
u1740:
	line	44
	
l3447:	
	return
	opt stack 0
GLOBAL	__end_of_delay_x10ms
	__end_of_delay_x10ms:
;; =============== function _delay_x10ms ends ============

	signat	_delay_x10ms,4216
	global	_get_RFID
psect	text579,local,class=CODE,delta=2
global __ptext579
__ptext579:

;; *************** function _get_RFID *****************
;; Defined at:
;;		line 21 in file "rfid125.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  RF_serial_55   11    0[BANK0 ] unsigned char [11]
;;  timeOutVal      2   17[BANK0 ] unsigned int 
;;  ii              1   19[BANK0 ] unsigned char 
;;  flag_RFID_la    1   16[BANK0 ] unsigned char 
;;  i               1   15[BANK0 ] unsigned char 
;;  j               1   14[BANK0 ] unsigned char 
;;  even_row        1   13[BANK0 ] unsigned char 
;;  even_col        1   12[BANK0 ] unsigned char 
;;  flag_RFID_sy    1   11[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0      20       0
;;      Temps:          1       0       0
;;      Totals:         1      20       0
;;Total ram usage:       21 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_timerOut
;;		___lbdiv
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text579
	file	"rfid125.c"
	line	21
	global	__size_of_get_RFID
	__size_of_get_RFID	equ	__end_of_get_RFID-_get_RFID
	
_get_RFID:	
	opt	stack 5
; Regs used in _get_RFID: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	30
	
l6295:	
;rfid125.c: 23: unsigned char RF_serial_55bits[11];
;rfid125.c: 24: unsigned int timeOutVal;
;rfid125.c: 25: unsigned char i,ii,j;
;rfid125.c: 26: unsigned char flag_RFID_syn, flag_RFID_last;
;rfid125.c: 27: unsigned char even_row, even_col;
;rfid125.c: 30: flag_RFID_syn = 0;
	clrf	(get_RFID@flag_RFID_syn)
	line	33
	
l6297:	
;rfid125.c: 33: i=16;
	movlw	(010h)
	movwf	(get_RFID@i)
	line	36
	
l6299:	
;rfid125.c: 35: {
;rfid125.c: 36: timeOutVal=timerOut(1,600);
	movlw	low(0258h)
	movwf	(?_timerOut)
	movlw	high(0258h)
	movwf	((?_timerOut))+1
	movlw	(01h)
	fcall	_timerOut
	movf	(1+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal+1)
	movf	(0+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal)
	line	37
	
l6301:	
;rfid125.c: 37: if(timeOutVal==0) return 0;
	movf	((get_RFID@timeOutVal+1)),w
	iorwf	((get_RFID@timeOutVal)),w
	skipz
	goto	u1311
	goto	u1310
u1311:
	goto	l6307
u1310:
	
l6303:	
	movlw	(0)
	goto	l2047
	line	39
	
l6307:	
;rfid125.c: 39: timeOutVal=timerOut(0,600);
	movlw	low(0258h)
	movwf	(?_timerOut)
	movlw	high(0258h)
	movwf	((?_timerOut))+1
	movlw	(0)
	fcall	_timerOut
	movf	(1+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal+1)
	movf	(0+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal)
	line	40
	
l6309:	
;rfid125.c: 40: if(timeOutVal==0) return 0;
	movf	((get_RFID@timeOutVal+1)),w
	iorwf	((get_RFID@timeOutVal)),w
	skipz
	goto	u1321
	goto	u1320
u1321:
	goto	l6315
u1320:
	goto	l6303
	line	42
	
l6315:	
;rfid125.c: 42: i--;
	decf	(get_RFID@i),f
	line	44
	
l6317:	
;rfid125.c: 43: }
;rfid125.c: 44: while(timeOutVal<290 && i>0);
	movlw	high(0122h)
	subwf	(get_RFID@timeOutVal+1),w
	movlw	low(0122h)
	skipnz
	subwf	(get_RFID@timeOutVal),w
	skipnc
	goto	u1331
	goto	u1330
u1331:
	goto	l2051
u1330:
	
l6319:	
	movf	(get_RFID@i),f
	skipz
	goto	u1341
	goto	u1340
u1341:
	goto	l6299
u1340:
	
l2051:	
	line	45
;rfid125.c: 45: flag_RFID_last = 1;
	clrf	(get_RFID@flag_RFID_last)
	incf	(get_RFID@flag_RFID_last),f
	line	46
	
l6321:	
;rfid125.c: 46: i = 0;
	clrf	(get_RFID@i)
	line	47
;rfid125.c: 47: while(i<64)
	goto	l6387
	line	49
	
l6323:	
;rfid125.c: 48: {
;rfid125.c: 49: for(ii=0;ii<9;ii++)
	clrf	(get_RFID@ii)
	line	51
	
l6329:	
;rfid125.c: 50: {
;rfid125.c: 51: timeOutVal=timerOut(flag_RFID_last,600);
	movlw	low(0258h)
	movwf	(?_timerOut)
	movlw	high(0258h)
	movwf	((?_timerOut))+1
	movf	(get_RFID@flag_RFID_last),w
	fcall	_timerOut
	movf	(1+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal+1)
	movf	(0+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal)
	line	52
	
l6331:	
;rfid125.c: 52: if(timeOutVal==0) return 0;
	movf	((get_RFID@timeOutVal+1)),w
	iorwf	((get_RFID@timeOutVal)),w
	skipz
	goto	u1351
	goto	u1350
u1351:
	goto	l6337
u1350:
	goto	l6303
	line	55
	
l6337:	
;rfid125.c: 54: if(0==flag_RFID_last && timeOutVal<=290 ||
;rfid125.c: 55: 1==flag_RFID_last && timeOutVal>290)
	movf	(get_RFID@flag_RFID_last),f
	skipz
	goto	u1361
	goto	u1360
u1361:
	goto	l6341
u1360:
	
l6339:	
	movlw	high(0123h)
	subwf	(get_RFID@timeOutVal+1),w
	movlw	low(0123h)
	skipnz
	subwf	(get_RFID@timeOutVal),w
	skipc
	goto	u1371
	goto	u1370
u1371:
	goto	l6345
u1370:
	
l6341:	
	decf	(get_RFID@flag_RFID_last),w
	skipz
	goto	u1381
	goto	u1380
u1381:
	goto	l6359
u1380:
	
l6343:	
	movlw	high(0123h)
	subwf	(get_RFID@timeOutVal+1),w
	movlw	low(0123h)
	skipnz
	subwf	(get_RFID@timeOutVal),w
	skipc
	goto	u1391
	goto	u1390
u1391:
	goto	l6359
u1390:
	line	57
	
l6345:	
;rfid125.c: 56: {
;rfid125.c: 57: if(!flag_RFID_last)
	movf	(get_RFID@flag_RFID_last),f
	skipz
	goto	u1401
	goto	u1400
u1401:
	goto	l6355
u1400:
	line	59
	
l6347:	
;rfid125.c: 58: {
;rfid125.c: 59: timeOutVal=timerOut(1,290);
	movlw	low(0122h)
	movwf	(?_timerOut)
	movlw	high(0122h)
	movwf	((?_timerOut))+1
	movlw	(01h)
	fcall	_timerOut
	movf	(1+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal+1)
	movf	(0+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal)
	line	60
	
l6349:	
;rfid125.c: 60: if(timeOutVal==0) return 0;
	movf	((get_RFID@timeOutVal+1)),w
	iorwf	((get_RFID@timeOutVal)),w
	skipz
	goto	u1411
	goto	u1410
u1411:
	goto	l6355
u1410:
	goto	l6303
	line	62
	
l6355:	
;rfid125.c: 61: }
;rfid125.c: 62: flag_RFID_last = 0;
	clrf	(get_RFID@flag_RFID_last)
	line	63
	
l6357:	
;rfid125.c: 63: i++;
	incf	(get_RFID@i),f
	line	64
;rfid125.c: 64: }
	goto	l6379
	line	67
	
l6359:	
;rfid125.c: 65: else
;rfid125.c: 66: if(0==flag_RFID_last && timeOutVal>290 ||
;rfid125.c: 67: 1==flag_RFID_last && timeOutVal<=290)
	movf	(get_RFID@flag_RFID_last),f
	skipz
	goto	u1421
	goto	u1420
u1421:
	goto	l6363
u1420:
	
l6361:	
	movlw	high(0123h)
	subwf	(get_RFID@timeOutVal+1),w
	movlw	low(0123h)
	skipnz
	subwf	(get_RFID@timeOutVal),w
	skipnc
	goto	u1431
	goto	u1430
u1431:
	goto	l6367
u1430:
	
l6363:	
	decf	(get_RFID@flag_RFID_last),w
	skipz
	goto	u1441
	goto	u1440
u1441:
	goto	l6379
u1440:
	
l6365:	
	movlw	high(0123h)
	subwf	(get_RFID@timeOutVal+1),w
	movlw	low(0123h)
	skipnz
	subwf	(get_RFID@timeOutVal),w
	skipnc
	goto	u1451
	goto	u1450
u1451:
	goto	l6379
u1450:
	line	69
	
l6367:	
;rfid125.c: 68: {
;rfid125.c: 69: if(flag_RFID_last)
	movf	(get_RFID@flag_RFID_last),w
	skipz
	goto	u1460
	goto	l2070
u1460:
	line	71
	
l6369:	
;rfid125.c: 70: {
;rfid125.c: 71: timeOutVal=timerOut(0,290);
	movlw	low(0122h)
	movwf	(?_timerOut)
	movlw	high(0122h)
	movwf	((?_timerOut))+1
	movlw	(0)
	fcall	_timerOut
	movf	(1+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal+1)
	movf	(0+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal)
	line	72
	
l6371:	
;rfid125.c: 72: if(timeOutVal==0) return 0;
	movf	((get_RFID@timeOutVal+1)),w
	iorwf	((get_RFID@timeOutVal)),w
	skipz
	goto	u1471
	goto	u1470
u1471:
	goto	l2070
u1470:
	goto	l6303
	line	73
	
l2070:	
	line	74
;rfid125.c: 73: }
;rfid125.c: 74: flag_RFID_last = 1;
	clrf	(get_RFID@flag_RFID_last)
	incf	(get_RFID@flag_RFID_last),f
	line	75
	
l6377:	
;rfid125.c: 75: i++;
	incf	(get_RFID@i),f
	line	77
;rfid125.c: 77: break;
	goto	l6383
	line	49
	
l6379:	
	incf	(get_RFID@ii),f
	
l6381:	
	movlw	(09h)
	subwf	(get_RFID@ii),w
	skipc
	goto	u1481
	goto	u1480
u1481:
	goto	l6329
u1480:
	line	81
	
l6383:	
;rfid125.c: 78: }
;rfid125.c: 80: }
;rfid125.c: 81: if(9==ii)
	movf	(get_RFID@ii),w
	xorlw	09h
	skipz
	goto	u1491
	goto	u1490
u1491:
	goto	l6387
u1490:
	line	83
	
l6385:	
;rfid125.c: 82: {
;rfid125.c: 83: flag_RFID_syn = 1;
	clrf	(get_RFID@flag_RFID_syn)
	incf	(get_RFID@flag_RFID_syn),f
	line	84
;rfid125.c: 84: break;
	goto	l6389
	line	47
	
l6387:	
	movlw	(040h)
	subwf	(get_RFID@i),w
	skipc
	goto	u1501
	goto	u1500
u1501:
	goto	l6323
u1500:
	line	88
	
l6389:	
;rfid125.c: 85: }
;rfid125.c: 86: }
;rfid125.c: 88: if(!flag_RFID_syn)
	movf	(get_RFID@flag_RFID_syn),f
	skipz
	goto	u1511
	goto	u1510
u1511:
	goto	l6395
u1510:
	goto	l6303
	line	92
	
l6395:	
;rfid125.c: 91: }
;rfid125.c: 92: for(ii=0;ii<55;ii++)
	clrf	(get_RFID@ii)
	line	94
	
l6401:	
;rfid125.c: 93: {
;rfid125.c: 94: i = ii/5;
	movlw	(05h)
	movwf	(?___lbdiv)
	movf	(get_RFID@ii),w
	fcall	___lbdiv
	movwf	(get_RFID@i)
	line	95
	
l6403:	
;rfid125.c: 95: timeOutVal=timerOut(flag_RFID_last,600);
	movlw	low(0258h)
	movwf	(?_timerOut)
	movlw	high(0258h)
	movwf	((?_timerOut))+1
	movf	(get_RFID@flag_RFID_last),w
	fcall	_timerOut
	movf	(1+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal+1)
	movf	(0+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal)
	line	96
	
l6405:	
;rfid125.c: 96: if(timeOutVal==0) return 0;
	movf	((get_RFID@timeOutVal+1)),w
	iorwf	((get_RFID@timeOutVal)),w
	skipz
	goto	u1521
	goto	u1520
u1521:
	goto	l6411
u1520:
	goto	l6303
	line	99
	
l6411:	
;rfid125.c: 98: if(0==flag_RFID_last && timeOutVal<=290 ||
;rfid125.c: 99: 1==flag_RFID_last && timeOutVal>290)
	movf	(get_RFID@flag_RFID_last),f
	skipz
	goto	u1531
	goto	u1530
u1531:
	goto	l6415
u1530:
	
l6413:	
	movlw	high(0123h)
	subwf	(get_RFID@timeOutVal+1),w
	movlw	low(0123h)
	skipnz
	subwf	(get_RFID@timeOutVal),w
	skipc
	goto	u1541
	goto	u1540
u1541:
	goto	l6419
u1540:
	
l6415:	
	decf	(get_RFID@flag_RFID_last),w
	skipz
	goto	u1551
	goto	u1550
u1551:
	goto	l6435
u1550:
	
l6417:	
	movlw	high(0123h)
	subwf	(get_RFID@timeOutVal+1),w
	movlw	low(0123h)
	skipnz
	subwf	(get_RFID@timeOutVal),w
	skipc
	goto	u1561
	goto	u1560
u1561:
	goto	l6435
u1560:
	line	101
	
l6419:	
;rfid125.c: 100: {
;rfid125.c: 101: if(!flag_RFID_last)
	movf	(get_RFID@flag_RFID_last),f
	skipz
	goto	u1571
	goto	u1570
u1571:
	goto	l6429
u1570:
	line	103
	
l6421:	
;rfid125.c: 102: {
;rfid125.c: 103: timeOutVal=timerOut(1,290);
	movlw	low(0122h)
	movwf	(?_timerOut)
	movlw	high(0122h)
	movwf	((?_timerOut))+1
	movlw	(01h)
	fcall	_timerOut
	movf	(1+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal+1)
	movf	(0+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal)
	line	104
	
l6423:	
;rfid125.c: 104: if(timeOutVal==0) return 0;
	movf	((get_RFID@timeOutVal+1)),w
	iorwf	((get_RFID@timeOutVal)),w
	skipz
	goto	u1581
	goto	u1580
u1581:
	goto	l6429
u1580:
	goto	l6303
	line	106
	
l6429:	
;rfid125.c: 105: }
;rfid125.c: 106: flag_RFID_last = 0;
	clrf	(get_RFID@flag_RFID_last)
	line	107
	
l6431:	
;rfid125.c: 107: RF_serial_55bits[i] <<= 1;
	movf	(get_RFID@i),w
	addlw	get_RFID@RF_serial_55bits&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrc
	rlf	indf,f
	line	108
	
l6433:	
;rfid125.c: 108: RF_serial_55bits[i] |= 0x01;
	movf	(get_RFID@i),w
	addlw	get_RFID@RF_serial_55bits&0ffh
	movwf	fsr0
	bsf	indf+(0/8),(0)&7
	line	109
;rfid125.c: 109: }
	goto	l6455
	line	112
	
l6435:	
;rfid125.c: 110: else
;rfid125.c: 111: if(0==flag_RFID_last && timeOutVal>290 ||
;rfid125.c: 112: 1==flag_RFID_last && timeOutVal<=290)
	movf	(get_RFID@flag_RFID_last),f
	skipz
	goto	u1591
	goto	u1590
u1591:
	goto	l6439
u1590:
	
l6437:	
	movlw	high(0123h)
	subwf	(get_RFID@timeOutVal+1),w
	movlw	low(0123h)
	skipnz
	subwf	(get_RFID@timeOutVal),w
	skipnc
	goto	u1601
	goto	u1600
u1601:
	goto	l6443
u1600:
	
l6439:	
	decf	(get_RFID@flag_RFID_last),w
	skipz
	goto	u1611
	goto	u1610
u1611:
	goto	l6455
u1610:
	
l6441:	
	movlw	high(0123h)
	subwf	(get_RFID@timeOutVal+1),w
	movlw	low(0123h)
	skipnz
	subwf	(get_RFID@timeOutVal),w
	skipnc
	goto	u1621
	goto	u1620
u1621:
	goto	l6455
u1620:
	line	114
	
l6443:	
;rfid125.c: 113: {
;rfid125.c: 114: if(flag_RFID_last)
	movf	(get_RFID@flag_RFID_last),w
	skipz
	goto	u1630
	goto	l2091
u1630:
	line	116
	
l6445:	
;rfid125.c: 115: {
;rfid125.c: 116: timeOutVal=timerOut(0,600);
	movlw	low(0258h)
	movwf	(?_timerOut)
	movlw	high(0258h)
	movwf	((?_timerOut))+1
	movlw	(0)
	fcall	_timerOut
	movf	(1+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal+1)
	movf	(0+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal)
	line	117
	
l6447:	
;rfid125.c: 117: if(timeOutVal==0) return 0;
	movf	((get_RFID@timeOutVal+1)),w
	iorwf	((get_RFID@timeOutVal)),w
	skipz
	goto	u1641
	goto	u1640
u1641:
	goto	l2091
u1640:
	goto	l6303
	line	118
	
l2091:	
	line	119
;rfid125.c: 118: }
;rfid125.c: 119: flag_RFID_last = 1;
	clrf	(get_RFID@flag_RFID_last)
	incf	(get_RFID@flag_RFID_last),f
	line	120
	
l6453:	
;rfid125.c: 120: RF_serial_55bits[i] <<= 1;
	movf	(get_RFID@i),w
	addlw	get_RFID@RF_serial_55bits&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrc
	rlf	indf,f
	line	92
	
l6455:	
	incf	(get_RFID@ii),f
	
l6457:	
	movlw	(037h)
	subwf	(get_RFID@ii),w
	skipc
	goto	u1651
	goto	u1650
u1651:
	goto	l6401
u1650:
	line	123
	
l6459:	
;rfid125.c: 121: }
;rfid125.c: 122: }
;rfid125.c: 123: if(55==ii)
	movf	(get_RFID@ii),w
	xorlw	037h
	skipz
	goto	u1661
	goto	u1660
u1661:
	goto	l6303
u1660:
	line	125
	
l6461:	
;rfid125.c: 124: {
;rfid125.c: 125: even_col = 0;
	clrf	(get_RFID@even_col)
	line	126
;rfid125.c: 126: for(ii=0;ii<10;ii++)
	clrf	(get_RFID@ii)
	line	128
	
l6467:	
;rfid125.c: 127: {
;rfid125.c: 128: even_row = (RF_serial_55bits[ii] & 0x01);
	movf	(get_RFID@ii),w
	addlw	get_RFID@RF_serial_55bits&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(get_RFID@even_row)
	
l6469:	
	movlw	(01h)
	andwf	(get_RFID@even_row),f
	line	129
	
l6471:	
;rfid125.c: 129: for(j=1;j<5;j++)
	clrf	(get_RFID@j)
	incf	(get_RFID@j),f
	line	131
	
l6477:	
;rfid125.c: 130: {
;rfid125.c: 131: even_row = even_row ^ ((RF_serial_55bits[ii]>>j) & 0x01);
	movf	(get_RFID@ii),w
	addlw	get_RFID@RF_serial_55bits&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_get_RFID+0)+0
	incf	(get_RFID@j),w
	goto	u1674
u1675:
	clrc
	rrf	(??_get_RFID+0)+0,f
u1674:
	addlw	-1
	skipz
	goto	u1675
	movf	0+(??_get_RFID+0)+0,w
	andlw	01h
	xorwf	(get_RFID@even_row),f
	line	129
	
l6479:	
	incf	(get_RFID@j),f
	
l6481:	
	movlw	(05h)
	subwf	(get_RFID@j),w
	skipc
	goto	u1681
	goto	u1680
u1681:
	goto	l6477
u1680:
	
l2097:	
	line	133
;rfid125.c: 132: }
;rfid125.c: 133: if(even_row & 0x01)
	btfss	(get_RFID@even_row),(0)&7
	goto	u1691
	goto	u1690
u1691:
	goto	l6487
u1690:
	goto	l6303
	line	138
	
l6487:	
;rfid125.c: 136: }
;rfid125.c: 138: RF_serial_55bits[ii] <<= 3;
	movf	(get_RFID@ii),w
	addlw	get_RFID@RF_serial_55bits&0ffh
	movwf	fsr0
	rlf	indf,f
	rlf	indf,f
	rlf	indf,w
	andlw	0f8h
	movwf	indf
	line	140
;rfid125.c: 140: i = RF_serial_55bits[ii];
	movf	(get_RFID@ii),w
	addlw	get_RFID@RF_serial_55bits&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(get_RFID@i)
	line	141
	
l6489:	
;rfid125.c: 141: if( 0==ii%2 )
	btfsc	(get_RFID@ii),(0)&7
	goto	u1701
	goto	u1700
u1701:
	goto	l6493
u1700:
	line	143
	
l6491:	
;rfid125.c: 142: {
;rfid125.c: 143: keyID[ii/2] = (i & 0xF0);
	clrc
	rrf	(get_RFID@ii),w
	addlw	_keyID&0ffh
	movwf	fsr0
	movf	(get_RFID@i),w
	movwf	indf
	clrc
	rrf	(get_RFID@ii),w
	addlw	_keyID&0ffh
	movwf	fsr0
	movlw	(0F0h)
	andwf	indf,f
	line	144
;rfid125.c: 144: }
	goto	l6497
	line	147
	
l6493:	
;rfid125.c: 145: else
;rfid125.c: 146: {
;rfid125.c: 147: i >>=4;
swapf	(get_RFID@i),f
	movlw	15
	andwf	(get_RFID@i),f

	line	148
	
l6495:	
;rfid125.c: 148: keyID[ii/2] |= (i & 0x0F);
	clrc
	rrf	(get_RFID@ii),w
	addlw	_keyID&0ffh
	movwf	fsr0
	movf	(get_RFID@i),w
	andlw	0Fh
	iorwf	indf,f
	line	150
	
l6497:	
;rfid125.c: 149: }
;rfid125.c: 150: even_col ^= RF_serial_55bits[ii];
	movf	(get_RFID@ii),w
	addlw	get_RFID@RF_serial_55bits&0ffh
	movwf	fsr0
	movf	indf,w
	xorwf	(get_RFID@even_col),f
	line	126
	
l6499:	
	incf	(get_RFID@ii),f
	
l6501:	
	movlw	(0Ah)
	subwf	(get_RFID@ii),w
	skipc
	goto	u1711
	goto	u1710
u1711:
	goto	l6467
u1710:
	
l2095:	
	line	152
;rfid125.c: 151: }
;rfid125.c: 152: RF_serial_55bits[10] <<= 3;
	rlf	0+(get_RFID@RF_serial_55bits)+0Ah,f
	rlf	0+(get_RFID@RF_serial_55bits)+0Ah,f
	rlf	0+(get_RFID@RF_serial_55bits)+0Ah,w
	andlw	0f8h
	movwf	0+(get_RFID@RF_serial_55bits)+0Ah
	line	153
	
l6503:	
;rfid125.c: 153: keyID[0] =0x00;
	clrf	(_keyID)
	line	154
	
l6505:	
;rfid125.c: 154: if(((RF_serial_55bits[10] & 0xf0)==(even_col & 0xf0)) && (0==(RF_serial_55bits[10]&0x08)))
	movlw	(0F0h)
	andwf	(get_RFID@even_col),w
	movwf	(??_get_RFID+0)+0
	movf	0+(get_RFID@RF_serial_55bits)+0Ah,w
	andlw	0F0h
	xorwf	0+(??_get_RFID+0)+0,w
	skipz
	goto	u1721
	goto	u1720
u1721:
	goto	l6303
u1720:
	
l6507:	
	btfsc	0+(get_RFID@RF_serial_55bits)+0Ah,(3)&7
	goto	u1731
	goto	u1730
u1731:
	goto	l6303
u1730:
	line	157
	
l6509:	
;rfid125.c: 155: {
;rfid125.c: 157: return 1;
	movlw	(01h)
	line	161
	
l2047:	
	return
	opt stack 0
GLOBAL	__end_of_get_RFID
	__end_of_get_RFID:
;; =============== function _get_RFID ends ============

	signat	_get_RFID,89
	global	_eepromWriteByte
psect	text580,local,class=CODE,delta=2
global __ptext580
__ptext580:

;; *************** function _eepromWriteByte *****************
;; Defined at:
;;		line 26 in file "ms82_eeprom.c"
;; Parameters:    Size  Location     Type
;;  EEAddr          1    wreg     unsigned char 
;;  EEData          1    2[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  EEAddr          1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         1       0       0
;;      Temps:          2       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_eepromWriteBlock
;;		_main
;; This function uses a non-reentrant model
;;
psect	text580
	file	"ms82_eeprom.c"
	line	26
	global	__size_of_eepromWriteByte
	__size_of_eepromWriteByte	equ	__end_of_eepromWriteByte-_eepromWriteByte
	
_eepromWriteByte:	
	opt	stack 4
; Regs used in _eepromWriteByte: [wreg]
;eepromWriteByte@EEAddr stored from wreg
	movwf	(eepromWriteByte@EEAddr)
	line	27
	
l6283:	
;ms82_eeprom.c: 27: GIE = 0;
	bcf	(95/8),(95)&7
	line	30
;ms82_eeprom.c: 29: {
;ms82_eeprom.c: 30: while(GIE) asm("clrwdt");
	goto	l1325
	
l1326:	
# 30 "ms82_eeprom.c"
clrwdt ;#
psect	text580
	
l1325:	
	btfsc	(95/8),(95)&7
	goto	u1291
	goto	u1290
u1291:
	goto	l1326
u1290:
	line	31
	
l6285:	
;ms82_eeprom.c: 31: EEADR = EEAddr;
	movf	(eepromWriteByte@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(155)^080h	;volatile
	line	32
;ms82_eeprom.c: 32: EEDAT = EEData;
	movf	(eepromWriteByte@EEData),w
	movwf	(154)^080h	;volatile
	line	33
	
l6287:	
;ms82_eeprom.c: 33: EEIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(103/8),(103)&7
	line	34
;ms82_eeprom.c: 34: EECON1 = 0x34;
	movlw	(034h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(156)^080h	;volatile
	line	35
	
l6289:	
;ms82_eeprom.c: 35: WR = 1;
	bsf	(1256/8)^080h,(1256)&7
	line	36
;ms82_eeprom.c: 36: while(WR) asm("clrwdt");
	goto	l1328
	
l1329:	
# 36 "ms82_eeprom.c"
clrwdt ;#
psect	text580
	
l1328:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	(1256/8)^080h,(1256)&7
	goto	u1301
	goto	u1300
u1301:
	goto	l1329
u1300:
	line	37
	
l6291:	
;ms82_eeprom.c: 37: _delay((unsigned long)((2)*(8000000/4000.0)));
	opt asmopt_off
movlw	6
movwf	((??_eepromWriteByte+0)+0+1),f
	movlw	48
movwf	((??_eepromWriteByte+0)+0),f
u2307:
	decfsz	((??_eepromWriteByte+0)+0),f
	goto	u2307
	decfsz	((??_eepromWriteByte+0)+0+1),f
	goto	u2307
	clrwdt
opt asmopt_on

	line	39
	
l6293:	
;ms82_eeprom.c: 38: }
;ms82_eeprom.c: 39: GIE = 1;
	bsf	(95/8),(95)&7
	line	40
	
l1331:	
	return
	opt stack 0
GLOBAL	__end_of_eepromWriteByte
	__end_of_eepromWriteByte:
;; =============== function _eepromWriteByte ends ============

	signat	_eepromWriteByte,8312
	global	_eepromReadBlock
psect	text581,local,class=CODE,delta=2
global __ptext581
__ptext581:

;; *************** function _eepromReadBlock *****************
;; Defined at:
;;		line 18 in file "ms82_eeprom.c"
;; Parameters:    Size  Location     Type
;;  addStart        1    wreg     unsigned char 
;;  buff            1    4[COMMON] PTR unsigned char 
;;		 -> buffTag(25), 
;;  len             1    5[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  addStart        1    7[COMMON] unsigned char 
;;  i               1    8[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 0/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         2       0       0
;;      Temps:          1       0       0
;;      Totals:         5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_eepromReadByte
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text581
	file	"ms82_eeprom.c"
	line	18
	global	__size_of_eepromReadBlock
	__size_of_eepromReadBlock	equ	__end_of_eepromReadBlock-_eepromReadBlock
	
_eepromReadBlock:	
	opt	stack 5
; Regs used in _eepromReadBlock: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;eepromReadBlock@addStart stored from wreg
	line	20
	movwf	(eepromReadBlock@addStart)
	
l6275:	
;ms82_eeprom.c: 19: unsigned char i;
;ms82_eeprom.c: 20: for(i=0;i<len;i++){
	clrf	(eepromReadBlock@i)
	goto	l6281
	line	21
	
l6277:	
;ms82_eeprom.c: 21: buff[i] = eepromReadByte(addStart+i);
	movf	(eepromReadBlock@i),w
	addwf	(eepromReadBlock@buff),w
	movwf	(??_eepromReadBlock+0)+0
	movf	0+(??_eepromReadBlock+0)+0,w
	movwf	fsr0
	movf	(eepromReadBlock@i),w
	addwf	(eepromReadBlock@addStart),w
	fcall	_eepromReadByte
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	20
	
l6279:	
	incf	(eepromReadBlock@i),f
	
l6281:	
	movf	(eepromReadBlock@len),w
	subwf	(eepromReadBlock@i),w
	skipc
	goto	u1281
	goto	u1280
u1281:
	goto	l6277
u1280:
	line	23
	
l1322:	
	return
	opt stack 0
GLOBAL	__end_of_eepromReadBlock
	__end_of_eepromReadBlock:
;; =============== function _eepromReadBlock ends ============

	signat	_eepromReadBlock,12408
	global	_sys_init
psect	text582,local,class=CODE,delta=2
global __ptext582
__ptext582:

;; *************** function _sys_init *****************
;; Defined at:
;;		line 3 in file "sysinit.c"
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
;;		On exit  : 60/20
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text582
	file	"sysinit.c"
	line	3
	global	__size_of_sys_init
	__size_of_sys_init	equ	__end_of_sys_init-_sys_init
	
_sys_init:	
	opt	stack 6
; Regs used in _sys_init: [wreg]
	line	21
	
l6271:	
;sysinit.c: 21: OSCCON = 0B01100001;
	movlw	(061h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(143)^080h	;volatile
	line	22
	
l6273:	
;sysinit.c: 22: _nop();
	nop
	line	28
;sysinit.c: 28: while(HTS==0);
	
l651:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1146/8)^080h,(1146)&7
	goto	u1271
	goto	u1270
u1271:
	goto	l651
u1270:
	line	30
	
l654:	
	return
	opt stack 0
GLOBAL	__end_of_sys_init
	__end_of_sys_init:
;; =============== function _sys_init ends ============

	signat	_sys_init,88
	global	___lbdiv
psect	text583,local,class=CODE,delta=2
global __ptext583
__ptext583:

;; *************** function ___lbdiv *****************
;; Defined at:
;;		line 5 in file "D:\OneDrive\SmarRF\MCU\MC82\IDE\ORIGINIDE_V2.0.9\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lbdiv.c"
;; Parameters:    Size  Location     Type
;;  dividend        1    wreg     unsigned char 
;;  divisor         1    2[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  dividend        1    3[COMMON] unsigned char 
;;  quotient        1    5[COMMON] unsigned char 
;;  counter         1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         3       0       0
;;      Temps:          0       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_get_RFID
;;		_id_search
;; This function uses a non-reentrant model
;;
psect	text583
	file	"D:\OneDrive\SmarRF\MCU\MC82\IDE\ORIGINIDE_V2.0.9\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lbdiv.c"
	line	5
	global	__size_of___lbdiv
	__size_of___lbdiv	equ	__end_of___lbdiv-___lbdiv
	
___lbdiv:	
	opt	stack 5
; Regs used in ___lbdiv: [wreg+status,2+status,0]
;___lbdiv@dividend stored from wreg
	line	9
	movwf	(___lbdiv@dividend)
	
l6247:	
	clrf	(___lbdiv@quotient)
	line	10
	
l6249:	
	movf	(___lbdiv@divisor),w
	skipz
	goto	u1230
	goto	l6267
u1230:
	line	11
	
l6251:	
	clrf	(___lbdiv@counter)
	incf	(___lbdiv@counter),f
	line	12
	goto	l6255
	
l4915:	
	line	13
	clrc
	rlf	(___lbdiv@divisor),f
	line	14
	
l6253:	
	incf	(___lbdiv@counter),f
	line	12
	
l6255:	
	btfss	(___lbdiv@divisor),(7)&7
	goto	u1241
	goto	u1240
u1241:
	goto	l4915
u1240:
	line	16
	
l4917:	
	line	17
	clrc
	rlf	(___lbdiv@quotient),f
	line	18
	
l6257:	
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),w
	skipc
	goto	u1251
	goto	u1250
u1251:
	goto	l6263
u1250:
	line	19
	
l6259:	
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),f
	line	20
	
l6261:	
	bsf	(___lbdiv@quotient)+(0/8),(0)&7
	line	22
	
l6263:	
	clrc
	rrf	(___lbdiv@divisor),f
	line	23
	
l6265:	
	decfsz	(___lbdiv@counter),f
	goto	u1261
	goto	u1260
u1261:
	goto	l4917
u1260:
	line	25
	
l6267:	
	movf	(___lbdiv@quotient),w
	line	26
	
l4920:	
	return
	opt stack 0
GLOBAL	__end_of___lbdiv
	__end_of___lbdiv:
;; =============== function ___lbdiv ends ============

	signat	___lbdiv,8313
	global	___bmul
psect	text584,local,class=CODE,delta=2
global __ptext584
__ptext584:

;; *************** function ___bmul *****************
;; Defined at:
;;		line 3 in file "D:\OneDrive\SmarRF\MCU\MC82\IDE\ORIGINIDE_V2.0.9\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\bmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      1    wreg     unsigned char 
;;  multiplicand    1    2[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  multiplier      1    4[COMMON] unsigned char 
;;  product         1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_id_replate
;; This function uses a non-reentrant model
;;
psect	text584
	file	"D:\OneDrive\SmarRF\MCU\MC82\IDE\ORIGINIDE_V2.0.9\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\bmul.c"
	line	3
	global	__size_of___bmul
	__size_of___bmul	equ	__end_of___bmul-___bmul
	
___bmul:	
	opt	stack 5
; Regs used in ___bmul: [wreg+status,2+status,0]
;___bmul@multiplier stored from wreg
	movwf	(___bmul@multiplier)
	line	4
	
l6231:	
	clrf	(___bmul@product)
	line	7
	
l6233:	
	btfss	(___bmul@multiplier),(0)&7
	goto	u1211
	goto	u1210
u1211:
	goto	l6237
u1210:
	line	8
	
l6235:	
	movf	(___bmul@multiplicand),w
	addwf	(___bmul@product),f
	line	9
	
l6237:	
	clrc
	rlf	(___bmul@multiplicand),f
	line	10
	
l6239:	
	clrc
	rrf	(___bmul@multiplier),f
	line	11
	
l6241:	
	movf	(___bmul@multiplier),f
	skipz
	goto	u1221
	goto	u1220
u1221:
	goto	l6233
u1220:
	line	12
	
l6243:	
	movf	(___bmul@product),w
	line	13
	
l4884:	
	return
	opt stack 0
GLOBAL	__end_of___bmul
	__end_of___bmul:
;; =============== function ___bmul ends ============

	signat	___bmul,8313
	global	_setState
psect	text585,local,class=CODE,delta=2
global __ptext585
__ptext585:

;; *************** function _setState *****************
;; Defined at:
;;		line 117 in file "MAIN.C"
;; Parameters:    Size  Location     Type
;;  stt             1    wreg     unsigned char 
;;  _tOut           2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  stt             1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text585
	file	"MAIN.C"
	line	117
	global	__size_of_setState
	__size_of_setState	equ	__end_of_setState-_setState
	
_setState:	
	opt	stack 6
; Regs used in _setState: [wreg+status,2]
;setState@stt stored from wreg
	line	119
	movwf	(setState@stt)
	
l6225:	
;MAIN.C: 119: mtState = stt;
	movf	(setState@stt),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_mtState)
	line	120
	
l6227:	
;MAIN.C: 120: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	121
	
l6229:	
;MAIN.C: 121: timeOut = _tOut;
	movf	(setState@_tOut+1),w
	movwf	(_timeOut+1)
	movf	(setState@_tOut),w
	movwf	(_timeOut)
	line	122
	
l3460:	
	return
	opt stack 0
GLOBAL	__end_of_setState
	__end_of_setState:
;; =============== function _setState ends ============

	signat	_setState,8312
	global	_SET_EPWM_ON
psect	text586,local,class=CODE,delta=2
global __ptext586
__ptext586:

;; *************** function _SET_EPWM_ON *****************
;; Defined at:
;;		line 11 in file "ms82_pwm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/20
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text586
	file	"ms82_pwm.c"
	line	11
	global	__size_of_SET_EPWM_ON
	__size_of_SET_EPWM_ON	equ	__end_of_SET_EPWM_ON-_SET_EPWM_ON
	
_SET_EPWM_ON:	
	opt	stack 6
; Regs used in _SET_EPWM_ON: [wreg+status,2]
	line	12
	
l6199:	
;ms82_pwm.c: 12: TRISC |= 0b00000100;
	bsf	(135)^080h+(2/8),(2)&7	;volatile
	line	13
	
l6201:	
;ms82_pwm.c: 13: PR2 = 15;
	movlw	(0Fh)
	movwf	(146)^080h	;volatile
	line	14
	
l6203:	
;ms82_pwm.c: 14: EPWMR1L =0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(19)	;volatile
	line	15
	
l6205:	
;ms82_pwm.c: 15: EPWM1CON = 0b10011100;
	movlw	(09Ch)
	movwf	(21)	;volatile
	line	16
;ms82_pwm.c: 16: TMR2 = 0;
	clrf	(17)	;volatile
	line	17
	
l6207:	
;ms82_pwm.c: 17: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	18
	
l6209:	
;ms82_pwm.c: 18: T2CON = 0B00000100;
	movlw	(04h)
	movwf	(18)	;volatile
	line	19
;ms82_pwm.c: 19: while(TMR2IF==1) asm("clrwdt");
	goto	l2750
	
l2751:	
# 19 "ms82_pwm.c"
clrwdt ;#
psect	text586
	
l2750:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(97/8),(97)&7
	goto	u1181
	goto	u1180
u1181:
	goto	l2751
u1180:
	line	20
	
l6211:	
;ms82_pwm.c: 20: PWM1CON = 0b00010000;
	movlw	(010h)
	movwf	(22)	;volatile
	line	21
;ms82_pwm.c: 21: EPWM1AUX = 0b10001000;
	movlw	(088h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	22
	
l6213:	
;ms82_pwm.c: 22: TRISC &= 0b11111011;
	bcf	(135)^080h+(2/8),(2)&7	;volatile
	line	23
	
l2753:	
	return
	opt stack 0
GLOBAL	__end_of_SET_EPWM_ON
	__end_of_SET_EPWM_ON:
;; =============== function _SET_EPWM_ON ends ============

	signat	_SET_EPWM_ON,88
	global	_timerOut
psect	text587,local,class=CODE,delta=2
global __ptext587
__ptext587:

;; *************** function _timerOut *****************
;; Defined at:
;;		line 6 in file "rfid125.c"
;; Parameters:    Size  Location     Type
;;  Logic           1    wreg     unsigned char 
;;  time            2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  Logic           1    4[COMMON] unsigned char 
;;  CurTimer        2    5[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    2[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         3       0       0
;;      Temps:          0       0       0
;;      Totals:         5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_get_RFID
;; This function uses a non-reentrant model
;;
psect	text587
	file	"rfid125.c"
	line	6
	global	__size_of_timerOut
	__size_of_timerOut	equ	__end_of_timerOut-_timerOut
	
_timerOut:	
	opt	stack 5
; Regs used in _timerOut: [wreg+status,2]
;timerOut@Logic stored from wreg
	line	8
	movwf	(timerOut@Logic)
	
l6179:	
;rfid125.c: 7: unsigned int CurTimer;
;rfid125.c: 8: TMR1ON = 0;
	bcf	(128/8),(128)&7
	line	9
	
l6181:	
;rfid125.c: 9: TMR1H = 0;
	clrf	(15)	;volatile
	line	10
;rfid125.c: 10: TMR1L = 0;
	clrf	(14)	;volatile
	line	11
	
l6183:	
;rfid125.c: 11: TMR1IF = 0;
	bcf	(96/8),(96)&7
	line	12
	
l6185:	
;rfid125.c: 12: TMR1ON = 1;
	bsf	(128/8),(128)&7
	line	13
;rfid125.c: 13: while(RA4==Logic){
	goto	l6193
	line	14
	
l6187:	
;rfid125.c: 14: CurTimer= (TMR1H <<8 )| TMR1L;
	movf	(15),w	;volatile
	movwf	(timerOut@CurTimer+1)
	clrf	(timerOut@CurTimer)
	movf	(14),w	;volatile
	iorwf	(timerOut@CurTimer),f
	line	15
;rfid125.c: 15: if(CurTimer>time)
	movf	(timerOut@CurTimer+1),w
	subwf	(timerOut@time+1),w
	skipz
	goto	u1165
	movf	(timerOut@CurTimer),w
	subwf	(timerOut@time),w
u1165:
	skipnc
	goto	u1161
	goto	u1160
u1161:
	goto	l6193
u1160:
	line	16
	
l6189:	
;rfid125.c: 16: return 0;
	clrf	(?_timerOut)
	clrf	(?_timerOut+1)
	goto	l2041
	line	13
	
l6193:	
	movlw	0
	btfsc	(44/8),(44)&7
	movlw	1
	xorwf	(timerOut@Logic),w
	skipnz
	goto	u1171
	goto	u1170
u1171:
	goto	l6187
u1170:
	line	18
	
l6195:	
;rfid125.c: 17: }
;rfid125.c: 18: return CurTimer;
	movf	(timerOut@CurTimer+1),w
	movwf	(?_timerOut+1)
	movf	(timerOut@CurTimer),w
	movwf	(?_timerOut)
	line	19
	
l2041:	
	return
	opt stack 0
GLOBAL	__end_of_timerOut
	__end_of_timerOut:
;; =============== function _timerOut ends ============

	signat	_timerOut,8314
	global	_comArr
psect	text588,local,class=CODE,delta=2
global __ptext588
__ptext588:

;; *************** function _comArr *****************
;; Defined at:
;;		line 52 in file "ms82_eeprom.c"
;; Parameters:    Size  Location     Type
;;  arr1            1    wreg     PTR unsigned char 
;;		 -> keyID(5), 
;;  arr2            1    2[COMMON] PTR unsigned char 
;;		 -> buffTag(25), 
;;  len1            1    3[COMMON] unsigned char 
;;  len2            1    4[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  arr1            1    8[COMMON] PTR unsigned char 
;;		 -> keyID(5), 
;;  i               1    9[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         3       0       0
;;      Locals:         2       0       0
;;      Temps:          3       0       0
;;      Totals:         8       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_id_search
;; This function uses a non-reentrant model
;;
psect	text588
	file	"ms82_eeprom.c"
	line	52
	global	__size_of_comArr
	__size_of_comArr	equ	__end_of_comArr-_comArr
	
_comArr:	
	opt	stack 5
; Regs used in _comArr: [wreg-fsr0h+status,2+status,0]
;comArr@arr1 stored from wreg
	line	55
	movwf	(comArr@arr1)
	
l6147:	
;ms82_eeprom.c: 53: unsigned char i;
;ms82_eeprom.c: 55: if(len1!=len2)
	movf	(comArr@len1),w
	xorwf	(comArr@len2),w
	skipnz
	goto	u1121
	goto	u1120
u1121:
	goto	l6155
u1120:
	line	56
	
l6149:	
;ms82_eeprom.c: 56: return 0;
	movlw	(0)
	goto	l1341
	line	58
	
l6155:	
;ms82_eeprom.c: 57: else{
;ms82_eeprom.c: 58: for(i=0;i<len1;i++){
	clrf	(comArr@i)
	goto	l6165
	line	59
	
l6157:	
;ms82_eeprom.c: 59: if(*(arr1+i) != *(arr2+i)){
	movf	(comArr@i),w
	addwf	(comArr@arr2),w
	movwf	(??_comArr+0)+0
	movf	0+(??_comArr+0)+0,w
	movwf	fsr
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_comArr+1)+0
	movf	(comArr@i),w
	addwf	(comArr@arr1),w
	movwf	(??_comArr+2)+0
	movf	0+(??_comArr+2)+0,w
	movwf	fsr0
	movf	indf,w
	xorwf	(??_comArr+1)+0,w
	skipnz
	goto	u1131
	goto	u1130
u1131:
	goto	l6163
u1130:
	goto	l6149
	line	58
	
l6163:	
	incf	(comArr@i),f
	
l6165:	
	movf	(comArr@len1),w
	subwf	(comArr@i),w
	skipc
	goto	u1141
	goto	u1140
u1141:
	goto	l6157
u1140:
	line	63
	
l6167:	
;ms82_eeprom.c: 61: }
;ms82_eeprom.c: 62: }
;ms82_eeprom.c: 63: if(i==len1)
	movf	(comArr@i),w
	xorwf	(comArr@len1),w
	skipz
	goto	u1151
	goto	u1150
u1151:
	goto	l6149
u1150:
	line	64
	
l6169:	
;ms82_eeprom.c: 64: return 1;
	movlw	(01h)
	line	68
	
l1341:	
	return
	opt stack 0
GLOBAL	__end_of_comArr
	__end_of_comArr:
;; =============== function _comArr ends ============

	signat	_comArr,16505
	global	_eepromReadByte
psect	text589,local,class=CODE,delta=2
global __ptext589
__ptext589:

;; *************** function _eepromReadByte *****************
;; Defined at:
;;		line 7 in file "ms82_eeprom.c"
;; Parameters:    Size  Location     Type
;;  EEAddr          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  EEAddr          1    2[COMMON] unsigned char 
;;  ReEepromData    1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_eepromReadBlock
;;		_main
;; This function uses a non-reentrant model
;;
psect	text589
	file	"ms82_eeprom.c"
	line	7
	global	__size_of_eepromReadByte
	__size_of_eepromReadByte	equ	__end_of_eepromReadByte-_eepromReadByte
	
_eepromReadByte:	
	opt	stack 5
; Regs used in _eepromReadByte: [wreg]
;eepromReadByte@EEAddr stored from wreg
	line	10
	movwf	(eepromReadByte@EEAddr)
	
l6139:	
;ms82_eeprom.c: 8: unsigned char ReEepromData;
;ms82_eeprom.c: 10: EEADR = EEAddr;
	movf	(eepromReadByte@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(155)^080h	;volatile
	line	11
	
l6141:	
;ms82_eeprom.c: 11: RD = 1;
	bsf	(1248/8)^080h,(1248)&7
	line	12
;ms82_eeprom.c: 12: ReEepromData = EEDAT;
	movf	(154)^080h,w	;volatile
	movwf	(eepromReadByte@ReEepromData)
	line	13
	
l6143:	
;ms82_eeprom.c: 13: RD = 0;
	bcf	(1248/8)^080h,(1248)&7
	line	14
;ms82_eeprom.c: 14: return ReEepromData;
	movf	(eepromReadByte@ReEepromData),w
	line	15
	
l1316:	
	return
	opt stack 0
GLOBAL	__end_of_eepromReadByte
	__end_of_eepromReadByte:
;; =============== function _eepromReadByte ends ============

	signat	_eepromReadByte,4217
	global	_int_init
psect	text590,local,class=CODE,delta=2
global __ptext590
__ptext590:

;; *************** function _int_init *****************
;; Defined at:
;;		line 66 in file "sysinit.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text590
	file	"sysinit.c"
	line	66
	global	__size_of_int_init
	__size_of_int_init	equ	__end_of_int_init-_int_init
	
_int_init:	
	opt	stack 6
; Regs used in _int_init: [status,2]
	line	71
	
l6119:	
;sysinit.c: 71: INTCON = 0B00000000;
	clrf	(11)	;volatile
	line	72
;sysinit.c: 72: PIE1 = 0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(140)^080h	;volatile
	line	73
;sysinit.c: 73: PIR1 = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(12)	;volatile
	line	85
	
l6121:	
;sysinit.c: 85: T0IF = 0;
	bcf	(90/8),(90)&7
	line	86
	
l6123:	
;sysinit.c: 86: T0IE = 0;
	bcf	(93/8),(93)&7
	line	87
	
l6125:	
;sysinit.c: 87: TMR1ON = 0;
	bcf	(128/8),(128)&7
	line	89
	
l6127:	
;sysinit.c: 89: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	90
	
l6129:	
;sysinit.c: 90: TMR2IE = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1121/8)^080h,(1121)&7
	line	93
	
l6131:	
;sysinit.c: 93: TMR1IF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(96/8),(96)&7
	line	94
	
l6133:	
;sysinit.c: 94: TMR1IE = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1120/8)^080h,(1120)&7
	line	96
	
l6135:	
;sysinit.c: 96: PEIE = 0;
	bcf	(94/8),(94)&7
	line	98
	
l6137:	
;sysinit.c: 98: GIE = 1;
	bsf	(95/8),(95)&7
	line	99
	
l663:	
	return
	opt stack 0
GLOBAL	__end_of_int_init
	__end_of_int_init:
;; =============== function _int_init ends ============

	signat	_int_init,88
	global	_timer_init
psect	text591,local,class=CODE,delta=2
global __ptext591
__ptext591:

;; *************** function _timer_init *****************
;; Defined at:
;;		line 44 in file "sysinit.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text591
	file	"sysinit.c"
	line	44
	global	__size_of_timer_init
	__size_of_timer_init	equ	__end_of_timer_init-_timer_init
	
_timer_init:	
	opt	stack 6
; Regs used in _timer_init: [wreg]
	line	46
	
l6117:	
;sysinit.c: 46: OPTION = 0B00000001;
	movlw	(01h)
	movwf	(129)^080h	;volatile
	line	59
;sysinit.c: 59: TMR1H = -5000>>8;
	movlw	(0ECh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(15)	;volatile
	line	60
;sysinit.c: 60: TMR1L = -5000;
	movlw	(078h)
	movwf	(14)	;volatile
	line	61
;sysinit.c: 61: T1CON = 0B00100001;
	movlw	(021h)
	movwf	(16)	;volatile
	line	63
	
l660:	
	return
	opt stack 0
GLOBAL	__end_of_timer_init
	__end_of_timer_init:
;; =============== function _timer_init ends ============

	signat	_timer_init,88
	global	_gpio_init
psect	text592,local,class=CODE,delta=2
global __ptext592
__ptext592:

;; *************** function _gpio_init *****************
;; Defined at:
;;		line 32 in file "sysinit.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text592
	file	"sysinit.c"
	line	32
	global	__size_of_gpio_init
	__size_of_gpio_init	equ	__end_of_gpio_init-_gpio_init
	
_gpio_init:	
	opt	stack 6
; Regs used in _gpio_init: [wreg+status,2]
	line	34
	
l6107:	
;sysinit.c: 34: PORTA = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	35
	
l6109:	
;sysinit.c: 35: TRISA = 0B01110011;
	movlw	(073h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	36
	
l6111:	
;sysinit.c: 36: WPUA = 0B10010000;
	movlw	(090h)
	movwf	(149)^080h	;volatile
	line	37
	
l6113:	
;sysinit.c: 37: PORTC = 0B00000010;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(7)	;volatile
	line	38
	
l6115:	
;sysinit.c: 38: TRISC = 0B11111110;
	movlw	(0FEh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	39
;sysinit.c: 39: WPUC = 0B00000000;
	clrf	(136)^080h	;volatile
	line	41
	
l657:	
	return
	opt stack 0
GLOBAL	__end_of_gpio_init
	__end_of_gpio_init:
;; =============== function _gpio_init ends ============

	signat	_gpio_init,88
	global	_ISR
psect	text593,local,class=CODE,delta=2
global __ptext593
__ptext593:

;; *************** function _ISR *****************
;; Defined at:
;;		line 61 in file "MAIN.C"
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
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          2       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text593
	file	"MAIN.C"
	line	61
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 3
; Regs used in _ISR: [wreg]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ISR+0)
	movf	pclath,w
	movwf	(??_ISR+1)
	ljmp	_ISR
psect	text593
	line	87
	
i1l6215:	
;MAIN.C: 87: if(T0IE&&T0IF)
	btfss	(93/8),(93)&7
	goto	u119_21
	goto	u119_20
u119_21:
	goto	i1l3457
u119_20:
	
i1l6217:	
	btfss	(90/8),(90)&7
	goto	u120_21
	goto	u120_20
u120_21:
	goto	i1l3457
u120_20:
	line	89
	
i1l6219:	
;MAIN.C: 88: {
;MAIN.C: 89: T0IF = 0;
	bcf	(90/8),(90)&7
	line	90
	
i1l6221:	
;MAIN.C: 90: TMR0 = buzFre;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_buzFre),w
	movwf	(1)	;volatile
	line	91
;MAIN.C: 91: RC0 = ~RC0;
	movlw	1<<((56)&7)
	xorwf	((56)/8),f
	line	114
	
i1l3457:	
	movf	(??_ISR+1),w
	movwf	pclath
	swapf	(??_ISR+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
;; =============== function _ISR ends ============

	signat	_ISR,88
psect	text594,local,class=CODE,delta=2
global __ptext594
__ptext594:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
