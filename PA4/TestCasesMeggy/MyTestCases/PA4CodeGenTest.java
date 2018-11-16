/** 
 *
 * @File:      PA4CodeGenTest
 * @Brief:     To test PA4 code gen
 * @Created:   Nov/10/2018
 * @Author:    Jiahao Cai
 *
 */

import meggy.Meggy;

class PA4CodeGenTest {
  public static void main(String[] parameters) {
    // new Class1().func1((byte)1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14);
    new Class1().func2((byte)1, 2);
    Meggy.toneStart(Meggy.Tone.Cs3, 10);
    // if (1 < 2) {}
    // if ((byte)1 < 2) {}
    // if ((byte)2 < (byte)1) {}
  }
}

class Class1 {
  // public int func1(byte a, int b, int c, int d, int e, int f, int g, int h, int i, int j, int k, int l, int m, int n) {
  //   return 0;
  // }
  public int func2(byte a, int b) {
    return 0;
  }
}

