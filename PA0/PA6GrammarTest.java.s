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
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    ArraryTest_test


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main



    .text
.global ArraryTest_init
    .type  ArraryTest_init, @function
ArraryTest_init:
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
/* done with function ArraryTest_init prologue */


    # IdExp
    # load value for variable len
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 4
    ldd    r24, Y + 3
    # push two byte expression onto stack
    push   r25
    push   r24

    ### NewArrayExp, allocating a new array
    # loading array size in elements
    # load a two byte expression off stack
    pop    r26
    pop    r27
    # since num elems might be in caller-saved registers
    # need to push num elems onto the stack around call to malloc
    # if had three-address code reg alloc could work around this
    push   r27
    push   r26
    # add size in elems to self to multiply by 2
    # complements of Jason Mealler
    add    r26,r26
    adc    r27,r27
    # need bytes for elems + 2 in bytes
    ldi    r24, 2
    ldi    r25, 0
    add    r24,r26
    adc    r25,r27
    # call malloc, it expects r25:r24 as input
    call   malloc
    # set .length field to number of elements
    mov    r31, r25
    mov    r30, r24
    pop    r26
    pop    r27
    std    Z+0,r26
    std    Z+1,r27
    # store object address
    # push two byte expression onto stack
    push   r31
    push   r30

    ### AssignStatement
    # load rhs exp
    # load a two byte expression off stack
    pop    r24
    pop    r25

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var arr
    std    Z + 1, r25
    std    Z + 0, r24

/* epilogue start for ArraryTest_init */
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
    .size ArraryTest_init, .-ArraryTest_init


    .text
.global ArraryTest_test
    .type  ArraryTest_test, @function
ArraryTest_test:
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
/* done with function ArraryTest_test prologue */


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

    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    # store rhs into var pos
    std    Y + 5, r24


    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

    # Load constant int 5
    ldi    r24,lo8(5)
    ldi    r25,hi8(5)
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

    call    ArraryTest_init

    # Load constant int 0
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
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

    #### while statement
MJ_L0:

    # IdExp
    # load value for variable i
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 4
    ldd    r24, Y + 3
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 5
    ldi    r24,lo8(5)
    ldi    r25,hi8(5)
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
    brlt MJ_L4

    # load false
MJ_L3:
    ldi     r24, 0
    jmp      MJ_L5

    # load true
MJ_L4:
    ldi    r24, 1

    # push result of less than
MJ_L5:
    # push one byte expression onto stack
    push   r24

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


    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

    # IdExp
    # load value for variable i
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 4
    ldd    r24, Y + 3
    # push two byte expression onto stack
    push   r25
    push   r24

    # IdExp
    # load value for variable i
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 4
    ldd    r24, Y + 3
    # push two byte expression onto stack
    push   r25
    push   r24

    #### function call
    # put parameter values into appropriate registers
    # load a two byte expression off stack
    pop    r20
    pop    r21
    # load a two byte expression off stack
    pop    r22
    pop    r23
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    ArraryTest_setElement

    #### if statement


    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

    # IdExp
    # load value for variable i
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 4
    ldd    r24, Y + 3
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

    call    ArraryTest_getElement

    # handle return value
    # push two byte expression onto stack
    push   r25
    push   r24

    # IdExp
    # load value for variable i
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 4
    ldd    r24, Y + 3
    # push two byte expression onto stack
    push   r25
    push   r24

    # equality check expression
    # load a two byte expression off stack
    pop    r18
    pop    r19
    # load a two byte expression off stack
    pop    r24
    pop    r25
    cp    r24, r18
    cpc   r25, r19
    breq MJ_L10

    # result is false
MJ_L9:
    ldi     r24, 0
    jmp      MJ_L11

    # result is true
MJ_L10:
    ldi     r24, 1

    # store result of equal expression
MJ_L11:
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

    # IdExp
    # load value for variable pos
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 5
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable pos
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 5
    # push one byte expression onto stack
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
    jmp    MJ_L8

    # else label for if
MJ_L6:

    # IdExp
    # load value for variable pos
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 5
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable pos
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 5
    # push one byte expression onto stack
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

    # done label for if
MJ_L8:

    # jump to while test
    jmp    MJ_L0

    # end of while
MJ_L2:

    #### if statement

    # IdExp
    # load value for variable arr

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a two byte variable from base+offset
    ldd    r25, Z + 1
    ldd    r24, Z + 0
    # push two byte expression onto stack
    push   r25
    push   r24

    # length of array
    # load a two byte expression off stack
    pop    r30
    pop    r31
    ldd   r24, Z+0
    ldd   r25, Z+1
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 5
    ldi    r24,lo8(5)
    ldi    r25,hi8(5)
    # push two byte expression onto stack
    push   r25
    push   r24

    # equality check expression
    # load a two byte expression off stack
    pop    r18
    pop    r19
    # load a two byte expression off stack
    pop    r24
    pop    r25
    cp    r24, r18
    cpc   r25, r19
    breq MJ_L16

    # result is false
MJ_L15:
    ldi     r24, 0
    jmp      MJ_L17

    # result is true
MJ_L16:
    ldi     r24, 1

    # store result of equal expression
MJ_L17:
    # push one byte expression onto stack
    push   r24

    # load condition and branch if false
    # load a one byte expression off stack
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L12
    brne   MJ_L13
    jmp    MJ_L12

    # then label for if
MJ_L13:

    # IdExp
    # load value for variable pos
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 5
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable pos
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 5
    # push one byte expression onto stack
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
    jmp    MJ_L14

    # else label for if
MJ_L12:

    # IdExp
    # load value for variable pos
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 5
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable pos
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 5
    # push one byte expression onto stack
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

    # done label for if
MJ_L14:


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

    call    ArraryTest_getArr

    # handle return value
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 1
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    # push two byte expression onto stack
    push   r25
    push   r24

    ### ArrayExp
    # calculate the array element address by first
    # loading index
    # load a two byte expression off stack
    pop    r18
    pop    r19
    # add size in elems to self to multiply by 2
    # complements of Jason Mealler
    add    r18,r18
    adc    r19,r19
    # put index*(elem size in bytes) into r31:r30
    mov    r31, r19
    mov    r30, r18
    # want result of addressing arithmetic 
    # to be in r31:r30 for access through Z
    # index over length
    ldi    r20, 2
    ldi    r21, 0
    add    r30, r20
    adc    r31, r21
    # loading array reference
    # load a two byte expression off stack
    pop    r22
    pop    r23
    # add array reference to result of indexing arithmetic
    add    r30, r22
    adc    r31, r23
    # load array element and push onto stack
    ldd    r24, Z+0
    ldd    r25, Z+1
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

    #### if statement

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

    # equality check expression
    # load a two byte expression off stack
    pop    r18
    pop    r19
    # load a two byte expression off stack
    pop    r24
    pop    r25
    cp    r24, r18
    cpc   r25, r19
    breq MJ_L22

    # result is false
MJ_L21:
    ldi     r24, 0
    jmp      MJ_L23

    # result is true
MJ_L22:
    ldi     r24, 1

    # store result of equal expression
MJ_L23:
    # push one byte expression onto stack
    push   r24

    # load condition and branch if false
    # load a one byte expression off stack
    pop    r24
    #load zero into reg
    ldi    r25, 0

    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L18
    brne   MJ_L19
    jmp    MJ_L18

    # then label for if
MJ_L19:

    # IdExp
    # load value for variable pos
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 5
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable pos
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 5
    # push one byte expression onto stack
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
    jmp    MJ_L20

    # else label for if
MJ_L18:

    # IdExp
    # load value for variable pos
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 5
    # push one byte expression onto stack
    push   r24

    # IdExp
    # load value for variable pos
    # variable is a local or param variable

    # load a one byte variable from base+offset
    ldd    r24, Y + 5
    # push one byte expression onto stack
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

    # done label for if
MJ_L20:

/* epilogue start for ArraryTest_test */
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
    .size ArraryTest_test, .-ArraryTest_test


    .text
.global ArraryTest_getElement
    .type  ArraryTest_getElement, @function
ArraryTest_getElement:
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
/* done with function ArraryTest_getElement prologue */


    # IdExp
    # load value for variable arr

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a two byte variable from base+offset
    ldd    r25, Z + 1
    ldd    r24, Z + 0
    # push two byte expression onto stack
    push   r25
    push   r24

    # IdExp
    # load value for variable index
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 4
    ldd    r24, Y + 3
    # push two byte expression onto stack
    push   r25
    push   r24

    ### ArrayExp
    # calculate the array element address by first
    # loading index
    # load a two byte expression off stack
    pop    r18
    pop    r19
    # add size in elems to self to multiply by 2
    # complements of Jason Mealler
    add    r18,r18
    adc    r19,r19
    # put index*(elem size in bytes) into r31:r30
    mov    r31, r19
    mov    r30, r18
    # want result of addressing arithmetic 
    # to be in r31:r30 for access through Z
    # index over length
    ldi    r20, 2
    ldi    r21, 0
    add    r30, r20
    adc    r31, r21
    # loading array reference
    # load a two byte expression off stack
    pop    r22
    pop    r23
    # add array reference to result of indexing arithmetic
    add    r30, r22
    adc    r31, r23
    # load array element and push onto stack
    ldd    r24, Z+0
    ldd    r25, Z+1
    # push two byte expression onto stack
    push   r25
    push   r24

/* epilogue start for ArraryTest_getElement */
    # handle return value
    # load a two byte expression off stack
    pop    r24
    pop    r25
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size ArraryTest_getElement, .-ArraryTest_getElement


    .text
.global ArraryTest_setElement
    .type  ArraryTest_setElement, @function
ArraryTest_setElement:
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
    std    Y + 4, r23
    std    Y + 3, r22
    std    Y + 6, r21
    std    Y + 5, r20
/* done with function ArraryTest_setElement prologue */


    # IdExp
    # load value for variable arr

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a two byte variable from base+offset
    ldd    r25, Z + 1
    ldd    r24, Z + 0
    # push two byte expression onto stack
    push   r25
    push   r24

    # IdExp
    # load value for variable index
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 4
    ldd    r24, Y + 3
    # push two byte expression onto stack
    push   r25
    push   r24

    # IdExp
    # load value for variable value
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 6
    ldd    r24, Y + 5
    # push two byte expression onto stack
    push   r25
    push   r24

    ### ArrayAssignStatement
    # load rhs
    # load a two byte expression off stack
    pop    r24
    pop    r25
    # calculate the array element address by first
    # loading index
    # load a two byte expression off stack
    pop    r18
    pop    r19
    # add size in elems to self to multiply by 2
    # complements of Jason Mealler
    add    r18,r18
    adc    r19,r19
    # put index*(elem size in bytes) into r31:r30
    mov    r31, r19
    mov    r30, r18
    # want result of addressing arithmetic 
    # to be in r31:r30 for access through Z
    # index over length
    ldi    r20, 2
    ldi    r21, 0
    add    r30, r20
    adc    r31, r21
    # loading array reference
    # load a two byte expression off stack
    pop    r22
    pop    r23
    # add array reference to result of indexing arithmetic
    add    r30, r22
    adc    r31, r23
    # store rhs into memory location for array element
    std    Z+0, r24
    std    Z+1, r25

/* epilogue start for ArraryTest_setElement */
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
    .size ArraryTest_setElement, .-ArraryTest_setElement


    .text
.global ArraryTest_getArr
    .type  ArraryTest_getArr, @function
ArraryTest_getArr:
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
/* done with function ArraryTest_getArr prologue */


    # IdExp
    # load value for variable arr

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a two byte variable from base+offset
    ldd    r25, Z + 1
    ldd    r24, Z + 0
    # push two byte expression onto stack
    push   r25
    push   r24

/* epilogue start for ArraryTest_getArr */
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
    .size ArraryTest_getArr, .-ArraryTest_getArr

