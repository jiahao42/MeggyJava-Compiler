/** 
 *
 * @File:      PA4RubricTest
 * @Brief:     Test everything mentioned in PA4 Rubric
 * @Created:   Nov/24/2018
 * @Author:    Jiahao Cai
 *
 */

import meggy.Meggy;

class PA4RubricTest {
  public static void main(String[] parameters) {
    // Test meggy.toneStart
    Meggy.toneStart(Meggy.Tone.Cs3, 10);
    // Test less than operator
    if ((byte)1 < 2) { // should execute
      Meggy.setPixel((byte)1, (byte)2, Meggy.Color.GREEN);
    }
    if (2 < 1) { // should not execute
      Meggy.setPixel((byte)1, (byte)2, Meggy.Color.RED);
    }
    new Custom().func3();
  }
}

// user define class
class Custom {
  // test parameters
  public byte func1(int a, int b, byte c, byte d) {
    return (byte)(a + b + c * d);
  }

  // test return value and call expr
  public int func2() {
    Meggy.setPixel(this.func1(1, 2, (byte)1, (byte)2), this.func1(2, 1, (byte)2, (byte)2), Meggy.Color.GREEN);
    if (this.func1(1, 2, (byte)3, (byte)4) == (byte)14) {
      Meggy.setPixel((byte)2, (byte)1, Meggy.Color.GREEN);
    }
    return 0;
  }

  // test call statement
  public void func3() {
    this.func2();
    new Custom().func2();
  }
}


