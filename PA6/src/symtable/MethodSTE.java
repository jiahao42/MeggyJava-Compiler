/** 
 *
 * @File:      MethodSTE
 * @Brief:     Symbol Table Entry for Method
 * @Created:   Nov/12/2018
 * @Author:    Jiahao Cai
 *
 */

package symtable;

public class MethodSTE extends STE {
    private Signature mSignature;
    public MethodSTE(String name, Signature signature, Scope scope) {
        super(name, scope);
        mSignature = signature;
        mSize = 0;
        // for (Object ste : scope.getDict().values()) {
        //     mSize = 0;
        //     if (ste instanceof VarSTE) {
        //         mSize += ((VarSTE)ste).getType().getAVRTypeSize();
        //     }
        // }
    }

    public MethodSTE(String name, Scope scope) {
        super(name, scope);
    }

    public void setSignature(Signature signature) {
        mSignature = signature;
    }

    public Signature getSignature() {
        return mSignature;
    }
}