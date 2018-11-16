/** 
 *
 * @File:      STE
 * @Brief:     Symbol Table Entry
 * @Created:   Nov/12/2018
 * @Author:    Jiahao Cai
 *
 */

package symtable;

public class STE {
    private String mName;
    private Scope mScope;
    protected int mSize;
    public STE(String name, Scope scope) {
        mName = name;
        mScope = scope;
    }
    public String getName() {
        return mName;
    }
    public Scope getScope() {
        return mScope;
    }
    public int getSize() {
        return mSize;
    }
}