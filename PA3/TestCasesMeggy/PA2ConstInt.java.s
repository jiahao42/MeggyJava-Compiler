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


	# Load constant int 2
	ldi r24,lo8(2)
	ldi r25,hi8(2)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


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


	# Load constant int 2
	ldi r24,lo8(2)
	ldi r25,hi8(2)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Load constant int 3
	ldi r24,lo8(3)
	ldi r25,hi8(3)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


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


	# Load constant int 3
	ldi r24,lo8(3)
	ldi r25,hi8(3)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Load constant int 4
	ldi r24,lo8(4)
	ldi r25,hi8(4)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


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



/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main
