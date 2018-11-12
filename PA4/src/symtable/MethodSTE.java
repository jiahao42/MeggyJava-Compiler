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
    }
}