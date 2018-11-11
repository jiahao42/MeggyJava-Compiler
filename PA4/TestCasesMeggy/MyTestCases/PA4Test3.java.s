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




	### start of while loop
MJ_L0: # while loop condition
	# True/1 expression
	ldi    r22, 1
	# push one byte expression onto stack
	push   r22
	# examine condition
	# load a one byte expression off stack
	pop r24
	ldi r25,1
	cp r24, r25
	breq MJ_L1 # if true, go to body
	jmp MJ_L2 # if false, go to next block
MJ_L1: # while loop body
	# Load constant int 1
	ldi r24,lo8(1)
	ldi r25,hi8(1)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Color expression Meggy.Color.RED
	ldi r22,1
	# push one byte expression onto stack
	push r22

	# start a add operation
	# start a add operation
	# Load constant int 10
	ldi r24,lo8(10)
	ldi r25,hi8(10)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

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
	# Load constant int 30
	ldi r24,lo8(30)
	ldi r25,hi8(30)
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
	# start a add operation
	# start a add operation
	# Load constant int 10
	ldi r24,lo8(10)
	ldi r25,hi8(10)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

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
	# Load constant int 20
	ldi r24,lo8(20)
	ldi r25,hi8(20)
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
	# start a add operation
	# start a add operation
	# Load constant int 10
	ldi r24,lo8(10)
	ldi r25,hi8(10)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

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
	breq MJ_L10 # goto false branch
MJ_L9: # if true
	ldi r24, 1
	jmp MJ_L11
MJ_L10: # false branch, r24 is already 0, do nothing
MJ_L11: 
	push r24
	# True/1 expression
	ldi    r22, 1
	# push one byte expression onto stack
	push   r22

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L15
	ldi r25, 0
	jmp MJ_L16
MJ_L15: 
	ldi r25, hi8(-1)
MJ_L16: 
	push r25
	push r24
	# right operand of ==
	pop r18
	pop r19

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L17
	ldi r25, 0
	jmp MJ_L18
MJ_L17: 
	ldi r25, hi8(-1)
MJ_L18: 
	push r25
	push r24
	# left operand of ==
	pop r24
	pop r25
	# compare the operands
	cp    r24, r18
	cpc   r25, r19
	breq MJ_L12 # goto true branch
MJ_L13: # false branch
	ldi r24, 0
	jmp MJ_L14
MJ_L12: # true branch
	ldi r24, 1
MJ_L14: 
	push r24 # push the result on stack
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

	# Load constant int 4
	ldi r24,lo8(4)
	ldi r25,hi8(4)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Color expression Meggy.Color.GREEN
	ldi r22,4
	# push one byte expression onto stack
	push r22

	jmp MJ_L8 # jump over the else branch

MJ_L7: # else branch
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

	# Color expression Meggy.Color.RED
	ldi r22,1
	# push one byte expression onto stack
	push r22

	# Load constant int 7
	ldi r24,lo8(7)
	ldi r25,hi8(7)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Color expression Meggy.Color.GREEN
	ldi r22,4
	# push one byte expression onto stack
	push r22

MJ_L8: 
	jmp MJ_L0 # go back to condition
MJ_L2: 
	### end of while loop

/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main

