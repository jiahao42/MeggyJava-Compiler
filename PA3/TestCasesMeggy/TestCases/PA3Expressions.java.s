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


# start a add operation# start a add operation
	# Load constant int 2
	ldi r24,lo8(2)
	ldi r25,hi8(2)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Load constant int 1
	ldi r24,lo8(1)
	ldi r25,hi8(1)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# load a two byte expression off stack
	pop    r18
	pop    r19
	# load a two byte expression off stack
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

	# load a two byte expression off stack
	pop    r18
	pop    r19
	# load a two byte expression off stack
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
# start a add operation
	# Load constant int 0
	ldi r24,lo8(0)
	ldi r25,hi8(0)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Load constant int 3
	ldi r24,lo8(3)
	ldi r25,hi8(3)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# load a two byte expression off stack
	pop    r18
	pop    r19
	# load a two byte expression off stack
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

	# Load constant int 7
	ldi r24,lo8(7)
	ldi r25,hi8(7)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Load constant int 1
	ldi r24,lo8(1)
	ldi r25,hi8(1)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# load a two byte expression off stack
	pop    r18
	pop    r19
	# load a two byte expression off stack
	pop    r24
	pop    r25
	# Do INT sub operation
	sub    r24, r18
	sbc    r25, r19
	# push hi order byte first
	# push two byte expression onto stack
	push   r25
	push   r24
	# Load constant int 6
	ldi r24,lo8(6)
	ldi r25,hi8(6)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# load a two byte expression off stack
	pop    r18
	pop    r19
	# load a two byte expression off stack
	pop    r24
	pop    r25
	# Do INT sub operation
	sub    r24, r18
	sbc    r25, r19
	# push hi order byte first
	# push two byte expression onto stack
	push   r25
	push   r24
	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Load constant int 9
	ldi r24,lo8(9)
	ldi r25,hi8(9)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Load constant int 5
	ldi r24,lo8(5)
	ldi r25,hi8(5)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# load a two byte expression off stack
	pop    r18
	pop    r19
	# load a two byte expression off stack
	pop    r24
	pop    r25
	# Do INT sub operation
	sub    r24, r18
	sbc    r25, r19
	# push hi order byte first
	# push two byte expression onto stack
	push   r25
	push   r24
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

	### Meggy.setPixel(x,y,color) call
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# load a one byte expression off stack
	pop r24
	call   _Z6DrawPxhhh
	call   _Z12DisplaySlatev
# start a add operation# start a add operation
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
	# load a two byte expression off stack
	pop    r18
	pop    r19
	# load a two byte expression off stack
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

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	ldi r25, 0
	push r25
	push r24
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
	# load a two byte expression off stack
	pop    r18
	pop    r19
	# load a two byte expression off stack
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
# start a add operation# start a add operation
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
	# load a two byte expression off stack
	pop    r18
	pop    r19
	# load a two byte expression off stack
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

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	ldi r25, 0
	push r25
	push r24
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

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	ldi r25, 0
	push r25
	push r24
	# load a two byte expression off stack
	pop    r18
	pop    r19
	# load a two byte expression off stack
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
	# load a two byte expression off stack
	pop    r18
	pop    r19
	# load a two byte expression off stack
	pop    r24
	pop    r25
	# Do INT sub operation
	sub    r24, r18
	sbc    r25, r19
	# push hi order byte first
	# push two byte expression onto stack
	push   r25
	push   r24
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
	# load a two byte expression off stack
	pop    r18
	pop    r19
	# load a two byte expression off stack
	pop    r24
	pop    r25
	# Do INT sub operation
	sub    r24, r18
	sbc    r25, r19
	# push hi order byte first
	# push two byte expression onto stack
	push   r25
	push   r24
	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 
# start a add operation
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

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	ldi r25, 0
	push r25
	push r24
	# load a two byte expression off stack
	pop    r18
	pop    r19
	# load a two byte expression off stack
	pop    r24
	pop    r25
	# Do INT sub operation
	sub    r24, r18
	sbc    r25, r19
	# push hi order byte first
	# push two byte expression onto stack
	push   r25
	push   r24
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

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	ldi r25, 0
	push r25
	push r24
	# load a two byte expression off stack
	pop    r18
	pop    r19
	# load a two byte expression off stack
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
# start a add operation# start a add operation
	# Load constant int 2
	ldi r24,lo8(2)
	ldi r25,hi8(2)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Load constant int 1
	ldi r24,lo8(1)
	ldi r25,hi8(1)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# load a two byte expression off stack
	pop    r18
	pop    r19
	# load a two byte expression off stack
	pop    r24
	pop    r25
	# Do add operation
	add    r24, r18
	adc    r25, r19
	# push two byte expression onto stack
	push   r25
	push   r24
	# neg int
	# load a two byte expression off stack
	pop r24
	pop r25
	ldi r22, 0
	ldi r23, 0
	sub r22, r24
	sbc r23, r25
	# push two byte expression back to stack
	push r23
	push r22
	# Load constant int 8
	ldi r24,lo8(8)
	ldi r25,hi8(8)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# load a two byte expression off stack
	pop    r18
	pop    r19
	# load a two byte expression off stack
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
	pop r24
	pop r25
	ldi r22, 0
	ldi r23, 0
	sub r22, r24
	sbc r23, r25
	# push two byte expression back to stack
	push r23
	push r22
	# load a two byte expression off stack
	pop    r18
	pop    r19
	# load a two byte expression off stack
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

	# Color expression Meggy.Color.DARK
	ldi r22,0
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

	# Load constant int 0
	ldi r24,lo8(0)
	ldi r25,hi8(0)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Load constant int 6
	ldi r24,lo8(6)
	ldi r25,hi8(6)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# neg int
	# load a two byte expression off stack
	pop r24
	pop r25
	ldi r22, 0
	ldi r23, 0
	sub r22, r24
	sbc r23, r25
	# push two byte expression back to stack
	push r23
	push r22
	# neg int
	# load a two byte expression off stack
	pop r24
	pop r25
	ldi r22, 0
	ldi r23, 0
	sub r22, r24
	sbc r23, r25
	# push two byte expression back to stack
	push r23
	push r22
	# load a two byte expression off stack
	pop    r18
	pop    r19
	# load a two byte expression off stack
	pop    r24
	pop    r25
	# Do INT sub operation
	sub    r24, r18
	sbc    r25, r19
	# push hi order byte first
	# push two byte expression onto stack
	push   r25
	push   r24
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
	pop r24
	pop r25
	ldi r22, 0
	ldi r23, 0
	sub r22, r24
	sbc r23, r25
	# push two byte expression back to stack
	push r23
	push r22
	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Do Mul Operation
	pop r24
	pop r25
	muls r24, r25
	push r24
	push r25
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
	pop r24
	pop r25
	ldi r22, 0
	ldi r23, 0
	sub r22, r24
	sbc r23, r25
	# push two byte expression back to stack
	push r23
	push r22
	# load a two byte expression off stack
	pop    r18
	pop    r19
	# load a two byte expression off stack
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

	# Color expression Meggy.Color.ORANGE
	ldi r22,2
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
	# load a two byte expression off stack
	pop    r18
	pop    r19
	# load a two byte expression off stack
	pop    r24
	pop    r25
	# Do INT sub operation
	sub    r24, r18
	sbc    r25, r19
	# push hi order byte first
	# push two byte expression onto stack
	push   r25
	push   r24
	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 
# start a add operation
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
	# Load constant int 7
	ldi r24,lo8(7)
	ldi r25,hi8(7)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# load a two byte expression off stack
	pop    r18
	pop    r19
	# load a two byte expression off stack
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

	# Do Mul Operation
	pop r24
	pop r25
	muls r24, r25
	push r24
	push r25
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


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main

