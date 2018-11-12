/** 
 *
 * @File:      Scope
 * @Brief:     Scope in Symbol Table
 * @Created:   Nov/12/2018
 * @Author:    Jiahao Cai
 *
 */

package symtable;

public class Scope {
    private HashMap<String, STE> mDict;
    public Scope() {
        mDict = new HashMap<String, STE>();
    }
    public STE lookup(String sym) {
        return mDict.get(sym);
    }
    public void insert(STE ste) {
        mDict.put(ste.getName(), ste);
    }
}