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

		if ((byte) 2 == (byte) 2 && (byte)4321 == (byte)1234) { // both expr should be evaled
			Meggy.setPixel((byte) 5, (byte) 6, Meggy.Color.RED);
		} else {
			Meggy.setPixel((byte) 5, (byte) 6, Meggy.Color.GREEN);
		}

		if ((byte) 3 == (byte) 2 && (byte)    1 == (byte)1)  // right expr should not be evaled
			Meggy.setPixel((byte) 6, (byte) 5, Meggy.Color.RED);
		else
			Meggy.setPixel((byte) 3, (byte) 2, Meggy.Color.GREEN);

		// right expr should not be evaled
		if (Meggy.getPixel((byte)1, (byte)2) == Meggy.Color.RED && Meggy.getPixel((byte)2, (byte)3) == Meggy.Color.GREEN) {
			Meggy.setPixel((byte) 6, (byte) 5, Meggy.Color.RED);
		} else {
			Meggy.setPixel((byte) 6, (byte) 5, Meggy.Color.GREEN);
		}

		// both expr should be evaled
		if (Meggy.getPixel((byte)5, (byte)2) == Meggy.Color.DARK && Meggy.getPixel((byte)6, (byte)2) == Meggy.Color.DARK) {
			Meggy.setPixel((byte) 6, (byte) 5, Meggy.Color.GREEN);
		} else {
			Meggy.setPixel((byte) 6, (byte) 5, Meggy.Color.RED);
		}

		// if ((byte) 3 == (byte) 2) { // if-else with brace
		// 	Meggy.setPixel((byte) 6, (byte) 5, Meggy.Color.YELLOW);
		// } else {
		// 	Meggy.setPixel((byte) 5, (byte) 3, Meggy.Color.WHITE);
		// }

	}
}
