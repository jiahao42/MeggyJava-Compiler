/** 
 *
 * @File:      PA4varNoDef
 * @Brief:     Use undefined variable
 * @Created:   Nov/17/2018
 * @Author:    Jiahao Cai
 *
 */


import meggy.Meggy;

class PA4varNoDef {
    public static void main(String[] whatever) {
        new C().setP();
    }
}

class C {
    public int setP() {
        return z;
    }

}
