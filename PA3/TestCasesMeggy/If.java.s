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


	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L9
	ldi r25, 0
	jmp MJ_L10
MJ_L9: 
	ldi r25, hi8(-1)
MJ_L10: 
	push r25
	push r24
	# right operand of ==
	pop r18
	pop r19

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
	# left operand of ==
	pop r24
	pop r25
	# compare the operands
	cp    r24, r18
	cpc   r25, r19
	breq MJ_L6 # goto true branch
MJ_L7: # false branch
	ldi r24, 0
	jmp MJ_L8
MJ_L6: # true branch
	ldi r24, 1
MJ_L8: 
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

	jmp MJ_L5 # jump over the else branch

MJ_L4: # else branch
MJ_L5: 
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


	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L22
	ldi r25, 0
	jmp MJ_L23
MJ_L22: 
	ldi r25, hi8(-1)
MJ_L23: 
	push r25
	push r24
	# right operand of ==
	pop r18
	pop r19

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L24
	ldi r25, 0
	jmp MJ_L25
MJ_L24: 
	ldi r25, hi8(-1)
MJ_L25: 
	push r25
	push r24
	# left operand of ==
	pop r24
	pop r25
	# compare the operands
	cp    r24, r18
	cpc   r25, r19
	breq MJ_L19 # goto true branch
MJ_L20: # false branch
	ldi r24, 0
	jmp MJ_L21
MJ_L19: # true branch
	ldi r24, 1
MJ_L21: 
	push r24 # push the result on stack
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L13

MJ_L14: # false branch
	ldi r24, 0
	jmp MJ_L15

MJ_L13: # true branch
	ldi r24, 1

MJ_L15: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L16
	jmp MJ_L17

MJ_L16: # then branch
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

	jmp MJ_L18 # jump over the else branch

MJ_L17: # else branch
MJ_L18: 
#### if statement
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
	brlt MJ_L35
	ldi r25, 0
	jmp MJ_L36
MJ_L35: 
	ldi r25, hi8(-1)
MJ_L36: 
	push r25
	push r24
	# right operand of ==
	pop r18
	pop r19

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
	# left operand of ==
	pop r24
	pop r25
	# compare the operands
	cp    r24, r18
	cpc   r25, r19
	breq MJ_L32 # goto true branch
MJ_L33: # false branch
	ldi r24, 0
	jmp MJ_L34
MJ_L32: # true branch
	ldi r24, 1
MJ_L34: 
	push r24 # push the result on stack
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L26

MJ_L27: # false branch
	ldi r24, 0
	jmp MJ_L28

MJ_L26: # true branch
	ldi r24, 1

MJ_L28: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L29
	jmp MJ_L30

MJ_L29: # then branch
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

	jmp MJ_L31 # jump over the else branch

MJ_L30: # else branch
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

MJ_L31: 
#### if statement
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
	brlt MJ_L48
	ldi r25, 0
	jmp MJ_L49
MJ_L48: 
	ldi r25, hi8(-1)
MJ_L49: 
	push r25
	push r24
	# right operand of ==
	pop r18
	pop r19

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
	# left operand of ==
	pop r24
	pop r25
	# compare the operands
	cp    r24, r18
	cpc   r25, r19
	breq MJ_L45 # goto true branch
MJ_L46: # false branch
	ldi r24, 0
	jmp MJ_L47
MJ_L45: # true branch
	ldi r24, 1
MJ_L47: 
	push r24 # push the result on stack
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L39

MJ_L40: # false branch
	ldi r24, 0
	jmp MJ_L41

MJ_L39: # true branch
	ldi r24, 1

MJ_L41: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L42
	jmp MJ_L43

MJ_L42: # then branch
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

	jmp MJ_L44 # jump over the else branch

MJ_L43: # else branch
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

MJ_L44: 

/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main

