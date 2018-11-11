/** 
 *
 * @File:      PA4GrammarTest
 * @Brief:     To test PA4 grammar for JCup
 * @Created:   Nov/10/2018
 * @Author:    Jiahao Cai
 *
 */

import meggy.Meggy;

class PA4GrammarTest {
  public static void main(String[] parameters) {
    
  }
}

class Class1 {
  public void method1() {

  }

  public int method2(byte a, byte b, int c, Meggy.Color d) {
    Meggy.toneStart(Meggy.Tone.As3, 10);
    new Class2().method3(1);
    new Class2().method4(1, 2);
    new Class2().method5();
    return a;
  }

}

class Class2 {
  public void test() {
    this.method3(1);
    this.method4(1, 2);
    this.method5();
  }
  public void method3(int _var__int__a) {

  }
  public void method4(int a, int b) {

  }

  public void method5() {

  }
}

class Class3 {

}