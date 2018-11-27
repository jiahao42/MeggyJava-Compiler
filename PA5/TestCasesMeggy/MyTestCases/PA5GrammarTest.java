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
    new TestVarDecl().func(new CustomType(), 1);
  }
}

class CustomType {
  
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
  public int func(CustomType yo, int zzz) {
    int aa;
    byte bb;
    boolean cc;
    Meggy.Color ccolor;
    Meggy.Button bbtt;
    Meggy.Tone ttone;
    TestVarDecl tt; // class type
    zzz = 1;
    aa = 1;
    bb = (byte)1;
    cc = true;
    ccolor = Meggy.Color.GREEN;
    // bbtt = Meggy.Button.Up;
    ttone = Meggy.Tone.Cs3;
    return aa;
  }
}