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

    call    TestReturnValue_testAll

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

    call    TestParameters_testAll

    #### if statement

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

    call    TestLessThan_testLessThan

    # handle return value
    # push one byte expression onto stack
    push   r24

    # True/1 expression
    ldi    r22, 1
    # push one byte expression onto stack
    push   r22

    # equality check expression
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    breq MJ_L4

    # result is false
MJ_L3:
    ldi     r24, 0
    jmp      MJ_L5

    # result is true
MJ_L4:
    ldi     r24, 1

    # store result of equal expression
MJ_L5:
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

    # Color expression Meggy.Color.GREEN
    ldi    r22,4
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
    jmp    MJ_L2

    # else label for if
MJ_L0:

    # done label for if
MJ_L2:

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

    # Color expression Meggy.Color.GREEN
    ldi    r22,4
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

    # Load constant int 5
    ldi    r24,lo8(5)
    ldi    r25,hi8(5)
    # push two byte expression onto stack
    push   r25
    push   r24

    ### Meggy.delay() call
    # load delay parameter
    # load a two byte expression off stack
    pop    r24
    pop    r25
    call   _Z8delay_msj

    #### if statement

    ### MeggyCheckButton
    call    _Z16CheckButtonsDownv
    lds    r24, Button_Down
    # if button value is zero, push 0 else push 1
    tst    r24
    breq   MJ_L9
MJ_L10:
    ldi    r24, 1
    jmp    MJ_L11
MJ_L9:
MJ_L11:
    # push one byte expression onto stack
    push   r24

    # True/1 expression
    ldi    r22, 1
    # push one byte expression onto stack
    push   r22

    # equality check expression
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    breq MJ_L13

    # result is false
MJ_L12:
    ldi     r24, 0
    jmp      MJ_L14

    # result is true
MJ_L13:
    ldi     r24, 1

    # store result of equal expression
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
    #WANT breq MJ_L6
    brne   MJ_L7
    jmp    MJ_L6

    # then label for if
MJ_L7:

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

    # Color expression Meggy.Color.RED
    ldi    r22,1
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
    jmp    MJ_L8

    # else label for if
MJ_L6:

    # done label for if
MJ_L8:


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main



    .text
.global TestReturnValue_testAll
    .type  TestReturnValue_testAll, @function
TestReturnValue_testAll:
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
/* done with function TestReturnValue_testAll prologue */



    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

    #### function call
    # put parameter values into appropriate registers
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    TestReturnValue_testBoolean

    #### if statement


    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

    #### function call
    # put parameter values into appropriate registers
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    TestReturnValue_testBoolean

    # handle return value
    # push one byte expression onto stack
    push   r24

    # True/1 expression
    ldi    r22, 1
    # push one byte expression onto stack
    push   r22

    # equality check expression
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    breq MJ_L19

    # result is false
MJ_L18:
    ldi     r24, 0
    jmp      MJ_L20

    # result is true
MJ_L19:
    ldi     r24, 1

    # store result of equal expression
MJ_L20:
    # push one byte expression onto stack
    push   r24

    # load condition and branch if false
    # load a one byte expression off stack
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L15
    brne   MJ_L16
    jmp    MJ_L15

    # then label for if
MJ_L16:
    jmp    MJ_L17

    # else label for if
MJ_L15:

    # done label for if
MJ_L17:


    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

    #### function call
    # put parameter values into appropriate registers
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    TestReturnValue_testByte


    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

    #### function call
    # put parameter values into appropriate registers
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    TestReturnValue_testInt


    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

    #### function call
    # put parameter values into appropriate registers
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    TestReturnValue_testVoid


    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

    #### function call
    # put parameter values into appropriate registers
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    TestReturnValue_testColor


    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

    #### function call
    # put parameter values into appropriate registers
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    TestReturnValue_testButton


    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

    #### function call
    # put parameter values into appropriate registers
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    TestReturnValue_testTone

/* epilogue start for TestReturnValue_testAll */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size TestReturnValue_testAll, .-TestReturnValue_testAll


    .text
.global TestReturnValue_testBoolean
    .type  TestReturnValue_testBoolean, @function
TestReturnValue_testBoolean:
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
/* done with function TestReturnValue_testBoolean prologue */


    # True/1 expression
    ldi    r22, 1
    # push one byte expression onto stack
    push   r22

/* epilogue start for TestReturnValue_testBoolean */
    # handle return value
    # load a one byte expression off stack
    pop    r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L21
    ldi    r25, 0
    jmp    MJ_L22
MJ_L21:
    ldi    r25, hi8(-1)
MJ_L22:
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size TestReturnValue_testBoolean, .-TestReturnValue_testBoolean


    .text
.global TestReturnValue_testByte
    .type  TestReturnValue_testByte, @function
TestReturnValue_testByte:
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
/* done with function TestReturnValue_testByte prologue */


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

/* epilogue start for TestReturnValue_testByte */
    # handle return value
    # load a one byte expression off stack
    pop    r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L23
    ldi    r25, 0
    jmp    MJ_L24
MJ_L23:
    ldi    r25, hi8(-1)
MJ_L24:
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size TestReturnValue_testByte, .-TestReturnValue_testByte


    .text
.global TestReturnValue_testInt
    .type  TestReturnValue_testInt, @function
TestReturnValue_testInt:
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
/* done with function TestReturnValue_testInt prologue */


    # Load constant int 1
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    # push two byte expression onto stack
    push   r25
    push   r24

/* epilogue start for TestReturnValue_testInt */
    # handle return value
    # load a two byte expression off stack
    pop    r24
    pop    r25
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size TestReturnValue_testInt, .-TestReturnValue_testInt


    .text
.global TestReturnValue_testVoid
    .type  TestReturnValue_testVoid, @function
TestReturnValue_testVoid:
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
/* done with function TestReturnValue_testVoid prologue */


/* epilogue start for TestReturnValue_testVoid */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size TestReturnValue_testVoid, .-TestReturnValue_testVoid


    .text
.global TestReturnValue_testColor
    .type  TestReturnValue_testColor, @function
TestReturnValue_testColor:
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
/* done with function TestReturnValue_testColor prologue */


    # Color expression Meggy.Color.DARK
    ldi    r22,0
    # push one byte expression onto stack
    push   r22

/* epilogue start for TestReturnValue_testColor */
    # handle return value
    # load a one byte expression off stack
    pop    r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L25
    ldi    r25, 0
    jmp    MJ_L26
MJ_L25:
    ldi    r25, hi8(-1)
MJ_L26:
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size TestReturnValue_testColor, .-TestReturnValue_testColor


    .text
.global TestReturnValue_testButton
    .type  TestReturnValue_testButton, @function
TestReturnValue_testButton:
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
/* done with function TestReturnValue_testButton prologue */


/* epilogue start for TestReturnValue_testButton */
    # handle return value
    # load a one byte expression off stack
    pop    r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L27
    ldi    r25, 0
    jmp    MJ_L28
MJ_L27:
    ldi    r25, hi8(-1)
MJ_L28:
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size TestReturnValue_testButton, .-TestReturnValue_testButton


    .text
.global TestReturnValue_testTone
    .type  TestReturnValue_testTone, @function
TestReturnValue_testTone:
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
/* done with function TestReturnValue_testTone prologue */


    # Push Meggy.Tone.C3 onto the stack.
    ldi    r25, hi8(61157)
    ldi    r24, lo8(61157)
    # push two byte expression onto stack
    push   r25
    push   r24

/* epilogue start for TestReturnValue_testTone */
    # handle return value
    # load a two byte expression off stack
    pop    r24
    pop    r25
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size TestReturnValue_testTone, .-TestReturnValue_testTone


    .text
.global TestParameters_testAll
    .type  TestParameters_testAll, @function
TestParameters_testAll:
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
/* done with function TestParameters_testAll prologue */



    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

    # True/1 expression
    ldi    r22, 1
    # push one byte expression onto stack
    push   r22

    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    TestParameters_testBoolean


    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

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
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    TestParameters_testByte


    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

    # Load constant int 0
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
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

    call    TestParameters_testInt


    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

    # Color expression Meggy.Color.DARK
    ldi    r22,0
    # push one byte expression onto stack
    push   r22

    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    TestParameters_testColor


    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    TestParameters_testButton


    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

    # Push Meggy.Tone.C3 onto the stack.
    ldi    r25, hi8(61157)
    ldi    r24, lo8(61157)
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

    call    TestParameters_testTone

/* epilogue start for TestParameters_testAll */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size TestParameters_testAll, .-TestParameters_testAll


    .text
.global TestParameters_testBoolean
    .type  TestParameters_testBoolean, @function
TestParameters_testBoolean:
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
/* done with function TestParameters_testBoolean prologue */


/* epilogue start for TestParameters_testBoolean */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size TestParameters_testBoolean, .-TestParameters_testBoolean


    .text
.global TestParameters_testByte
    .type  TestParameters_testByte, @function
TestParameters_testByte:
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
/* done with function TestParameters_testByte prologue */


/* epilogue start for TestParameters_testByte */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size TestParameters_testByte, .-TestParameters_testByte


    .text
.global TestParameters_testInt
    .type  TestParameters_testInt, @function
TestParameters_testInt:
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
    std    Y + 4, r23
    std    Y + 3, r22
/* done with function TestParameters_testInt prologue */


    # IdExp
    # load value for variable i
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 4
    ldd    r24, Y + 3
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

    # Do add operation
    add    r24, r18
    adc    r25, r19
    # push two byte expression onto stack
    push   r25
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a two byte expression off stack
    pop    r24
    pop    r25
    # store rhs into var i
    std    Y + 4, r25
    std    Y + 3, r24

/* epilogue start for TestParameters_testInt */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size TestParameters_testInt, .-TestParameters_testInt


    .text
.global TestParameters_testColor
    .type  TestParameters_testColor, @function
TestParameters_testColor:
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
/* done with function TestParameters_testColor prologue */


/* epilogue start for TestParameters_testColor */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size TestParameters_testColor, .-TestParameters_testColor


    .text
.global TestParameters_testButton
    .type  TestParameters_testButton, @function
TestParameters_testButton:
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
/* done with function TestParameters_testButton prologue */


/* epilogue start for TestParameters_testButton */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size TestParameters_testButton, .-TestParameters_testButton


    .text
.global TestParameters_testTone
    .type  TestParameters_testTone, @function
TestParameters_testTone:
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
    std    Y + 4, r23
    std    Y + 3, r22
/* done with function TestParameters_testTone prologue */


/* epilogue start for TestParameters_testTone */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size TestParameters_testTone, .-TestParameters_testTone


    .text
.global TestLessThan_testLessThan
    .type  TestLessThan_testLessThan, @function
TestLessThan_testLessThan:
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
/* done with function TestLessThan_testLessThan prologue */


    # Load constant int 1
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 2
    ldi    r24,lo8(2)
    ldi    r25,hi8(2)
    # push two byte expression onto stack
    push   r25
    push   r24

    # less than expression
    # load a two byte expression off stack
    pop    r18
    pop    r19
    # load a two byte expression off stack
    pop    r24
    pop    r25
    cp    r24, r18
    cpc   r25, r19
    brlt MJ_L30

    # load false
MJ_L29:
    ldi     r24, 0
    jmp      MJ_L31

    # load true
MJ_L30:
    ldi    r24, 1

    # push result of less than
MJ_L31:
    # push one byte expression onto stack
    push   r24

/* epilogue start for TestLessThan_testLessThan */
    # handle return value
    # load a one byte expression off stack
    pop    r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L32
    ldi    r25, 0
    jmp    MJ_L33
MJ_L32:
    ldi    r25, hi8(-1)
MJ_L33:
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size TestLessThan_testLessThan, .-TestLessThan_testLessThan

