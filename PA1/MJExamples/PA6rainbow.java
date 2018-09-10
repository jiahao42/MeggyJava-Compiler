/**
 * PA6rainbow.java
 * 
 * Initialize an array with rainbow colors and display the
 * rainbow.
 *
 * MMS, 2/2/11
 */

import meggy.Meggy;

class PA6rainbow {

    public static void main(String[] whatever){
        {
            // display a rainbow on row 5
            new Rainbow().run((byte)5);
        }
    }
}

class Rainbow {
    Meggy.Color [] p;
    
    public void run(byte row) {
        p = new Meggy.Color [8];
        p[0] = Meggy.Color.RED;
        p[1] = Meggy.Color.ORANGE;
        p[2] = Meggy.Color.YELLOW;
        p[3] = Meggy.Color.GREEN;
        p[4] = Meggy.Color.BLUE;
        p[5] = Meggy.Color.VIOLET;
        p[6] = Meggy.Color.WHITE;
        p[7] = Meggy.Color.DARK;

        Meggy.setPixel((byte)2, (byte)3, p[0]);
        Meggy.setPixel((byte)2, (byte)4, p[4]);
        this.displayRow(row, p);

    }
    
    public void displayRow(byte row, Meggy.Color [] a) {
        int i;
        i=0;
        
        while (i<8) {
            Meggy.setPixel((byte)i, row, a[i]);        
            i = i+1;
        }
    }

}
