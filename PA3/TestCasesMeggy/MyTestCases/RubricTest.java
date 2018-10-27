/** 
 *
 * @File:      RubricTest
 * @Brief:     Test According to Rubric for PA3
 * @Created:   Oct/26/2018
 * @Author:    Jiahao Cai
 *
 */

import meggy.Meggy;

class RubricTest {
  public static void main(String[] parameters) {
    // setting pixels with constant integer expressions
    // setting pixels with color literals
    Meggy.setPixel(1, 1, Meggy.Color.GREEN);

    // settingpixels with byte casting
    Meggy.setPixel((byte)2, (byte)2, Meggy.Color.GREEN);
    // sequaence  of statements with setPixel calls
    Meggy.setPixel((byte)3, (byte)3, Meggy.Color.GREEN);
    Meggy.setPixel((byte)4, (byte)4, Meggy.Color.GREEN);
    Meggy.setPixel((byte)5, (byte)5, Meggy.Color.GREEN);
    Meggy.setPixel((byte)6, (byte)6, Meggy.Color.GREEN);
    Meggy.setPixel((byte)7, (byte)7, Meggy.Color.GREEN);

    // button presses (Meggy.checkButton)
    if (Meggy.checkButton(Meggy.Button.Left) == false) {
      Meggy.setPixel((byte)1, (byte)1, Meggy.Color.GREEN);
    } else {
      Meggy.setPixel((byte)1, (byte)1, Meggy.Color.RED);
    }

    // Use of the delay function (Meggy.delay)
    Meggy.delay(100);
    Meggy.delay((byte)200); // promote byte to int here

    // functtion for reading the screen pixel values (Meggy.getPixel)
    if (Meggy.getPixel((byte)2, (byte)2) == Meggy.Color.DARK) {
      Meggy.setPixel((byte)3, (byte)3, Meggy.Color.RED);
    } else {
      Meggy.setPixel((byte)3, (byte)3, Meggy.Color.GREEN);
    }

    // while statement
    while (Meggy.getPixel((byte)3, (byte)3) == Meggy.Color.GREEN) {
      Meggy.setPixel((byte)3, (byte)3, Meggy.Color.VIOLET);
      Meggy.setPixel((byte)3, (byte)3, Meggy.Color.WHITE);
      Meggy.setPixel((byte)3, (byte)3, Meggy.Color.RED);
      // break here
      Meggy.setPixel((byte)3, (byte)3, Meggy.Color.YELLOW);
    }

    // if statement
    if (Meggy.getPixel((byte)5, (byte)5) == Meggy.Color.DARK) {
      Meggy.setPixel((byte)6, (byte)6, Meggy.Color.RED);
    } else {
      // go this way
      Meggy.setPixel((byte)6, (byte)6, Meggy.Color.GREEN);
      Meggy.setPixel((byte)6, (byte)6, Meggy.Color.WHITE);
      Meggy.setPixel((byte)6, (byte)6, Meggy.Color.GREEN);
    }

    if (Meggy.getPixel((byte)6, (byte)6) == Meggy.Color.GREEN) {
      // go this way
      Meggy.setPixel((byte)7, (byte)7, Meggy.Color.GREEN);
    }

    // byte casts
    if ((byte)(byte)(byte)-5 == ---6+10-9) {
      // go this way
      Meggy.setPixel((byte)1, (byte)1, Meggy.Color.GREEN);
    }

    // operators plush, minus, and times
    // should be (1, 1)
    Meggy.setPixel((byte)2+3-(byte)3*(byte)4- -8, (byte)((byte)2*(byte)3+-5), Meggy.Color.GREEN);
    // should be (2, 2)
    Meggy.setPixel(1-2-(byte)3*(byte)(4-5), (byte)(-2) * (byte)-1, Meggy.Color.GREEN);

    // boolean expressions
    if (Meggy.checkButton(Meggy.Button.Down) == false) {
      if ((true && false) == false) {
        Meggy.setPixel((byte)3, (byte)3, Meggy.Color.GREEN);
      }
    }
  }
}