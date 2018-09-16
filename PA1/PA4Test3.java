/** 
 *
 * @File:      PA4Test3
 * @Brief:     Test code for PA4
 * @Created:   Sep/09/2018
 * @Author:    Jiahao Cai
 *
 */

import meggy.Meggy;

// 1. Test return experssion
// 2. Test new identifier
// 3. Test new introduced Meggy functions

class PA4Test3 {
  public static void main(String[] parameters) {
    new MixedTest().SetLineColor(1, Meggy.Color.RED);
    Meggy.toneStart(Meggy.Tone.Cs3, 10 + 3);
    if (Meggy.checkButton(Meggy.Button.Left) == true) {
      new MixedTest().safeSetPixel((byte)1, (byte)2, Meggy.Color.BLUE);
    } else {
      new MixedTest().safeSwitchPixel((byte)2, (byte)3, (byte)3, (byte)4);
    }
  }
}

class MixedTest {
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

  public boolean boundary_guard(byte x, byte y) {
    return ((byte) (0 - 1) < x) && (x < (byte) 8) && ((byte) (0 - 1) < y) && (y < (byte) 8);
  }

  public void safeSetPixel(byte x, byte y, Meggy.Color c) {
    if (this.boundary_guard(x, y) == true)
      Meggy.setPixel(x, y, c);
  }

  public void safeSwitchPixel(byte x1, byte y1, byte x2, byte y2) {
    if (this.boundary_guard(x1, y1) && this.boundary_guard(x2, y2))
      Meggy.setPixel((byte)7 ,(byte)7, Meggy.getPixel(x1, y1));
      Meggy.setPixel(x1, y1, Meggy.getPixel(x2, y2));
      Meggy.setPixel(x2, x2, Meggy.getPixel((byte)7 ,(byte)7));
      Meggy.setPixel((byte)7 ,(byte)7, Meggy.Color.DARK);
  }
}