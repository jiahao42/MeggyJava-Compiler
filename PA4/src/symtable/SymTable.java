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

    public SymTable() {
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

    public STE lookup(String sym) {

        /* WRITE ME */

    }

    /**
     * Lookup a symbol in innermost scope only.
     * return null if the symbol is not found
     */

    public STE lookupInnermost(String sym) {

        Scope currentScope = mScopeStack.peek();

        return currentScope.lookupInnermost(sym);

    }

    /**
     * When inserting an STE will just insert
     * it into the scope at the top of the scope stack.
     */

    public void insert(STE ste) {
        /* WRITE ME */
    }

    /**
     * Lookup the given method scope and make it the innermost
     * scope. That is, make it the top of the scope stack.
     */

    public void pushScope(String id) {
        /* WRITE ME */
    }

    public void popScope() {
        /* WRITE ME */
    }
}
