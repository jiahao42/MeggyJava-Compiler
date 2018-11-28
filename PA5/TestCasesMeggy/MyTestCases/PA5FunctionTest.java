/** 
 *
 * @File:      PA5FunctionTest
 * @Brief:     Test new features of PA5
 * @Created:   Nov/27/2018
 * @Author:    Jiahao Cai
 *
 */


import meggy.Meggy;

class PA5FunctionTest {
  public static void main(String[] parameters) {
    new TestClassCompare().compare();
    new TestThis().func();
  }
}

class CustomType {
  int a;
}

// test class reference comparison
class TestClassCompare {
  public void compare() {
    CustomType a;
    CustomType b;
    a = new CustomType();
    b = new CustomType();
    if (a == b) { // not equal
      Meggy.setPixel((byte)1, (byte)2, Meggy.Color.RED);
    } else {
      Meggy.setPixel((byte)1, (byte)2, Meggy.Color.GREEN);
    }
    b = a;
    if (a == b) { // equal
      Meggy.setPixel((byte)1, (byte)2, Meggy.Color.GREEN);
    } else {
      Meggy.setPixel((byte)1, (byte)2, Meggy.Color.RED);
    }
  }
}

class TestThis {
  int a;
  int b;
  public void func() {
    a = 1;
    b = 2;
    this.test(this);
  }

  public void test(TestThis t) {
    if (t.getA() == 1 && t.getB() == 2) {
      Meggy.setPixel((byte)1, (byte)2, Meggy.Color.GREEN);
    } else {
      Meggy.setPixel((byte)1, (byte)2, Meggy.Color.RED);
    }
  }

  public int getA() {
    return a;
  }

  public int getB() {
    return b;
  }
}