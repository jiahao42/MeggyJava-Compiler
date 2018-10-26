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
	#push Meggy.Button.Down
	ldi r24, 8
	push r24
	pop r25 # get button literal
	### MeggyCheckButton
	call    _Z16CheckButtonsDownv
	lds    r24, Button_Down
	# if button value is zero, push 0 else push 1
	tst    r24 # Test for Zero or Minus
	breq MJ_L7 # goto false branch
MJ_L6: # if true
	ldi r24, 1
	jmp MJ_L8
MJ_L7: # false branch, r24 is already 0, do nothing
MJ_L8: 
	push r24
	#push Meggy.Button.Down
	ldi r24, 8
	push r24
	pop r25 # get button literal
	### MeggyCheckButton
	call    _Z16CheckButtonsDownv
	lds    r24, Button_Down
	# if button value is zero, push 0 else push 1
	tst    r24 # Test for Zero or Minus
	breq MJ_L10 # goto false branch
MJ_L9: # if true
	ldi r24, 1
	jmp MJ_L11
MJ_L10: # false branch, r24 is already 0, do nothing
MJ_L11: 
	push r24
	# load a one byte expression off stack
	pop r18
	# load a one byte expression off stack
	pop r24
	# compare the operands
	cp r24, r18
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
	#push Meggy.Button.Left
	ldi r24, 16
	push r24
	pop r25 # get button literal
	### MeggyCheckButton
	call    _Z16CheckButtonsDownv
	lds    r24, Button_Left
	# if button value is zero, push 0 else push 1
	tst    r24 # Test for Zero or Minus
	breq MJ_L22 # goto false branch
MJ_L21: # if true
	ldi r24, 1
	jmp MJ_L23
MJ_L22: # false branch, r24 is already 0, do nothing
MJ_L23: 
	push r24
	#push Meggy.Button.Up
	ldi r24, 4
	push r24
	pop r25 # get button literal
	### MeggyCheckButton
	call    _Z16CheckButtonsDownv
	lds    r24, Button_Up
	# if button value is zero, push 0 else push 1
	tst    r24 # Test for Zero or Minus
	breq MJ_L25 # goto false branch
MJ_L24: # if true
	ldi r24, 1
	jmp MJ_L26
MJ_L25: # false branch, r24 is already 0, do nothing
MJ_L26: 
	push r24
	# load a one byte expression off stack
	pop r18
	# load a one byte expression off stack
	pop r24
	# compare the operands
	cp r24, r18
	breq MJ_L27 # goto true branch
MJ_L28: # false branch
	ldi r24, 0
	jmp MJ_L29
MJ_L27: # true branch
	ldi r24, 1
MJ_L29: 
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

	jmp MJ_L20 # jump over the else branch

MJ_L19: # else branch
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

MJ_L20: 

/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main

