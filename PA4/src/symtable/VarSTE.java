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
        mSize = type.getAVRTypeSize();
    }
    public Type getType() {
        return this.mType;
    }
    public int getBase() {
        return this.mBase;
    }
    public int getOffset() {
        return this.getOffset();
    }
}