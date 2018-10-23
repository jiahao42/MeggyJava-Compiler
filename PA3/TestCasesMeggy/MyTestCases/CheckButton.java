/** 
 *
 * @File:      If
 * @Brief:     Test syntax for CheckButton
 * @Created:   Oct/20/2018
 * @Author:    Jiahao Cai
 *
 */


import meggy.Meggy;

class CheckButton {
	public static void main(String[] whatever) {
		if (Meggy.checkButton(Meggy.Button.Down) == Meggy.checkButton(Meggy.Button.Down)) {
			Meggy.setPixel((byte) 6, (byte) 5, Meggy.Color.GREEN);
		} else {
			Meggy.setPixel((byte) 6, (byte) 5, Meggy.Color.RED);
		}

		if (Meggy.checkButton(Meggy.Button.Left) == Meggy.checkButton(Meggy.Button.Up)) {
			Meggy.setPixel((byte) 6, (byte) 5, Meggy.Color.GREEN);
		} else {
			Meggy.setPixel((byte) 6, (byte) 5, Meggy.Color.RED);
		}
	}
}
