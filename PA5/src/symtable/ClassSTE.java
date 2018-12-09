/** 
 *
 * @File:      ClassSTE
 * @Brief:     Symbol Table Entry for Class
 * @Created:   Nov/12/2018
 * @Author:    Jiahao Cai
 *
 */

package symtable;

public class ClassSTE extends STE {
    private boolean mMain;
    private ClassSTE mSuperClass;
    public ClassSTE(String name, boolean main, ClassSTE superClass, Scope scope) {
        super(name, scope);
        mMain = main;
        mSuperClass = superClass;
        mSize = 0;
        for (Object ste : scope.getDict().values()) {
            if (ste instanceof VarSTE) {
                mSize += ((VarSTE)ste).getType().getAVRTypeSize();
            }
        }
    }
    public boolean getMain() {
        return mMain;
    }
}