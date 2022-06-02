.nolist
.include "m8def.inc"
.list
;
.def rmp = R16
	ldi rmp,0b11111111
	out DDRB,rmp
label1:
	ldi rmp,0b01010101
	out PORTB,rmp
	ldi rmp,0b10101010
	out PORTB,rmp
	rjmp label1
	
