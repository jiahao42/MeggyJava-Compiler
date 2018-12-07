/** 
 *
 * @File:      Scope
 * @Brief:     Scope in Symbol Table
 * @Created:   Nov/12/2018
 * @Author:    Jiahao Cai
 *
 */

package symtable;
import java.util.*;


public class Scope {
    private HashMap<String, STE> mDict;
    private String mName;
    public static final ScopeType globalScope = new ScopeType("GlobalScope");
    public static final ScopeType classScope = new ScopeType("ClassScope");
    public static final ScopeType methodScope = new ScopeType("MethodScope");
    public static final ScopeType varScope = new ScopeType("VarScope");
    private ScopeType mScopeType;

    public Scope(String name, ScopeType type) {
        mDict = new HashMap<String, STE>();
        mName = name;
        mScopeType = type;
    }

    public STE lookup(String sym) {
        return mDict.get(sym);
    }

    public boolean insert(STE ste) {
        if (mDict.get(ste.getName()) == null) {
            mDict.put(ste.getName(), ste);
            return true;
        } else {
            return false;
        }
    }

    public String getName() {
        return mName;
    }

    public HashMap<String, STE> getDict() {
        return mDict;
    }

    public ScopeType getScopeType() {
        return mScopeType;
    }
}

class ScopeType {
    private String scopeName;

    public ScopeType(String name) {
        scopeName = name;
    }

    public String toString() {
        return scopeName;
    }
}