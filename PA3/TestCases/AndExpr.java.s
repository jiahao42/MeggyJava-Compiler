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


	#### short-circuited && operation
	# &&: left operand
	# start equality check


	# Load constant int 1
	ldi r24,lo8(1)
	ldi r25,hi8(1)
	# push two byte expression onto stack
	push r25
	push r24


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # lower bits
	pop r25 # higher bits
	push r24


	# Load constant int 2
	ldi r24,lo8(2)
	ldi r25,hi8(2)
	# push two byte expression onto stack
	push r25
	push r24


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # lower bits
	pop r25 # higher bits
	push r24


	### Meggy.getPixel(x,y) call
	# load a one byte expression off stack
	pop    r22
	# load a one byte expression off stack
	pop    r24
	call   _Z6ReadPxhh
	# push one byte expression onto stack
	push   r24

	# Color expression Meggy.Color.RED
	ldi r22,1
	# push one byte expression onto stack
	push r22


	# load a one byte expression off stack
	pop r18
	# load a one byte expression off stack
	pop r24
	# compare the operands
	cp r24, r18

	# load a one byte expression off stack
	pop r18
	# load a one byte expression off stack
	pop r24
	cp r24, r18 # examine the result of left expr
	breq MJ_L5
MJ_L6: # if left expr is false
	ldi r24, 0
	jmp MJ_L7
MJ_L5: # if left expr is true
	ldi r24, 1
MJ_L7: # get comparison result
	# push one byte expression onto stack
	push r24 # store result of left expr
	# &&: if left operand is false do not eval right
	# load a one byte expression off stack
	pop r24
	# push one byte expression onto stack
	push r24
	# compare left exp with zero
	ldi r25, 0
	cp r24, r25
	brne MJ_L8 # if the left expr is true, jump to right expr
	jmp MJ_L9
MJ_L8: # right expr
	# start equality check


	# Load constant int 2
	ldi r24,lo8(2)
	ldi r25,hi8(2)
	# push two byte expression onto stack
	push r25
	push r24


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # lower bits
	pop r25 # higher bits
	push r24


	# Load constant int 3
	ldi r24,lo8(3)
	ldi r25,hi8(3)
	# push two byte expression onto stack
	push r25
	push r24


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # lower bits
	pop r25 # higher bits
	push r24


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

MJ_L9: 

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
	# load zero into reg
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
	push r25
	push r24


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # lower bits
	pop r25 # higher bits
	push r24


	# Load constant int 5
	ldi r24,lo8(5)
	ldi r25,hi8(5)
	# push two byte expression onto stack
	push r25
	push r24


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # lower bits
	pop r25 # higher bits
	push r24


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



MJ_L4: # else branch


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main

