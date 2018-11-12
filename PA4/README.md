# CS6620 - PA4

## Basic info 

* GitHub username: jiahao42
* email: jc4mf@virginia.edu

## Info about PA4


### Hightlight

* Problem about the original Compiler

There is 26 registers in total (r0 - r25), which means a method can have at most 13 parameters (including `this`), but the orginal compiler doesn't check it. 

Giving the following code

```Java
new Class1().func1(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14);
```

It will generate wrong code:

```assembly
    #### function call
    # put parameter values into appropriate registers
    # load a two byte expression off stack
    pop    r-4
    pop    r-3
    # load a two byte expression off stack
    pop    r-2
    pop    r-1
    # load a two byte expression off stack
    pop    r0
    pop    r1
    # load a two byte expression off stack
    pop    r2
    pop    r3
    # load a two byte expression off stack
    pop    r4
    pop    r5
    # load a two byte expression off stack
    pop    r6
    pop    r7
    # load a two byte expression off stack
    pop    r8
    pop    r9
    # load a two byte expression off stack
    pop    r10
    pop    r11
    # load a two byte expression off stack
    pop    r12
    pop    r13
    # load a two byte expression off stack
    pop    r14
    pop    r15
    # load a two byte expression off stack
    pop    r16
    pop    r17
    # load a two byte expression off stack
    pop    r18
    pop    r19
    # load a two byte expression off stack
    pop    r20
    pop    r21
    # load a one byte expression off stack
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    Class1_func1
```