# PA3

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