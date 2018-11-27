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
    private String mBase;
    private int mOffset;
    public VarSTE(String name, Type type, int offset) {
        super(name, null);
        mType = type;
        mBase = "Y";
        mOffset = offset;
        mSize = mType.getAVRTypeSize();
    }
    public Type getType() {
        return this.mType;
    }
    public String getBase() {
        return this.mBase;
    }
    public int getOffset() {
        return this.mOffset;
    }
}