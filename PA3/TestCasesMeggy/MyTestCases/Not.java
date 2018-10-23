/** 
 *
 * @File:      If
 * @Brief:     Test syntax for not
 * @Created:   Oct/20/2018
 * @Author:    Jiahao Cai
 *
 */


import meggy.Meggy;

class Not {
	public static void main(String[] whatever) {
		if (!((byte) 3 == (byte) 2)) { // Should execute
			Meggy.setPixel((byte) 6, (byte) 5, Meggy.Color.GREEN);
		} else {
			Meggy.setPixel((byte) 6, (byte) 5, Meggy.Color.RED);
		}

		if (!((byte) 2 == (byte) 2))  // Should not execute
			Meggy.setPixel((byte) 5, (byte) 6, Meggy.Color.RED);
		else
			Meggy.setPixel((byte) 5, (byte) 6, Meggy.Color.GREEN);

		if (!(Meggy.getPixel((byte)1, (byte)2) == Meggy.Color.RED))
			Meggy.setPixel((byte) 6, (byte) 5, Meggy.Color.GREEN);
		else
			Meggy.setPixel((byte) 3, (byte) 2, Meggy.Color.YELLOW);

		while (!(Meggy.getPixel((byte)1, (byte)2) == Meggy.Color.RED)) {
			Meggy.setPixel((byte)7 ,(byte)7, Meggy.Color.GREEN);
			Meggy.setPixel((byte)6 ,(byte)6, Meggy.Color.YELLOW);
			Meggy.setPixel((byte)5 ,(byte)5, Meggy.Color.VIOLET);
			Meggy.setPixel((byte)1 ,(byte)2, Meggy.Color.RED); // break the loop
		}

	}
}
