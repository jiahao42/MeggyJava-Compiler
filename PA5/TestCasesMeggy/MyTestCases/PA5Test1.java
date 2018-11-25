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
    new SwitchPixel().switchPixel((byte)1, (byte)2, (byte)3, (byte)4);
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
    a = 0;
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

class SwitchPixel {
  public void switchPixel(byte x0, byte y0, byte x1, byte y1) {
    Meggy.Color c;
    c = Meggy.getPixel(x0, y0);
    Meggy.setPixel(x0, y0, Meggy.getPixel(x1, x1));
    Meggy.setPixel(x1, y1, c);
  }
}