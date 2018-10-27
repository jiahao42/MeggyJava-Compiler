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


	## This is a auto typecast: demote Int to Byte
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Load constant int 1
	ldi r24,lo8(1)
	ldi r25,hi8(1)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	## This is a auto typecast: demote Int to Byte
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Color expression Meggy.Color.GREEN
	ldi r22,4
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

	# Color expression Meggy.Color.GREEN
	ldi r22,4
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

	# Color expression Meggy.Color.GREEN
	ldi r22,4
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

	# Color expression Meggy.Color.GREEN
	ldi r22,4
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

	# Color expression Meggy.Color.GREEN
	ldi r22,4
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

	# Load constant int 6
	ldi r24,lo8(6)
	ldi r25,hi8(6)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Load constant int 6
	ldi r24,lo8(6)
	ldi r25,hi8(6)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Color expression Meggy.Color.GREEN
	ldi r22,4
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

	# Load constant int 7
	ldi r24,lo8(7)
	ldi r25,hi8(7)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Load constant int 7
	ldi r24,lo8(7)
	ldi r25,hi8(7)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Color expression Meggy.Color.GREEN
	ldi r22,4
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

#### if statement
	# start equality check
	#push Meggy.Button.Left
	ldi r24, 16
	push r24
	pop r25 # get button literal
	### MeggyCheckButton
	call    _Z16CheckButtonsDownv
	lds    r24, Button_Left
	# if button value is zero, push 0 else push 1
	tst    r24 # Test for Zero or Minus
	breq MJ_L7 # goto false branch
MJ_L6: # if true
	ldi r24, 1
	jmp MJ_L8
MJ_L7: # false branch, r24 is already 0, do nothing
MJ_L8: 
	push r24
	# False/0 expression
	ldi    r22, 0
	# push one byte expression onto stack
	push   r22

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L12
	ldi r25, 0
	jmp MJ_L13
MJ_L12: 
	ldi r25, hi8(-1)
MJ_L13: 
	push r25
	push r24
	# right operand of ==
	pop r18
	pop r19

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L14
	ldi r25, 0
	jmp MJ_L15
MJ_L14: 
	ldi r25, hi8(-1)
MJ_L15: 
	push r25
	push r24
	# left operand of ==
	pop r24
	pop r25
	# compare the operands
	cp    r24, r18
	cpc   r25, r19
	breq MJ_L9 # goto true branch
MJ_L10: # false branch
	ldi r24, 0
	jmp MJ_L11
MJ_L9: # true branch
	ldi r24, 1
MJ_L11: 
	push r24 # push the result on stack
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L0

MJ_L1: # false branch
	ldi r24, 0
	jmp MJ_L2

MJ_L0: # true branch
	ldi r24, 1

MJ_L2: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L3
	jmp MJ_L4

MJ_L3: # then branch
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

	# Color expression Meggy.Color.GREEN
	ldi r22,4
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

	jmp MJ_L5 # jump over the else branch

MJ_L4: # else branch
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

	# Color expression Meggy.Color.RED
	ldi r22,1
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

MJ_L5: 
	# Load constant int 100
	ldi r24,lo8(100)
	ldi r25,hi8(100)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop    r24
	pop    r25
	call   _Z8delay_msj
	# Load constant int 200
	ldi r24,lo8(200)
	ldi r25,hi8(200)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 


	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L16
	ldi r25, 0
	jmp MJ_L17
MJ_L16: 
	ldi r25, hi8(-1)
MJ_L17: 
	push r25
	push r24
	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop    r24
	pop    r25
	call   _Z8delay_msj
#### if statement
	# start equality check
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
	breq MJ_L18

MJ_L19: # false branch
	ldi r24, 0
	jmp MJ_L20

MJ_L18: # true branch
	ldi r24, 1

MJ_L20: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L21
	jmp MJ_L22

MJ_L21: # then branch
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

	# Color expression Meggy.Color.RED
	ldi r22,1
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

	jmp MJ_L23 # jump over the else branch

MJ_L22: # else branch
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

	# Color expression Meggy.Color.GREEN
	ldi r22,4
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

MJ_L23: 

	### start of while loop
MJ_L31: # while loop condition
	# start equality check
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

	### Meggy.getPixel(x,y) call
	# load a one byte expression off stack
	pop    r22
	# load a one byte expression off stack
	pop    r24
	call   _Z6ReadPxhh
	# push one byte expression onto stack
	push   r24
	# Color expression Meggy.Color.GREEN
	ldi r22,4
	# push one byte expression onto stack
	push r22


	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L37
	ldi r25, 0
	jmp MJ_L38
MJ_L37: 
	ldi r25, hi8(-1)
MJ_L38: 
	push r25
	push r24
	# right operand of ==
	pop r18
	pop r19

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L39
	ldi r25, 0
	jmp MJ_L40
MJ_L39: 
	ldi r25, hi8(-1)
MJ_L40: 
	push r25
	push r24
	# left operand of ==
	pop r24
	pop r25
	# compare the operands
	cp    r24, r18
	cpc   r25, r19
	breq MJ_L34 # goto true branch
MJ_L35: # false branch
	ldi r24, 0
	jmp MJ_L36
MJ_L34: # true branch
	ldi r24, 1
MJ_L36: 
	push r24 # push the result on stack
	# examine condition
	# load a one byte expression off stack
	pop r24
	ldi r25,1
	cp r24, r25
	breq MJ_L32 # if true, go to body
	jmp MJ_L33 # if false, go to next block
MJ_L32: # while loop body
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

	# Color expression Meggy.Color.VIOLET
	ldi r22,6
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

	# Color expression Meggy.Color.WHITE
	ldi r22,7
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

	# Color expression Meggy.Color.RED
	ldi r22,1
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

	jmp MJ_L31 # go back to condition
MJ_L33: 
	### end of while loop
#### if statement
	# start equality check
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
	brlt MJ_L50
	ldi r25, 0
	jmp MJ_L51
MJ_L50: 
	ldi r25, hi8(-1)
MJ_L51: 
	push r25
	push r24
	# right operand of ==
	pop r18
	pop r19

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L52
	ldi r25, 0
	jmp MJ_L53
MJ_L52: 
	ldi r25, hi8(-1)
MJ_L53: 
	push r25
	push r24
	# left operand of ==
	pop r24
	pop r25
	# compare the operands
	cp    r24, r18
	cpc   r25, r19
	breq MJ_L47 # goto true branch
MJ_L48: # false branch
	ldi r24, 0
	jmp MJ_L49
MJ_L47: # true branch
	ldi r24, 1
MJ_L49: 
	push r24 # push the result on stack
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L41

MJ_L42: # false branch
	ldi r24, 0
	jmp MJ_L43

MJ_L41: # true branch
	ldi r24, 1

MJ_L43: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L44
	jmp MJ_L45

MJ_L44: # then branch
	# Load constant int 6
	ldi r24,lo8(6)
	ldi r25,hi8(6)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Load constant int 6
	ldi r24,lo8(6)
	ldi r25,hi8(6)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Color expression Meggy.Color.RED
	ldi r22,1
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

	jmp MJ_L46 # jump over the else branch

MJ_L45: # else branch
	# Load constant int 6
	ldi r24,lo8(6)
	ldi r25,hi8(6)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Load constant int 6
	ldi r24,lo8(6)
	ldi r25,hi8(6)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Color expression Meggy.Color.GREEN
	ldi r22,4
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

	# Load constant int 6
	ldi r24,lo8(6)
	ldi r25,hi8(6)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Load constant int 6
	ldi r24,lo8(6)
	ldi r25,hi8(6)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Color expression Meggy.Color.WHITE
	ldi r22,7
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

	# Load constant int 6
	ldi r24,lo8(6)
	ldi r25,hi8(6)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Load constant int 6
	ldi r24,lo8(6)
	ldi r25,hi8(6)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Color expression Meggy.Color.GREEN
	ldi r22,4
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

MJ_L46: 
#### if statement
	# start equality check
	# Load constant int 6
	ldi r24,lo8(6)
	ldi r25,hi8(6)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Load constant int 6
	ldi r24,lo8(6)
	ldi r25,hi8(6)
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
	# Color expression Meggy.Color.GREEN
	ldi r22,4
	# push one byte expression onto stack
	push r22


	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L63
	ldi r25, 0
	jmp MJ_L64
MJ_L63: 
	ldi r25, hi8(-1)
MJ_L64: 
	push r25
	push r24
	# right operand of ==
	pop r18
	pop r19

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L65
	ldi r25, 0
	jmp MJ_L66
MJ_L65: 
	ldi r25, hi8(-1)
MJ_L66: 
	push r25
	push r24
	# left operand of ==
	pop r24
	pop r25
	# compare the operands
	cp    r24, r18
	cpc   r25, r19
	breq MJ_L60 # goto true branch
MJ_L61: # false branch
	ldi r24, 0
	jmp MJ_L62
MJ_L60: # true branch
	ldi r24, 1
MJ_L62: 
	push r24 # push the result on stack
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L54

MJ_L55: # false branch
	ldi r24, 0
	jmp MJ_L56

MJ_L54: # true branch
	ldi r24, 1

MJ_L56: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L57
	jmp MJ_L58

MJ_L57: # then branch
	# Load constant int 7
	ldi r24,lo8(7)
	ldi r25,hi8(7)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Load constant int 7
	ldi r24,lo8(7)
	ldi r25,hi8(7)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Color expression Meggy.Color.GREEN
	ldi r22,4
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

	jmp MJ_L59 # jump over the else branch

MJ_L58: # else branch
MJ_L59: 
#### if statement
	# start equality check
	# Load constant int 5
	ldi r24,lo8(5)
	ldi r25,hi8(5)
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

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# start a add operation
	# Load constant int 6
	ldi r24,lo8(6)
	ldi r25,hi8(6)
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
	# Load constant int 10
	ldi r24,lo8(10)
	ldi r25,hi8(10)
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
	# Load constant int 9
	ldi r24,lo8(9)
	ldi r25,hi8(9)
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
	# right operand of ==
	pop r18
	pop r19

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L84
	ldi r25, 0
	jmp MJ_L85
MJ_L84: 
	ldi r25, hi8(-1)
MJ_L85: 
	push r25
	push r24
	# left operand of ==
	pop r24
	pop r25
	# compare the operands
	cp    r24, r18
	cpc   r25, r19
	breq MJ_L81 # goto true branch
MJ_L82: # false branch
	ldi r24, 0
	jmp MJ_L83
MJ_L81: # true branch
	ldi r24, 1
MJ_L83: 
	push r24 # push the result on stack
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L67

MJ_L68: # false branch
	ldi r24, 0
	jmp MJ_L69

MJ_L67: # true branch
	ldi r24, 1

MJ_L69: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L70
	jmp MJ_L71

MJ_L70: # then branch
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

	# Color expression Meggy.Color.GREEN
	ldi r22,4
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

	jmp MJ_L72 # jump over the else branch

MJ_L71: # else branch
MJ_L72: 
	# start a add operation
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


	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L86
	ldi r25, 0
	jmp MJ_L87
MJ_L86: 
	ldi r25, hi8(-1)
MJ_L87: 
	push r25
	push r24
	# Load constant int 3
	ldi r24,lo8(3)
	ldi r25,hi8(3)
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


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

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


	# MulExp, only works for byte
	# load a one byte expression off stack
	pop    r18
	# load a one byte expression off stack
	pop    r22
	# move low byte src into dest reg
	mov    r24, r18
	# move low byte src into dest reg
	mov    r26, r22
	# Do mul operation of two input bytes
	muls   r24, r26
	# push two byte expression onto stack
	push   r1
	push   r0
	# clear r0 and r1
	eor    r0,r0
	eor    r1,r1

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
	# Load constant int 8
	ldi r24,lo8(8)
	ldi r25,hi8(8)
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

	## This is a auto typecast: demote Int to Byte
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# start a add operation
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


	# MulExp, only works for byte
	# load a one byte expression off stack
	pop    r18
	# load a one byte expression off stack
	pop    r22
	# move low byte src into dest reg
	mov    r24, r18
	# move low byte src into dest reg
	mov    r26, r22
	# Do mul operation of two input bytes
	muls   r24, r26
	# push two byte expression onto stack
	push   r1
	push   r0
	# clear r0 and r1
	eor    r0,r0
	eor    r1,r1
	# Load constant int 5
	ldi r24,lo8(5)
	ldi r25,hi8(5)
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

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Color expression Meggy.Color.GREEN
	ldi r22,4
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

	# Load constant int 4
	ldi r24,lo8(4)
	ldi r25,hi8(4)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Load constant int 5
	ldi r24,lo8(5)
	ldi r25,hi8(5)
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

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 


	# MulExp, only works for byte
	# load a one byte expression off stack
	pop    r18
	# load a one byte expression off stack
	pop    r22
	# move low byte src into dest reg
	mov    r24, r18
	# move low byte src into dest reg
	mov    r26, r22
	# Do mul operation of two input bytes
	muls   r24, r26
	# push two byte expression onto stack
	push   r1
	push   r0
	# clear r0 and r1
	eor    r0,r0
	eor    r1,r1

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

	## This is a auto typecast: demote Int to Byte
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

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Load constant int 1
	ldi r24,lo8(1)
	ldi r25,hi8(1)
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

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 


	# MulExp, only works for byte
	# load a one byte expression off stack
	pop    r18
	# load a one byte expression off stack
	pop    r22
	# move low byte src into dest reg
	mov    r24, r18
	# move low byte src into dest reg
	mov    r26, r22
	# Do mul operation of two input bytes
	muls   r24, r26
	# push two byte expression onto stack
	push   r1
	push   r0
	# clear r0 and r1
	eor    r0,r0
	eor    r1,r1

	## This is a auto typecast: demote Int to Byte
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Color expression Meggy.Color.GREEN
	ldi r22,4
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

#### if statement
	# start equality check
	#push Meggy.Button.Down
	ldi r24, 8
	push r24
	pop r25 # get button literal
	### MeggyCheckButton
	call    _Z16CheckButtonsDownv
	lds    r24, Button_Down
	# if button value is zero, push 0 else push 1
	tst    r24 # Test for Zero or Minus
	breq MJ_L103 # goto false branch
MJ_L102: # if true
	ldi r24, 1
	jmp MJ_L104
MJ_L103: # false branch, r24 is already 0, do nothing
MJ_L104: 
	push r24
	# False/0 expression
	ldi    r22, 0
	# push one byte expression onto stack
	push   r22

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L108
	ldi r25, 0
	jmp MJ_L109
MJ_L108: 
	ldi r25, hi8(-1)
MJ_L109: 
	push r25
	push r24
	# right operand of ==
	pop r18
	pop r19

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L110
	ldi r25, 0
	jmp MJ_L111
MJ_L110: 
	ldi r25, hi8(-1)
MJ_L111: 
	push r25
	push r24
	# left operand of ==
	pop r24
	pop r25
	# compare the operands
	cp    r24, r18
	cpc   r25, r19
	breq MJ_L105 # goto true branch
MJ_L106: # false branch
	ldi r24, 0
	jmp MJ_L107
MJ_L105: # true branch
	ldi r24, 1
MJ_L107: 
	push r24 # push the result on stack
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L96

MJ_L97: # false branch
	ldi r24, 0
	jmp MJ_L98

MJ_L96: # true branch
	ldi r24, 1

MJ_L98: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L99
	jmp MJ_L100

MJ_L99: # then branch
#### if statement
	# start equality check
	#### short-circuited && operation
	# &&: left operand
	# True/1 expression
	ldi    r22, 1
	# push one byte expression onto stack
	push   r22
	ldi r24, 1
	pop r25
	cp r24, r25
	brne MJ_L119 # if the left expr is false

MJ_L118: # if left expr is true
	# &&: right operand
	# False/0 expression
	ldi    r22, 0
	# push one byte expression onto stack
	push   r22
	jmp MJ_L120

MJ_L119: # false branch
	ldi r24, 0
	push r24 # push false on stack

MJ_L120: 
	# False/0 expression
	ldi    r22, 0
	# push one byte expression onto stack
	push   r22

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L124
	ldi r25, 0
	jmp MJ_L125
MJ_L124: 
	ldi r25, hi8(-1)
MJ_L125: 
	push r25
	push r24
	# right operand of ==
	pop r18
	pop r19

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L126
	ldi r25, 0
	jmp MJ_L127
MJ_L126: 
	ldi r25, hi8(-1)
MJ_L127: 
	push r25
	push r24
	# left operand of ==
	pop r24
	pop r25
	# compare the operands
	cp    r24, r18
	cpc   r25, r19
	breq MJ_L121 # goto true branch
MJ_L122: # false branch
	ldi r24, 0
	jmp MJ_L123
MJ_L121: # true branch
	ldi r24, 1
MJ_L123: 
	push r24 # push the result on stack
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L112

MJ_L113: # false branch
	ldi r24, 0
	jmp MJ_L114

MJ_L112: # true branch
	ldi r24, 1

MJ_L114: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L115
	jmp MJ_L116

MJ_L115: # then branch
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

	# Color expression Meggy.Color.GREEN
	ldi r22,4
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

	jmp MJ_L117 # jump over the else branch

MJ_L116: # else branch
MJ_L117: 
	jmp MJ_L101 # jump over the else branch

MJ_L100: # else branch
MJ_L101: 

/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main

