/** 
 *
 * @File:      PA4Test1
 * @Brief:     Test code for PA4
 * @Created:   Sep/09/2018
 * @Author:    Jiahao Cai
 *
 */


import meggy.Meggy;

// 1. Test return value
// 2. Test parameter variables
// 3. Test operator < 

class PA4Test1 {
  public static void main(String[] parameters) {
    new TestReturnValue().testAll();
    new TestParameters().testAll();
    if (new TestLessThan().testLessThan() == true) {
      Meggy.setPixel((byte)1, (byte)2, Meggy.Color.GREEN);
    }
    Meggy.setPixel((byte)1, (byte)2, Meggy.Color.GREEN);
    Meggy.delay(5);
    if (Meggy.checkButton(Meggy.Button.Down) == true) {
      Meggy.setPixel((byte)1, (byte)2, Meggy.Color.RED);
    }
  }
}

class TestReturnValue {
  public void testAll() {
    this.testBoolean();
    if (this.testBoolean() == true) {}
    this.testByte();
    this.testInt();
    this.testVoid();
    this.testColor();
    this.testButton();
    this.testTone();
  }

  public boolean testBoolean() {
    return true;
  }

  public byte testByte() {
    return (byte)1;
  }

  public int testInt() {
    return 1;
  }

  public void testVoid() {

  }

  public Meggy.Color testColor() {
    return Meggy.Color.DARK;
  }

  public Meggy.Button testButton() {
    return Meggy.Button.Up;
  }

  public Meggy.Tone testTone() {
    return Meggy.Tone.C3;
  }

}

class TestParameters {
  public void testAll() {
    this.testBoolean(true);
    this.testByte((byte)0);
    this.testInt(0);
    this.testColor(Meggy.Color.DARK);
    this.testButton(Meggy.Button.Up);
    this.testTone(Meggy.Tone.C3);
  }
  public void testBoolean(boolean b){}
  public void testByte(byte b){}
  public void testInt(int i){
    i = i + 1;
  }
  public void testColor(Meggy.Color c){}
  public void testButton(Meggy.Button b){}
  public void testTone(Meggy.Tone t){}
}

class TestLessThan {
  public boolean testLessThan() {
    return 1 < 2;
  }
}