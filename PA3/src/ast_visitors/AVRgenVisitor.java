package ast_visitors;

import java.io.PrintWriter;

import ast.visitor.*;
import ast.node.*;

public class AVRgenVisitor extends DepthFirstVisitor {
  private PrintWriter out;

  /** Constructor takes a PrintWriter, and stores in instance var. */
  public AVRgenVisitor(PrintWriter out) {
    this.out = out;
  }

  @Override
  public void inAndExp(AndExp node) {
    defaultIn(node);
  }

  @Override
  public void outAndExp(AndExp node) {
    defaultOut(node);
  }

  @Override
  public void inArrayAssignStatement(ArrayAssignStatement node) {
    defaultIn(node);
  }

  @Override
  public void outArrayAssignStatement(ArrayAssignStatement node) {
    defaultOut(node);
  }

  @Override
  public void inArrayExp(ArrayExp node) {
    defaultIn(node);
  }

  @Override
  public void outArrayExp(ArrayExp node) {
    defaultOut(node);
  }

  @Override
  public void inAssignStatement(AssignStatement node) {
    defaultIn(node);
  }
  @Override
  public void outAssignStatement(AssignStatement node) {
    defaultOut(node);
  }
  @Override
  public void inBlockStatement(BlockStatement node) {
    defaultIn(node);
  }
  @Override
  public void outBlockStatement(BlockStatement node) {
    defaultOut(node);
  }
  @Override
  public void inBoolType(BoolType node) {
    defaultIn(node);
  }
  @Override
  public void outBoolType(BoolType node) {
    defaultOut(node);
  }
  @Override
  public void inButtonExp(ButtonLiteral node) {
    defaultIn(node);
  }
  @Override
  public void outButtonExp(ButtonLiteral node) {
    defaultOut(node);
  }
  @Override
  public void inButtonType(ButtonType node) {
    defaultIn(node);
  }

  @Override
  public void outButtonType(ButtonType node) {
    defaultOut(node);
  }
@Override
  public void inByteCast(ByteCast node) {
    defaultIn(node);
  }
@Override
  public void outByteCast(ByteCast node) {
    out.println("# Casting int to byte by popping");
    out.println("# 2 bytes off stack and only pushing low order bits");
    out.println("# back on.  Low order bits are on top of stack.");
    out.println("pop    r24");
    out.println("pop    r25");
    out.println("push   r24\n");
  }
@Override
  public void inByteType(ByteType node) {
    defaultIn(node);
  }
@Override
  public void outByteType(ByteType node) {
    defaultOut(node);
  }
@Override
  public void inCallExp(CallExp node) {
    defaultIn(node);
  }
@Override
  public void outCallExp(CallExp node) {
    defaultOut(node);
  }
@Override
  public void inCallStatement(CallStatement node) {
    defaultIn(node);
  }
@Override
  public void outCallStatement(CallStatement node) {
    defaultOut(node);
  }
@Override
  public void inChildClassDecl(ChildClassDecl node) {
    defaultIn(node);
  }
@Override
  public void outChildClassDecl(ChildClassDecl node) {
    defaultOut(node);
  }
@Override
  public void inClassType(ClassType node) {
    defaultIn(node);
  }
@Override
  public void outClassType(ClassType node) {
    defaultOut(node);
  }
@Override
  public void inColorExp(ColorLiteral node) {
    defaultIn(node);
  }
@Override
  public void outColorExp(ColorLiteral node) {
    out.println("# Color expression " + node.getLexeme());
    out.println("ldi    r22," + node.getIntValue());
    out.println("# push one byte expression onto stack");
    out.println("push   r22\n");
  }
@Override
  public void inColorArrayType(ColorArrayType node) {
    defaultIn(node);
  }
@Override
  public void outColorArrayType(ColorArrayType node) {
    defaultOut(node);
  }
@Override
  public void inColorType(ColorType node) {
    defaultIn(node);
  }
@Override
  public void outColorType(ColorType node) {
    defaultOut(node);
  }
@Override
  public void inEqualExp(EqualExp node) {
    defaultIn(node);
  }
@Override
  public void outEqualExp(EqualExp node) {
    defaultOut(node);
  }
@Override
  public void inFalseExp(FalseLiteral node) {
    defaultIn(node);
  }
@Override
  public void outFalseExp(FalseLiteral node) {
    defaultOut(node);
  }
@Override
  public void inFormal(Formal node) {
    defaultIn(node);
  }
@Override
  public void outFormal(Formal node) {
    defaultOut(node);
  }
@Override
  public void inIdLiteral(IdLiteral node) {
    defaultIn(node);
  }
@Override
  public void outIdLiteral(IdLiteral node) {
    defaultOut(node);
  }
@Override
  public void inIfStatement(IfStatement node) {
    defaultIn(node);
  }
@Override
  public void outIfStatement(IfStatement node) {
    defaultOut(node);
  }
@Override
  public void inIntArrayType(IntArrayType node) {
    defaultIn(node);
  }
@Override
  public void outIntArrayType(IntArrayType node) {
    defaultOut(node);
  }
@Override
  public void inIntegerExp(IntLiteral node) {
    defaultIn(node);
  }
@Override
  public void outIntegerExp(IntLiteral node) {
    out.println("# Load constant int " + node.getIntValue());
    out.println("ldi    r24,lo8(" + node.getIntValue() + ")");
    out.println("ldi    r25,hi8(" + node.getIntValue() + ")");
    out.println("# push two byte expression onto stack");
    out.println("push   r25");
    out.println("push   r24\n");
  }
@Override
  public void inIntType(IntType node) {
    defaultIn(node);
  }
@Override
  public void outIntType(IntType node) {
    defaultOut(node);
  }
@Override
  public void inLengthExp(LengthExp node) {
    defaultIn(node);
  }
@Override
  public void outLengthExp(LengthExp node) {
    defaultOut(node);
  }
@Override
  public void inLtExp(LtExp node) {
    defaultIn(node);
  }
@Override
  public void outLtExp(LtExp node) {
    defaultOut(node);
  }
@Override
  public void inMainClass(MainClass node) {
    defaultIn(node);
  }
@Override
  public void outMainClass(MainClass node) {
    defaultOut(node);
  }
@Override
  public void inMeggyCheckButton(MeggyCheckButton node) {
    defaultIn(node);
  }
@Override
  public void outMeggyCheckButton(MeggyCheckButton node) {
    defaultOut(node);
  }
@Override
  public void inMeggyDelay(MeggyDelay node) {
    defaultIn(node);
  }
@Override
  public void outMeggyDelay(MeggyDelay node) {
    defaultOut(node);
  }
@Override
  public void inMeggyGetPixel(MeggyGetPixel node) {
    defaultIn(node);
  }
@Override
  public void outMeggyGetPixel(MeggyGetPixel node) {
    defaultOut(node);
  }
@Override
  public void inMeggySetAuxLEDs(MeggySetAuxLEDs node) {
    defaultIn(node);
  }
@Override
  public void outMeggySetAuxLEDs(MeggySetAuxLEDs node) {
    defaultOut(node);
  }
@Override
  public void inMeggySetPixel(MeggySetPixel node) {
    defaultIn(node);
  }
@Override
  public void outMeggySetPixel(MeggySetPixel node) {
    out.println("### Meggy.setPixel(x,y,color) call");
    out.println("# load a one byte expression off stack");
    out.println("pop    r20");
    out.println("# load a one byte expression off stack");
    out.println("pop    r22");
    out.println("# load a one byte expression off stack");
    out.println("pop    r24");
    out.println("call   _Z6DrawPxhhh");
    out.println("call   _Z12DisplaySlatev\n");
  }
@Override
  public void inMeggyToneStart(MeggyToneStart node) {
    defaultIn(node);
  }
@Override
  public void outMeggyToneStart(MeggyToneStart node) {
    defaultOut(node);
  }
@Override
  public void inMethodDecl(MethodDecl node) {
    defaultIn(node);
  }
@Override
  public void outMethodDecl(MethodDecl node) {
    defaultOut(node);
  }
@Override
  public void inMinusExp(MinusExp node) {
    defaultIn(node);
  }
@Override
  public void outMinusExp(MinusExp node) {
    defaultOut(node);
  }
@Override
  public void inMulExp(MulExp node) {
    defaultIn(node);
  }
@Override
  public void outMulExp(MulExp node) {
    defaultOut(node);
  }
@Override
  public void inNewArrayExp(NewArrayExp node) {
    defaultIn(node);
  }
@Override
  public void outNewArrayExp(NewArrayExp node) {
    defaultOut(node);
  }
@Override
  public void inNewExp(NewExp node) {
    defaultIn(node);
  }
@Override
  public void outNewExp(NewExp node) {
    defaultOut(node);
  }
@Override
  public void inNegExp(NegExp node) {
    defaultIn(node);
  }
@Override
  public void outNegExp(NegExp node) {
    defaultOut(node);
  }
@Override
  public void inNotExp(NotExp node) {
    defaultIn(node);
  }
@Override
  public void outNotExp(NotExp node) {
    defaultOut(node);
  }
@Override
  public void inPlusExp(PlusExp node) {
    defaultIn(node);
  }
@Override
  public void outPlusExp(PlusExp node) {
    defaultOut(node);
  }
@Override
  public void inProgram(Program node) {
    defaultIn(node);
  }
@Override
  public void outProgram(Program node) {
    defaultOut(node);
  }
@Override
  public void inThisExp(ThisLiteral node) {
    defaultIn(node);
  }
@Override
  public void outThisExp(ThisLiteral node) {
    defaultOut(node);
  }
@Override
  public void inToneExp(ToneLiteral node) {
    defaultIn(node);
  }
@Override
  public void outToneExp(ToneLiteral node) {
    defaultOut(node);
  }
@Override
  public void inToneType(ToneType node) {
    defaultIn(node);
  }
@Override
  public void outToneType(ToneType node) {
    defaultOut(node);
  }
@Override
  public void inTopClassDecl(TopClassDecl node) {
    defaultIn(node);
  }
@Override
  public void outTopClassDecl(TopClassDecl node) {
    defaultOut(node);
  }
@Override
  public void inTrueExp(TrueLiteral node) {
    defaultIn(node);
  }
@Override
  public void outTrueExp(TrueLiteral node) {
    defaultOut(node);
  }
@Override
  public void inVarDecl(VarDecl node) {
    defaultIn(node);
  }
@Override
  public void outVarDecl(VarDecl node) {
    defaultOut(node);
  }
@Override
  public void inVoidType(VoidType node) {
    defaultIn(node);
  }
@Override
  public void outVoidType(VoidType node) {
    defaultOut(node);
  }
@Override
  public void inWhileStatement(WhileStatement node) {
    defaultIn(node);
  }
@Override
  public void outWhileStatement(WhileStatement node) {
    defaultOut(node);
  }
}
