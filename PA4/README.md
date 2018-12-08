# PA4

Dear Mary and TA:

This compiler can pass all the testcases under `PA4/TestCasesMeggy/WorkingTestCases` and `PA4/TestCasesMeggy/WorkingErrorTestCases`, including:

```
WorkingTestCases
├── PA4MazeSolver.java
├── PA4RubricTest.java
├── PA4Test1.java
├── PA4Test2.java
├── PA4Test3.java
├── PA4bluedot.java
└── PA4raindrop.java

0 directories, 7 files

WorkingErrorTestCases
├── PA4doubleDef.java
├── PA4noDef.java
├── PA4tooManyParams.java
└── PA4varNoDef.java

0 directories, 4 files
```

Also, it can detect syntax error and generate error message, for example:
* undefined class/functions/variables, e.g.
    * `[23,5] Name [Custom] is not defined under scope PA4RubricTest`
    * `[14,2] Method setPix is not defined under scope C`
    * `[21,16] ID [z] is not defined under scope setP`
* multi-defined class/functions/variables, e.g.
    * `[50,7] Class [Custom] is already defined in scope global`
    * `[25,17] Method [setP] is already defined in scope C`
    * `[30,15] Formal [d] is  already defined in scope func1`
* invalid operand type for operator, e.g.
    * `[31,11] Invalid operands type for operator ==, expect same type on left and right, left: INT, right: BOOL`
* invalid parameter types for built-in method, e.g.
    * `[38,7] Invalid parameter types for Meggy.setPixel, expect: (BYTE, BYTE, COLOR), actual: (BYTE, BYTE, TONE)`
* invalid number of parameters for custom method, e.g.
    * `[36,20] Calling method [func1] with wrong number of parameters, expect: (INT,INT,BYTE,BYTE), actual: (INT,INT,BYTE)`
* invalid type of parameters for custom method, e.g.
    * `[36,20] Calling method [func1] with wrong type of parameters, expect: (INT,INT,BYTE,BYTE), actual: (INT,INT,BYTE,INT)`
* conflict between declared return type and the actual return type in a method, e.g.
    * `[35,14] Invalid return type for Method[35], expect: INT, actual: VOID`

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

