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
    private List<Type> _param_types;
    private Type _returnType;
    public Signature(List<Type> param_types, Type returnType) {
        _param_types = param_types;
        _returnType = returnType;
    }
    public List<Type> getParamTypes() {
        return _param_types;
    }
    public Type getReturnType() {
        return _returnType;
    }
}