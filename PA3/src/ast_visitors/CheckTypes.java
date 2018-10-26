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

	private boolean isByte(Type t) {
		return t == Type.BYTE;
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

	private boolean isVoid(Type t) {
		return t == Type.VOID;
	}

	private boolean isColor(Type t) {
		return t == Type.COLOR;
	}

	private Type getType(Node node) {
		return this.mCurrentST.getExpType(node);
	}

	private void setType(Node node, Type t) {
		this.mCurrentST.setExpType(node, t);
	}

	// ========================= Overriding the visitor interface

	@Override
	public void defaultOut(Node node) {
		System.err.println("Node not implemented in CheckTypes, " + node.getClass());
	}

	/** Type check for Experssions **/
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

	/* Functions */

	@Override
  public void outMeggyCheckButton(MeggyCheckButton node) {
		if (isButton(getType(node.getExp()))) {
			setType(node, Type.BOOL);
		} else {
			throw new SemanticException("Invalid parameter type for Meggy.checkButton, expect Meggy.Button", node.getExp().getLine(),
			node.getPos());
		}
	}
	
	@Override
  public void outMeggyGetPixel(MeggyGetPixel node) {
		Type x = getType(node.getXExp());
		Type y = getType(node.getYExp());
		if (isIntOrByte(x) && isIntOrByte(y)) {
			setType(node, Type.COLOR);
		} else {
			throw new SemanticException("Invalid parameter types for Meggy.getPixel, expect (BYTE, BYTE)", node.getXExp().getLine(),
					node.getPos());
		}
	}
	
	/* Operators */

	@Override
	public void outAndExp(AndExp node) {
		if (getType(node.getLExp()) != Type.BOOL) {
			throw new SemanticException("Invalid left operand type for operator &&", node.getLExp().getLine(),
					node.getLExp().getPos());
		}

		if (getType(node.getRExp()) != Type.BOOL) {
			throw new SemanticException("Invalid right operand type for operator &&", node.getRExp().getLine(),
					node.getRExp().getPos());
		}
		setType(node, Type.BOOL);
	}

	/* 
	shouldn't be VOID,
	if they are BYTE and INT, expand BYTE to INT
	*/
	@Override
	public void outEqualExp(EqualExp node) {
		Type lExpType = getType(node.getLExp());
		Type rExpType = getType(node.getRExp());
		if (isVoid(lExpType) || isVoid(rExpType)) {
			throw new SemanticException("Invalid operands type for operator ==, cannot be VOID", node.getLine(),
					node.getPos());
		} else if (isIntOrByte(lExpType) && isIntOrByte(rExpType)) {
			setType(node, Type.BOOL);
		} else if (lExpType == rExpType) {
			setType(node, Type.BOOL);
		} else {
				throw new SemanticException("Invalid operands type for operator ==, expect same type on left and right", node.getLine(),
						node.getPos());
		}
	}

	@Override
	public void outPlusExp(PlusExp node) {
		Type lExpType = getType(node.getLExp());
		Type rExpType = getType(node.getRExp());
		if (isIntOrByte(lExpType) && isIntOrByte(rExpType)) {
			setType(node, Type.INT);
		} else {
			throw new SemanticException("Invalid operands type for operator +, expect INT or BYTE", node.getLine(),
					node.getPos());
		}
	}

	@Override
  public void outMinusExp(MinusExp node) {
		Type lExpType = getType(node.getLExp());
		Type rExpType = getType(node.getRExp());
		if (isIntOrByte(lExpType) && isIntOrByte(rExpType)) {
			setType(node, Type.INT);
		} else {
			throw new SemanticException("Invalid operands type for operator -, expect INT or BYTE", node.getLine(),
					node.getPos());
		}
	}
	
  @Override
  public void outMulExp(MulExp node) {
		Type lExpType = getType(node.getLExp());
		Type rExpType = getType(node.getRExp());
		if (isByte(lExpType) && isByte(rExpType)) {
			setType(node, Type.INT);
		} else {
			throw new SemanticException("Invalid operands type for operator *, expect BYTE", node.getLine(),
					node.getPos());
		}
	}
	
	@Override
  public void outNegExp(NegExp node) {
		if (isIntOrByte(getType(node.getExp()))) {
			setType(node, getType(node.getExp())); // type not change
		} else {
			throw new SemanticException("Invalid operands type for operator -, expect INT or BYTE", node.getLine(),
					node.getPos());
		}
  }

	@Override
	public void outByteCast(ByteCast node) {
		if (isIntOrByte(getType(node.getExp()))) {
			setType(node, Type.BYTE);
		} else {
			throw new SemanticException("Invalid operand type for byte cast, expect INT or BYTE", node.getLine(),
					node.getPos());
		}
	}

	@Override
  public void outNotExp(NotExp node) {
		if (isBoolean(getType(node.getExp()))) {
			setType(node, Type.BOOL);
		} else {
			throw new SemanticException("Invalid operand type for !, expect BOOL", node.getLine(),
					node.getPos());
		}
	}
	
	/** Type check for statement **/

	@Override
  public void outMeggySetPixel(MeggySetPixel node) {
		Type xExpType = getType(node.getXExp());
		Type yExpType = getType(node.getYExp());
		Type colorType = getType(node.getColor());
		if (isIntOrByte(xExpType) && 
				isIntOrByte(xExpType) &&
				isColor(colorType)) {
					setType(node, Type.VOID);
				} else {
					throw new SemanticException("Invalid parameter types for Meggy.setPixel, expect (BYTE, BYTE, Meggy.Color)", node.getLine(),
					node.getPos());
				}
	}
	
	@Override
  public void outMeggyDelay(MeggyDelay node) {
		if (isIntOrByte(getType(node.getExp()))) {
			setType(node, Type.VOID);
		} else {
			throw new SemanticException("Invalid parameter types for Meggy.delay, expect INT", node.getLine(),
			node.getPos());
		}
	}
	
	@Override
  public void visitIfStatement(IfStatement node) {
    inIfStatement(node);
    if (node.getExp() != null) {
      node.getExp().accept(this);
		}
		if (!isBoolean(getType(node.getExp()))) {
			throw new SemanticException("Invalid condition type for if statement, expect BOOL", node.getLine(),
			node.getPos());
		}
    if (node.getThenStatement() != null) {
      node.getThenStatement().accept(this);
    }
    if (node.getElseStatement() != null) {
      node.getElseStatement().accept(this);
    }
	}
	
	@Override
  public void visitWhileStatement(WhileStatement node) {
    inWhileStatement(node);
    if (node.getExp() != null) {
      node.getExp().accept(this);
		}
		if (!isBoolean(getType(node.getExp()))) {
			throw new SemanticException("Invalid condition type for while statement, expect BOOL", node.getLine(),
			node.getPos());
		}
    if (node.getStatement() != null) {
      node.getStatement().accept(this);
    }
	}
	
	/** Others **/
	
	@Override
	public void outBlockStatement(BlockStatement node) {
		
	}

	@Override
  public void outMainClass(MainClass node) {
    
	}
	
	@Override
  public void outProgram(Program node) {
		
  }
}

