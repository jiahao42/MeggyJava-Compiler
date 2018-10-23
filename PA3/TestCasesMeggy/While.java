/** 
 *
 * @File:      If
 * @Brief:     Test syntax for while loop
 * @Created:   Oct/22/2018
 * @Author:    Jiahao Cai
 *
 */


import meggy.Meggy;

class While {
	public static void main(String[] whatever) {
		Meggy.setPixel((byte)1 ,(byte)2, Meggy.Color.RED);
		while (Meggy.getPixel((byte)1, (byte)2) == Meggy.Color.RED) {
			Meggy.setPixel((byte)7 ,(byte)7, Meggy.Color.GREEN);
			Meggy.setPixel((byte)6 ,(byte)6, Meggy.Color.YELLOW);
			Meggy.setPixel((byte)5 ,(byte)5, Meggy.Color.VIOLET);
			Meggy.setPixel((byte)1 ,(byte)2, Meggy.Color.WHITE); // break the loop
		}

		// out of while!
		Meggy.setPixel((byte)1 ,(byte)2, Meggy.Color.GREEN);
	}
}
