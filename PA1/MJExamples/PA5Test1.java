/** 
 *
 * @File:      PA5Test1
 * @Brief:     Test code for PA5
 * @Created:   Sep/09/2018
 * @Author:    Jiahao Cai
 *
 */

import meggy.Meggy;

// 1. Test variable declarations
// 2. Test assignment statements
// 3. Test object creation

class PA5Test1 {
  public static void main(String[] parameters) {
    new TestObjectCreation().testObjectCreation();
  }
}

class ThisIsAType {

}

class TestVarDeclare {
  public void testVar() {
    boolean b;
    byte bt;
    int i;
    Meggy.Color c;
    Meggy.Button btn;
    Meggy.Tone t;
    ThisIsAType customType;
  }
}

class TestAssign {
  public void testAssign() {
    int a;
    int b;
    b = a;
    a = -b;
    a = (a + b - a + (-b));
  }
}

class TestObjectCreation {
  public void testObjectCreation() {
    TestAssign t;
    TestVarDeclare v;
    t = new TestAssign();
    t.testAssign();
    v = new TestVarDeclare();
    v.testVar();
  }
}