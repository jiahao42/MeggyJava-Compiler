/** 
 *
 * @File:      PA3Test2
 * @Brief:     Test code for PA3
 * @Created:   Sep/08/2018
 * @Author:    Jiahao Cai
 *
 */


import meggy.Meggy;

// 1. Test if without else
// 2. Test while
// 3. Test operator !
class PA3Test2 {
  public static void main(String[] parameters) {
    if ((Meggy.getPixel((byte)1, (byte)2) == Meggy.Color.YELLOW) && (Meggy.getPixel((byte)2, (byte)3) == Meggy.Color.YELLOW)) {
      while (true) {
        if (!Meggy.checkButton(Meggy.Button.Down)) {
          Meggy.setPixel((byte)1, (byte)1, Meggy.getPixel((byte)2, (byte)3));
        }
      }
    }
  }
}