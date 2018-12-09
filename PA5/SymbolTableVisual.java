/** 
 *
 * @File:      SymbolTableVisual
 * @Brief:     To visualize Symbol Table
 * @Created:   Dec/09/2018
 * @Author:    Jiahao Cai
 *
 */


import meggy.Meggy;

class SymbolTableVisual {
  public static void main(String[] args) {
    
  }
}

class CustomType {}

class Vars {
  int a;
  byte b;
  Meggy.Color c;
  Meggy.Button d;
  CustomType e;
}

class Methods {
  public void test() {}
  public int test1() {
    return 0;
  }
  public CustomType test2() {
    return new CustomType();
  }
}

class Mixed {
  int a;
  byte b;
  public void func() {}
  public int func1() {
    return 0;
  }
}

