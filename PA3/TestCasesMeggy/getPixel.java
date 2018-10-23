/** 
 *
 * @File:      If
 * @Brief:     Test syntax for Meggy.getPixel
 * @Created:   Oct/21/2018
 * @Author:    Jiahao Cai
 *
 */
import meggy.Meggy;

class GetPixel
{
	public static void main (String[] args){
		if (Meggy.getPixel((byte)1, (byte)2) == Meggy.Color.RED) {
			Meggy.setPixel((byte)7 ,(byte)7, Meggy.Color.DARK);
		} else {
			Meggy.setPixel((byte)0 ,(byte)0, Meggy.Color.YELLOW);
		}
	}
}
