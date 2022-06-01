.include "m328pdef.inc"
    .def	mask 	= r16	; mask register
    .def	ledR 	= r17	; led register
    .def	oLoopR 	= r18	; outer loop register
    .def	iLoopRl = r24	; inner loop register low
    .def	iLoopRh = r25	; inner loop register high
    .equ	oVal 	= 71	; outer loop value
    .equ	iVal 	= 28168	; inner loop value
    .cseg
    .org	0x00
    clr	    ledR		; clear led register to zero
    ldi	    mask,(1<<PB5)	; load the mask register 00100000
    out	    DDRB,mask		; turn on PB5 on PORTB as output
start:
    eor	    ledR, mask		; toggle value in led register 
    out     PORTB, ledR		; output ledR value to PORTB
    ldi     oLoopR,oVal		; initialize outer loop count
oLoop:
     ldi    iLoopRl,LOW(iVal)	; intialize inner loop count LOW
     ldi    iLoopRh,HIGH(iVal)	; intialize inner loop count HIGH
iLoop:
    sbiw    iLoopRl,1	        ; decrement inner loop register
    brne    iLoop		; branch to iLoop if iLoop register != 0
    dec	    oLoopR		; decrement outer loop register
    brne    oLoop		; branch to oLoop if oLoop register != 0
    rjmp    start		; jump back to start
