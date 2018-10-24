package ast_visitors;

/** 
 * CheckTypes
 * 
 * This AST visitor traverses a MiniJava Abstract Syntax Tree and checks
 * for a number of type errors.  If a type error is found a SymanticException
 * is thrown
 * 
 * CHANGES to make next year (2012)
 *  - make the error messages between *, +, and - consistent <= ??
 *
 * Bring down the symtab code so that it only does get and set Type
 *  for expressions
 */

import ast.node.*;
import ast.visitor.DepthFirstVisitor;
import java.util.*;

import symtable.SymTable;
import symtable.Type;
import exceptions.InternalException;
import exceptions.SemanticException;

public class CheckTypes extends DepthFirstVisitor {

	private SymTable mCurrentST;

	public CheckTypes(SymTable st) {
		if (st == null) {
			throw new InternalException("unexpected null argument");
		}
		mCurrentST = st;
	}

	private boolean isIntOrByte(Type t) {
		return (t == Type.INT || t == Type.BYTE);
	}

	private boolean isBoolean(Type t) {
		return t == Type.BOOL;
	}

	private boolean isButton(Type t) {
		return t == Type.BUTTON;
	}

	// ========================= Overriding the visitor interface

	@Override
	public void defaultOut(Node node) {
		System.err.println("Node not implemented in CheckTypes, " + node.getClass());
	}

	/** Experssions **/
	/* Literals */
	@Override
	public void inIntegerExp(IntLiteral node) {
		this.mCurrentST.setExpType(node, Type.INT);
	}

	@Override
	public void inColorExp(ColorLiteral node) {
		this.mCurrentST.setExpType(node, Type.COLOR);
	}

	@Override
  public void inButtonExp(ButtonLiteral node) {
    this.mCurrentST.setExpType(node, Type.BUTTON);
	}
	
	@Override
  public void inEqualExp(EqualExp node) {
		this.mCurrentST.setExpType(node, Type.BOOL);
	}
	
	@Override
  public void inTrueExp(TrueLiteral node) {
		this.mCurrentST.setExpType(node, Type.BOOL);
	}

	@Override
  public void inFalseExp(TrueLiteral node) {
		this.mCurrentST.setExpType(node, Type.BOOL);
	}

	/* Functions */
	@Override
  public void inMeggyCheckButton(MeggyCheckButton node) {
		if (isButton(node.getExp())) {
			this.mCurrentST.setExpType(node, Type.BOOL);
		} else {
			throw new SemanticException("Invalid parameters of Meggy.checkButton, expect Meggy.Button", node.getExp().getLine(),
			node.getExp().getPos());
		}
	}
	
	@Override
  public void inMeggyGetPixel(MeggyGetPixel node) {
		Type x = this.mCurrentST.getExpType(node.getLExp);
		Type y = this.mCurrentST.getExpType(node.getRExp);
		if (isIntOrByte(x) && isIntOrByte(y)) {
			this.mCurrentST.setExpType(node, Type.COLOR);
		} else {
			throw new SemanticException("Invalid parameters of Meggy.getPixel, expect INT or BYTE", node.getLExp().getLine(),
					node.getLExp().getPos());
		}
	}
	
	/* Operators */

	@Override
	public void outAndExp(AndExp node) {
		if (this.mCurrentST.getExpType(node.getLExp()) != Type.BOOL) {
			throw new SemanticException("Invalid left operand type for operator &&", node.getLExp().getLine(),
					node.getLExp().getPos());
		}

		if (this.mCurrentST.getExpType(node.getRExp()) != Type.BOOL) {
			throw new SemanticException("Invalid right operand type for operator &&", node.getRExp().getLine(),
					node.getRExp().getPos());
		}

		this.mCurrentST.setExpType(node, Type.BOOL);
	}

	@Override
	public void outPlusExp(PlusExp node) {
		Type lexpType = this.mCurrentST.getExpType(node.getLExp());
		Type rexpType = this.mCurrentST.getExpType(node.getRExp());
		if (isIntOrByte(lexpType) && isIntOrByte(rexpType)) {
			this.mCurrentST.setExpType(node, Type.INT);
		} else {
			throw new SemanticException("Invalid operands of operator +, expect INT or BYTE", node.getLExp().getLine(),
					node.getLExp().getPos());
		}
	}
	
	@Override
	public void inByteCast(ByteCast node) {
		if (isIntOrByte(node.getExp())) {
			this.mCurrentST.setExpType(node, Type.BYTE);
		} else {
			throw new SemanticException("Invalid operand type for byte cast, expect INT", node.getExp().getLine(),
					node.getExp().getPos());
		}
	}

}
