package symtable;

import java.util.*;
import ast.node.*;

import exceptions.InternalException;

/**
 * SymTable .... The symbol table also keeps a mapping of expression nodes to
 * types because that information is needed elsewhere especially when looking up
 * method call information.
 * 
 * @author mstrout WB: Simplified to only expression types
 */
public class SymTable {
    private final HashMap<Node, Type> mExpType = new HashMap<Node, Type>();
    private Scope mGlobalScope;
    private Stack<Scope> mScopeStack;

    public SymTable() {
        mGlobalScope = new Scope();
        mScopeStack = new Stack<>();
    }

    public void setExpType(Node exp, Type t) {
        this.mExpType.put(exp, t);
    }

    public Type getExpType(Node exp) {
        return this.mExpType.get(exp);
    }

    /**
     * Lookup a symbol in this symbol table.
     * Starts looking in innermost scope and then
     * look in enclosing scopes.
     * Returns null if the symbol is not found.
     */
    public STE lookup (String sym) {
        Stack<Scope> copy = (Stack<Scope>)mScopeStack.clone();
        STE result = null;
        while (!copy.empty()) {
            Scope scope = copy.pop();
            if (scope.lookup(sym) != null) {
                result = scope.lookup(sym);
                break;
            }
        }
        return result;
    }

    /**
     * When inserting an STE will just insert
     * it into the scope at the top of the scope stack.
     */
    public void insert(STE ste) {
        Scope currentScope = mScopeStack.peek();
        currentScope.insert(ste);
    }

    /**
     * Lookup a symbol in innermost scope only.
     * return null if the symbol is not found
     */
    public STE lookupInnermost(String sym) {
        Scope currentScope = mScopeStack.peek();
        return currentScope.lookup(sym);
    }

    /**
     * Lookup the given method scope and make it the innermost
     * scope. That is, make it the top of the scope stack.
     */
    public void pushScope(String id) {
        Scope currentScope = mScopeStack.peek();
        mScopeStack.push(currentScope.lookup(id).getScope());
    }

    public void popScope() {
        mScopeStack.pop();
    }
}


class STE {
    private String mName;
    private Scope mScope;
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
}

class MethodSTE extends STE {
    private Signature mSignature;
    public MethodSTE(String name, Signature signature, Scope scope) {
        super(name, scope);
        mSignature = signature;
    }
}

class ClassSTE extends STE {
    private boolean mMain;
    private ClassSTE mSuperClass;
    public ClassSTE(String name, boolean main, ClassSTE superClass, Scope scope) {
        super(name, scope);
        mMain = main;
        mSuperClass = superClass;
    }
}

class VarSTE extends STE {
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

class Signature {
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

class Scope {
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