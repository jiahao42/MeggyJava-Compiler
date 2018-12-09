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
	ldi r24, lo8(6)
	ldi r25, hi8(6)
	# allocating object of size 0 on heap
	call malloc
	# push object address
	# push two byte expression onto stack
	push r25
	push r24
	# Load constant int 5
	ldi r24, lo8(5)
	ldi r25, hi8(5)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# True/1 expression
	ldi r22, lo8(1)
	# push one byte expression onto stack
	push r22
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
	pop r18
	# load a one byte expression off stack
	pop r20
	# load a two bytes expression off stack
	pop r22
	pop r23
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call RandomTest_func

/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main


	.text
.global RandomTest_func
	.type RandomTest_func, @function
RandomTest_func:
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
	std Y + 4, r23
	std Y + 3, r22
	std Y + 5, r20
	std Y + 6, r18
	/* done with function RandomTest_func prologue */



	### AssignStatement
	# eval rhs exp
	# IdExp
	# load value for variable aa
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24
	# load rhs exp
	pop r24
	pop r25
	# loading the implicit "this"
	ldd r31, Y + 2
	ldd r30, Y + 1
	# store rhs into var a
	std Z + 1, r25
	std Z + 0, r24

	### AssignStatement
	# eval rhs exp
	# IdExp
	# load value for variable bb
	# load a one byte variable from base+offset
	ldd r24, Y + 6
	# push one byte expression onto stack
	push r24
	# load rhs exp
	pop r24
	# loading the implicit "this"
	ldd r31, Y + 2
	ldd r30, Y + 1
	# store rhs into var b
	std Z + 2, r24

	### AssignStatement
	# eval rhs exp
	# IdExp
	# load value for variable cc
	# load a one byte variable from base+offset
	ldd r24, Y + 5
	# push one byte expression onto stack
	push r24
	# load rhs exp
	pop r24
	# loading the implicit "this"
	ldd r31, Y + 2
	ldd r30, Y + 1
	# store rhs into var c
	std Z + 3, r24
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# IdExp
	# load value for variable a
	# loading the implicit "this"
	ldd    r31, Y + 2
	ldd    r30, Y + 1
	# load a two byte variable from base+offset
	ldd r25, Z + 1
	ldd r24, Z + 0
	# push two byte expression onto stack
	push r25
	push r24

	#### function call
	# put parameter values into appropriate registers
	# load a two bytes expression off stack
	pop r22
	pop r23
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call RandomTest_recursive
	# Load constant int 0
	ldi r24, lo8(0)
	ldi r25, hi8(0)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	/* epilogue start for RandomTest_func */
	# handle return value
	# load a two byte expression off stack
	pop r24
	pop r25
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
	.size RandomTest_func, .-RandomTest_func


	.text
.global RandomTest_recursive
	.type RandomTest_recursive, @function
RandomTest_recursive:
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
	std Y + 4, r23
	std Y + 3, r22
	/* done with function RandomTest_recursive prologue */



	### AssignStatement
	# eval rhs exp
	# IdExp
	# load value for variable a
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24
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
	# load rhs exp
	pop r24
	pop r25
	# store rhs into var a
	std Y + 4, r25
	std Y + 3, r24
	#### if statement
	# IdExp
	# load value for variable a
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24
	# Load constant int 0
	ldi r24, lo8(0)
	ldi r25, hi8(0)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# less than expression
	# load a two byte expression off stack
	pop r18
	pop r19
	# load a two byte expression off stack
	pop r24
	pop r25
	cp r24, r18
	cpc r25, r19
	brlt MJ_L6
MJ_L7: # load false
	ldi r24, 0
	jmp MJ_L8
MJ_L6: # load true
	ldi r24, 1
MJ_L8: 
	push r24 # push the result of less than
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
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# IdExp
	# load value for variable a
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24

	#### function call
	# put parameter values into appropriate registers
	# load a two bytes expression off stack
	pop r22
	pop r23
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call RandomTest_recursive
	jmp MJ_L5 # jump over the else branch

MJ_L4: # else branch
MJ_L5: 
	/* epilogue start for RandomTest_recursive */
	# handle return value
	# no return value
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	pop r30
	pop r30
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size RandomTest_recursive, .-RandomTest_recursive

