    .file  "main.java"
__SREG__ = 0x3f
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__tmp_reg__ = 0
__zero_reg__ = 1
    .global __do_copy_data
    .global __do_clear_bss
    .text
.global main
    .type   main, @function
main:
    push r29
    push r28
    in r28,__SP_L__
    in r29,__SP_H__
/* prologue: function */
    call _Z18MeggyJrSimpleSetupv 
    /* Need to call this so that the meggy library gets set up */



	# Load constant int 1
	ldi r24,lo8(1)
	ldi r25,hi8(1)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Load constant int 2
	ldi r24,lo8(2)
	ldi r25,hi8(2)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Color expression Meggy.Color.BLUE
	ldi r22,5
	# push one byte expression onto stack
	push r22

	### Meggy.setPixel(x,y,color) call
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# load a one byte expression off stack
	pop r24
	call   _Z6DrawPxhhh
	call   _Z12DisplaySlatev

	# start a add operation
	# Load constant int 1
	ldi r24,lo8(1)
	ldi r25,hi8(1)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Load constant int 2
	ldi r24,lo8(2)
	ldi r25,hi8(2)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# left operand of +
	pop    r18
	pop    r19
	# right operand of +
	pop    r24
	pop    r25
	# Do add operation
	add    r24, r18
	adc    r25, r19
	# push two byte expression onto stack
	push   r25
	push   r24
	# Load constant int 3
	ldi r24,lo8(3)
	ldi r25,hi8(3)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# neg int
	# load a two byte expression off stack
	pop    r24
	pop    r25
	ldi     r22, 0
	ldi     r23, 0
	sub     r22, r24
	sbc     r23, r25
	# push two byte expression onto stack
	push   r23
	push   r22

	# x = x - y
	# load y
	pop r18 # lower bits of y
	pop r19 # higher bits of y
	# load x
	pop r24 # lower bits of x
	pop r25 # higher bits of x
	# Do INT sub operation
	sub    r24, r18
	sbc    r25, r19
	# push two byte expression onto stack
	push   r25 # higher bits
	push   r24 # lower bits
	# Load constant int 4
	ldi r24,lo8(4)
	ldi r25,hi8(4)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# x = x - y
	# load y
	pop r18 # lower bits of y
	pop r19 # higher bits of y
	# load x
	pop r24 # lower bits of x
	pop r25 # higher bits of x
	# Do INT sub operation
	sub    r24, r18
	sbc    r25, r19
	# push two byte expression onto stack
	push   r25 # higher bits
	push   r24 # lower bits
	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop    r24
	pop    r25
	call   _Z8delay_msj
#### if statement
	# start equality check
	# Load constant int 4
	ldi r24,lo8(4)
	ldi r25,hi8(4)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Load constant int 5
	ldi r24,lo8(5)
	ldi r25,hi8(5)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	### Meggy.getPixel(x,y) call
	# load a one byte expression off stack
	pop    r22
	# load a one byte expression off stack
	pop    r24
	call   _Z6ReadPxhh
	# push one byte expression onto stack
	push   r24
	# Color expression Meggy.Color.DARK
	ldi r22,0
	# push one byte expression onto stack
	push r22


	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L11
	ldi r25, 0
	jmp MJ_L12
MJ_L11: 
	ldi r25, hi8(-1)
MJ_L12: 
	push r25
	push r24
	# right operand of ==
	pop r18
	pop r19

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L13
	ldi r25, 0
	jmp MJ_L14
MJ_L13: 
	ldi r25, hi8(-1)
MJ_L14: 
	push r25
	push r24
	# left operand of ==
	pop r24
	pop r25
	# compare the operands
	cp    r24, r18
	cpc   r25, r19
	breq MJ_L8 # goto true branch
MJ_L9: # false branch
	ldi r24, 0
	jmp MJ_L10
MJ_L8: # true branch
	ldi r24, 1
MJ_L10: 
	push r24 # push the result on stack
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L2

MJ_L3: # false branch
	ldi r24, 0
	jmp MJ_L4

MJ_L2: # true branch
	ldi r24, 1

MJ_L4: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L5
	jmp MJ_L6

MJ_L5: # then branch
	# Load constant int 2
	ldi r24,lo8(2)
	ldi r25,hi8(2)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Load constant int 3
	ldi r24,lo8(3)
	ldi r25,hi8(3)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Color expression Meggy.Color.YELLOW
	ldi r22,3
	# push one byte expression onto stack
	push r22

	### Meggy.setPixel(x,y,color) call
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# load a one byte expression off stack
	pop r24
	call   _Z6DrawPxhhh
	call   _Z12DisplaySlatev

	jmp MJ_L7 # jump over the else branch

MJ_L6: # else branch
MJ_L7: 
#### if statement
	# start equality check
	#push Meggy.Button.Up
	ldi r24, 4
	push r24
	pop r25 # get button literal
	### MeggyCheckButton
	call    _Z16CheckButtonsDownv
	lds    r24, Button_Up
	# if button value is zero, push 0 else push 1
	tst    r24 # Test for Zero or Minus
	breq MJ_L22 # goto false branch
MJ_L21: # if true
	ldi r24, 1
	jmp MJ_L23
MJ_L22: # false branch, r24 is already 0, do nothing
MJ_L23: 
	push r24
	# True/1 expression
	ldi    r22, 1
	# push one byte expression onto stack
	push   r22

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L27
	ldi r25, 0
	jmp MJ_L28
MJ_L27: 
	ldi r25, hi8(-1)
MJ_L28: 
	push r25
	push r24
	# right operand of ==
	pop r18
	pop r19

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L29
	ldi r25, 0
	jmp MJ_L30
MJ_L29: 
	ldi r25, hi8(-1)
MJ_L30: 
	push r25
	push r24
	# left operand of ==
	pop r24
	pop r25
	# compare the operands
	cp    r24, r18
	cpc   r25, r19
	breq MJ_L24 # goto true branch
MJ_L25: # false branch
	ldi r24, 0
	jmp MJ_L26
MJ_L24: # true branch
	ldi r24, 1
MJ_L26: 
	push r24 # push the result on stack
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L15

MJ_L16: # false branch
	ldi r24, 0
	jmp MJ_L17

MJ_L15: # true branch
	ldi r24, 1

MJ_L17: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L18
	jmp MJ_L19

MJ_L18: # then branch
	jmp MJ_L20 # jump over the else branch

MJ_L19: # else branch
MJ_L20: 

/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main

