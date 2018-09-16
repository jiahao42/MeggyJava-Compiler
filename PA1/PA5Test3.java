/** 
 *
 * @File:      PA5Test3
 * @Brief:     Test code for PA5
 * @Created:   Sep/09/2018
 * @Author:    Jiahao Cai
 *
 */

import meggy.Meggy;

class PA5Test3 {
  public static void main(String[] parameters) {
    new MixedTest().mixedTestOne(); 
    new TestTimes().test();
  }
}

class MixedTest {
  public void mixedTestOne() {
    MeggyHelper _This_1s_a_1dentifi3r;
    _This_1s_a_1dentifi3r = new MeggyHelper();
    _This_1s_a_1dentifi3r.setColorByLine(2, Meggy.Color.YELLOW);
    _This_1s_a_1dentifi3r.sing();
    _This_1s_a_1dentifi3r.comparePixel((byte)0, (byte)1, (byte)2, (byte)3);
  }
}

class MeggyHelper {
  public void setColorByLine(int l, Meggy.Color c) {
    int i;
    i = 0;
    while (i < 8) {
      Meggy.setPixel((byte)i, (byte)l, c);
      i = i + 1;
    }
  }

  public void sing() {
    int i;
    int duration;
    i = 0;
    duration = 30;
    while (i < 10) {
      Meggy.toneStart(Meggy.Tone.C3, duration);
      Meggy.delay(5);
      Meggy.toneStart(Meggy.Tone.Cs3, duration);
      Meggy.delay(5);
      Meggy.toneStart(Meggy.Tone.D3, duration);
      Meggy.delay(5);
      Meggy.toneStart(Meggy.Tone.Ds3, duration);
      Meggy.delay(5);
      Meggy.toneStart(Meggy.Tone.E3, duration);
      Meggy.delay(5);
      Meggy.toneStart(Meggy.Tone.F3, duration);
      Meggy.delay(5);
      Meggy.toneStart(Meggy.Tone.Fs3, duration);
      Meggy.delay(5);
      Meggy.toneStart(Meggy.Tone.G3, duration);
      Meggy.delay(5);
      Meggy.toneStart(Meggy.Tone.Gs3, duration);
      Meggy.delay(5);
      Meggy.toneStart(Meggy.Tone.A3, duration);
      Meggy.delay(5);
      Meggy.toneStart(Meggy.Tone.As3, duration);
      Meggy.delay(5);
      Meggy.toneStart(Meggy.Tone.B3, duration);      
      Meggy.delay(5);
    }
  }

  public boolean comparePixel(byte x0, byte y0, byte x1, byte y1) {
    boolean res;
    if (Meggy.getPixel(x0, y0) == Meggy.getPixel(x1, y1)) {
      res = true;
    } else {
      res = false;
    }
    return res;
  }
}

class TestTimes {
  int a;
  public void test() {
    // a = 1 * 2;
  }
}
