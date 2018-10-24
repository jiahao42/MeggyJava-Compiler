/** 
 *
 * @File:      If
 * @Brief:     Test syntax for Meggy.getPixel
 * @Created:   Oct/21/2018
 * @Author:    Jiahao Cai
 *
 */
import meggy.Meggy;

class TypeConversion
{
	public static void main (String[] args){
		if (Meggy.getPixel(1, (byte)2) == Meggy.Color.RED) {
			Meggy.setPixel((byte)7, 4, Meggy.Color.DARK);
		} else {
			Meggy.delay((byte)100);
			Meggy.setPixel((byte)0 ,(byte)0, Meggy.Color.GREEN);
		}
		Meggy.setPixel((byte)7, 2, Meggy.Color.GREEN);
	}
}
