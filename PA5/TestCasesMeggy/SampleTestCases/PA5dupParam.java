/**
 * PA5dupParam.java
 * 
 * Duplicate parameter crashes MJ_PA6.jar
 *
 */

import meggy.Meggy;

class PA5dupParam {

    public static void main(String[] whatever){
	if(true) {} else {}
    }
}

class Dup {
	public void myMethod(int a, int a){}
}
