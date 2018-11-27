/** 
 *
 * @File:      BuildSymTable
 * @Brief:     Visitor to build a symbol table
 * @Created:   Nov/11/2018
 * @Author:    Jiahao Cai
 *
 */
package ast_visitors;

import symtable.*;
import java.util.*;
import ast.visitor.*;
import ast.node.*;
import exceptions.InternalException;
import exceptions.SemanticException;

public class BuildSymTable extends DepthFirstVisitor {
  SymTable ST;
  boolean mDebug;
  public static final int maxParamNum = 12; // 12 formal parameters at most

  public BuildSymTable() {
    ST = new SymTable();
    mDebug = false;
  }

  public BuildSymTable(boolean debug) {
    ST = new SymTable();
    mDebug = debug;
  }

  public SymTable getSymTable() {
    return ST;
  }

  private void debugInfo(String msg) {
    if (mDebug) {
      System.err.println("[Debug Info]: " + msg);
    }
  }

  private Type getType(Node node) {
    if (node == null) {
      return Type.VOID;
    }
    return this.ST.getExpType(node);
  }

  private void setType(Node node, Type t) {
    this.ST.setExpType(node, t);
  }

  /* Literals */
  @Override
  public void outIntType(IntType node) {
    setType(node, Type.INT);
  }

  @Override
  public void outColorType(ColorType node) {
    setType(node, Type.COLOR);
  }

  @Override
  public void outButtonType(ButtonType node) {
    setType(node, Type.BUTTON);
  }

  @Override
  public void outBoolType(BoolType node) {
    setType(node, Type.BOOL);
  }

  @Override
  public void outByteType(ByteType node) {
    setType(node, Type.BYTE);
  }

  @Override
  public void outVoidType(VoidType node) {
    setType(node, Type.VOID);
  }

  @Override
  public void outToneType(ToneType node) {
    setType(node, Type.TONE);
  }

  @Override
  public void outClassType(ClassType node) {
    setType(node, Type.getOrCreateType(node.getName()));
  }

  /* Literals */
	@Override
	public void outIntegerExp(IntLiteral node) {
		setType(node, Type.INT);
	}

	@Override
	public void outColorExp(ColorLiteral node) {
		setType(node, Type.COLOR);
	}

	@Override
  public void outButtonExp(ButtonLiteral node) {
    setType(node, Type.BUTTON);
	}
	
	@Override
  public void outTrueExp(TrueLiteral node) {
		setType(node, Type.BOOL);
	}

	@Override
  public void outFalseExp(FalseLiteral node) {
		setType(node, Type.BOOL);
	}

	@Override
	public void outToneExp(ToneLiteral node) {
		setType(node, Type.TONE);
  }
  
  @Override
	public void outByteCast(ByteCast node) {
		setType(node, Type.BYTE);
  }
  
  @Override
  public void outLtExp(LtExp node) {
    setType(node, Type.BOOL);
  }
  
  @Override
  public void outAndExp(AndExp node) {
    setType(node, Type.BOOL);
  }

  @Override
  public void outThisExp(ThisLiteral node) {
    Type currentType = Type.getOrCreateType(ST.getInnermostClassName());
    setType(node, currentType);
  }

  @Override
  public void inMainClass(MainClass node) {
    assert (ST.getCurrentScope() == ST.getGlobalScope());
    ClassSTE classSTE = new ClassSTE(node.getName(), true, null, new Scope(node.getName(), Scope.classScope));
    if (!ST.insert(classSTE)) {
      throw new SemanticException("Class [" + classSTE.getName() + "] is already defined in current scope!", node.getLine(),
          node.getPos());
    }
    debugInfo("Insert class [" + node.getName() + "] under scope " + ST.getCurrentScope().getName());
    ST.pushScope(classSTE.getScope());
  }

  @Override
  public void outMainClass(MainClass node) {
    ST.popScope();
  }

  // @Override
  // public void inTopClassDecl(TopClassDecl node) {
  //   assert (ST.getCurrentScope() == ST.getGlobalScope());
  //   ClassSTE classSTE = new ClassSTE(node.getName(), false, null, new Scope(node.getName(), Scope.classScope));
  //   if (!ST.insert(classSTE)) {
  //     throw new SemanticException("Class [" + classSTE.getName() + "] is already defined in scope " + ST.getCurrentScope().getName(), node.getLine(),
  //         node.getPos());
  //   }
  //   debugInfo("Insert class [" + node.getName() + "] under scope " + ST.getCurrentScope().getName());
  //   ST.pushScope(classSTE.getScope());
  // }

  // @Override
  // public void outTopClassDecl(TopClassDecl node) {
  //   ST.popScope();
  // }

  @Override
  public void visitTopClassDecl(TopClassDecl node) {
    assert (ST.getCurrentScope() == ST.getGlobalScope());
    ClassSTE classSTE = new ClassSTE(node.getName(), false, null, new Scope(node.getName(), Scope.classScope));
    if (!ST.insert(classSTE)) {
      throw new SemanticException("Class [" + classSTE.getName() + "] is already defined in scope " + ST.getCurrentScope().getName(), node.getLine(),
          node.getPos());
    }
    debugInfo("Insert class [" + node.getName() + "] under scope " + ST.getCurrentScope().getName());
    ST.pushScope(classSTE.getScope());
    /* Insert local variables to current scope */
    {
      int offset = 1;
      List<VarDecl> copy = new ArrayList<VarDecl>(node.getVarDecls());
      for (VarDecl e : copy) {
        e.accept(this);
        VarSTE varSTE = new VarSTE(e.getName(), getType(e.getType()), offset);
        if (classSTE.getScope().insert(varSTE)) {
          debugInfo("Insert var [" + e.getName() + "] under scope " + ST.getCurrentScope().getName());
        } else {
          throw new SemanticException("Var [" + e.getName() + "] is already defined in scope " + ST.getCurrentScope().getName(), 
            node.getLine(),
            node.getPos());
        }
        offset += getType(e.getType()).getAVRTypeSize();
      }
    }
    {
      List<MethodDecl> copy = new ArrayList<MethodDecl>(node.getMethodDecls());
      for (MethodDecl e : copy) {
        e.accept(this);
      }
    }
    ST.popScope();
  }

  @Override
  public void visitMethodDecl(MethodDecl node) {
    /* Insert MethodSTE */
    String name = node.getName();
    MethodSTE methodSTE = new MethodSTE(name, new Scope(name, Scope.methodScope));
    if (!ST.insert(methodSTE)) {
      throw new SemanticException("Method [" + methodSTE.getName() + "] is already defined in scope " + ST.getCurrentScope().getName(), 
        node.getLine(),
        node.getPos());
    }
    ST.pushScope(methodSTE.getScope());
    if (node.getType() != null) {
      node.getType().accept(this);
    }    
    /* The true return type depends on the return stmt */
    setType(node, getType(node.getType()));
    /* Insert the this pointer to current scope */
    int offset = 1;
    VarSTE thisSTE = new VarSTE("this", Type.getOrCreateType(ST.getInnermostClassName()), offset);
    methodSTE.getScope().insert(thisSTE);
    offset += 2;
    /* Insert formal parameters to current scope */
    {
      List<Formal> copy = new ArrayList<Formal>(node.getFormals());
      for (Formal e : copy) {
        e.accept(this);
        VarSTE varSTE = new VarSTE(e.getName(), getType(e.getType()), offset);
        if (ST.getCurrentScope().insert(varSTE)) {
          debugInfo("Insert formal [" + e.getName() + "] under scope " + ST.getCurrentScope().getName());
        } else {
          throw new SemanticException("Formal [" + e.getName() + "] is already defined in scope " + ST.getCurrentScope().getName(), 
            node.getLine(),
            node.getPos());
        }
        offset += getType(e.getType()).getAVRTypeSize();
      }
    }
    /* Insert local variables to current scope */
    {
      List<VarDecl> copy = new ArrayList<VarDecl>(node.getVarDecls());
      for (VarDecl e : copy) {
        e.accept(this);
        VarSTE varSTE = new VarSTE(e.getName(), getType(e.getType()), offset);
        if (methodSTE.getScope().insert(varSTE)) {
          debugInfo("Insert var [" + e.getName() + "] under scope " + ST.getCurrentScope().getName());
        } else {
          throw new SemanticException("Var [" + e.getName() + "] is already defined in scope " + ST.getCurrentScope().getName(), 
            node.getLine(),
            node.getPos());
        }
        offset += getType(e.getType()).getAVRTypeSize();
      }
    }
    /* Traverse statements */
    {
      List<IStatement> copy = new ArrayList<IStatement>(node.getStatements());
      for (IStatement e : copy) {
        e.accept(this);
      }
    }
    // The return type here should be determined be the type
    // instead of the type of the return statement.
    if (node.getExp() != null) {
      node.getExp().accept(this);
    } else {
      setType(node.getExp(), Type.VOID);
    }
    /* Generate function signature */
    // It is possible that this type has never been seen before
    // TODO: now we just consider native types in PA4
    Type retType = getType(node.getType());
    List<Type> mTypeList = new LinkedList<>();
    for (Formal e : node.getFormals()) {
      mTypeList.add(getType(e.getType()));
    }
    // debugInfo(node.getName());
    Signature mSignature = new Signature(mTypeList, retType);
    methodSTE.setSignature(mSignature);
    ST.popScope();
    if (node.getFormals().size() > maxParamNum) { // 12 formal parameters at most
      throw new SemanticException("Method [" + node.getName() + mSignature.toString() + "] under scope " + ST.getCurrentScope().getName() + " has too many parameters (at most 12)", 
        node.getLine(),
        node.getPos());
    }
    debugInfo("Insert method [" + node.getName() + mSignature.toString() + "] under scope " + ST.getCurrentScope().getName());
  }

  @Override
  public void outNewExp(NewExp node) {
    setType(node, Type.getOrCreateType(node.getId()));
  }
}