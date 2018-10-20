/** 
 *
 * @File:      If
 * @Brief:     Test syntax for if
 * @Created:   Oct/20/2018
 * @Author:    Jiahao Cai
 *
 */


import meggy.Meggy;

class If {
	public static void main(String[] whatever) {
		if ((byte) 2 == (byte) 2) { // Single if with brace
			Meggy.setPixel((byte) 6, (byte) 5, Meggy.Color.GREEN);
		}

		if ((byte) 2 == (byte) 2)  // Single if without brace
			Meggy.setPixel((byte) 6, (byte) 5, Meggy.Color.RED);

		// if ((byte) 3 == (byte) 2)  // if-else without brace
		// 	Meggy.setPixel((byte) 6, (byte) 5, Meggy.Color.YELLOW);
		// else 
		// 	Meggy.setPixel((byte) 3, (byte) 2, Meggy.Color.RED);

		// if ((byte) 3 == (byte) 2) { // if-else with brace
		// 	Meggy.setPixel((byte) 6, (byte) 5, Meggy.Color.YELLOW);
		// } else {
		// 	Meggy.setPixel((byte) 3, (byte) 2, Meggy.Color.RED);
		// }

	}
}
