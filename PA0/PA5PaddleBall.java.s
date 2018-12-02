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
    ldi    r24, lo8(0)
    ldi    r25, hi8(0)
    # allocating object of size 0 on heap
    call    malloc
    # push object address
    # push two byte expression onto stack
    push   r25
    push   r24

    #### function call
    # put parameter values into appropriate registers
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    PaddleBallBoard_run


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main



    .text
.global PaddleBallBoard_run
    .type  PaddleBallBoard_run, @function
PaddleBallBoard_run:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
    push   r30
    push   r30
    push   r30
    push   r30
    push   r30
    push   r30

    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__

    # save off parameters
    std    Y + 2, r25
    std    Y + 1, r24
/* done with function PaddleBallBoard_run prologue */


    # NewExp
    ldi    r24, lo8(5)
    ldi    r25, hi8(5)
    # allocating object of size 5 on heap
    call    malloc
    # push object address
    # push two byte expression onto stack
    push   r25
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a two byte expression off stack
    pop    r24
    pop    r25
    # store rhs into var b
    std    Y + 4, r25
    std    Y + 3, r24

    # IdExp
    # load value for variable b
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 4
    ldd    r24, Y + 3
    # push two byte expression onto stack
    push   r25
    push   r24

    #### function call
    # put parameter values into appropriate registers
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    Ball_init

    # NewExp
    ldi    r24, lo8(2)
    ldi    r25, hi8(2)
    # allocating object of size 2 on heap
    call    malloc
    # push object address
    # push two byte expression onto stack
    push   r25
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a two byte expression off stack
    pop    r24
    pop    r25
    # store rhs into var p
    std    Y + 6, r25
    std    Y + 5, r24

    # IdExp
    # load value for variable p
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 6
    ldd    r24, Y + 5
    # push two byte expression onto stack
    push   r25
    push   r24

    #### function call
    # put parameter values into appropriate registers
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    Paddle_init

    #### while statement
MJ_L0:

    # True/1 expression
    ldi    r22, 1
    # push one byte expression onto stack
    push   r22

    # if not(condition)
    # load a one byte expression off stack
    pop    r24
    ldi    r25,0
    cp     r24, r25
    # WANT breq MJ_L2
    brne   MJ_L1
    jmp    MJ_L2

    # while loop body
MJ_L1:

    #### if statement

    ### MeggyCheckButton
    call    _Z16CheckButtonsDownv
    lds    r24, Button_Left
    # if button value is zero, push 0 else push 1
    tst    r24
    breq   MJ_L6
MJ_L7:
    ldi    r24, 1
    jmp    MJ_L8
MJ_L6:
MJ_L8:
    # push one byte expression onto stack
    push   r24

    # load condition and branch if false
    # load a one byte expression off stack
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L3
    brne   MJ_L4
    jmp    MJ_L3

    # then label for if
MJ_L4:

    # IdExp
    # load value for variable p
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 6
    ldd    r24, Y + 5
    # push two byte expression onto stack
    push   r25
    push   r24

    #### function call
    # put parameter values into appropriate registers
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    Paddle_moveLeft
    jmp    MJ_L5

    # else label for if
MJ_L3:

    #### if statement

    ### MeggyCheckButton
    call    _Z16CheckButtonsDownv
    lds    r24, Button_Right
    # if button value is zero, push 0 else push 1
    tst    r24
    breq   MJ_L12
MJ_L13:
    ldi    r24, 1
    jmp    MJ_L14
MJ_L12:
MJ_L14:
    # push one byte expression onto stack
    push   r24

    # load condition and branch if false
    # load a one byte expression off stack
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L9
    brne   MJ_L10
    jmp    MJ_L9

    # then label for if
MJ_L10:

    # IdExp
    # load value for variable p
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 6
    ldd    r24, Y + 5
    # push two byte expression onto stack
    push   r25
    push   r24

    #### function call
    # put parameter values into appropriate registers
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    Paddle_moveRight
    jmp    MJ_L11

    # else label for if
MJ_L9:

    # done label for if
MJ_L11:

    # done label for if
MJ_L5:

    # IdExp
    # load value for variable b
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 4
    ldd    r24, Y + 3
    # push two byte expression onto stack
    push   r25
    push   r24

    #### function call
    # put parameter values into appropriate registers
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    Ball_move

    # Load constant int 256
    ldi    r24,lo8(256)
    ldi    r25,hi8(256)
    # push two byte expression onto stack
    push   r25
    push   r24

    ### Meggy.delay() call
    # load delay parameter
    # load a two byte expression off stack
    pop    r24
    pop    r25
    call   _Z8delay_msj

    # jump to while test
    jmp    MJ_L0

    # end of while
MJ_L2:

/* epilogue start for PaddleBallBoard_run */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size PaddleBallBoard_run, .-PaddleBallBoard_run


    .text
.global Paddle_init
    .type  Paddle_init, @function
Paddle_init:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
    push   r30
    push   r30

    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__

    # save off parameters
    std    Y + 2, r25
    std    Y + 1, r24
/* done with function Paddle_init prologue */


    # Load constant int 4
    ldi    r24,lo8(4)
    ldi    r25,hi8(4)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var centerX
    std    Z + 0, r24

    # Color expression Meggy.Color.BLUE
    ldi    r22,5
    # push one byte expression onto stack
    push   r22

    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var color
    std    Z + 1, r24


    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

    # IdExp
    # load value for variable centerX

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 0
    # push one byte expression onto stack
    push   r24

    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    Paddle_drawPaddle

/* epilogue start for Paddle_init */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size Paddle_init, .-Paddle_init


    .text
.global Paddle_drawPaddle
    .type  Paddle_drawPaddle, @function
Paddle_drawPaddle:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
    push   r30
    push   r30
    push   r30

    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__

    # save off parameters
    std    Y + 2, r25
    std    Y + 1, r24
    std    Y + 3, r22
/* done with function Paddle_drawPaddle prologue */


    # IdExp
    # load value for variable x
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24

    # Load constant int 1
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L15
    ldi    r25, 0
    jmp    MJ_L16
MJ_L15:
    ldi    r25, hi8(-1)
MJ_L16:
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L17
    ldi    r19, 0
    jmp    MJ_L18
MJ_L17:
    ldi    r19, hi8(-1)
MJ_L18:

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
    pop    r24
    pop    r25
    push   r24

    # Load constant int 0
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for variable color

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 1
    # push one byte expression onto stack
    push   r24

    ### Meggy.setPixel(x,y,color) call
    # load a one byte expression off stack
    pop    r20
    # load a one byte expression off stack
    pop    r22
    # load a one byte expression off stack
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

    # IdExp
    # load value for variable x
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24

    # Load constant int 0
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for variable color

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 1
    # push one byte expression onto stack
    push   r24

    ### Meggy.setPixel(x,y,color) call
    # load a one byte expression off stack
    pop    r20
    # load a one byte expression off stack
    pop    r22
    # load a one byte expression off stack
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

    # IdExp
    # load value for variable x
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24

    # Load constant int 1
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L19
    ldi    r25, 0
    jmp    MJ_L20
MJ_L19:
    ldi    r25, hi8(-1)
MJ_L20:
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L21
    ldi    r19, 0
    jmp    MJ_L22
MJ_L21:
    ldi    r19, hi8(-1)
MJ_L22:

    # Do add operation
    add    r24, r18
    adc    r25, r19
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Load constant int 0
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for variable color

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 1
    # push one byte expression onto stack
    push   r24

    ### Meggy.setPixel(x,y,color) call
    # load a one byte expression off stack
    pop    r20
    # load a one byte expression off stack
    pop    r22
    # load a one byte expression off stack
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

/* epilogue start for Paddle_drawPaddle */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size Paddle_drawPaddle, .-Paddle_drawPaddle


    .text
.global Paddle_moveLeft
    .type  Paddle_moveLeft, @function
Paddle_moveLeft:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
    push   r30
    push   r30

    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__

    # save off parameters
    std    Y + 2, r25
    std    Y + 1, r24
/* done with function Paddle_moveLeft prologue */


    #### if statement


    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

    # IdExp
    # load value for variable centerX

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 0
    # push one byte expression onto stack
    push   r24

    # Load constant int 2
    ldi    r24,lo8(2)
    ldi    r25,hi8(2)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L26
    ldi    r25, 0
    jmp    MJ_L27
MJ_L26:
    ldi    r25, hi8(-1)
MJ_L27:
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L28
    ldi    r19, 0
    jmp    MJ_L29
MJ_L28:
    ldi    r19, hi8(-1)
MJ_L29:

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
    pop    r24
    pop    r25
    push   r24

    # Load constant int 0
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r20
    # load a one byte expression off stack
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    Paddle_inBounds

    # handle return value
    # push one byte expression onto stack
    push   r24

    # load condition and branch if false
    # load a one byte expression off stack
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L23
    brne   MJ_L24
    jmp    MJ_L23

    # then label for if
MJ_L24:

    # IdExp
    # load value for variable centerX

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 0
    # push one byte expression onto stack
    push   r24

    # Load constant int 1
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L30
    ldi    r25, 0
    jmp    MJ_L31
MJ_L30:
    ldi    r25, hi8(-1)
MJ_L31:
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L32
    ldi    r19, 0
    jmp    MJ_L33
MJ_L32:
    ldi    r19, hi8(-1)
MJ_L33:

    # Do add operation
    add    r24, r18
    adc    r25, r19
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Load constant int 0
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Color expression Meggy.Color.DARK
    ldi    r22,0
    # push one byte expression onto stack
    push   r22

    ### Meggy.setPixel(x,y,color) call
    # load a one byte expression off stack
    pop    r20
    # load a one byte expression off stack
    pop    r22
    # load a one byte expression off stack
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

    # IdExp
    # load value for variable centerX

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 0
    # push one byte expression onto stack
    push   r24

    # Load constant int 1
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L34
    ldi    r25, 0
    jmp    MJ_L35
MJ_L34:
    ldi    r25, hi8(-1)
MJ_L35:
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L36
    ldi    r19, 0
    jmp    MJ_L37
MJ_L36:
    ldi    r19, hi8(-1)
MJ_L37:

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
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var centerX
    std    Z + 0, r24


    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

    # IdExp
    # load value for variable centerX

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 0
    # push one byte expression onto stack
    push   r24

    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    Paddle_drawPaddle
    jmp    MJ_L25

    # else label for if
MJ_L23:

    # done label for if
MJ_L25:

/* epilogue start for Paddle_moveLeft */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size Paddle_moveLeft, .-Paddle_moveLeft


    .text
.global Paddle_moveRight
    .type  Paddle_moveRight, @function
Paddle_moveRight:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
    push   r30
    push   r30

    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__

    # save off parameters
    std    Y + 2, r25
    std    Y + 1, r24
/* done with function Paddle_moveRight prologue */


    #### if statement


    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

    # IdExp
    # load value for variable centerX

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 0
    # push one byte expression onto stack
    push   r24

    # Load constant int 2
    ldi    r24,lo8(2)
    ldi    r25,hi8(2)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L41
    ldi    r25, 0
    jmp    MJ_L42
MJ_L41:
    ldi    r25, hi8(-1)
MJ_L42:
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L43
    ldi    r19, 0
    jmp    MJ_L44
MJ_L43:
    ldi    r19, hi8(-1)
MJ_L44:

    # Do add operation
    add    r24, r18
    adc    r25, r19
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Load constant int 0
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r20
    # load a one byte expression off stack
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    Paddle_inBounds

    # handle return value
    # push one byte expression onto stack
    push   r24

    # load condition and branch if false
    # load a one byte expression off stack
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L38
    brne   MJ_L39
    jmp    MJ_L38

    # then label for if
MJ_L39:

    # IdExp
    # load value for variable centerX

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 0
    # push one byte expression onto stack
    push   r24

    # Load constant int 1
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L45
    ldi    r25, 0
    jmp    MJ_L46
MJ_L45:
    ldi    r25, hi8(-1)
MJ_L46:
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L47
    ldi    r19, 0
    jmp    MJ_L48
MJ_L47:
    ldi    r19, hi8(-1)
MJ_L48:

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
    pop    r24
    pop    r25
    push   r24

    # Load constant int 0
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Color expression Meggy.Color.DARK
    ldi    r22,0
    # push one byte expression onto stack
    push   r22

    ### Meggy.setPixel(x,y,color) call
    # load a one byte expression off stack
    pop    r20
    # load a one byte expression off stack
    pop    r22
    # load a one byte expression off stack
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

    # IdExp
    # load value for variable centerX

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 0
    # push one byte expression onto stack
    push   r24

    # Load constant int 1
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L49
    ldi    r25, 0
    jmp    MJ_L50
MJ_L49:
    ldi    r25, hi8(-1)
MJ_L50:
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L51
    ldi    r19, 0
    jmp    MJ_L52
MJ_L51:
    ldi    r19, hi8(-1)
MJ_L52:

    # Do add operation
    add    r24, r18
    adc    r25, r19
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var centerX
    std    Z + 0, r24


    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

    # IdExp
    # load value for variable centerX

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 0
    # push one byte expression onto stack
    push   r24

    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    Paddle_drawPaddle
    jmp    MJ_L40

    # else label for if
MJ_L38:

    # done label for if
MJ_L40:

/* epilogue start for Paddle_moveRight */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size Paddle_moveRight, .-Paddle_moveRight


    .text
.global Paddle_inBounds
    .type  Paddle_inBounds, @function
Paddle_inBounds:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
    push   r30
    push   r30
    push   r30
    push   r30

    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__

    # save off parameters
    std    Y + 2, r25
    std    Y + 1, r24
    std    Y + 3, r22
    std    Y + 4, r20
/* done with function Paddle_inBounds prologue */


    #### short-circuited && operation
    # &&: left operand

    #### short-circuited && operation
    # &&: left operand

    #### short-circuited && operation
    # &&: left operand

    # Load constant int 0
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 1
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    # push two byte expression onto stack
    push   r25
    push   r24
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
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for variable x
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24

    # less than expression
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    brlt MJ_L54

    # load false
MJ_L53:
    ldi     r24, 0
    jmp      MJ_L55

    # load true
MJ_L54:
    ldi    r24, 1

    # push result of less than
MJ_L55:
    # push one byte expression onto stack
    push   r24

    # &&: if left operand is false do not eval right
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    # compare left exp with zero
    ldi r25, 0
    cp    r24, r25
    # Want this, breq MJ_L56
    brne  MJ_L57
    jmp   MJ_L56

MJ_L57:
    # right operand
    # load a one byte expression off stack
    pop    r24

    # IdExp
    # load value for variable x
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24

    # Load constant int 8
    ldi    r24,lo8(8)
    ldi    r25,hi8(8)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # less than expression
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    brlt MJ_L59

    # load false
MJ_L58:
    ldi     r24, 0
    jmp      MJ_L60

    # load true
MJ_L59:
    ldi    r24, 1

    # push result of less than
MJ_L60:
    # push one byte expression onto stack
    push   r24
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24

MJ_L56:

    # &&: if left operand is false do not eval right
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    # compare left exp with zero
    ldi r25, 0
    cp    r24, r25
    # Want this, breq MJ_L61
    brne  MJ_L62
    jmp   MJ_L61

MJ_L62:
    # right operand
    # load a one byte expression off stack
    pop    r24

    # Load constant int 0
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 1
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    # push two byte expression onto stack
    push   r25
    push   r24
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
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for variable y
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 4
    # push one byte expression onto stack
    push   r24

    # less than expression
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    brlt MJ_L64

    # load false
MJ_L63:
    ldi     r24, 0
    jmp      MJ_L65

    # load true
MJ_L64:
    ldi    r24, 1

    # push result of less than
MJ_L65:
    # push one byte expression onto stack
    push   r24
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24

MJ_L61:

    # &&: if left operand is false do not eval right
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    # compare left exp with zero
    ldi r25, 0
    cp    r24, r25
    # Want this, breq MJ_L66
    brne  MJ_L67
    jmp   MJ_L66

MJ_L67:
    # right operand
    # load a one byte expression off stack
    pop    r24

    # IdExp
    # load value for variable y
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 4
    # push one byte expression onto stack
    push   r24

    # Load constant int 8
    ldi    r24,lo8(8)
    ldi    r25,hi8(8)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # less than expression
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    brlt MJ_L69

    # load false
MJ_L68:
    ldi     r24, 0
    jmp      MJ_L70

    # load true
MJ_L69:
    ldi    r24, 1

    # push result of less than
MJ_L70:
    # push one byte expression onto stack
    push   r24
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24

MJ_L66:

/* epilogue start for Paddle_inBounds */
    # handle return value
    # load a one byte expression off stack
    pop    r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L71
    ldi    r25, 0
    jmp    MJ_L72
MJ_L71:
    ldi    r25, hi8(-1)
MJ_L72:
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size Paddle_inBounds, .-Paddle_inBounds


    .text
.global Ball_init
    .type  Ball_init, @function
Ball_init:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
    push   r30
    push   r30

    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__

    # save off parameters
    std    Y + 2, r25
    std    Y + 1, r24
/* done with function Ball_init prologue */


    # Load constant int 3
    ldi    r24,lo8(3)
    ldi    r25,hi8(3)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var prevX
    std    Z + 2, r24

    # Load constant int 7
    ldi    r24,lo8(7)
    ldi    r25,hi8(7)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var prevY
    std    Z + 3, r24

    # Load constant int 4
    ldi    r24,lo8(4)
    ldi    r25,hi8(4)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var currentX
    std    Z + 0, r24

    # Load constant int 6
    ldi    r24,lo8(6)
    ldi    r25,hi8(6)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var currentY
    std    Z + 1, r24

    # Color expression Meggy.Color.ORANGE
    ldi    r22,2
    # push one byte expression onto stack
    push   r22

    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var ballColor
    std    Z + 4, r24

    # IdExp
    # load value for variable currentX

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 0
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable currentY

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 1
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable ballColor

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 4
    # push one byte expression onto stack
    push   r24

    ### Meggy.setPixel(x,y,color) call
    # load a one byte expression off stack
    pop    r20
    # load a one byte expression off stack
    pop    r22
    # load a one byte expression off stack
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

/* epilogue start for Ball_init */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size Ball_init, .-Ball_init


    .text
.global Ball_inBounds
    .type  Ball_inBounds, @function
Ball_inBounds:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
    push   r30
    push   r30
    push   r30
    push   r30

    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__

    # save off parameters
    std    Y + 2, r25
    std    Y + 1, r24
    std    Y + 3, r22
    std    Y + 4, r20
/* done with function Ball_inBounds prologue */


    #### short-circuited && operation
    # &&: left operand

    #### short-circuited && operation
    # &&: left operand

    #### short-circuited && operation
    # &&: left operand

    # Load constant int 0
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 1
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    # push two byte expression onto stack
    push   r25
    push   r24
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
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for variable x
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24

    # less than expression
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    brlt MJ_L74

    # load false
MJ_L73:
    ldi     r24, 0
    jmp      MJ_L75

    # load true
MJ_L74:
    ldi    r24, 1

    # push result of less than
MJ_L75:
    # push one byte expression onto stack
    push   r24

    # &&: if left operand is false do not eval right
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    # compare left exp with zero
    ldi r25, 0
    cp    r24, r25
    # Want this, breq MJ_L76
    brne  MJ_L77
    jmp   MJ_L76

MJ_L77:
    # right operand
    # load a one byte expression off stack
    pop    r24

    # IdExp
    # load value for variable x
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24

    # Load constant int 8
    ldi    r24,lo8(8)
    ldi    r25,hi8(8)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # less than expression
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    brlt MJ_L79

    # load false
MJ_L78:
    ldi     r24, 0
    jmp      MJ_L80

    # load true
MJ_L79:
    ldi    r24, 1

    # push result of less than
MJ_L80:
    # push one byte expression onto stack
    push   r24
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24

MJ_L76:

    # &&: if left operand is false do not eval right
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    # compare left exp with zero
    ldi r25, 0
    cp    r24, r25
    # Want this, breq MJ_L81
    brne  MJ_L82
    jmp   MJ_L81

MJ_L82:
    # right operand
    # load a one byte expression off stack
    pop    r24

    # Load constant int 0
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 1
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    # push two byte expression onto stack
    push   r25
    push   r24
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
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for variable y
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 4
    # push one byte expression onto stack
    push   r24

    # less than expression
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    brlt MJ_L84

    # load false
MJ_L83:
    ldi     r24, 0
    jmp      MJ_L85

    # load true
MJ_L84:
    ldi    r24, 1

    # push result of less than
MJ_L85:
    # push one byte expression onto stack
    push   r24
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24

MJ_L81:

    # &&: if left operand is false do not eval right
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    # compare left exp with zero
    ldi r25, 0
    cp    r24, r25
    # Want this, breq MJ_L86
    brne  MJ_L87
    jmp   MJ_L86

MJ_L87:
    # right operand
    # load a one byte expression off stack
    pop    r24

    # IdExp
    # load value for variable y
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 4
    # push one byte expression onto stack
    push   r24

    # Load constant int 8
    ldi    r24,lo8(8)
    ldi    r25,hi8(8)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # less than expression
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    brlt MJ_L89

    # load false
MJ_L88:
    ldi     r24, 0
    jmp      MJ_L90

    # load true
MJ_L89:
    ldi    r24, 1

    # push result of less than
MJ_L90:
    # push one byte expression onto stack
    push   r24
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24

MJ_L86:

/* epilogue start for Ball_inBounds */
    # handle return value
    # load a one byte expression off stack
    pop    r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L91
    ldi    r25, 0
    jmp    MJ_L92
MJ_L91:
    ldi    r25, hi8(-1)
MJ_L92:
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size Ball_inBounds, .-Ball_inBounds


    .text
.global Ball_collision
    .type  Ball_collision, @function
Ball_collision:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
    push   r30
    push   r30
    push   r30
    push   r30

    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__

    # save off parameters
    std    Y + 2, r25
    std    Y + 1, r24
    std    Y + 3, r22
    std    Y + 4, r20
/* done with function Ball_collision prologue */


    # Color expression Meggy.Color.DARK
    ldi    r22,0
    # push one byte expression onto stack
    push   r22

    # IdExp
    # load value for variable x
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable y
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 4
    # push one byte expression onto stack
    push   r24

    ### Meggy.getPixel(x,y) call
    # load a one byte expression off stack
    pop    r22
    # load a one byte expression off stack
    pop    r24
    call   _Z6ReadPxhh
    # push one byte expression onto stack
    push   r24

    # equality check expression
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    breq MJ_L94

    # result is false
MJ_L93:
    ldi     r24, 0
    jmp      MJ_L95

    # result is true
MJ_L94:
    ldi     r24, 1

    # store result of equal expression
MJ_L95:
    # push one byte expression onto stack
    push   r24

    # not operation
    # load a one byte expression off stack
    pop    r24
    ldi     r22, 1
    eor     r24,r22
    # push one byte expression onto stack
    push   r24

/* epilogue start for Ball_collision */
    # handle return value
    # load a one byte expression off stack
    pop    r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L96
    ldi    r25, 0
    jmp    MJ_L97
MJ_L96:
    ldi    r25, hi8(-1)
MJ_L97:
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size Ball_collision, .-Ball_collision


    .text
.global Ball_move
    .type  Ball_move, @function
Ball_move:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
    push   r30
    push   r30
    push   r30
    push   r30
    push   r30
    push   r30

    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__

    # save off parameters
    std    Y + 2, r25
    std    Y + 1, r24
/* done with function Ball_move prologue */


    # IdExp
    # load value for variable currentX

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 0
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable prevX

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 2
    # push one byte expression onto stack
    push   r24
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L98
    ldi    r25, 0
    jmp    MJ_L99
MJ_L98:
    ldi    r25, hi8(-1)
MJ_L99:
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L100
    ldi    r19, 0
    jmp    MJ_L101
MJ_L100:
    ldi    r19, hi8(-1)
MJ_L101:

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
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for variable currentX

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 0
    # push one byte expression onto stack
    push   r24
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L102
    ldi    r25, 0
    jmp    MJ_L103
MJ_L102:
    ldi    r25, hi8(-1)
MJ_L103:
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L104
    ldi    r19, 0
    jmp    MJ_L105
MJ_L104:
    ldi    r19, hi8(-1)
MJ_L105:

    # Do add operation
    add    r24, r18
    adc    r25, r19
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    # store rhs into var nextX
    std    Y + 3, r24

    # IdExp
    # load value for variable currentY

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 1
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable prevY

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 3
    # push one byte expression onto stack
    push   r24
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L106
    ldi    r25, 0
    jmp    MJ_L107
MJ_L106:
    ldi    r25, hi8(-1)
MJ_L107:
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L108
    ldi    r19, 0
    jmp    MJ_L109
MJ_L108:
    ldi    r19, hi8(-1)
MJ_L109:

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
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for variable currentY

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 1
    # push one byte expression onto stack
    push   r24
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L110
    ldi    r25, 0
    jmp    MJ_L111
MJ_L110:
    ldi    r25, hi8(-1)
MJ_L111:
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L112
    ldi    r19, 0
    jmp    MJ_L113
MJ_L112:
    ldi    r19, hi8(-1)
MJ_L113:

    # Do add operation
    add    r24, r18
    adc    r25, r19
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    # store rhs into var nextY
    std    Y + 4, r24

    #### if statement

    #### short-circuited && operation
    # &&: left operand


    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

    # IdExp
    # load value for variable nextX
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable nextY
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 4
    # push one byte expression onto stack
    push   r24

    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r20
    # load a one byte expression off stack
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    Ball_inBounds

    # handle return value
    # push one byte expression onto stack
    push   r24

    # &&: if left operand is false do not eval right
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    # compare left exp with zero
    ldi r25, 0
    cp    r24, r25
    # Want this, breq MJ_L117
    brne  MJ_L118
    jmp   MJ_L117

MJ_L118:
    # right operand
    # load a one byte expression off stack
    pop    r24


    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

    # IdExp
    # load value for variable nextX
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable nextY
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 4
    # push one byte expression onto stack
    push   r24

    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r20
    # load a one byte expression off stack
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    Ball_collision

    # handle return value
    # push one byte expression onto stack
    push   r24

    # not operation
    # load a one byte expression off stack
    pop    r24
    ldi     r22, 1
    eor     r24,r22
    # push one byte expression onto stack
    push   r24
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24

MJ_L117:

    # load condition and branch if false
    # load a one byte expression off stack
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L114
    brne   MJ_L115
    jmp    MJ_L114

    # then label for if
MJ_L115:
    jmp    MJ_L116

    # else label for if
MJ_L114:

    # IdExp
    # load value for variable currentX

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 0
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable prevX

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 2
    # push one byte expression onto stack
    push   r24
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L119
    ldi    r25, 0
    jmp    MJ_L120
MJ_L119:
    ldi    r25, hi8(-1)
MJ_L120:
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L121
    ldi    r19, 0
    jmp    MJ_L122
MJ_L121:
    ldi    r19, hi8(-1)
MJ_L122:

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
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    # store rhs into var deltaX
    std    Y + 5, r24

    # IdExp
    # load value for variable currentY

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 1
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable prevY

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 3
    # push one byte expression onto stack
    push   r24
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L123
    ldi    r25, 0
    jmp    MJ_L124
MJ_L123:
    ldi    r25, hi8(-1)
MJ_L124:
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L125
    ldi    r19, 0
    jmp    MJ_L126
MJ_L125:
    ldi    r19, hi8(-1)
MJ_L126:

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
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    # store rhs into var deltaY
    std    Y + 6, r24

    # IdExp
    # load value for variable currentX

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 0
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable deltaX
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 5
    # push one byte expression onto stack
    push   r24
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L127
    ldi    r25, 0
    jmp    MJ_L128
MJ_L127:
    ldi    r25, hi8(-1)
MJ_L128:
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L129
    ldi    r19, 0
    jmp    MJ_L130
MJ_L129:
    ldi    r19, hi8(-1)
MJ_L130:

    # Do add operation
    add    r24, r18
    adc    r25, r19
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    # store rhs into var nextX
    std    Y + 3, r24

    # IdExp
    # load value for variable currentY

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 1
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable deltaY
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 6
    # push one byte expression onto stack
    push   r24
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L131
    ldi    r25, 0
    jmp    MJ_L132
MJ_L131:
    ldi    r25, hi8(-1)
MJ_L132:
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L133
    ldi    r19, 0
    jmp    MJ_L134
MJ_L133:
    ldi    r19, hi8(-1)
MJ_L134:

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
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    # store rhs into var nextY
    std    Y + 4, r24

    #### if statement

    #### short-circuited && operation
    # &&: left operand


    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

    # IdExp
    # load value for variable nextX
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable nextY
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 4
    # push one byte expression onto stack
    push   r24

    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r20
    # load a one byte expression off stack
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    Ball_inBounds

    # handle return value
    # push one byte expression onto stack
    push   r24

    # &&: if left operand is false do not eval right
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    # compare left exp with zero
    ldi r25, 0
    cp    r24, r25
    # Want this, breq MJ_L138
    brne  MJ_L139
    jmp   MJ_L138

MJ_L139:
    # right operand
    # load a one byte expression off stack
    pop    r24


    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

    # IdExp
    # load value for variable nextX
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable nextY
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 4
    # push one byte expression onto stack
    push   r24

    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r20
    # load a one byte expression off stack
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    Ball_collision

    # handle return value
    # push one byte expression onto stack
    push   r24

    # not operation
    # load a one byte expression off stack
    pop    r24
    ldi     r22, 1
    eor     r24,r22
    # push one byte expression onto stack
    push   r24
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24

MJ_L138:

    # load condition and branch if false
    # load a one byte expression off stack
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L135
    brne   MJ_L136
    jmp    MJ_L135

    # then label for if
MJ_L136:
    jmp    MJ_L137

    # else label for if
MJ_L135:

    # IdExp
    # load value for variable currentX

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 0
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable deltaX
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 5
    # push one byte expression onto stack
    push   r24
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L140
    ldi    r25, 0
    jmp    MJ_L141
MJ_L140:
    ldi    r25, hi8(-1)
MJ_L141:
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L142
    ldi    r19, 0
    jmp    MJ_L143
MJ_L142:
    ldi    r19, hi8(-1)
MJ_L143:

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
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    # store rhs into var nextX
    std    Y + 3, r24

    # IdExp
    # load value for variable currentY

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 1
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable deltaY
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 6
    # push one byte expression onto stack
    push   r24
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L144
    ldi    r25, 0
    jmp    MJ_L145
MJ_L144:
    ldi    r25, hi8(-1)
MJ_L145:
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L146
    ldi    r19, 0
    jmp    MJ_L147
MJ_L146:
    ldi    r19, hi8(-1)
MJ_L147:

    # Do add operation
    add    r24, r18
    adc    r25, r19
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    # store rhs into var nextY
    std    Y + 4, r24

    #### if statement

    #### short-circuited && operation
    # &&: left operand


    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

    # IdExp
    # load value for variable nextX
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable nextY
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 4
    # push one byte expression onto stack
    push   r24

    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r20
    # load a one byte expression off stack
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    Ball_inBounds

    # handle return value
    # push one byte expression onto stack
    push   r24

    # &&: if left operand is false do not eval right
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    # compare left exp with zero
    ldi r25, 0
    cp    r24, r25
    # Want this, breq MJ_L151
    brne  MJ_L152
    jmp   MJ_L151

MJ_L152:
    # right operand
    # load a one byte expression off stack
    pop    r24


    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

    # IdExp
    # load value for variable nextX
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable nextY
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 4
    # push one byte expression onto stack
    push   r24

    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r20
    # load a one byte expression off stack
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    Ball_collision

    # handle return value
    # push one byte expression onto stack
    push   r24

    # not operation
    # load a one byte expression off stack
    pop    r24
    ldi     r22, 1
    eor     r24,r22
    # push one byte expression onto stack
    push   r24
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24

MJ_L151:

    # load condition and branch if false
    # load a one byte expression off stack
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L148
    brne   MJ_L149
    jmp    MJ_L148

    # then label for if
MJ_L149:
    jmp    MJ_L150

    # else label for if
MJ_L148:

    # IdExp
    # load value for variable prevX

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 2
    # push one byte expression onto stack
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    # store rhs into var nextX
    std    Y + 3, r24

    # IdExp
    # load value for variable prevY

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 3
    # push one byte expression onto stack
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    # store rhs into var nextY
    std    Y + 4, r24

    # done label for if
MJ_L150:

    # done label for if
MJ_L137:

    # done label for if
MJ_L116:

    # IdExp
    # load value for variable currentX

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 0
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable currentY

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 1
    # push one byte expression onto stack
    push   r24

    # Color expression Meggy.Color.DARK
    ldi    r22,0
    # push one byte expression onto stack
    push   r22

    ### Meggy.setPixel(x,y,color) call
    # load a one byte expression off stack
    pop    r20
    # load a one byte expression off stack
    pop    r22
    # load a one byte expression off stack
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

    # IdExp
    # load value for variable nextX
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable nextY
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 4
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable ballColor

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 4
    # push one byte expression onto stack
    push   r24

    ### Meggy.setPixel(x,y,color) call
    # load a one byte expression off stack
    pop    r20
    # load a one byte expression off stack
    pop    r22
    # load a one byte expression off stack
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

    # IdExp
    # load value for variable currentX

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 0
    # push one byte expression onto stack
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var prevX
    std    Z + 2, r24

    # IdExp
    # load value for variable currentY

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a one byte variable from base+offset
    ldd    r24, Z + 1
    # push one byte expression onto stack
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var prevY
    std    Z + 3, r24

    # IdExp
    # load value for variable nextX
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var currentX
    std    Z + 0, r24

    # IdExp
    # load value for variable nextY
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 4
    # push one byte expression onto stack
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var currentY
    std    Z + 1, r24

/* epilogue start for Ball_move */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size Ball_move, .-Ball_move

