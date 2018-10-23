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


	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop    r24
	pop    r25
	call   _Z8delay_msj

	# Load constant int 10
	ldi r24,lo8(10)
	ldi r25,hi8(10)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop    r24
	pop    r25
	call   _Z8delay_msj

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

	# Load constant int 1000
	ldi r24,lo8(1000)
	ldi r25,hi8(1000)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop    r24
	pop    r25
	call   _Z8delay_msj

	# Load constant int 10000
	ldi r24,lo8(10000)
	ldi r25,hi8(10000)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop    r24
	pop    r25
	call   _Z8delay_msj

	# Load constant int 99
	ldi r24,lo8(99)
	ldi r25,hi8(99)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop    r24
	pop    r25
	call   _Z8delay_msj


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main

