/** 
 *
 * @File:      Test
 * @Brief:     Test for dot files
 * @Created:   Dec/09/2018
 * @Author:    Jiahao Cai
 *
 */

import meggy.Meggy;

class Test {
  public static void main(String[] args) {
    new RandomTest().func(5, true, (byte)0);
  }
}

class CustomType {
  int local;
}

class RandomTest {
  int a;
  byte b;
  boolean c;
  Meggy.Color color;
  Meggy.Button button;
  public int func(int aa, boolean cc, byte bb) {
    a = aa;
    b = bb;
    c = cc;
    this.recursive(a);
    return 0;
  }
  public void recursive(int a) {
    a = a - 1;
    if (a < 0) {
      this.recursive(a);
    }
  }
}