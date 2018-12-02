import meggy.Meggy;

class Buggy {
  public static void main(String[] parameters) {
    new TestClassCompare().compare();
  }
}

class CustomType {
  int a;
}

class TestClassCompare {
  public void compare() {
    CustomType t1;
    CustomType t2;
    t1 = new CustomType();
    t2 = new CustomType();
    if (t1 == t2) {
      Meggy.setPixel((byte)1, (byte)1, Meggy.Color.RED);
    } else {
      Meggy.setPixel((byte)1, (byte)1, Meggy.Color.GREEN);
    }
    t1 = t2;
    if (t1 == t2) {
      Meggy.setPixel((byte)1, (byte)1, Meggy.Color.GREEN);
    } else {
      Meggy.setPixel((byte)1, (byte)1, Meggy.Color.RED);
    }
  }
}
