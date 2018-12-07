/** 
 *
 * @File:      PA6GrammarTest
 * @Brief:     Test PA6 Grammar
 * @Created:   Dec/06/2018
 * @Author:    Jiahao Cai
 *
 */


import meggy.Meggy;

class PA6GrammarTest {
  public static void main(String[] parameters) {
    new ArraryTest().test();
  }
}

class ArraryTest {
  int[] arr;
  public void init(int len) {
    arr = new int[len];
  }
  public void test() {
    int i;
    byte pos;
    pos = (byte)0;
    this.init(5); // with this
    i = 0;
    while (i < 5) {
      this.setElement(i, i); // without this
      if (this.getElement(i) == i) {
        Meggy.setPixel(pos, pos, Meggy.Color.GREEN);
      } else {
        Meggy.setPixel(pos, pos, Meggy.Color.RED);
      }
    }
    if (arr.length == 5) {
      Meggy.setPixel(pos, pos, Meggy.Color.GREEN);
    } else {
      Meggy.setPixel(pos, pos, Meggy.Color.RED);
    }
    i = this.getArr()[1];
    if (i == 1) {
      Meggy.setPixel(pos, pos, Meggy.Color.GREEN);
    } else {
      Meggy.setPixel(pos, pos, Meggy.Color.RED);
    }
  }
  public int getElement(int index) {
    return arr[index];
  }
  public void setElement(int index, int value) {
    arr[index] = value;
  }
  public int[] getArr() {
    return arr;
  }
}