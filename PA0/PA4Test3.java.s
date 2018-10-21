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

    ### Meggy.getPixel(x,y) call
    # load a one byte expression off stack
    pop    r22
    # load a one byte expression off stack
    pop    r24
    call   _Z6ReadPxhh
    # push one byte expression onto stack
    push   r24

    # Color expression Meggy.Color.RED
    ldi    r22,1
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

    #### if statement

    ### MeggyCheckButton
    call    _Z16CheckButtonsDownv
    lds    r24, Button_Left
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
    jmp    MJ_L8

    # else label for if
MJ_L6:

    # done label for if
MJ_L8:
    jmp    MJ_L2

    # else label for if
MJ_L0:

    # done label for if
MJ_L2:

    #### while statement
MJ_L15:

    # True/1 expression
    ldi    r22, 1
    # push one byte expression onto stack
    push   r22

    # if not(condition)
    # load a one byte expression off stack
    pop    r24
    ldi    r25,0
    cp     r24, r25
    # WANT breq MJ_L17
    brne   MJ_L16
    jmp    MJ_L17

    # while loop body
MJ_L16:

    # NewExp
    ldi    r24, lo8(0)
    ldi    r25, hi8(0)
    # allocating object of size 0 on heap
    call    malloc
    # push object address
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 1
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Color expression Meggy.Color.RED
    ldi    r22,1
    # push one byte expression onto stack
    push   r22

    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r20
    # load a two byte expression off stack
    pop    r22
    pop    r23
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    MixedTest_SetLineColor

    # Push Meggy.Tone.Cs3 onto the stack.
    ldi    r25, hi8(57724)
    ldi    r24, lo8(57724)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 10
    ldi    r24,lo8(10)
    ldi    r25,hi8(10)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

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
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L18
    ldi    r25, 0
    jmp    MJ_L19
MJ_L18:
    ldi    r25, hi8(-1)
MJ_L19:
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L20
    ldi    r19, 0
    jmp    MJ_L21
MJ_L20:
    ldi    r19, hi8(-1)
MJ_L21:

    # Do add operation
    add    r24, r18
    adc    r25, r19
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 30
    ldi    r24,lo8(30)
    ldi    r25,hi8(30)
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
    # load a two byte expression off stack
    pop    r24
    pop    r25
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L22
    ldi    r19, 0
    jmp    MJ_L23
MJ_L22:
    ldi    r19, hi8(-1)
MJ_L23:

    # Do add operation
    add    r24, r18
    adc    r25, r19
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

    # Push Meggy.Tone.Ds3 onto the stack.
    ldi    r25, hi8(51427)
    ldi    r24, lo8(51427)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 10
    ldi    r24,lo8(10)
    ldi    r25,hi8(10)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 3
    ldi    r24,lo8(3)
    ldi    r25,hi8(3)
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

    # Load constant int 20
    ldi    r24,lo8(20)
    ldi    r25,hi8(20)
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

    ### Meggy.toneStart(tone, time_ms) call
    # load a two byte expression off stack
    pop    r22
    pop    r23
    # load a two byte expression off stack
    pop    r24
    pop    r25
    call   _Z10Tone_Startjj

    # Push Meggy.Tone.B3 onto the stack.
    ldi    r25, hi8(32397)
    ldi    r24, lo8(32397)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 10
    ldi    r24,lo8(10)
    ldi    r25,hi8(10)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 3
    ldi    r24,lo8(3)
    ldi    r25,hi8(3)
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

    # Load constant int 10
    ldi    r24,lo8(10)
    ldi    r25,hi8(10)
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

    ### Meggy.toneStart(tone, time_ms) call
    # load a two byte expression off stack
    pop    r22
    pop    r23
    # load a two byte expression off stack
    pop    r24
    pop    r25
    call   _Z10Tone_Startjj

    #### if statement

    ### MeggyCheckButton
    call    _Z16CheckButtonsDownv
    lds    r24, Button_Left
    # if button value is zero, push 0 else push 1
    tst    r24
    breq   MJ_L27
MJ_L28:
    ldi    r24, 1
    jmp    MJ_L29
MJ_L27:
MJ_L29:
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
    breq MJ_L31

    # result is false
MJ_L30:
    ldi     r24, 0
    jmp      MJ_L32

    # result is true
MJ_L31:
    ldi     r24, 1

    # store result of equal expression
MJ_L32:
    # push one byte expression onto stack
    push   r24

    # load condition and branch if false
    # load a one byte expression off stack
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L24
    brne   MJ_L25
    jmp    MJ_L24

    # then label for if
MJ_L25:

    # NewExp
    ldi    r24, lo8(0)
    ldi    r25, hi8(0)
    # allocating object of size 0 on heap
    call    malloc
    # push object address
    # push two byte expression onto stack
    push   r25
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

    # Color expression Meggy.Color.BLUE
    ldi    r22,5
    # push one byte expression onto stack
    push   r22

    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r20
    # load a one byte expression off stack
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    MixedTest_safeSetPixel

    # NewExp
    ldi    r24, lo8(0)
    ldi    r25, hi8(0)
    # allocating object of size 0 on heap
    call    malloc
    # push object address
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 4
    ldi    r24,lo8(4)
    ldi    r25,hi8(4)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Color expression Meggy.Color.GREEN
    ldi    r22,4
    # push one byte expression onto stack
    push   r22

    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r20
    # load a two byte expression off stack
    pop    r22
    pop    r23
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    MixedTest_SetLineColor
    jmp    MJ_L26

    # else label for if
MJ_L24:

    # NewExp
    ldi    r24, lo8(0)
    ldi    r25, hi8(0)
    # allocating object of size 0 on heap
    call    malloc
    # push object address
    # push two byte expression onto stack
    push   r25
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

    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r16
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r20
    # load a one byte expression off stack
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    MixedTest_safeSwitchPixel

    # NewExp
    ldi    r24, lo8(0)
    ldi    r25, hi8(0)
    # allocating object of size 0 on heap
    call    malloc
    # push object address
    # push two byte expression onto stack
    push   r25
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

    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r20
    # load a one byte expression off stack
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    MixedTest_safeSetPixel

    # NewExp
    ldi    r24, lo8(0)
    ldi    r25, hi8(0)
    # allocating object of size 0 on heap
    call    malloc
    # push object address
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 7
    ldi    r24,lo8(7)
    ldi    r25,hi8(7)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Color expression Meggy.Color.GREEN
    ldi    r22,4
    # push one byte expression onto stack
    push   r22

    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r20
    # load a two byte expression off stack
    pop    r22
    pop    r23
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    MixedTest_SetLineColor

    # done label for if
MJ_L26:

    # jump to while test
    jmp    MJ_L15

    # end of while
MJ_L17:


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main



    .text
.global MixedTest_SetLineColor
    .type  MixedTest_SetLineColor, @function
MixedTest_SetLineColor:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
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
    std    Y + 5, r20
/* done with function MixedTest_SetLineColor prologue */


    #### if statement

    # IdExp
    # load value for variable line
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 4
    ldd    r24, Y + 3
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 8
    ldi    r24,lo8(8)
    ldi    r25,hi8(8)
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
    brlt MJ_L37

    # load false
MJ_L36:
    ldi     r24, 0
    jmp      MJ_L38

    # load true
MJ_L37:
    ldi    r24, 1

    # push result of less than
MJ_L38:
    # push one byte expression onto stack
    push   r24

    # load condition and branch if false
    # load a one byte expression off stack
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L33
    brne   MJ_L34
    jmp    MJ_L33

    # then label for if
MJ_L34:

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
    # load value for variable line
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 4
    ldd    r24, Y + 3
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
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 5
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

    # IdExp
    # load value for variable line
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 4
    ldd    r24, Y + 3
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
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 5
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

    # IdExp
    # load value for variable line
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 4
    ldd    r24, Y + 3
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
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 5
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

    # IdExp
    # load value for variable line
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 4
    ldd    r24, Y + 3
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
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 5
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

    # IdExp
    # load value for variable line
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 4
    ldd    r24, Y + 3
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
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 5
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

    # Load constant int 5
    ldi    r24,lo8(5)
    ldi    r25,hi8(5)
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
    # load value for variable line
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 4
    ldd    r24, Y + 3
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
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 5
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

    # IdExp
    # load value for variable line
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 4
    ldd    r24, Y + 3
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
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 5
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

    # IdExp
    # load value for variable line
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 4
    ldd    r24, Y + 3
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
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 5
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
    jmp    MJ_L35

    # else label for if
MJ_L33:

    # done label for if
MJ_L35:

/* epilogue start for MixedTest_SetLineColor */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size MixedTest_SetLineColor, .-MixedTest_SetLineColor


    .text
.global MixedTest_boundary_guard
    .type  MixedTest_boundary_guard, @function
MixedTest_boundary_guard:
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
/* done with function MixedTest_boundary_guard prologue */


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
    brlt MJ_L40

    # load false
MJ_L39:
    ldi     r24, 0
    jmp      MJ_L41

    # load true
MJ_L40:
    ldi    r24, 1

    # push result of less than
MJ_L41:
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
    # Want this, breq MJ_L42
    brne  MJ_L43
    jmp   MJ_L42

MJ_L43:
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
    brlt MJ_L45

    # load false
MJ_L44:
    ldi     r24, 0
    jmp      MJ_L46

    # load true
MJ_L45:
    ldi    r24, 1

    # push result of less than
MJ_L46:
    # push one byte expression onto stack
    push   r24
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24

MJ_L42:

    # &&: if left operand is false do not eval right
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    # compare left exp with zero
    ldi r25, 0
    cp    r24, r25
    # Want this, breq MJ_L47
    brne  MJ_L48
    jmp   MJ_L47

MJ_L48:
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
    brlt MJ_L50

    # load false
MJ_L49:
    ldi     r24, 0
    jmp      MJ_L51

    # load true
MJ_L50:
    ldi    r24, 1

    # push result of less than
MJ_L51:
    # push one byte expression onto stack
    push   r24
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24

MJ_L47:

    # &&: if left operand is false do not eval right
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    # compare left exp with zero
    ldi r25, 0
    cp    r24, r25
    # Want this, breq MJ_L52
    brne  MJ_L53
    jmp   MJ_L52

MJ_L53:
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
    brlt MJ_L55

    # load false
MJ_L54:
    ldi     r24, 0
    jmp      MJ_L56

    # load true
MJ_L55:
    ldi    r24, 1

    # push result of less than
MJ_L56:
    # push one byte expression onto stack
    push   r24
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24

MJ_L52:

/* epilogue start for MixedTest_boundary_guard */
    # handle return value
    # load a one byte expression off stack
    pop    r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L57
    ldi    r25, 0
    jmp    MJ_L58
MJ_L57:
    ldi    r25, hi8(-1)
MJ_L58:
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size MixedTest_boundary_guard, .-MixedTest_boundary_guard


    .text
.global MixedTest_safeSetPixel
    .type  MixedTest_safeSetPixel, @function
MixedTest_safeSetPixel:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
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
    std    Y + 3, r22
    std    Y + 4, r20
    std    Y + 5, r18
/* done with function MixedTest_safeSetPixel prologue */


    #### if statement


    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

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

    call    MixedTest_boundary_guard

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
    breq MJ_L63

    # result is false
MJ_L62:
    ldi     r24, 0
    jmp      MJ_L64

    # result is true
MJ_L63:
    ldi     r24, 1

    # store result of equal expression
MJ_L64:
    # push one byte expression onto stack
    push   r24

    # load condition and branch if false
    # load a one byte expression off stack
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L59
    brne   MJ_L60
    jmp    MJ_L59

    # then label for if
MJ_L60:

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

    # IdExp
    # load value for variable c
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 5
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
    jmp    MJ_L61

    # else label for if
MJ_L59:

    # done label for if
MJ_L61:

/* epilogue start for MixedTest_safeSetPixel */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size MixedTest_safeSetPixel, .-MixedTest_safeSetPixel


    .text
.global MixedTest_safeSwitchPixel
    .type  MixedTest_safeSwitchPixel, @function
MixedTest_safeSwitchPixel:
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
    std    Y + 3, r22
    std    Y + 4, r20
    std    Y + 5, r18
    std    Y + 6, r16
/* done with function MixedTest_safeSwitchPixel prologue */


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
    # load value for variable x1
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable y1
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

    call    MixedTest_boundary_guard

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
    # Want this, breq MJ_L68
    brne  MJ_L69
    jmp   MJ_L68

MJ_L69:
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
    # load value for variable x2
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 5
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable y2
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 6
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

    call    MixedTest_boundary_guard

    # handle return value
    # push one byte expression onto stack
    push   r24
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24

MJ_L68:

    # load condition and branch if false
    # load a one byte expression off stack
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L65
    brne   MJ_L66
    jmp    MJ_L65

    # then label for if
MJ_L66:

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

    # IdExp
    # load value for variable x1
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable y1
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

    ### Meggy.setPixel(x,y,color) call
    # load a one byte expression off stack
    pop    r20
    # load a one byte expression off stack
    pop    r22
    # load a one byte expression off stack
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev
    jmp    MJ_L67

    # else label for if
MJ_L65:

    # done label for if
MJ_L67:

    # IdExp
    # load value for variable x1
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable y1
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 4
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable x2
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 5
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable y2
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 6
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
    # load value for variable x2
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 5
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable x2
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 5
    # push one byte expression onto stack
    push   r24

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

    ### Meggy.getPixel(x,y) call
    # load a one byte expression off stack
    pop    r22
    # load a one byte expression off stack
    pop    r24
    call   _Z6ReadPxhh
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

/* epilogue start for MixedTest_safeSwitchPixel */
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
    .size MixedTest_safeSwitchPixel, .-MixedTest_safeSwitchPixel

