/** 
 *
 * @File:      PA5GrammarTest
 * @Brief:     To test PA5 Grammar
 * @Created:   Nov/25/2018
 * @Author:    Jiahao Cai
 *
 */

import meggy.Meggy;

class PA5GrammarTest {
  public static void main(String[] parameters) {
    new TestVarDecl().func(new CustomType());
  }
}

class CustomType {
  int a;
}

class TestVarDecl {
  // var declaration under class
  int a;
  byte b;
  boolean c;
  Meggy.Color color;
  Meggy.Button bt;
  Meggy.Tone tone;
  TestVarDecl t; // class type
  public int func(CustomType yo) {
    int aa;
    byte bb;
    boolean cc;
    Meggy.Color ccolor;
    Meggy.Button bbtt;
    Meggy.Tone ttone;
    TestVarDecl tt; // class type
    aa = 11;
    bb = (byte)1;
    cc = true;
    ccolor = Meggy.Color.GREEN;
    Meggy.setPixel(bb, bb, ccolor);
    // bbtt = Meggy.Button.Up; // Button Literal
    if (Meggy.checkButton(Meggy.Button.Up) == false) {
      ttone = Meggy.Tone.Cs3;
      Meggy.toneStart(ttone, aa);
    }
    return aa;
  }
}