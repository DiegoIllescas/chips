;
; matrixKeyboard.asm
;
; Created: 12/01/2025 11:36:19 p. m.
; Author : diego
;


; Replace with your application code
	.def temp = r16
	.def characterCount = r17
	.def line = r18
	.def cont1 = r19
	.def cont2 = r20
	.def character = r21
	.def offset = r22
	.cseg
	.org 0

	jmp reset

	.org $024
	jmp rx_complete

	;config d0-d7 as output
reset: ldi temp, $fe;
	out ddrd, temp

	;port b0-b3 as output
	ldi temp, $0f
	out ddrb, temp

	;set 0 to portb
	ldi temp, $00
	out portb, temp

	out portc, temp
	;set pull-up in portc
	ldi temp, $0f
	out portc, temp

	call delay_100m

	;config lcd

	;function set
	ldi temp, $24 ;enable en 1
	out portd, temp

	ldi temp, $20 ;enable en 0
	out portd, temp

	ldi temp, $84 ;enable en 1
	out portd, temp

	ldi temp, $80 ;enable en 0
	out portd, temp

	call delay_20m

	;display on/off
	ldi temp, $04 ;enable en 1
	out portd, temp

	ldi temp, $00 ;enable en 0
	out portd, temp

	ldi temp, $e4 ;enable en 1
	out portd, temp

	ldi temp, $e0 ;enable en 0
	out portd, temp

	call delay_20m

	;modo set
	ldi temp, $04 ;enable en 1
	out portd, temp

	ldi temp, $00 ;enable en 0
	out portd, temp

	ldi temp, $64 ;enable en 1
	out portd, temp

	ldi temp, $60 ;enable en 0
	out portd, temp

	call delay_20m
	
	;clear display
	ldi temp, $04 ;enable en 1
	out portd, temp

	ldi temp, $00 ;enable en 0
	out portd, temp

	ldi temp, $14 ;enable en 1
	out portd, temp

	ldi temp, $10 ;enable en 0
	out portd, temp

	call delay_20m

	;config rx
	ldi temp, $98
	sts ucsr0b, temp

	ldi temp, 103
	sts ubrr0l, temp

	sei

	ldi offset, $20
	ldi characterCount, $00
	ldi line, $01

main: in temp, pinc
	andi temp, $0f
	cpi temp, $0f
	brne keyboard
	jmp main

keyboard: cpi temp, $0e
	breq row0
	cpi temp, $0d
	breq row1
	cpi temp, $0b
	breq row2
	ldi character, $0c
	jmp cols

row0: ldi character, $00
	jmp cols

row1: ldi character, $04
	jmp cols

row2: ldi character, $08
	jmp cols

cols: ldi temp, $0f
	out ddrc, temp
	ldi temp, $00
	out portc, temp
	ldi temp, $00
	out ddrb, temp
	ldi temp, $0f
	out portb, temp
	call delay_20m
	in temp, pinb
	andi temp, $0f
	cpi temp, $0e
	breq col0
	cpi temp, $0d
	breq col1
	cpi temp, $0b
	breq col2
	ldi temp, $03
	add character, temp
	cpi character, $0f
	breq switchOffset
	jmp sumOffset

col0: ldi temp, $00
	add character, temp
	jmp sumOffset

col1: ldi temp, $01
	add character, temp
	jmp sumOffset

col2: ldi temp, $02
	add character, temp
	jmp sumOffset

switchOffset: cpi offset, $71
	brsh resetOffset
	ldi temp, $0f
	add offset, temp
	call delay_20m
	call restoreIO
	call waitRebounds
	jmp main

resetOffset: ldi offset, $20
	call delay_20m
	call restoreIO
	call waitRebounds
	jmp main

sumOffset: add character, offset
	call sendCharacter
	call restoreIO
	call waitRebounds
	jmp main

sendCharacter: mov temp, character
	andi temp, $f0
	ori temp, $0c
	out portd, temp
	andi temp, $f0
	ori temp, $08
	out portd, temp

	call delay_20m

	lsl character
	lsl character
	lsl character
	lsl character
	ori character, $0c
	out portd, character
	andi character, $f0
	ori character, $08
	out portd, temp
	call delay_20m

	inc characterCount
	cpi characterCount, $10
	brsh shift

	ret

shift: cpi characterCount, 40
	brsh waitFill
	ldi temp, $14 ;enable en 1
	out portd, temp

	ldi temp, $10 ;enable en 0
	out portd, temp

	ldi temp, $84 ;enable en 1
	out portd, temp

	ldi temp, $80 ;enable en 0
	out portd, temp

	call delay_20m
	ret

waitFill: cpi characterCount, 40
	brsh changeLine
	ret

changeLine: cpi line, $01
	breq secondline
	call resetlcd
	ret

secondline: ldi temp, $04
	out portd, temp
	
	ldi temp, $00
	out portd, temp
	
	call delay_20m
	
	ldi temp, $24
	out portd, temp
	
	ldi temp, $20
	out portd, temp
 
	call delay_20m
	
	ldi temp, $c4
	out portd, temp

	ldi temp, $c0
	out portd, temp

	call delay_20m

	ldi temp, $04
	out portd, temp

	ldi temp, $00
	out portd, temp

	call delay_20m

	ldi characterCount, $00
	ldi line, $02
	ret

resetlcd: cpi characterCount, 41
	breq resetAllLCD
	ret

resetAllLCD: ldi temp, $04
	out portd, temp

	ldi temp, $00
	out portd, temp

	call delay_20m

	ldi temp, $14
	out portd, temp

	ldi temp, $10
	out portd, temp

	call delay_20m

	ldi line, $01
	ldi characterCount, $00

	ret

restoreIO: ldi temp, $00
	out ddrc, temp
	ldi temp, $0f
	out portc, temp
	nop
	nop
	nop
	out ddrb, temp
	ldi temp, $00
	out portb, temp
	nop
	nop
	nop
	ret

waitRebounds: call delay_20m
	in temp, pinc
	andi temp, $0f
	cpi temp, $0f
	brne waitRebounds
	ret
	;Recibe un caracter de la PC
rx_complete: lds character, udr0
	call sendCharacter
	reti

delay_20m: ldi cont2, 160
lazo2:	ldi cont1, 200
lazo1:	nop
	nop
	nop
	nop
	nop
	nop
	nop
	dec cont1
	brne lazo1
	dec cont2
	brne lazo2
	ret

delay_100m: call delay_20m
	call delay_20m
	call delay_20m
	call delay_20m
	call delay_20m
	ret
