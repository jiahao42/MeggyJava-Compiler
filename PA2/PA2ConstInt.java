/** 
 *
 * @File:      PA2ConstInt
 * @Brief:     generates correct code for PA2 subset for setting pixels with at least 2 different constant integer expressions
 * @Created:   Oct/03/2018
 * @Author:    Jiahao Cai
 *
 */

import meggy.Meggy;

class PA2ConstInt {
  public static void main(String[] parameters) {
    Meggy.setPixel(1, 2, Meggy.Color.YELLOW);
    Meggy.setPixel(2, 3, Meggy.Color.YELLOW);
    Meggy.setPixel(3, 4, Meggy.Color.YELLOW);
    Meggy.setPixel(4, 5, Meggy.Color.YELLOW);
  }
}
