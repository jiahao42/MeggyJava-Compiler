/** 
 *
 * @File:      VarSTE
 * @Brief:     Symbol Table Entry for Variables
 * @Created:   Nov/12/2018
 * @Author:    Jiahao Cai
 *
 */

package symtable;

public class VarSTE extends STE {
    private Type mType;
    private int mBase;
    private int mOffset;
    public VarSTE(String name, Type type, int base, int offset) {
        super(name, null);
        mType = type;
        mBase = base;
        mOffset = offset;
    }
}