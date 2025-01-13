;
; lcd.asm
;
; Created: 04/11/2024 08:59:45 a. m.
; Author : diego
;


	.def temp = r16
	.def cont1 = r17
	.def cont2 = r18
	.cseg
	.org 0

	ldi temp, $fe
	out ddrd, temp

	call delay_100m

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

	ldi temp, $c4 ;enable en 1
	out portd, temp

	ldi temp, $c0 ;enable en 0
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

	; letra D

	ldi temp, $4c ;enable en 1
	out portd, temp

	ldi temp, $48 ;enable en 0
	out portd, temp

	ldi temp, $4c ;enable en 1
	out portd, temp

	ldi temp, $48 ;enable en 0
	out portd, temp

	call delay_20m

	;letra i
	ldi temp, $6c ;enable en 1
	out portd, temp

	ldi temp, $68 ;enable en 0
	out portd, temp

	ldi temp, $9c ;enable en 1
	out portd, temp

	ldi temp, $98 ;enable en 0
	out portd, temp

	call delay_20m

	;letra e
	ldi temp, $6c ;enable en 1
	out portd, temp

	ldi temp, $68 ;enable en 0
	out portd, temp

	ldi temp, $5c ;enable en 1
	out portd, temp

	ldi temp, $58 ;enable en 0
	out portd, temp

	call delay_20m

	;letra g
	ldi temp, $6c ;enable en 1
	out portd, temp

	ldi temp, $68 ;enable en 0
	out portd, temp

	ldi temp, $7c ;enable en 1
	out portd, temp

	ldi temp, $78 ;enable en 0
	out portd, temp

	call delay_20m

	;letra o
	ldi temp, $6c ;enable en 1
	out portd, temp

	ldi temp, $68 ;enable en 0
	out portd, temp

	ldi temp, $fc ;enable en 1
	out portd, temp

	ldi temp, $f8 ;enable en 0
	out portd, temp

	call delay_20m

	;espacio
	ldi temp, $2c ;enable en 1
	out portd, temp

	ldi temp, $28 ;enable en 0
	out portd, temp

	ldi temp, $0c ;enable en 1
	out portd, temp

	ldi temp, $08 ;enable en 0
	out portd, temp

	call delay_20m
	;letra I
	ldi temp, $4c ;enable en 1
	out portd, temp

	ldi temp, $48 ;enable en 0
	out portd, temp

	ldi temp, $9c ;enable en 1
	out portd, temp

	ldi temp, $98 ;enable en 0
	out portd, temp

	call delay_20m
	;letra v
	ldi temp, $7c ;enable en 1
	out portd, temp

	ldi temp, $78 ;enable en 0
	out portd, temp

	ldi temp, $6c ;enable en 1
	out portd, temp

	ldi temp, $68 ;enable en 0
	out portd, temp

	call delay_20m
	;letra a 
	ldi temp, $6c ;enable en 1
	out portd, temp

	ldi temp, $68 ;enable en 0
	out portd, temp

	ldi temp, $1c ;enable en 1
	out portd, temp

	ldi temp, $18 ;enable en 0
	out portd, temp

	call delay_20m
	;letra n
	ldi temp, $6c ;enable en 1
	out portd, temp

	ldi temp, $68 ;enable en 0
	out portd, temp

	ldi temp, $ec ;enable en 1
	out portd, temp

	ldi temp, $e8 ;enable en 0
	out portd, temp

	call delay_20m
	;espacio
	ldi temp, $2c ;enable en 1
	out portd, temp

	ldi temp, $28 ;enable en 0
	out portd, temp

	ldi temp, $0c ;enable en 1
	out portd, temp

	ldi temp, $08 ;enable en 0
	out portd, temp

	call delay_20m
	;letra I
	ldi temp, $4c ;enable en 1
	out portd, temp

	ldi temp, $48 ;enable en 0
	out portd, temp

	ldi temp, $9c ;enable en 1
	out portd, temp

	ldi temp, $98 ;enable en 0
	out portd, temp

	call delay_20m
	; letra l
	ldi temp, $6c ;enable en 1
	out portd, temp

	ldi temp, $68 ;enable en 0
	out portd, temp

	ldi temp, $cc ;enable en 1
	out portd, temp

	ldi temp, $c8 ;enable en 0
	out portd, temp

	call delay_20m
	; letra l
	ldi temp, $6c ;enable en 1
	out portd, temp

	ldi temp, $68 ;enable en 0
	out portd, temp

	ldi temp, $cc ;enable en 1
	out portd, temp

	ldi temp, $c8 ;enable en 0
	out portd, temp

	call delay_20m
	; letra e
	ldi temp, $6c ;enable en 1
	out portd, temp

	ldi temp, $68 ;enable en 0
	out portd, temp

	ldi temp, $5c ;enable en 1
	out portd, temp

	ldi temp, $58 ;enable en 0
	out portd, temp

	call delay_20m
	; letra s
	ldi temp, $7c ;enable en 1
	out portd, temp

	ldi temp, $78 ;enable en 0
	out portd, temp

	ldi temp, $3c ;enable en 1
	out portd, temp

	ldi temp, $38 ;enable en 0
	out portd, temp

	call delay_20m
	; letra c
	ldi temp, $6c ;enable en 1
	out portd, temp

	ldi temp, $68 ;enable en 0
	out portd, temp

	ldi temp, $3c ;enable en 1
	out portd, temp

	ldi temp, $38 ;enable en 0
	out portd, temp

	call delay_20m
	; letra a
	ldi temp, $6c ;enable en 1
	out portd, temp

	ldi temp, $68 ;enable en 0
	out portd, temp

	ldi temp, $1c ;enable en 1
	out portd, temp

	ldi temp, $18 ;enable en 0
	out portd, temp

	call delay_20m
	; letra s
	ldi temp, $7c ;enable en 1
	out portd, temp

	ldi temp, $78 ;enable en 0
	out portd, temp

	ldi temp, $3c ;enable en 1
	out portd, temp

	ldi temp, $38 ;enable en 0
	out portd, temp

	call delay_20m
	; espacio
	ldi temp, $2c ;enable en 1
	out portd, temp

	ldi temp, $28 ;enable en 0
	out portd, temp

	ldi temp, $0c ;enable en 1
	out portd, temp

	ldi temp, $08 ;enable en 0
	out portd, temp

	call delay_20m
	; letra L
	ldi temp, $4c ;enable en 1
	out portd, temp

	ldi temp, $48 ;enable en 0
	out portd, temp

	ldi temp, $cc ;enable en 1
	out portd, temp

	ldi temp, $c8 ;enable en 0
	out portd, temp

	call delay_20m
	; letra o
	ldi temp, $6c ;enable en 1
	out portd, temp

	ldi temp, $68 ;enable en 0
	out portd, temp

	ldi temp, $fc ;enable en 1
	out portd, temp

	ldi temp, $f8 ;enable en 0
	out portd, temp

	call delay_20m
	; letra p
	ldi temp, $7c ;enable en 1
	out portd, temp

	ldi temp, $78 ;enable en 0
	out portd, temp

	ldi temp, $0c ;enable en 1
	out portd, temp

	ldi temp, $08 ;enable en 0
	out portd, temp

	call delay_20m
	; letra e
	ldi temp, $6c ;enable en 1
	out portd, temp

	ldi temp, $68 ;enable en 0
	out portd, temp

	ldi temp, $5c ;enable en 1
	out portd, temp

	ldi temp, $58 ;enable en 0
	out portd, temp

	call delay_20m
	; letra z
	ldi temp, $7c ;enable en 1
	out portd, temp

	ldi temp, $78 ;enable en 0
	out portd, temp

	ldi temp, $ac ;enable en 1
	out portd, temp

	ldi temp, $a8 ;enable en 0
	out portd, temp

	call delay_20m
aqui: call delay_200m
	; shift 
	ldi temp, $14 ;enable en 1
	out portd, temp

	ldi temp, $10 ;enable en 0
	out portd, temp

	ldi temp, $84 ;enable en 1
	out portd, temp

	ldi temp, $80 ;enable en 0
	out portd, temp

	jmp aqui

delay_200m: call delay_100m
	call delay_100m
	ret

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