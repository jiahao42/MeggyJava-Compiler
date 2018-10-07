/** 
 *
 * @File:      PA2ConstColor
 * @Brief:     generates correct code for PA2 subset for setting pixels with at least 2 different color literals
 * @Created:   Oct/03/2018
 * @Author:    Jiahao Cai
 *
 */

import meggy.Meggy;

class PA2ConstColor {
  public static void main(String[] parameters) {
    Meggy.setPixel((byte)2, (byte)3, Meggy.Color.YELLOW);
    Meggy.setPixel((byte)2, (byte)3, Meggy.Color.RED);
    Meggy.setPixel((byte)2, (byte)3, Meggy.Color.ORANGE);
    Meggy.setPixel((byte)2, (byte)3, Meggy.Color.WHITE);
  }
}
