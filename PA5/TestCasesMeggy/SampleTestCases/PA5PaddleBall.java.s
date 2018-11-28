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



	# NewExp
	ldi r24, lo8(0)
	ldi r25, hi8(0)
	# allocating object of size 0 on heap
	call malloc
	# push object address
	# push two byte expression onto stack
	push r25
	push r24

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call PaddleBallBoard_run

/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main


	.text
.global PaddleBallBoard_run
	.type PaddleBallBoard_run, @function
PaddleBallBoard_run:
	push r29
	push r28
	# make space for locals and params
	ldi r30, 0
	push r30
	push r30
	push r30
	push r30
	push r30
	push r30
	# Copy stack pointer to frame pointer
	in r28, __SP_L__
	in r29, __SP_H__
	# save off parameters
	# implicit this pointer
	std Y + 2, r25
	std Y + 1, r24
	/* done with function PaddleBallBoard_run prologue */



	### AssignStatement
	# eval rhs exp
	# NewExp
	ldi r24, lo8(5)
	ldi r25, hi8(5)
	# allocating object of size 0 on heap
	call malloc
	# push object address
	# push two byte expression onto stack
	push r25
	push r24
	# load rhs exp
	pop r24
	pop r25
	# store rhs into var b
	std Y + 4, r25
	std Y + 3, r24
	# IdExp
	# load value for variable b
	# variable is a local or param variable
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call Ball_init

	### AssignStatement
	# eval rhs exp
	# NewExp
	ldi r24, lo8(2)
	ldi r25, hi8(2)
	# allocating object of size 0 on heap
	call malloc
	# push object address
	# push two byte expression onto stack
	push r25
	push r24
	# load rhs exp
	pop r24
	pop r25
	# store rhs into var p
	std Y + 6, r25
	std Y + 5, r24
	# IdExp
	# load value for variable p
	# variable is a local or param variable
	# load a two byte variable from base+offset
	ldd r25, Y + 6
	ldd r24, Y + 5
	# push two byte expression onto stack
	push r25
	push r24

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call Paddle_init

	### start of while loop
MJ_L0: # while loop condition
	# True/1 expression
	ldi r22, lo8(1)
	# push one byte expression onto stack
	push r22
	# examine condition
	# load a one byte expression off stack
	pop r24
	ldi r25, 1
	cp r24, r25
	breq MJ_L1 # if true, go to body
	jmp MJ_L2 # if false, go to next block
MJ_L1: # while loop body
#### if statement
	#push Meggy.Button.Left
	ldi r24, 16
	push r24
	pop r25 # get button literal
	### MeggyCheckButton
	call _Z16CheckButtonsDownv
	lds r24, Button_Left
	# if button value is zero, push 0 else push 1
	tst r24 # Test for Zero or Minus
	breq MJ_L10 # goto false branch
MJ_L9: # if true
	ldi r24, 1
	jmp MJ_L11
MJ_L10: # false branch, r24 is already 0, do nothing
MJ_L11: 
	push r24
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L3

MJ_L4: # false branch
	ldi r24, 0
	jmp MJ_L5

MJ_L3: # true branch
	ldi r24, 1

MJ_L5: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L6
	jmp MJ_L7

MJ_L6: # then branch
	# IdExp
	# load value for variable p
	# variable is a local or param variable
	# load a two byte variable from base+offset
	ldd r25, Y + 6
	ldd r24, Y + 5
	# push two byte expression onto stack
	push r25
	push r24

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call Paddle_moveLeft
	jmp MJ_L8 # jump over the else branch

MJ_L7: # else branch
#### if statement
	#push Meggy.Button.Right
	ldi r24, 32
	push r24
	pop r25 # get button literal
	### MeggyCheckButton
	call _Z16CheckButtonsDownv
	lds r24, Button_Right
	# if button value is zero, push 0 else push 1
	tst r24 # Test for Zero or Minus
	breq MJ_L19 # goto false branch
MJ_L18: # if true
	ldi r24, 1
	jmp MJ_L20
MJ_L19: # false branch, r24 is already 0, do nothing
MJ_L20: 
	push r24
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L12

MJ_L13: # false branch
	ldi r24, 0
	jmp MJ_L14

MJ_L12: # true branch
	ldi r24, 1

MJ_L14: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L15
	jmp MJ_L16

MJ_L15: # then branch
	# IdExp
	# load value for variable p
	# variable is a local or param variable
	# load a two byte variable from base+offset
	ldd r25, Y + 6
	ldd r24, Y + 5
	# push two byte expression onto stack
	push r25
	push r24

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call Paddle_moveRight
	jmp MJ_L17 # jump over the else branch

MJ_L16: # else branch
MJ_L17: 
MJ_L8: 
	# IdExp
	# load value for variable b
	# variable is a local or param variable
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call Ball_move
	# Load constant int 256
	ldi r24, lo8(256)
	ldi r25, hi8(256)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z8delay_msj
	jmp MJ_L0 # go back to condition
MJ_L2: 
	### end of while loop
	/* epilogue start for PaddleBallBoard_run */
	# handle return value
	# no return value
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	pop r30
	pop r30
	pop r30
	pop r30
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size PaddleBallBoard_run, .-PaddleBallBoard_run


	.text
.global Paddle_init
	.type Paddle_init, @function
Paddle_init:
	push r29
	push r28
	# make space for locals and params
	ldi r30, 0
	push r30
	push r30
	# Copy stack pointer to frame pointer
	in r28, __SP_L__
	in r29, __SP_H__
	# save off parameters
	# implicit this pointer
	std Y + 2, r25
	std Y + 1, r24
	/* done with function Paddle_init prologue */



	### AssignStatement
	# eval rhs exp
	# Load constant int 4
	ldi r24, lo8(4)
	ldi r25, hi8(4)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# load rhs exp
	pop r24
	# store rhs into var centerX
	std Z + 1, r24

	### AssignStatement
	# eval rhs exp
	# Color expression Meggy.Color.BLUE
	ldi r22, 5
	# push one byte expression onto stack
	push r22

	# load rhs exp
	pop r24
	# store rhs into var color
	std Z + 2, r24
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# IdExp
	# load value for variable centerX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 1
	# push one byte expression onto stack
	push r24

	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r22
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call Paddle_drawPaddle
	/* epilogue start for Paddle_init */
	# handle return value
	# no return value
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size Paddle_init, .-Paddle_init


	.text
.global Paddle_drawPaddle
	.type Paddle_drawPaddle, @function
Paddle_drawPaddle:
	push r29
	push r28
	# make space for locals and params
	ldi r30, 0
	push r30
	push r30
	push r30
	# Copy stack pointer to frame pointer
	in r28, __SP_L__
	in r29, __SP_H__
	# save off parameters
	# implicit this pointer
	std Y + 2, r25
	std Y + 1, r24
	std Y + 3, r22
	/* done with function Paddle_drawPaddle prologue */


	# IdExp
	# load value for variable x
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L21
	ldi r25, 0
	jmp MJ_L22
MJ_L21: 
	ldi r25, hi8(-1)
MJ_L22: 
	push r25
	push r24
	# Load constant int 1
	ldi r24, lo8(1)
	ldi r25, hi8(1)
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
	brlt MJ_L23
	ldi r25, 0
	jmp MJ_L24
MJ_L23: 
	ldi r25, hi8(-1)
MJ_L24: 
	push r25
	push r24

	# x = x - y
	# load y
	pop r18 # lower bits of y
	pop r19 # higher bits of y
	# load x
	pop r24 # lower bits of x
	pop r25 # higher bits of x
	# Do INT sub operation
	sub r24, r18
	sbc r25, r19
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Load constant int 0
	ldi r24, lo8(0)
	ldi r25, hi8(0)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# IdExp
	# load value for variable color
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 2
	# push one byte expression onto stack
	push r24
	### Meggy.setPixel(x,y,color) call
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# load a one byte expression off stack
	pop r24
	call _Z6DrawPxhhh
	call _Z12DisplaySlatev

	# IdExp
	# load value for variable x
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# Load constant int 0
	ldi r24, lo8(0)
	ldi r25, hi8(0)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# IdExp
	# load value for variable color
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 2
	# push one byte expression onto stack
	push r24
	### Meggy.setPixel(x,y,color) call
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# load a one byte expression off stack
	pop r24
	call _Z6DrawPxhhh
	call _Z12DisplaySlatev

	# start a add operation
	# IdExp
	# load value for variable x
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L25
	ldi r25, 0
	jmp MJ_L26
MJ_L25: 
	ldi r25, hi8(-1)
MJ_L26: 
	push r25
	push r24
	# Load constant int 1
	ldi r24, lo8(1)
	ldi r25, hi8(1)
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
	brlt MJ_L27
	ldi r25, 0
	jmp MJ_L28
MJ_L27: 
	ldi r25, hi8(-1)
MJ_L28: 
	push r25
	push r24
	# left operand of +
	pop r18
	pop r19
	# right operand of +
	pop r24
	pop r25
	# Do add operation
	add r24, r18
	adc r25, r19
	# push two byte expression onto stack
	push r25
	push r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Load constant int 0
	ldi r24, lo8(0)
	ldi r25, hi8(0)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# IdExp
	# load value for variable color
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 2
	# push one byte expression onto stack
	push r24
	### Meggy.setPixel(x,y,color) call
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# load a one byte expression off stack
	pop r24
	call _Z6DrawPxhhh
	call _Z12DisplaySlatev

	/* epilogue start for Paddle_drawPaddle */
	# handle return value
	# no return value
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	pop r30
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size Paddle_drawPaddle, .-Paddle_drawPaddle


	.text
.global Paddle_moveLeft
	.type Paddle_moveLeft, @function
Paddle_moveLeft:
	push r29
	push r28
	# make space for locals and params
	ldi r30, 0
	push r30
	push r30
	# Copy stack pointer to frame pointer
	in r28, __SP_L__
	in r29, __SP_H__
	# save off parameters
	# implicit this pointer
	std Y + 2, r25
	std Y + 1, r24
	/* done with function Paddle_moveLeft prologue */


#### if statement
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# IdExp
	# load value for variable centerX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 1
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L35
	ldi r25, 0
	jmp MJ_L36
MJ_L35: 
	ldi r25, hi8(-1)
MJ_L36: 
	push r25
	push r24
	# Load constant int 2
	ldi r24, lo8(2)
	ldi r25, hi8(2)
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
	brlt MJ_L37
	ldi r25, 0
	jmp MJ_L38
MJ_L37: 
	ldi r25, hi8(-1)
MJ_L38: 
	push r25
	push r24

	# x = x - y
	# load y
	pop r18 # lower bits of y
	pop r19 # higher bits of y
	# load x
	pop r24 # lower bits of x
	pop r25 # higher bits of x
	# Do INT sub operation
	sub r24, r18
	sbc r25, r19
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Load constant int 0
	ldi r24, lo8(0)
	ldi r25, hi8(0)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 


	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call Paddle_inBounds
	# handle return value
	# push one byte expression onto stack
	push r24

	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L29

MJ_L30: # false branch
	ldi r24, 0
	jmp MJ_L31

MJ_L29: # true branch
	ldi r24, 1

MJ_L31: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L32
	jmp MJ_L33

MJ_L32: # then branch
	# start a add operation
	# IdExp
	# load value for variable centerX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 1
	# push one byte expression onto stack
	push r24

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
	# Load constant int 1
	ldi r24, lo8(1)
	ldi r25, hi8(1)
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
	brlt MJ_L41
	ldi r25, 0
	jmp MJ_L42
MJ_L41: 
	ldi r25, hi8(-1)
MJ_L42: 
	push r25
	push r24
	# left operand of +
	pop r18
	pop r19
	# right operand of +
	pop r24
	pop r25
	# Do add operation
	add r24, r18
	adc r25, r19
	# push two byte expression onto stack
	push r25
	push r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Load constant int 0
	ldi r24, lo8(0)
	ldi r25, hi8(0)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Color expression Meggy.Color.DARK
	ldi r22, 0
	# push one byte expression onto stack
	push r22

	### Meggy.setPixel(x,y,color) call
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# load a one byte expression off stack
	pop r24
	call _Z6DrawPxhhh
	call _Z12DisplaySlatev


	### AssignStatement
	# eval rhs exp
	# IdExp
	# load value for variable centerX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 1
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L43
	ldi r25, 0
	jmp MJ_L44
MJ_L43: 
	ldi r25, hi8(-1)
MJ_L44: 
	push r25
	push r24
	# Load constant int 1
	ldi r24, lo8(1)
	ldi r25, hi8(1)
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
	brlt MJ_L45
	ldi r25, 0
	jmp MJ_L46
MJ_L45: 
	ldi r25, hi8(-1)
MJ_L46: 
	push r25
	push r24

	# x = x - y
	# load y
	pop r18 # lower bits of y
	pop r19 # higher bits of y
	# load x
	pop r24 # lower bits of x
	pop r25 # higher bits of x
	# Do INT sub operation
	sub r24, r18
	sbc r25, r19
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# load rhs exp
	pop r24
	# store rhs into var centerX
	std Z + 1, r24
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# IdExp
	# load value for variable centerX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 1
	# push one byte expression onto stack
	push r24

	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r22
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call Paddle_drawPaddle
	jmp MJ_L34 # jump over the else branch

MJ_L33: # else branch
MJ_L34: 
	/* epilogue start for Paddle_moveLeft */
	# handle return value
	# no return value
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size Paddle_moveLeft, .-Paddle_moveLeft


	.text
.global Paddle_moveRight
	.type Paddle_moveRight, @function
Paddle_moveRight:
	push r29
	push r28
	# make space for locals and params
	ldi r30, 0
	push r30
	push r30
	# Copy stack pointer to frame pointer
	in r28, __SP_L__
	in r29, __SP_H__
	# save off parameters
	# implicit this pointer
	std Y + 2, r25
	std Y + 1, r24
	/* done with function Paddle_moveRight prologue */


#### if statement
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# start a add operation
	# IdExp
	# load value for variable centerX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 1
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L53
	ldi r25, 0
	jmp MJ_L54
MJ_L53: 
	ldi r25, hi8(-1)
MJ_L54: 
	push r25
	push r24
	# Load constant int 2
	ldi r24, lo8(2)
	ldi r25, hi8(2)
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
	brlt MJ_L55
	ldi r25, 0
	jmp MJ_L56
MJ_L55: 
	ldi r25, hi8(-1)
MJ_L56: 
	push r25
	push r24
	# left operand of +
	pop r18
	pop r19
	# right operand of +
	pop r24
	pop r25
	# Do add operation
	add r24, r18
	adc r25, r19
	# push two byte expression onto stack
	push r25
	push r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Load constant int 0
	ldi r24, lo8(0)
	ldi r25, hi8(0)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 


	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call Paddle_inBounds
	# handle return value
	# push one byte expression onto stack
	push r24

	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L47

MJ_L48: # false branch
	ldi r24, 0
	jmp MJ_L49

MJ_L47: # true branch
	ldi r24, 1

MJ_L49: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L50
	jmp MJ_L51

MJ_L50: # then branch
	# IdExp
	# load value for variable centerX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 1
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L57
	ldi r25, 0
	jmp MJ_L58
MJ_L57: 
	ldi r25, hi8(-1)
MJ_L58: 
	push r25
	push r24
	# Load constant int 1
	ldi r24, lo8(1)
	ldi r25, hi8(1)
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
	brlt MJ_L59
	ldi r25, 0
	jmp MJ_L60
MJ_L59: 
	ldi r25, hi8(-1)
MJ_L60: 
	push r25
	push r24

	# x = x - y
	# load y
	pop r18 # lower bits of y
	pop r19 # higher bits of y
	# load x
	pop r24 # lower bits of x
	pop r25 # higher bits of x
	# Do INT sub operation
	sub r24, r18
	sbc r25, r19
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Load constant int 0
	ldi r24, lo8(0)
	ldi r25, hi8(0)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Color expression Meggy.Color.DARK
	ldi r22, 0
	# push one byte expression onto stack
	push r22

	### Meggy.setPixel(x,y,color) call
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# load a one byte expression off stack
	pop r24
	call _Z6DrawPxhhh
	call _Z12DisplaySlatev


	### AssignStatement
	# eval rhs exp
	# start a add operation
	# IdExp
	# load value for variable centerX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 1
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L61
	ldi r25, 0
	jmp MJ_L62
MJ_L61: 
	ldi r25, hi8(-1)
MJ_L62: 
	push r25
	push r24
	# Load constant int 1
	ldi r24, lo8(1)
	ldi r25, hi8(1)
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
	brlt MJ_L63
	ldi r25, 0
	jmp MJ_L64
MJ_L63: 
	ldi r25, hi8(-1)
MJ_L64: 
	push r25
	push r24
	# left operand of +
	pop r18
	pop r19
	# right operand of +
	pop r24
	pop r25
	# Do add operation
	add r24, r18
	adc r25, r19
	# push two byte expression onto stack
	push r25
	push r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# load rhs exp
	pop r24
	# store rhs into var centerX
	std Z + 1, r24
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# IdExp
	# load value for variable centerX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 1
	# push one byte expression onto stack
	push r24

	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r22
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call Paddle_drawPaddle
	jmp MJ_L52 # jump over the else branch

MJ_L51: # else branch
MJ_L52: 
	/* epilogue start for Paddle_moveRight */
	# handle return value
	# no return value
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size Paddle_moveRight, .-Paddle_moveRight


	.text
.global Paddle_inBounds
	.type Paddle_inBounds, @function
Paddle_inBounds:
	push r29
	push r28
	# make space for locals and params
	ldi r30, 0
	push r30
	push r30
	push r30
	push r30
	# Copy stack pointer to frame pointer
	in r28, __SP_L__
	in r29, __SP_H__
	# save off parameters
	# implicit this pointer
	std Y + 2, r25
	std Y + 1, r24
	std Y + 3, r22
	std Y + 4, r20
	/* done with function Paddle_inBounds prologue */


	#### short-circuited && operation
	# &&: left operand
	#### short-circuited && operation
	# &&: left operand
	#### short-circuited && operation
	# &&: left operand
	# Load constant int 0
	ldi r24, lo8(0)
	ldi r25, hi8(0)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Load constant int 1
	ldi r24, lo8(1)
	ldi r25, hi8(1)
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
	sub r24, r18
	sbc r25, r19
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
	brlt MJ_L65
	ldi r25, 0
	jmp MJ_L66
MJ_L65: 
	ldi r25, hi8(-1)
MJ_L66: 
	push r25
	push r24
	# IdExp
	# load value for variable x
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L67
	ldi r25, 0
	jmp MJ_L68
MJ_L67: 
	ldi r25, hi8(-1)
MJ_L68: 
	push r25
	push r24
	# less than expression
	# load a two byte expression off stack
	pop r18
	pop r19
	# load a two byte expression off stack
	pop r24
	pop r25
	cp r24, r18
	cpc r25, r19
	brlt MJ_L69
MJ_L70: # load false
	ldi r24, 0
	jmp MJ_L71
MJ_L69: # load true
	ldi r24, 1
MJ_L71: 
	push r24 # push the result of less than
	ldi r24, 1
	pop r25
	cp r24, r25
	brne MJ_L73 # if the left expr is false

MJ_L72: # if left expr is true
	# &&: right operand
	# IdExp
	# load value for variable x
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L75
	ldi r25, 0
	jmp MJ_L76
MJ_L75: 
	ldi r25, hi8(-1)
MJ_L76: 
	push r25
	push r24
	# Load constant int 8
	ldi r24, lo8(8)
	ldi r25, hi8(8)
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
	brlt MJ_L77
	ldi r25, 0
	jmp MJ_L78
MJ_L77: 
	ldi r25, hi8(-1)
MJ_L78: 
	push r25
	push r24
	# less than expression
	# load a two byte expression off stack
	pop r18
	pop r19
	# load a two byte expression off stack
	pop r24
	pop r25
	cp r24, r18
	cpc r25, r19
	brlt MJ_L79
MJ_L80: # load false
	ldi r24, 0
	jmp MJ_L81
MJ_L79: # load true
	ldi r24, 1
MJ_L81: 
	push r24 # push the result of less than
	jmp MJ_L74

MJ_L73: # false branch
	ldi r24, 0
	push r24 # push false on stack

MJ_L74: 
	ldi r24, 1
	pop r25
	cp r24, r25
	brne MJ_L83 # if the left expr is false

MJ_L82: # if left expr is true
	# &&: right operand
	# Load constant int 0
	ldi r24, lo8(0)
	ldi r25, hi8(0)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Load constant int 1
	ldi r24, lo8(1)
	ldi r25, hi8(1)
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
	sub r24, r18
	sbc r25, r19
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
	brlt MJ_L85
	ldi r25, 0
	jmp MJ_L86
MJ_L85: 
	ldi r25, hi8(-1)
MJ_L86: 
	push r25
	push r24
	# IdExp
	# load value for variable y
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L87
	ldi r25, 0
	jmp MJ_L88
MJ_L87: 
	ldi r25, hi8(-1)
MJ_L88: 
	push r25
	push r24
	# less than expression
	# load a two byte expression off stack
	pop r18
	pop r19
	# load a two byte expression off stack
	pop r24
	pop r25
	cp r24, r18
	cpc r25, r19
	brlt MJ_L89
MJ_L90: # load false
	ldi r24, 0
	jmp MJ_L91
MJ_L89: # load true
	ldi r24, 1
MJ_L91: 
	push r24 # push the result of less than
	jmp MJ_L84

MJ_L83: # false branch
	ldi r24, 0
	push r24 # push false on stack

MJ_L84: 
	ldi r24, 1
	pop r25
	cp r24, r25
	brne MJ_L93 # if the left expr is false

MJ_L92: # if left expr is true
	# &&: right operand
	# IdExp
	# load value for variable y
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L95
	ldi r25, 0
	jmp MJ_L96
MJ_L95: 
	ldi r25, hi8(-1)
MJ_L96: 
	push r25
	push r24
	# Load constant int 8
	ldi r24, lo8(8)
	ldi r25, hi8(8)
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
	brlt MJ_L97
	ldi r25, 0
	jmp MJ_L98
MJ_L97: 
	ldi r25, hi8(-1)
MJ_L98: 
	push r25
	push r24
	# less than expression
	# load a two byte expression off stack
	pop r18
	pop r19
	# load a two byte expression off stack
	pop r24
	pop r25
	cp r24, r18
	cpc r25, r19
	brlt MJ_L99
MJ_L100: # load false
	ldi r24, 0
	jmp MJ_L101
MJ_L99: # load true
	ldi r24, 1
MJ_L101: 
	push r24 # push the result of less than
	jmp MJ_L94

MJ_L93: # false branch
	ldi r24, 0
	push r24 # push false on stack

MJ_L94: 
	/* epilogue start for Paddle_inBounds */
	# handle return value
	# load a one byte expression off stack
	pop r25
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	pop r30
	pop r30
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size Paddle_inBounds, .-Paddle_inBounds


	.text
.global Ball_init
	.type Ball_init, @function
Ball_init:
	push r29
	push r28
	# make space for locals and params
	ldi r30, 0
	push r30
	push r30
	# Copy stack pointer to frame pointer
	in r28, __SP_L__
	in r29, __SP_H__
	# save off parameters
	# implicit this pointer
	std Y + 2, r25
	std Y + 1, r24
	/* done with function Ball_init prologue */



	### AssignStatement
	# eval rhs exp
	# Load constant int 3
	ldi r24, lo8(3)
	ldi r25, hi8(3)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# load rhs exp
	pop r24
	# store rhs into var prevX
	std Z + 3, r24

	### AssignStatement
	# eval rhs exp
	# Load constant int 7
	ldi r24, lo8(7)
	ldi r25, hi8(7)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# load rhs exp
	pop r24
	# store rhs into var prevY
	std Z + 4, r24

	### AssignStatement
	# eval rhs exp
	# Load constant int 4
	ldi r24, lo8(4)
	ldi r25, hi8(4)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# load rhs exp
	pop r24
	# store rhs into var currentX
	std Z + 1, r24

	### AssignStatement
	# eval rhs exp
	# Load constant int 6
	ldi r24, lo8(6)
	ldi r25, hi8(6)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# load rhs exp
	pop r24
	# store rhs into var currentY
	std Z + 2, r24

	### AssignStatement
	# eval rhs exp
	# Color expression Meggy.Color.ORANGE
	ldi r22, 2
	# push one byte expression onto stack
	push r22

	# load rhs exp
	pop r24
	# store rhs into var ballColor
	std Z + 5, r24
	# IdExp
	# load value for variable currentX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 1
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable currentY
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 2
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable ballColor
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 5
	# push one byte expression onto stack
	push r24
	### Meggy.setPixel(x,y,color) call
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# load a one byte expression off stack
	pop r24
	call _Z6DrawPxhhh
	call _Z12DisplaySlatev

	/* epilogue start for Ball_init */
	# handle return value
	# no return value
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size Ball_init, .-Ball_init


	.text
.global Ball_inBounds
	.type Ball_inBounds, @function
Ball_inBounds:
	push r29
	push r28
	# make space for locals and params
	ldi r30, 0
	push r30
	push r30
	push r30
	push r30
	# Copy stack pointer to frame pointer
	in r28, __SP_L__
	in r29, __SP_H__
	# save off parameters
	# implicit this pointer
	std Y + 2, r25
	std Y + 1, r24
	std Y + 3, r22
	std Y + 4, r20
	/* done with function Ball_inBounds prologue */


	#### short-circuited && operation
	# &&: left operand
	#### short-circuited && operation
	# &&: left operand
	#### short-circuited && operation
	# &&: left operand
	# Load constant int 0
	ldi r24, lo8(0)
	ldi r25, hi8(0)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Load constant int 1
	ldi r24, lo8(1)
	ldi r25, hi8(1)
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
	sub r24, r18
	sbc r25, r19
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
	brlt MJ_L102
	ldi r25, 0
	jmp MJ_L103
MJ_L102: 
	ldi r25, hi8(-1)
MJ_L103: 
	push r25
	push r24
	# IdExp
	# load value for variable x
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L104
	ldi r25, 0
	jmp MJ_L105
MJ_L104: 
	ldi r25, hi8(-1)
MJ_L105: 
	push r25
	push r24
	# less than expression
	# load a two byte expression off stack
	pop r18
	pop r19
	# load a two byte expression off stack
	pop r24
	pop r25
	cp r24, r18
	cpc r25, r19
	brlt MJ_L106
MJ_L107: # load false
	ldi r24, 0
	jmp MJ_L108
MJ_L106: # load true
	ldi r24, 1
MJ_L108: 
	push r24 # push the result of less than
	ldi r24, 1
	pop r25
	cp r24, r25
	brne MJ_L110 # if the left expr is false

MJ_L109: # if left expr is true
	# &&: right operand
	# IdExp
	# load value for variable x
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L112
	ldi r25, 0
	jmp MJ_L113
MJ_L112: 
	ldi r25, hi8(-1)
MJ_L113: 
	push r25
	push r24
	# Load constant int 8
	ldi r24, lo8(8)
	ldi r25, hi8(8)
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
	brlt MJ_L114
	ldi r25, 0
	jmp MJ_L115
MJ_L114: 
	ldi r25, hi8(-1)
MJ_L115: 
	push r25
	push r24
	# less than expression
	# load a two byte expression off stack
	pop r18
	pop r19
	# load a two byte expression off stack
	pop r24
	pop r25
	cp r24, r18
	cpc r25, r19
	brlt MJ_L116
MJ_L117: # load false
	ldi r24, 0
	jmp MJ_L118
MJ_L116: # load true
	ldi r24, 1
MJ_L118: 
	push r24 # push the result of less than
	jmp MJ_L111

MJ_L110: # false branch
	ldi r24, 0
	push r24 # push false on stack

MJ_L111: 
	ldi r24, 1
	pop r25
	cp r24, r25
	brne MJ_L120 # if the left expr is false

MJ_L119: # if left expr is true
	# &&: right operand
	# Load constant int 0
	ldi r24, lo8(0)
	ldi r25, hi8(0)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Load constant int 1
	ldi r24, lo8(1)
	ldi r25, hi8(1)
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
	sub r24, r18
	sbc r25, r19
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
	brlt MJ_L122
	ldi r25, 0
	jmp MJ_L123
MJ_L122: 
	ldi r25, hi8(-1)
MJ_L123: 
	push r25
	push r24
	# IdExp
	# load value for variable y
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24

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
	# less than expression
	# load a two byte expression off stack
	pop r18
	pop r19
	# load a two byte expression off stack
	pop r24
	pop r25
	cp r24, r18
	cpc r25, r19
	brlt MJ_L126
MJ_L127: # load false
	ldi r24, 0
	jmp MJ_L128
MJ_L126: # load true
	ldi r24, 1
MJ_L128: 
	push r24 # push the result of less than
	jmp MJ_L121

MJ_L120: # false branch
	ldi r24, 0
	push r24 # push false on stack

MJ_L121: 
	ldi r24, 1
	pop r25
	cp r24, r25
	brne MJ_L130 # if the left expr is false

MJ_L129: # if left expr is true
	# &&: right operand
	# IdExp
	# load value for variable y
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L132
	ldi r25, 0
	jmp MJ_L133
MJ_L132: 
	ldi r25, hi8(-1)
MJ_L133: 
	push r25
	push r24
	# Load constant int 8
	ldi r24, lo8(8)
	ldi r25, hi8(8)
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
	brlt MJ_L134
	ldi r25, 0
	jmp MJ_L135
MJ_L134: 
	ldi r25, hi8(-1)
MJ_L135: 
	push r25
	push r24
	# less than expression
	# load a two byte expression off stack
	pop r18
	pop r19
	# load a two byte expression off stack
	pop r24
	pop r25
	cp r24, r18
	cpc r25, r19
	brlt MJ_L136
MJ_L137: # load false
	ldi r24, 0
	jmp MJ_L138
MJ_L136: # load true
	ldi r24, 1
MJ_L138: 
	push r24 # push the result of less than
	jmp MJ_L131

MJ_L130: # false branch
	ldi r24, 0
	push r24 # push false on stack

MJ_L131: 
	/* epilogue start for Ball_inBounds */
	# handle return value
	# load a one byte expression off stack
	pop r25
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	pop r30
	pop r30
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size Ball_inBounds, .-Ball_inBounds


	.text
.global Ball_collision
	.type Ball_collision, @function
Ball_collision:
	push r29
	push r28
	# make space for locals and params
	ldi r30, 0
	push r30
	push r30
	push r30
	push r30
	# Copy stack pointer to frame pointer
	in r28, __SP_L__
	in r29, __SP_H__
	# save off parameters
	# implicit this pointer
	std Y + 2, r25
	std Y + 1, r24
	std Y + 3, r22
	std Y + 4, r20
	/* done with function Ball_collision prologue */


	# start equality check
	# Color expression Meggy.Color.DARK
	ldi r22, 0
	# push one byte expression onto stack
	push r22

	# IdExp
	# load value for variable x
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable y
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24
	### Meggy.getPixel(x,y) call
	# load a one byte expression off stack
	pop r22
	# load a one byte expression off stack
	pop r24
	call _Z6ReadPxhh
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L142
	ldi r25, 0
	jmp MJ_L143
MJ_L142: 
	ldi r25, hi8(-1)
MJ_L143: 
	push r25
	push r24
	# right operand of ==
	pop r18
	pop r19

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L144
	ldi r25, 0
	jmp MJ_L145
MJ_L144: 
	ldi r25, hi8(-1)
MJ_L145: 
	push r25
	push r24
	# left operand of ==
	pop r24
	pop r25
	# compare the operands
	cp r24, r18
	cpc r25, r19
	breq MJ_L139 # goto true branch
MJ_L140: # false branch
	ldi r24, 0
	jmp MJ_L141
MJ_L139: # true branch
	ldi r24, 1
MJ_L141: 
	push r24 # push the result on stack
	# not operation
	# load a one byte expression off stack
	pop r24
	ldi r22, 1
	eor r24,r22 # xor
	# push the result onto stack
	push r24
	/* epilogue start for Ball_collision */
	# handle return value
	# load a one byte expression off stack
	pop r25
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	pop r30
	pop r30
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size Ball_collision, .-Ball_collision


	.text
.global Ball_move
	.type Ball_move, @function
Ball_move:
	push r29
	push r28
	# make space for locals and params
	ldi r30, 0
	push r30
	push r30
	push r30
	push r30
	push r30
	push r30
	# Copy stack pointer to frame pointer
	in r28, __SP_L__
	in r29, __SP_H__
	# save off parameters
	# implicit this pointer
	std Y + 2, r25
	std Y + 1, r24
	/* done with function Ball_move prologue */



	### AssignStatement
	# eval rhs exp
	# start a add operation
	# IdExp
	# load value for variable currentX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 1
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L146
	ldi r25, 0
	jmp MJ_L147
MJ_L146: 
	ldi r25, hi8(-1)
MJ_L147: 
	push r25
	push r24
	# IdExp
	# load value for variable prevX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 3
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L148
	ldi r25, 0
	jmp MJ_L149
MJ_L148: 
	ldi r25, hi8(-1)
MJ_L149: 
	push r25
	push r24

	# x = x - y
	# load y
	pop r18 # lower bits of y
	pop r19 # higher bits of y
	# load x
	pop r24 # lower bits of x
	pop r25 # higher bits of x
	# Do INT sub operation
	sub r24, r18
	sbc r25, r19
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
	brlt MJ_L150
	ldi r25, 0
	jmp MJ_L151
MJ_L150: 
	ldi r25, hi8(-1)
MJ_L151: 
	push r25
	push r24
	# IdExp
	# load value for variable currentX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 1
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L152
	ldi r25, 0
	jmp MJ_L153
MJ_L152: 
	ldi r25, hi8(-1)
MJ_L153: 
	push r25
	push r24
	# left operand of +
	pop r18
	pop r19
	# right operand of +
	pop r24
	pop r25
	# Do add operation
	add r24, r18
	adc r25, r19
	# push two byte expression onto stack
	push r25
	push r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# load rhs exp
	pop r24
	# store rhs into var nextX
	std Y + 3, r24

	### AssignStatement
	# eval rhs exp
	# start a add operation
	# IdExp
	# load value for variable currentY
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 2
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L154
	ldi r25, 0
	jmp MJ_L155
MJ_L154: 
	ldi r25, hi8(-1)
MJ_L155: 
	push r25
	push r24
	# IdExp
	# load value for variable prevY
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 4
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L156
	ldi r25, 0
	jmp MJ_L157
MJ_L156: 
	ldi r25, hi8(-1)
MJ_L157: 
	push r25
	push r24

	# x = x - y
	# load y
	pop r18 # lower bits of y
	pop r19 # higher bits of y
	# load x
	pop r24 # lower bits of x
	pop r25 # higher bits of x
	# Do INT sub operation
	sub r24, r18
	sbc r25, r19
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
	brlt MJ_L158
	ldi r25, 0
	jmp MJ_L159
MJ_L158: 
	ldi r25, hi8(-1)
MJ_L159: 
	push r25
	push r24
	# IdExp
	# load value for variable currentY
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 2
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L160
	ldi r25, 0
	jmp MJ_L161
MJ_L160: 
	ldi r25, hi8(-1)
MJ_L161: 
	push r25
	push r24
	# left operand of +
	pop r18
	pop r19
	# right operand of +
	pop r24
	pop r25
	# Do add operation
	add r24, r18
	adc r25, r19
	# push two byte expression onto stack
	push r25
	push r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# load rhs exp
	pop r24
	# store rhs into var nextY
	std Y + 4, r24
#### if statement
	#### short-circuited && operation
	# &&: left operand
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# IdExp
	# load value for variable nextX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable nextY
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24

	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call Ball_inBounds
	# handle return value
	# push one byte expression onto stack
	push r24

	ldi r24, 1
	pop r25
	cp r24, r25
	brne MJ_L169 # if the left expr is false

MJ_L168: # if left expr is true
	# &&: right operand
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# IdExp
	# load value for variable nextX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable nextY
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24

	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call Ball_collision
	# handle return value
	# push one byte expression onto stack
	push r24

	# not operation
	# load a one byte expression off stack
	pop r24
	ldi r22, 1
	eor r24,r22 # xor
	# push the result onto stack
	push r24
	jmp MJ_L170

MJ_L169: # false branch
	ldi r24, 0
	push r24 # push false on stack

MJ_L170: 
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L162

MJ_L163: # false branch
	ldi r24, 0
	jmp MJ_L164

MJ_L162: # true branch
	ldi r24, 1

MJ_L164: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L165
	jmp MJ_L166

MJ_L165: # then branch
	jmp MJ_L167 # jump over the else branch

MJ_L166: # else branch

	### AssignStatement
	# eval rhs exp
	# IdExp
	# load value for variable currentX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 1
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L171
	ldi r25, 0
	jmp MJ_L172
MJ_L171: 
	ldi r25, hi8(-1)
MJ_L172: 
	push r25
	push r24
	# IdExp
	# load value for variable prevX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 3
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L173
	ldi r25, 0
	jmp MJ_L174
MJ_L173: 
	ldi r25, hi8(-1)
MJ_L174: 
	push r25
	push r24

	# x = x - y
	# load y
	pop r18 # lower bits of y
	pop r19 # higher bits of y
	# load x
	pop r24 # lower bits of x
	pop r25 # higher bits of x
	# Do INT sub operation
	sub r24, r18
	sbc r25, r19
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# load rhs exp
	pop r24
	# store rhs into var deltaX
	std Y + 5, r24

	### AssignStatement
	# eval rhs exp
	# IdExp
	# load value for variable currentY
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 2
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L175
	ldi r25, 0
	jmp MJ_L176
MJ_L175: 
	ldi r25, hi8(-1)
MJ_L176: 
	push r25
	push r24
	# IdExp
	# load value for variable prevY
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 4
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L177
	ldi r25, 0
	jmp MJ_L178
MJ_L177: 
	ldi r25, hi8(-1)
MJ_L178: 
	push r25
	push r24

	# x = x - y
	# load y
	pop r18 # lower bits of y
	pop r19 # higher bits of y
	# load x
	pop r24 # lower bits of x
	pop r25 # higher bits of x
	# Do INT sub operation
	sub r24, r18
	sbc r25, r19
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# load rhs exp
	pop r24
	# store rhs into var deltaY
	std Y + 6, r24

	### AssignStatement
	# eval rhs exp
	# start a add operation
	# IdExp
	# load value for variable currentX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 1
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L179
	ldi r25, 0
	jmp MJ_L180
MJ_L179: 
	ldi r25, hi8(-1)
MJ_L180: 
	push r25
	push r24
	# IdExp
	# load value for variable deltaX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 5
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L181
	ldi r25, 0
	jmp MJ_L182
MJ_L181: 
	ldi r25, hi8(-1)
MJ_L182: 
	push r25
	push r24
	# left operand of +
	pop r18
	pop r19
	# right operand of +
	pop r24
	pop r25
	# Do add operation
	add r24, r18
	adc r25, r19
	# push two byte expression onto stack
	push r25
	push r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# load rhs exp
	pop r24
	# store rhs into var nextX
	std Y + 3, r24

	### AssignStatement
	# eval rhs exp
	# IdExp
	# load value for variable currentY
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 2
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L183
	ldi r25, 0
	jmp MJ_L184
MJ_L183: 
	ldi r25, hi8(-1)
MJ_L184: 
	push r25
	push r24
	# IdExp
	# load value for variable deltaY
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 6
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L185
	ldi r25, 0
	jmp MJ_L186
MJ_L185: 
	ldi r25, hi8(-1)
MJ_L186: 
	push r25
	push r24

	# x = x - y
	# load y
	pop r18 # lower bits of y
	pop r19 # higher bits of y
	# load x
	pop r24 # lower bits of x
	pop r25 # higher bits of x
	# Do INT sub operation
	sub r24, r18
	sbc r25, r19
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# load rhs exp
	pop r24
	# store rhs into var nextY
	std Y + 4, r24
#### if statement
	#### short-circuited && operation
	# &&: left operand
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# IdExp
	# load value for variable nextX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable nextY
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24

	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call Ball_inBounds
	# handle return value
	# push one byte expression onto stack
	push r24

	ldi r24, 1
	pop r25
	cp r24, r25
	brne MJ_L194 # if the left expr is false

MJ_L193: # if left expr is true
	# &&: right operand
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# IdExp
	# load value for variable nextX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable nextY
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24

	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call Ball_collision
	# handle return value
	# push one byte expression onto stack
	push r24

	# not operation
	# load a one byte expression off stack
	pop r24
	ldi r22, 1
	eor r24,r22 # xor
	# push the result onto stack
	push r24
	jmp MJ_L195

MJ_L194: # false branch
	ldi r24, 0
	push r24 # push false on stack

MJ_L195: 
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L187

MJ_L188: # false branch
	ldi r24, 0
	jmp MJ_L189

MJ_L187: # true branch
	ldi r24, 1

MJ_L189: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L190
	jmp MJ_L191

MJ_L190: # then branch
	jmp MJ_L192 # jump over the else branch

MJ_L191: # else branch

	### AssignStatement
	# eval rhs exp
	# IdExp
	# load value for variable currentX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 1
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L196
	ldi r25, 0
	jmp MJ_L197
MJ_L196: 
	ldi r25, hi8(-1)
MJ_L197: 
	push r25
	push r24
	# IdExp
	# load value for variable deltaX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 5
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L198
	ldi r25, 0
	jmp MJ_L199
MJ_L198: 
	ldi r25, hi8(-1)
MJ_L199: 
	push r25
	push r24

	# x = x - y
	# load y
	pop r18 # lower bits of y
	pop r19 # higher bits of y
	# load x
	pop r24 # lower bits of x
	pop r25 # higher bits of x
	# Do INT sub operation
	sub r24, r18
	sbc r25, r19
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# load rhs exp
	pop r24
	# store rhs into var nextX
	std Y + 3, r24

	### AssignStatement
	# eval rhs exp
	# start a add operation
	# IdExp
	# load value for variable currentY
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 2
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L200
	ldi r25, 0
	jmp MJ_L201
MJ_L200: 
	ldi r25, hi8(-1)
MJ_L201: 
	push r25
	push r24
	# IdExp
	# load value for variable deltaY
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 6
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L202
	ldi r25, 0
	jmp MJ_L203
MJ_L202: 
	ldi r25, hi8(-1)
MJ_L203: 
	push r25
	push r24
	# left operand of +
	pop r18
	pop r19
	# right operand of +
	pop r24
	pop r25
	# Do add operation
	add r24, r18
	adc r25, r19
	# push two byte expression onto stack
	push r25
	push r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# load rhs exp
	pop r24
	# store rhs into var nextY
	std Y + 4, r24
#### if statement
	#### short-circuited && operation
	# &&: left operand
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# IdExp
	# load value for variable nextX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable nextY
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24

	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call Ball_inBounds
	# handle return value
	# push one byte expression onto stack
	push r24

	ldi r24, 1
	pop r25
	cp r24, r25
	brne MJ_L211 # if the left expr is false

MJ_L210: # if left expr is true
	# &&: right operand
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# IdExp
	# load value for variable nextX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable nextY
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24

	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call Ball_collision
	# handle return value
	# push one byte expression onto stack
	push r24

	# not operation
	# load a one byte expression off stack
	pop r24
	ldi r22, 1
	eor r24,r22 # xor
	# push the result onto stack
	push r24
	jmp MJ_L212

MJ_L211: # false branch
	ldi r24, 0
	push r24 # push false on stack

MJ_L212: 
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L204

MJ_L205: # false branch
	ldi r24, 0
	jmp MJ_L206

MJ_L204: # true branch
	ldi r24, 1

MJ_L206: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L207
	jmp MJ_L208

MJ_L207: # then branch
	jmp MJ_L209 # jump over the else branch

MJ_L208: # else branch

	### AssignStatement
	# eval rhs exp
	# IdExp
	# load value for variable prevX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 3
	# push one byte expression onto stack
	push r24
	# load rhs exp
	pop r24
	# store rhs into var nextX
	std Y + 3, r24

	### AssignStatement
	# eval rhs exp
	# IdExp
	# load value for variable prevY
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 4
	# push one byte expression onto stack
	push r24
	# load rhs exp
	pop r24
	# store rhs into var nextY
	std Y + 4, r24
MJ_L209: 
MJ_L192: 
MJ_L167: 
	# IdExp
	# load value for variable currentX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 1
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable currentY
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 2
	# push one byte expression onto stack
	push r24
	# Color expression Meggy.Color.DARK
	ldi r22, 0
	# push one byte expression onto stack
	push r22

	### Meggy.setPixel(x,y,color) call
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# load a one byte expression off stack
	pop r24
	call _Z6DrawPxhhh
	call _Z12DisplaySlatev

	# IdExp
	# load value for variable nextX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable nextY
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable ballColor
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 5
	# push one byte expression onto stack
	push r24
	### Meggy.setPixel(x,y,color) call
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# load a one byte expression off stack
	pop r24
	call _Z6DrawPxhhh
	call _Z12DisplaySlatev


	### AssignStatement
	# eval rhs exp
	# IdExp
	# load value for variable currentX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 1
	# push one byte expression onto stack
	push r24
	# load rhs exp
	pop r24
	# store rhs into var prevX
	std Z + 3, r24

	### AssignStatement
	# eval rhs exp
	# IdExp
	# load value for variable currentY
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Z + 2
	# push one byte expression onto stack
	push r24
	# load rhs exp
	pop r24
	# store rhs into var prevY
	std Z + 4, r24

	### AssignStatement
	# eval rhs exp
	# IdExp
	# load value for variable nextX
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# load rhs exp
	pop r24
	# store rhs into var currentX
	std Z + 1, r24

	### AssignStatement
	# eval rhs exp
	# IdExp
	# load value for variable nextY
	# variable is a local or param variable
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24
	# load rhs exp
	pop r24
	# store rhs into var currentY
	std Z + 2, r24
	/* epilogue start for Ball_move */
	# handle return value
	# no return value
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	pop r30
	pop r30
	pop r30
	pop r30
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size Ball_move, .-Ball_move

