/**
 * PA4doubleDef
 * 
 * doubly defined method
 * LEGAL java Not legal Meggy Java
 * WB, 3/12
 */

import meggy.Meggy;

class PA4doubleDef {

    public static void main(String[] whatever){
	new C().setP((byte)3,(byte)7,Meggy.Color.BLUE);
	new C().setP(2,(byte)7,Meggy.Color.BLUE);
    }
}

class C {
    
    public void setP(byte x, byte y, Meggy.Color c) {
            Meggy.setPixel(x, x, c);    
    }

    public void setP(int x, byte y, Meggy.Color c) {
	Meggy.setPixel((byte)x, y, c);    
    }
    
}
