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
  }
}

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