/* Tests Meggy.getPixel
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
