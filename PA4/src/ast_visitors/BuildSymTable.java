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

  public BuildSymTable() {
    ST = new SymTable();
  }

  public SymTable getSymTable() {
    return ST;
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
    setType(node, Type.BOOL);
  }

  @Override
  public void outVoidType(VoidType node) {
    setType(node, Type.BOOL);
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
    ST.pushScope(mSTE.getScope());
  }

  @Override
  public void outTopClassDecl(TopClassDecl node) {
    ST.popScope();
  }

  @Override
  public void inMethodDecl(MethodDecl node) {
    // String name = ST.genMethodName(node.getName());
    setType(node, getType(node.getType()));
    String name = node.getName();
    List<Type> mTypeList = new LinkedList<>();
    for (Formal e : node.getFormals()) {
      mTypeList.add(getType(e.getType()));
    }
    Type retType = getType(node.getType());
    MethodSTE mSTE = new MethodSTE(name, new Signature(mTypeList, retType), new Scope(name));
    if (!ST.insert(mSTE)) {
      throw new SemanticException("Method " + mSTE.getName() + " already exists in current scope!", node.getLine(),
          node.getPos());
    }
    ST.pushScope(mSTE.getScope());
  }

  @Override
  public void outMethodDecl(MethodDecl node) {
    ST.popScope();
  }

  @Override
  public void outNewExp(NewExp node) {
    setType(node, Type.getOrCreateType(node.getId()));
  }
}