/** 
 *
 * @File:      PA4Test2
 * @Brief:     Test code for PA4
 * @Created:   Sep/09/2018
 * @Author:    Jiahao Cai
 *
 */

import meggy.Meggy;

// 1. Test function definition
// 2. Test function calls
// 3. Test this

class PA4Test2 {
  public static void main(String[] parameters) {
    new MultiClassTest1().sameNameFunction();
    new MultiClassTest2().sameNameFunction();
    new MultiClassTest3().sameNameFunction();
    Meggy.toneStart(Meggy.Tone.As3, 10);
    Meggy.toneStart(Meggy.Tone.C3, 10);
    Meggy.toneStart(Meggy.Tone.C3, 10);
    Meggy.toneStart(Meggy.Tone.Cs3, 10);
    Meggy.toneStart(Meggy.Tone.Ds3, 10);
    Meggy.toneStart(Meggy.Tone.D3, 10);
    Meggy.toneStart(Meggy.Tone.B3, 10);
    Meggy.setPixel((byte)1, (byte)3, Meggy.Color.VIOLET);
  }
}

class MultiClassTest1 {
  public int testThis() {
    return new MultiClassTest2().sameNameFunction();
  }
  public int sameNameFunction() {
    return this.testThis();
  }
}

class MultiClassTest2 {
    public int testThis() {
    return new MultiClassTest3().sameNameFunction();
  }
  public int sameNameFunction() {
    return this.testThis();
  }

}

class MultiClassTest3 {
  public int testThis() {
    return 0;
  }
  public int sameNameFunction() {
    return this.testThis();
  }
}

/*
class MultiClassTest1 {
  public int sameNameFunction() {
    return this.testThis();
  }
  public int testThis() {
    return new MultiClassTest2().sameNameFunction();
  }
}

class MultiClassTest2 {
  public int sameNameFunction() {
    return this.testThis();
  }
  public int testThis() {
    return new MultiClassTest3().sameNameFunction();
  }
}

class MultiClassTest3 {
  public int sameNameFunction() {
    return this.testThis();
  }
  public int testThis() {
    return 0;
  }
}
*/