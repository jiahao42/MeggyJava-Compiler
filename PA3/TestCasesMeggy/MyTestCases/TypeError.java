/** 
 *
 * @File:      PA2Test1
 * @Brief:     Test code for PA2
 * @Created:   Sep/08/2018
 * @Author:    Jiahao Cai
 *
 */

import meggy.Meggy;

class TypeError {
  public static void main(String[] parameters) {
    Meggy.setPixel(Meggy.Color.WHITE, (byte)2, Meggy.Color.YELLOW);
    if (Meggy.checkButton((byte)1)) {
      if (Meggy.checkButton(Meggy.Button.Left) == 1)
        if (Meggy.getPixel(1, 2) == 3) {

        }
    }
  }
}


