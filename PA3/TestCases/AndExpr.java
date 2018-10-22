/** 
 *
 * @File:      If
 * @Brief:     Test syntax for &&
 * @Created:   Oct/20/2018
 * @Author:    Jiahao Cai
 *
 */


import meggy.Meggy;

class AndExpr {
	public static void main(String[] whatever) {
		if (Meggy.getPixel((byte)1, (byte)2) == Meggy.Color.RED && Meggy.getPixel((byte)2, (byte)3) == Meggy.Color.GREEN) {
			Meggy.setPixel((byte) 6, (byte) 5, Meggy.Color.GREEN);
		}

		// if ((byte) 2 == (byte) 2)  // Single if without brace
		// 	Meggy.setPixel((byte) 5, (byte) 6, Meggy.Color.RED);

		// if ((byte) 3 == (byte) 2)  // if-else without brace
		// 	Meggy.setPixel((byte) 6, (byte) 5, Meggy.Color.YELLOW);
		// else
		// 	Meggy.setPixel((byte) 3, (byte) 2, Meggy.Color.YELLOW);

		// if ((byte) 3 == (byte) 2) { // if-else with brace
		// 	Meggy.setPixel((byte) 6, (byte) 5, Meggy.Color.YELLOW);
		// } else {
		// 	Meggy.setPixel((byte) 5, (byte) 3, Meggy.Color.WHITE);
		// }

	}
}
