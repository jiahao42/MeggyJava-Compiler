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

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof Signature) {
            Signature other = (Signature)obj;
            // Compare the number of parameters
            if (other.getParamTypes().size() != this.getParamTypes().size()) {
                return false;
            }
            // Compare the type of parameters one by one
            List<Type> types1 = this.getParamTypes();
            List<Type> types2 = other.getParamTypes();
            for (int i = 0; i < this.getParamTypes().size(); i++) {
                if (types1.get(i) != types2.get(i)) {
                    return false;
                }
            }
            if (other.getReturnType() != this.getReturnType()) {
                return false;
            }
            return true;
        } else {
            return false;
        }
    }
}