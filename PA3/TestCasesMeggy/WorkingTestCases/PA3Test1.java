/** 
 *
 * @File:      PA3Test1
 * @Brief:     Test code for PA3
 * @Created:   Sep/08/2018
 * @Author:    Jiahao Cai
 *
 */

import meggy.Meggy;

// 1. Test built-in Meggy functionality
// 2. Test arithmetic expressions
// 3. Test boolean expressions
class PA3Test1 {
  public static void main(String[] parameters) {
    Meggy.setPixel((byte)1, (byte)2, Meggy.Color.BLUE);
    Meggy.delay(1 + 2 - (-3) - 4);
    if (Meggy.getPixel((byte)4, (byte)5) == Meggy.Color.DARK) {
      Meggy.setPixel((byte)2, (byte)3, Meggy.Color.YELLOW);
    }
    if (Meggy.checkButton(Meggy.Button.Up) == true) {}
  }
}
