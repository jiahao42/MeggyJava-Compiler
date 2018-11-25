# UVA-CS6620
UVA CS6620 Compiler

## Basic info 

* GitHub username: jiahao42
* email: jc4mf@virginia.edu

## Info about PA4

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


## Info about PA3

Dear Mary and TA:

There are some potential problems while testing the compiler, but it is not because the compiler is not correct, for example:

* Consider `Meggy.setPixel(1, 1, Meggy.Color.GREEN);`, the Java compiler will refuse to compile this statement because it wouldn't allow int-to-byte conversion. My compiler will allow this, which follows the design of the original `MJ.jar`.
  * My compiler will output warning when converting int to byte, e.g. `[16,20]: Warning: Demoting a INT to BYTE, may lose precision here...`

* In the file `PA2error.java`, the Java compiler will output several errors at one time, but my compiler will only output the first error it encounters and then exit, which also follows the design of the original `MJ.jar`.

Except things above, this compiler meets all the requirements in the PA3 Rubric, it can correctly generate code for every test case under folder `PA3/TestCasesMeggy/WorkingTestCases`. You can run `./regress.sh ` under `PA3/TestCasesMeggy` to auto test all the test cases. Beside the test cases below, I have an extra test case called `PA3/TestCasesMeggy/MyTestCases/RubricTest.java`, which test everything mentioned in `PA3 Rubric`.

```plaintext
PA3/TestCasesMeggy/WorkingTestCases
├── AndExpr.java
├── Byte.java
├── CheckButton.java
├── CondExpr.java
├── Delay.java
├── GetPixel.java
├── If.java
├── IfStmt.java
├── Not.java
├── PA2ConstColor.java
├── PA2EmptyStatement.java
├── PA2FlowerSimple.java
├── PA2Test1.java
├── PA2bluedot.java
├── PA3Cylon.java
├── PA3Expressions.java
├── PA3Test1.java
├── PA3Test2.java
├── PA3Test3.java
├── PA3buttondot.java
├── PA3ifdots.java
├── While.java
└── meggy
    ├── Meggy.java
    ├── MeggyException.java
    ├── MeggyTest.java
    ├── arg_opts
    └── junit-4.8.2.jar

1 directory, 28 files
```

Thanks.

-Jiahao

## Info about PA2

Dear Mary and TA,

There is a problem with current compiler, as the PA2 Rubric says, we will **generate correct code for PA2 subset for setting pixels with at least 2 different constant integer expressions**, but the function `Meggy.setPixel` should accept two bytes and one color literal instead of two integer literals and one color literal, and we haven't been asked to implement type checking yet. So the following code is not working with current compiler. Furthermore, I tried this snippet of code with MJ.jar and Meggy Jr: MJ.jar cannot compile it while Meggy Jr can run this Assembly code, but the result is wrong.

```java
import meggy.Meggy;

class PA2ConstInt {
  public static void main(String[] parameters) {
    Meggy.setPixel(1, 2, Meggy.Color.YELLOW);
    Meggy.setPixel(2, 3, Meggy.Color.YELLOW);
    Meggy.setPixel(3, 4, Meggy.Color.YELLOW);
    Meggy.setPixel(4, 5, Meggy.Color.YELLOW);
  }
}
```

I add some test files for tokens, including,

* assign.in & assign.in.OK: used to test operator '='
* brace.in & brace.in.OK: used to test '{' and '}'
* bracket.in & bracket.in.OK: used to test '[' and ']'
* comma.in & comma.in.OK: used to test ','
* err_resrv.in & err_resrv.in.OK: used to test wrong reserve words
* int.in & int.in.OK: used to test integer literals
* lt.in & lt.in.OK: used to test '<'
* minus.in & minus.in.OK: used to test '-'
* not.in & not.in.OK: used to test '!'
* paren.in & paren.in.OK: used to test '(' and ')'
* semi.in & semi.in.OK: used to test ';'
* times.in & times.in.OK: used to test '*'

There also some test files for Java:

* PA2ConstColor.java: setting pixels with some different color literals
* PA2ConstInt.java: setting pixels with some 2 different constant integer expressions, this file is unable to compile because of the type conflict.
* PA2Test1.java: setting pixels with byte casting
* PA2FlowerSimple.java: including more than 10 setPixel calls
* PA2Smallest.java: the smallest possible MeggyJava program, no statements
* PA2AwesomeTest.java: a integreted test for PA2

If you have installed GNU Make, then you can use my `makefile` to simplify your work.

* `make --file=my_makefile`: You can compile all the Java code to AVR Assembly and run them with MJSIM.jar at one time.

* `make --file=my_makefile clean`: you can remove all the generated files (.s).

I hope it can reduce your work :)

-Jiahao


## Info about PA1

Dear Mary and TA,

If you have installed GNU Make, then you can use my `makefile` to simplify your work.

* `make` or `make dot`: Just simply run `make` under the folder `PA1/`, you shall be able to compile all the test cases from PA2 to PA5 into `dot` files at one time.

* `make run`: If you run `make run` under the folder `PA1/`, you shall be able to compile all the test cases from PA2 to PA5 into `class` files and run them at one time.

* `make clean`: you can use `make clean` to remove all the generated files (.dot and .class).

I hope it can reduce your work :)

-Jiahao


