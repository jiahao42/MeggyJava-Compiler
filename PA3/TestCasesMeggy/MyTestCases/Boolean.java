/** 
 *
 * @File:      If
 * @Brief:     Test syntax for not
 * @Created:   Oct/20/2018
 * @Author:    Jiahao Cai
 *
 */


import meggy.Meggy;

class Boolean {
	public static void main(String[] whatever) {
		if (true) { // GREEN
			Meggy.setPixel((byte) 6, (byte) 5, Meggy.Color.GREEN);
		} else {
			Meggy.setPixel((byte) 6, (byte) 5, Meggy.Color.RED);
		}

		if (false)  // GREEN
			Meggy.setPixel((byte) 5, (byte) 6, Meggy.Color.RED);
		else
			Meggy.setPixel((byte) 5, (byte) 6, Meggy.Color.GREEN);

		if (!false)  // GREEN
			Meggy.setPixel((byte) 5, (byte) 6, Meggy.Color.GREEN);
		else
			Meggy.setPixel((byte) 5, (byte) 6, Meggy.Color.RED);

		if (true == false)  // GREEN
			Meggy.setPixel((byte) 5, (byte) 6, Meggy.Color.RED);
		else
			Meggy.setPixel((byte) 5, (byte) 6, Meggy.Color.GREEN);

		if ((Meggy.getPixel((byte)1, (byte)2) == Meggy.Color.RED) == false) // GREEN
			Meggy.setPixel((byte) 6, (byte) 5, Meggy.Color.GREEN);
		else
			Meggy.setPixel((byte) 3, (byte) 2, Meggy.Color.YELLOW);
		
	}
}
