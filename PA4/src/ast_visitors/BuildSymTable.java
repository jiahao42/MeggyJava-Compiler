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
    setType(node, Type.BOOL);
  }

  @Override
  public void outToneType(ToneType node) {
    setType(node, Type.TONE);
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
  public void inMainClass(MainClass node) {
    assert (ST.getCurrentScope() == ST.getGlobalScope());
    ClassSTE mSTE = new ClassSTE(node.getName(), true, null, new Scope(node.getName()));
    if (!ST.insert(mSTE)) {
      throw new SemanticException("Class " + mSTE.getName() + " already exists in current scope!", node.getLine(),
          node.getPos());
    }
    debugInfo("Insert class [" + node.getName() + "] under scope " + ST.getCurrentScope().getName());
    ST.pushScope(mSTE.getScope());
  }

  @Override
  public void outMainClass(MainClass node) {
    ST.popScope();
  }

  @Override
  public void inTopClassDecl(TopClassDecl node) {
    assert (ST.getCurrentScope() == ST.getGlobalScope());
    ClassSTE mSTE = new ClassSTE(node.getName(), false, null, new Scope(node.getName()));
    if (!ST.insert(mSTE)) {
      throw new SemanticException("Class " + mSTE.getName() + " already exists in current scope!", node.getLine(),
          node.getPos());
    }
    debugInfo("Insert class [" + node.getName() + "] under scope " + ST.getCurrentScope().getName());
    ST.pushScope(mSTE.getScope());
  }

  @Override
  public void outTopClassDecl(TopClassDecl node) {
    ST.popScope();
  }

  @Override
  public void visitMethodDecl(MethodDecl node) {
    // System.out.println(node.getType());
    String name = node.getName();
    MethodSTE mSTE = new MethodSTE(name, new Scope(name));
    if (!ST.insert(mSTE)) {
      throw new SemanticException("Method " + mSTE.getName() + " already exists in current scope!", node.getLine(),
          node.getPos());
    }
    ST.pushScope(mSTE.getScope());
    if (node.getType() != null) {
      node.getType().accept(this);
    }
    {
      List<Formal> copy = new ArrayList<Formal>(node.getFormals());
      for (Formal e : copy) {
        e.accept(this);
      }
    }
    List<Type> mTypeList = new LinkedList<>();
    for (Formal e : node.getFormals()) {
      mTypeList.add(getType(e.getType()));
    }
    {
      List<VarDecl> copy = new ArrayList<VarDecl>(node.getVarDecls());
      for (VarDecl e : copy) {
        e.accept(this);
      }
    }
    {
      List<IStatement> copy = new ArrayList<IStatement>(node.getStatements());
      for (IStatement e : copy) {
        e.accept(this);
      }
    }
    if (node.getExp() != null) {
      node.getExp().accept(this);
    }
    Type retType = getType(node.getType());
    // debugInfo(node.getName());
    Signature mSignature = new Signature(mTypeList, retType);
    mSTE.setSignature(mSignature);
    ST.popScope();
    debugInfo("Insert method [" + node.getName() + mSignature.toString() + "] under scope " + ST.getCurrentScope().getName());
  }

  @Override
  public void outNewExp(NewExp node) {
    setType(node, Type.getOrCreateType(node.getId()));
  }
}