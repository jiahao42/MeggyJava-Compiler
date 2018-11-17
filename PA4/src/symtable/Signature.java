/** 
 *
 * @File:      Signature
 * @Brief:     Signature for Method
 * @Created:   Nov/12/2018
 * @Author:    Jiahao Cai
 *
 */

package symtable;
import java.util.*;

public class Signature {
    private List<Type> mParamTypes;
    private Type mReturnType;
    public Signature(List<Type> paramTypes, Type returnType) {
        mParamTypes = paramTypes;
        mReturnType = returnType;
    }
    public List<Type> getParamTypes() {
        return mParamTypes;
    }
    public Type getReturnType() {
        return mReturnType;
    }

    @Override
    public String toString() {
        String paramTypesLiteral = "(";
        for (Type t : mParamTypes) {
            paramTypesLiteral += t.toString() + ",";
        }
        if (mParamTypes.size() > 0) {
            paramTypesLiteral = paramTypesLiteral.substring(0, paramTypesLiteral.length() - 1); // delete last comma
        }
        paramTypesLiteral += ") returns " + mReturnType.toString();
        return paramTypesLiteral;
    }
}