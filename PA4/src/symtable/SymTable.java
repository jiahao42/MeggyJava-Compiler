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
        mScopeStack.push(mGlobalScope);
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
    public boolean insert(STE ste) {
        Scope currentScope = mScopeStack.peek();
        return currentScope.insert(ste);
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
        Scope currentScope = getCurrentScope();
        mScopeStack.push(currentScope.lookup(id).getScope());
    }

    public void popScope() {
        mScopeStack.pop();
    }

    public Scope getCurrentScope() {
        return mScopeStack.peek();
    }

    public Scope getGlobalScope() {
        return mGlobalScope;
    }
}