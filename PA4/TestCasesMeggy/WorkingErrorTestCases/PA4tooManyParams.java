/** 
 *
 * @File:      PA4tooManyParams
 * @Brief:     Too many params
 * @Created:   Nov/10/2018
 * @Author:    Jiahao Cai
 *
 */

import meggy.Meggy;

class PA4tooManyParams {
  public static void main(String[] parameters) {
    new Class1().func1((byte)1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14);
  }
}

class Class1 {
  public int func1(byte a, int b, int c, int d, int e, int f, int g, int h, int i, int j, int k, int l, int m, int n) {
    return 0;
  }
}