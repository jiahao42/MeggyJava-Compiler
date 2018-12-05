/** 
 *
 * @File:      PA5RubricTest
 * @Brief:     Test according to PA5 Rubric
 * @Created:   Dec/05/2018
 * @Author:    Jiahao Cai
 *
 */


import meggy.Meggy;

class PA5RubricTest {
  public static void main(String[] parameters) {
    // new class objects
    new TestThis().testThis();
  }
}

class TestThis {
  int a;
  int b;
  public void testThis() {
    // local var definition
    int local;
    // test member var
    this.getVar(a, b);
    a = 1;
    b = 2;
    if (a == b) {
      Meggy.setPixel((byte)a, (byte)b, Meggy.Color.RED);
    } else {
      Meggy.setPixel((byte)a, (byte)b, Meggy.Color.GREEN);
    }
    // test use of local
    local = 1;
    if (a == local) {
      Meggy.setPixel((byte)a, (byte)b, Meggy.Color.GREEN);
    } else {
      Meggy.setPixel((byte)a, (byte)b, Meggy.Color.RED);
    }
  }

  public int getVar(int a, int b) {
    return a + b;
  }

  public void testClassComparison() {
    Dummy d1;
    Dummy d2;
    d1 = new Dummy();
    d2 = new Dummy();
    if (d1 == d2) {
      Meggy.setPixel((byte)a, (byte)b, Meggy.Color.RED);
    } else {
      Meggy.setPixel((byte)a, (byte)b, Meggy.Color.GREEN);
    }
    d1 = d2;
    if (d1 == d2) {
      Meggy.setPixel((byte)a, (byte)b, Meggy.Color.GREEN);
    } else {
      Meggy.setPixel((byte)a, (byte)b, Meggy.Color.RED);
    }
  }
}

class Dummy {

}