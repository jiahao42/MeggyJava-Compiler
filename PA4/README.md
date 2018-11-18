# CS6620 - PA4

## Basic info 

* GitHub username: jiahao42
* email: jc4mf@virginia.edu

## Info about PA4

Dear Mary and TA:

This compiler can pass all the testcases under `PA4/TestCasesMeggy/WorkingTestCases` and `PA4/TestCasesMeggy/WorkingErrorTestCases`, including:

```
WorkingTestCases
├── PA4MazeSolver.java
├── PA4Test1.java
├── PA4Test2.java
├── PA4Test3.java
├── PA4bluedot.java
└── PA4raindrop.java

0 directories, 8 files

WorkingErrorTestCases
├── PA4doubleDef.java
├── PA4noDef.java
├── PA4tooManyParams.java
└── PA4varNoDef.java

0 directories, 4 files
```

Also, it can detect undefined functions/variables and multi-defined functions/variables, it will generate error messages like:

```
[14,2] Method setPix is not defined under scope C
[25,17] Method [setP] is already defined in scope C
[21,16] ID [z] is not defined under scope setP
```

### Hightlight

* Problem about the original Compiler

There are 26 registers in total (r0 - r25), which means a method can have at most 13 parameters (including `this`), but the orginal compiler doesn't check it. 

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
    ......
    # load a one byte expression off stack
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    Class1_func1
```

My compiler will generate error message for the function above:

```
[19,14] Method [func1(BYTE,INT,INT,INT,INT,INT,INT,INT,INT,INT,INT,INT,INT,INT) returns INT] under scope Class1has too many parameters (at most 12)
```

