/**
 * PA3ifdots.java
 * 
 * An example for the students to code up in AVR assembly for PA1.
 * The language features will be from the PA3 grammar.
 *
 * MMS, 1/23/13
 */

import meggy.Meggy;

class PA3ifdots {

    public static void main(String[] whatever){
        if (Meggy.checkButton(Meggy.Button.Up)) {
            Meggy.setPixel( (byte)3, (byte)(4+3), Meggy.Color.BLUE );
        }
        if (Meggy.checkButton(Meggy.Button.Down)) {
            Meggy.setPixel( (byte)3, (byte)0, Meggy.Color.RED );
        }
    }
}
