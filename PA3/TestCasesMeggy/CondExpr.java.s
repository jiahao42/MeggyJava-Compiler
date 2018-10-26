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
	# Load constant int 1
	ldi r24,lo8(1)
	ldi r25,hi8(1)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Load constant int 3
	ldi r24,lo8(3)
	ldi r25,hi8(3)
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
	# load a one byte expression off stack
	pop r18
	# load a one byte expression off stack
	pop r24
	# compare the operands
	cp r24, r18
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
	# Load constant int 0
	ldi r24,lo8(0)
	ldi r25,hi8(0)
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
	# Load constant int 0
	ldi r24,lo8(0)
	ldi r25,hi8(0)
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

	# start a add operation
	# Load constant int 10
	ldi r24,lo8(10)
	ldi r25,hi8(10)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

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


	# neg byte
	# load a one byte expression off stack
	pop r24
	# promoting a byte to an int
	tst r24
	brlt MJ_L19
	ldi r25, 0
	jmp MJ_L20
MJ_L19: 
	ldi r25, hi8(-1)
MJ_L20: 
	ldi r22, 0
	ldi r23, 0
	sub r22, r24
	sbc r23, r25
	# pushtwo byte expression onto stack
	push r23
	push r22

	# neg byte
	# load a one byte expression off stack
	pop r24
	# promoting a byte to an int
	tst r24
	brlt MJ_L21
	ldi r25, 0
	jmp MJ_L22
MJ_L21: 
	ldi r25, hi8(-1)
MJ_L22: 
	ldi r22, 0
	ldi r23, 0
	sub r22, r24
	sbc r23, r25
	# pushtwo byte expression onto stack
	push r23
	push r22
	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	ldi r25, 0
	push r25
	push r24
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
	# load a one byte expression off stack
	pop r18
	# load a one byte expression off stack
	pop r24
	# compare the operands
	cp r24, r18
	breq MJ_L23 # goto true branch
MJ_L24: # false branch
	ldi r24, 0
	jmp MJ_L25
MJ_L23: # true branch
	ldi r24, 1
MJ_L25: 
	push r24 # push the result on stack
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L11

MJ_L12: # false branch
	ldi r24, 0
	jmp MJ_L13

MJ_L11: # true branch
	ldi r24, 1

MJ_L13: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L14
	jmp MJ_L15

MJ_L14: # then branch
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

	jmp MJ_L16 # jump over the else branch

MJ_L15: # else branch
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

MJ_L16: 
#### if statement
	# start equality check
	# Load constant int 4
	ldi r24,lo8(4)
	ldi r25,hi8(4)
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

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	ldi r25, 0
	push r25
	push r24
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
	# load a one byte expression off stack
	pop r18
	# load a one byte expression off stack
	pop r24
	# compare the operands
	cp r24, r18
	breq MJ_L34 # goto true branch
MJ_L35: # false branch
	ldi r24, 0
	jmp MJ_L36
MJ_L34: # true branch
	ldi r24, 1
MJ_L36: 
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

	jmp MJ_L31 # jump over the else branch

MJ_L30: # else branch
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

MJ_L31: 
#### if statement
	# start equality check
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

	# load a one byte expression off stack
	pop r18
	# load a one byte expression off stack
	pop r24
	# compare the operands
	cp r24, r18
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
	breq MJ_L37

MJ_L38: # false branch
	ldi r24, 0
	jmp MJ_L39

MJ_L37: # true branch
	ldi r24, 1

MJ_L39: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L40
	jmp MJ_L41

MJ_L40: # then branch
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

	jmp MJ_L42 # jump over the else branch

MJ_L41: # else branch
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

MJ_L42: 
#### if statement
	# start equality check
	# start a add operation
	# Load constant int 512
	ldi r24,lo8(512)
	ldi r25,hi8(512)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Load constant int 512
	ldi r24,lo8(512)
	ldi r25,hi8(512)
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
	# Load constant int 1024
	ldi r24,lo8(1024)
	ldi r25,hi8(1024)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# load a one byte expression off stack
	pop r18
	# load a one byte expression off stack
	pop r24
	# compare the operands
	cp r24, r18
	breq MJ_L56 # goto true branch
MJ_L57: # false branch
	ldi r24, 0
	jmp MJ_L58
MJ_L56: # true branch
	ldi r24, 1
MJ_L58: 
	push r24 # push the result on stack
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L50

MJ_L51: # false branch
	ldi r24, 0
	jmp MJ_L52

MJ_L50: # true branch
	ldi r24, 1

MJ_L52: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L53
	jmp MJ_L54

MJ_L53: # then branch
	# Load constant int 0
	ldi r24,lo8(0)
	ldi r25,hi8(0)
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

	jmp MJ_L55 # jump over the else branch

MJ_L54: # else branch
	# Load constant int 0
	ldi r24,lo8(0)
	ldi r25,hi8(0)
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

	### Meggy.setPixel(x,y,color) call
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# load a one byte expression off stack
	pop r24
	call   _Z6DrawPxhhh
	call   _Z12DisplaySlatev

MJ_L55: 
#### if statement
	# start equality check
	# start a add operation
	# Load constant int 3
	ldi r24,lo8(3)
	ldi r25,hi8(3)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

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
	ldi r25, 0
	push r25
	push r24
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
	# Load constant int 5
	ldi r24,lo8(5)
	ldi r25,hi8(5)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# load a one byte expression off stack
	pop r18
	# load a one byte expression off stack
	pop r24
	# compare the operands
	cp r24, r18
	breq MJ_L65 # goto true branch
MJ_L66: # false branch
	ldi r24, 0
	jmp MJ_L67
MJ_L65: # true branch
	ldi r24, 1
MJ_L67: 
	push r24 # push the result on stack
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L59

MJ_L60: # false branch
	ldi r24, 0
	jmp MJ_L61

MJ_L59: # true branch
	ldi r24, 1

MJ_L61: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L62
	jmp MJ_L63

MJ_L62: # then branch
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

	jmp MJ_L64 # jump over the else branch

MJ_L63: # else branch
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

	### Meggy.setPixel(x,y,color) call
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# load a one byte expression off stack
	pop r24
	call   _Z6DrawPxhhh
	call   _Z12DisplaySlatev

MJ_L64: 
#### if statement
	# start equality check
	# start a add operation
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

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	ldi r25, 0
	push r25
	push r24
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
	# Load constant int 5
	ldi r24,lo8(5)
	ldi r25,hi8(5)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# load a one byte expression off stack
	pop r18
	# load a one byte expression off stack
	pop r24
	# compare the operands
	cp r24, r18
	breq MJ_L74 # goto true branch
MJ_L75: # false branch
	ldi r24, 0
	jmp MJ_L76
MJ_L74: # true branch
	ldi r24, 1
MJ_L76: 
	push r24 # push the result on stack
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L68

MJ_L69: # false branch
	ldi r24, 0
	jmp MJ_L70

MJ_L68: # true branch
	ldi r24, 1

MJ_L70: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L71
	jmp MJ_L72

MJ_L71: # then branch
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

	jmp MJ_L73 # jump over the else branch

MJ_L72: # else branch
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

	### Meggy.setPixel(x,y,color) call
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# load a one byte expression off stack
	pop r24
	call   _Z6DrawPxhhh
	call   _Z12DisplaySlatev

MJ_L73: 
#### if statement
	# start equality check
	# start a add operation
	# Load constant int 3
	ldi r24,lo8(3)
	ldi r25,hi8(3)
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

	# load a one byte expression off stack
	pop r18
	# load a one byte expression off stack
	pop r24
	# compare the operands
	cp r24, r18
	breq MJ_L83 # goto true branch
MJ_L84: # false branch
	ldi r24, 0
	jmp MJ_L85
MJ_L83: # true branch
	ldi r24, 1
MJ_L85: 
	push r24 # push the result on stack
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L77

MJ_L78: # false branch
	ldi r24, 0
	jmp MJ_L79

MJ_L77: # true branch
	ldi r24, 1

MJ_L79: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L80
	jmp MJ_L81

MJ_L80: # then branch
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

	jmp MJ_L82 # jump over the else branch

MJ_L81: # else branch
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

MJ_L82: 
#### if statement
	# start equality check
	# Load constant int 0
	ldi r24,lo8(0)
	ldi r25,hi8(0)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Load constant int 512
	ldi r24,lo8(512)
	ldi r25,hi8(512)
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
	# Load constant int 512
	ldi r24,lo8(512)
	ldi r25,hi8(512)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Load constant int 1024
	ldi r24,lo8(1024)
	ldi r25,hi8(1024)
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
	# load a one byte expression off stack
	pop r18
	# load a one byte expression off stack
	pop r24
	# compare the operands
	cp r24, r18
	breq MJ_L92 # goto true branch
MJ_L93: # false branch
	ldi r24, 0
	jmp MJ_L94
MJ_L92: # true branch
	ldi r24, 1
MJ_L94: 
	push r24 # push the result on stack
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L86

MJ_L87: # false branch
	ldi r24, 0
	jmp MJ_L88

MJ_L86: # true branch
	ldi r24, 1

MJ_L88: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L89
	jmp MJ_L90

MJ_L89: # then branch
	# Load constant int 0
	ldi r24,lo8(0)
	ldi r25,hi8(0)
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

	jmp MJ_L91 # jump over the else branch

MJ_L90: # else branch
	# Load constant int 0
	ldi r24,lo8(0)
	ldi r25,hi8(0)
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

MJ_L91: 
#### if statement
	# start equality check
	# Load constant int 0
	ldi r24,lo8(0)
	ldi r25,hi8(0)
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
	ldi r25, 0
	push r25
	push r24
	# Load constant int 32
	ldi r24,lo8(32)
	ldi r25,hi8(32)
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
	# Load constant int 512
	ldi r24,lo8(512)
	ldi r25,hi8(512)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Load constant int 544
	ldi r24,lo8(544)
	ldi r25,hi8(544)
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
	# load a one byte expression off stack
	pop r18
	# load a one byte expression off stack
	pop r24
	# compare the operands
	cp r24, r18
	breq MJ_L101 # goto true branch
MJ_L102: # false branch
	ldi r24, 0
	jmp MJ_L103
MJ_L101: # true branch
	ldi r24, 1
MJ_L103: 
	push r24 # push the result on stack
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L95

MJ_L96: # false branch
	ldi r24, 0
	jmp MJ_L97

MJ_L95: # true branch
	ldi r24, 1

MJ_L97: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L98
	jmp MJ_L99

MJ_L98: # then branch
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

	jmp MJ_L100 # jump over the else branch

MJ_L99: # else branch
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

MJ_L100: 
#### if statement
	# start equality check
	# Load constant int 0
	ldi r24,lo8(0)
	ldi r25,hi8(0)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Load constant int 32
	ldi r24,lo8(32)
	ldi r25,hi8(32)
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
	ldi r25, 0
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
	sub    r24, r18
	sbc    r25, r19
	# push two byte expression onto stack
	push   r25 # higher bits
	push   r24 # lower bits
	# Load constant int 512
	ldi r24,lo8(512)
	ldi r25,hi8(512)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Load constant int 544
	ldi r24,lo8(544)
	ldi r25,hi8(544)
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
	# load a one byte expression off stack
	pop r18
	# load a one byte expression off stack
	pop r24
	# compare the operands
	cp r24, r18
	breq MJ_L110 # goto true branch
MJ_L111: # false branch
	ldi r24, 0
	jmp MJ_L112
MJ_L110: # true branch
	ldi r24, 1
MJ_L112: 
	push r24 # push the result on stack
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L104

MJ_L105: # false branch
	ldi r24, 0
	jmp MJ_L106

MJ_L104: # true branch
	ldi r24, 1

MJ_L106: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L107
	jmp MJ_L108

MJ_L107: # then branch
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

	jmp MJ_L109 # jump over the else branch

MJ_L108: # else branch
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

MJ_L109: 
#### if statement
	# start equality check
	# Load constant int 0
	ldi r24,lo8(0)
	ldi r25,hi8(0)
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
	ldi r25, 0
	push r25
	push r24
	# Load constant int 32
	ldi r24,lo8(32)
	ldi r25,hi8(32)
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
	ldi r25, 0
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

	# Load constant int 512
	ldi r24,lo8(512)
	ldi r25,hi8(512)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Load constant int 544
	ldi r24,lo8(544)
	ldi r25,hi8(544)
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

	# load a one byte expression off stack
	pop r18
	# load a one byte expression off stack
	pop r24
	# compare the operands
	cp r24, r18
	breq MJ_L119 # goto true branch
MJ_L120: # false branch
	ldi r24, 0
	jmp MJ_L121
MJ_L119: # true branch
	ldi r24, 1
MJ_L121: 
	push r24 # push the result on stack
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L113

MJ_L114: # false branch
	ldi r24, 0
	jmp MJ_L115

MJ_L113: # true branch
	ldi r24, 1

MJ_L115: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L116
	jmp MJ_L117

MJ_L116: # then branch
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

	jmp MJ_L118 # jump over the else branch

MJ_L117: # else branch
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

MJ_L118: 
#### if statement
	# start equality check
	# Load constant int 32
	ldi r24,lo8(32)
	ldi r25,hi8(32)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Load constant int 32
	ldi r24,lo8(32)
	ldi r25,hi8(32)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# load a one byte expression off stack
	pop r18
	# load a one byte expression off stack
	pop r24
	# compare the operands
	cp r24, r18
	breq MJ_L128 # goto true branch
MJ_L129: # false branch
	ldi r24, 0
	jmp MJ_L130
MJ_L128: # true branch
	ldi r24, 1
MJ_L130: 
	push r24 # push the result on stack
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L122

MJ_L123: # false branch
	ldi r24, 0
	jmp MJ_L124

MJ_L122: # true branch
	ldi r24, 1

MJ_L124: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L125
	jmp MJ_L126

MJ_L125: # then branch
	# Load constant int 0
	ldi r24,lo8(0)
	ldi r25,hi8(0)
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

	jmp MJ_L127 # jump over the else branch

MJ_L126: # else branch
	# Load constant int 0
	ldi r24,lo8(0)
	ldi r25,hi8(0)
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

MJ_L127: 
#### if statement
	# start equality check
	# Load constant int 32
	ldi r24,lo8(32)
	ldi r25,hi8(32)
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
	# Load constant int 32
	ldi r24,lo8(32)
	ldi r25,hi8(32)
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

	# load a one byte expression off stack
	pop r18
	# load a one byte expression off stack
	pop r24
	# compare the operands
	cp r24, r18
	breq MJ_L141 # goto true branch
MJ_L142: # false branch
	ldi r24, 0
	jmp MJ_L143
MJ_L141: # true branch
	ldi r24, 1
MJ_L143: 
	push r24 # push the result on stack
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L131

MJ_L132: # false branch
	ldi r24, 0
	jmp MJ_L133

MJ_L131: # true branch
	ldi r24, 1

MJ_L133: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L134
	jmp MJ_L135

MJ_L134: # then branch
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

	jmp MJ_L136 # jump over the else branch

MJ_L135: # else branch
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

MJ_L136: 
#### if statement
	# start equality check
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

	# load a one byte expression off stack
	pop r18
	# load a one byte expression off stack
	pop r24
	# compare the operands
	cp r24, r18
	breq MJ_L150 # goto true branch
MJ_L151: # false branch
	ldi r24, 0
	jmp MJ_L152
MJ_L150: # true branch
	ldi r24, 1
MJ_L152: 
	push r24 # push the result on stack
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L144

MJ_L145: # false branch
	ldi r24, 0
	jmp MJ_L146

MJ_L144: # true branch
	ldi r24, 1

MJ_L146: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L147
	jmp MJ_L148

MJ_L147: # then branch
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

	jmp MJ_L149 # jump over the else branch

MJ_L148: # else branch
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

MJ_L149: 
#### if statement
	#push Meggy.Button.A
	ldi r24, 2
	push r24
	pop r25 # get button literal
	### MeggyCheckButton
	call    _Z16CheckButtonsDownv
	lds    r24, Button_A
	# if button value is zero, push 0 else push 1
	tst    r24 # Test for Zero or Minus
	breq MJ_L160 # goto false branch
MJ_L159: # if true
	ldi r24, 1
	jmp MJ_L161
MJ_L160: # false branch, r24 is already 0, do nothing
MJ_L161: 
	push r24
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L153

MJ_L154: # false branch
	ldi r24, 0
	jmp MJ_L155

MJ_L153: # true branch
	ldi r24, 1

MJ_L155: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L156
	jmp MJ_L157

MJ_L156: # then branch
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

	jmp MJ_L158 # jump over the else branch

MJ_L157: # else branch
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

MJ_L158: 

/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main

