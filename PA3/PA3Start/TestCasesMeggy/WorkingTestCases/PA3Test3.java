/** 
 *
 * @File:      PA3Test3
 * @Brief:     Test code for PA3
 * @Created:   Sep/08/2018
 * @Author:    Jiahao Cai
 *
 */

import meggy.Meggy;

// 1. Test identifier
// 2. Test if with else
// 3. Test true & false

class PA3Test3 {
  public static void main(String[] _1_A_d_Z_0_test_identifier) {
    if (Meggy.getPixel((byte)4, (byte)5) == Meggy.Color.DARK && true && false) {
      Meggy.setPixel((byte)(4 + 1), (byte)(5 - 1), Meggy.Color.DARK);
    } else {
      Meggy.setPixel((byte)2, (byte)3, Meggy.Color.YELLOW);
    }
  }
}