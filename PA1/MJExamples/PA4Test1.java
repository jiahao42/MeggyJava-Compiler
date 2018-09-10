
/** 
 *
 * @File:      PA4Test4
 * @Brief:     Test code for PA4
 * @Created:   Sep/09/2018
 * @Author:    Jiahao Cai
 *
 */

import meggy.Meggy;
// import meggy.Meggy.Color;

class PA4Test1 {
  public static void main(String[] parameters) {
    new MeggyHelper().SetLineColor(1, Meggy.Color.RED);
  }
}

class MeggyHelper {
  public void SetLineColor(int line, Meggy.Color color) {
    if (line < 8) {
      Meggy.setPixel((byte) 0, (byte) line, color);
      Meggy.setPixel((byte) 1, (byte) line, color);
      Meggy.setPixel((byte) 2, (byte) line, color);
      Meggy.setPixel((byte) 3, (byte) line, color);
      Meggy.setPixel((byte) 4, (byte) line, color);
      Meggy.setPixel((byte) 5, (byte) line, color);
      Meggy.setPixel((byte) 6, (byte) line, color);
      Meggy.setPixel((byte) 7, (byte) line, color);
    }
  }

  public boolean inBounds(byte x, byte y) {
    return ((byte) (0 - 1) < x) && (x < (byte) 8) && ((byte) (0 - 1) < y) && (y < (byte) 8);
  }
}