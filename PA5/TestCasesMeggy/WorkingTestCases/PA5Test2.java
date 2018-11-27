/** 
 *
 * @File:      PA5Test2
 * @Brief:     Test code for PA5
 * @Created:   Sep/09/2018
 * @Author:    Jiahao Cai
 *
 */

import meggy.Meggy;

// 1. Test long var declaration list
// 2. Test nested while loop
// 3. Test var declaration in class

class PA5Test2 {
  public static void main(String[] parameters) {
    new TestLongVarDeclareList().testLongVarDeclareList(
      (byte)1,
      true,
      Meggy.Color.DARK,
      Meggy.Button.Up,
      Meggy.Tone.C3,
      new CustomType(),
      0,1,2,3,4,5
    );
    new TestNestedWhileLoop().testNestedWhileLoop();
    new TestVarDeclareInClass().testVarDeclareInClass();
  }
}

class CustomType {}

class TestLongVarDeclareList {
  public int testLongVarDeclareList(
    byte b,
    boolean bl,
    Meggy.Color c,
    Meggy.Button btn,
    Meggy.Tone t,
    CustomType myType,
    int i,
    int ii,
    int iii,
    int iiii,
    int iiiii,
    int iiiiii
    ) {
    return i + ii + iii + iiii + iiiii + iiiiii;
  }
}

class TestNestedWhileLoop {
  public void testNestedWhileLoop() {
    while (true) {
      while (true) {
        while (true) {
          while (true) {
            while (true) {
              while (true) {
                while (true) {
                  Meggy.setPixel((byte)1, (byte)2, Meggy.Color.DARK);
                }
              }
            }
          }
        }
      }
    }
  }
}

class TestVarDeclareInClass {
  int a;
  int b;
  public void testVarDeclareInClass() {
    a = a + b + a;
  }
}