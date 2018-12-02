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
    ldi    r24, lo8(10)
    ldi    r25, hi8(10)
    # allocating object of size 10 on heap
    call    malloc
    # push object address
    # push two byte expression onto stack
    push   r25
    push   r24

    # NewExp
    ldi    r24, lo8(2)
    ldi    r25, hi8(2)
    # allocating object of size 2 on heap
    call    malloc
    # push object address
    # push two byte expression onto stack
    push   r25
    push   r24

    #### function call
    # put parameter values into appropriate registers
    # load a two byte expression off stack
    pop    r22
    pop    r23
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    TestVarDecl_func


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main



    .text
.global TestVarDecl_func
    .type  TestVarDecl_func, @function
TestVarDecl_func:
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
    push   r30
    push   r30
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
    std    Y + 4, r23
    std    Y + 3, r22
/* done with function TestVarDecl_func prologue */


    # Load constant int 11
    ldi    r24,lo8(11)
    ldi    r25,hi8(11)
    # push two byte expression onto stack
    push   r25
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a two byte expression off stack
    pop    r24
    pop    r25
    # store rhs into var aa
    std    Y + 6, r25
    std    Y + 5, r24

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

    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    # store rhs into var bb
    std    Y + 7, r24

    # True/1 expression
    ldi    r22, 1
    # push one byte expression onto stack
    push   r22

    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    # store rhs into var cc
    std    Y + 8, r24

    # Color expression Meggy.Color.GREEN
    ldi    r22,4
    # push one byte expression onto stack
    push   r22

    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    # store rhs into var ccolor
    std    Y + 9, r24

    # IdExp
    # load value for variable bb
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 7
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable bb
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 7
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable ccolor
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 9
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

    #### if statement

    ### MeggyCheckButton
    call    _Z16CheckButtonsDownv
    lds    r24, Button_Up
    # if button value is zero, push 0 else push 1
    tst    r24
    breq   MJ_L3
MJ_L4:
    ldi    r24, 1
    jmp    MJ_L5
MJ_L3:
MJ_L5:
    # push one byte expression onto stack
    push   r24

    # False/0 expression
    ldi    r24,0
    # push one byte expression onto stack
    push   r24

    # equality check expression
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    breq MJ_L7

    # result is false
MJ_L6:
    ldi     r24, 0
    jmp      MJ_L8

    # result is true
MJ_L7:
    ldi     r24, 1

    # store result of equal expression
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
    #WANT breq MJ_L0
    brne   MJ_L1
    jmp    MJ_L0

    # then label for if
MJ_L1:

    # Push Meggy.Tone.Cs3 onto the stack.
    ldi    r25, hi8(57724)
    ldi    r24, lo8(57724)
    # push two byte expression onto stack
    push   r25
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a two byte expression off stack
    pop    r24
    pop    r25
    # store rhs into var ttone
    std    Y + 12, r25
    std    Y + 11, r24

    # IdExp
    # load value for variable ttone
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 12
    ldd    r24, Y + 11
    # push two byte expression onto stack
    push   r25
    push   r24

    # IdExp
    # load value for variable aa
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 6
    ldd    r24, Y + 5
    # push two byte expression onto stack
    push   r25
    push   r24

    ### Meggy.toneStart(tone, time_ms) call
    # load a two byte expression off stack
    pop    r22
    pop    r23
    # load a two byte expression off stack
    pop    r24
    pop    r25
    call   _Z10Tone_Startjj
    jmp    MJ_L2

    # else label for if
MJ_L0:

    # done label for if
MJ_L2:

    # IdExp
    # load value for variable aa
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 6
    ldd    r24, Y + 5
    # push two byte expression onto stack
    push   r25
    push   r24

/* epilogue start for TestVarDecl_func */
    # handle return value
    # load a two byte expression off stack
    pop    r24
    pop    r25
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
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
    .size TestVarDecl_func, .-TestVarDecl_func

