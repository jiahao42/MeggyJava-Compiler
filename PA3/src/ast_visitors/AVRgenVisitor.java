package ast_visitors;

import java.io.PrintWriter;
import java.util.*;
import ast.visitor.*;
import ast.node.*;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.File;
import java.io.FileNotFoundException;
import label.Label;

public class AVRgenVisitor extends DepthFirstVisitor {
  private PrintWriter out;

  /** Constructor takes a PrintWriter, and stores in instance var. */
  public AVRgenVisitor(PrintWriter out) {
    this.out = out;
  }

  private void write2FileWithTab(String s) {
    this.out.println("\t" + s);
  }

  private void write2File(String s) {
    this.out.println(s);
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
    defaultIn(node);
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
    write2FileWithTab("# Casting int to byte by popping");
    write2FileWithTab("# 2 bytes off stack and only pushing low order bits");
    write2FileWithTab("# back on.  Low order bits are on top of stack.");
    write2FileWithTab("pop r24");
    write2FileWithTab("pop r25");
    write2FileWithTab("push r24\n");
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
    write2FileWithTab("# Color expression " + node.getLexeme());
    write2FileWithTab("ldi r22," + node.getIntValue());
    write2FileWithTab("# push one byte expression onto stack");
    write2FileWithTab("push r22\n");
  }

  @Override
  public void outColorExp(ColorLiteral node) {
    defaultOut(node);
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
    write2FileWithTab("# start equality check");
  }

  @Override
  public void outEqualExp(EqualExp node) {
    // TODO: only support byte comparison
    write2FileWithTab("# load a one byte expression off stack");
    this.out.print("pop r18");
    write2FileWithTab("# load a one byte expression off stack");
    this.out.print("pop r24");
    write2FileWithTab("# compare the operands");
    write2FileWithTab("cp r24, r18");
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
    write2FileWithTab("#### if statement");
  }

  @Override
  public void visitIfStatement(IfStatement node) {
    Label trueBranch = new Label();
    Label falseBranch = new Label();
    Label compareBranch = new Label();
    Label thenBranch = new Label();
    inIfStatement(node);
    if (node.getExp() != null) {
      node.getExp().accept(this);
    }
    write2FileWithTab("breq " + trueBranch.toString());
    write2File(falseBranch.toString() + " # false branch");
    write2FileWithTab("ldi r24, 0");
    write2FileWithTab("jmp " + thenBranch.toString());
    write2File(trueBranch.toString() + " # true branch");
    write2FileWithTab("ldi r24, 1");
    write2File(compareBranch.toString() + " # get result");
    write2FileWithTab("# push comparison result onto stack");
    write2FileWithTab("push r24");
    write2FileWithTab("# load condition and branch if false");
    write2FileWithTab("# load a one byte expression off stack");
    write2FileWithTab("pop r24");
    write2FileWithTab("# load zero into reg");
    write2FileWithTab("ldi r25, 1");
    write2FileWithTab("# use cp to set SREG");
    write2FileWithTab("cp r24, r25");
    write2FileWithTab("breq " + trueBranch.toString());
    write2FileWithTab("jmp " + falseBranch.toString());
    write2File(trueBranch.toString());
    if (node.getThenStatement() != null) {
      node.getThenStatement().accept(this);
    }
    write2File(falseBranch.toString());
    if (node.getElseStatement() != null) {
      node.getElseStatement().accept(this);
    }
    outIfStatement(node);
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
    write2FileWithTab("# Load constant int " + node.getIntValue());
    write2FileWithTab("ldi r24,lo8(" + node.getIntValue() + ")");
    write2FileWithTab("ldi r25,hi8(" + node.getIntValue() + ")");
    write2FileWithTab("# push two byte expression onto stack");
    write2FileWithTab("push r25");
    write2FileWithTab("push r24\n");
  }

  @Override
  public void outIntegerExp(IntLiteral node) {
    defaultOut(node);
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
    write2FileWithTab("### Meggy.setPixel(x,y,color) call");
    write2FileWithTab("# load a one byte expression off stack");
    write2FileWithTab("pop r20");
    write2FileWithTab("# load a one byte expression off stack");
    write2FileWithTab("pop r22");
    write2FileWithTab("# load a one byte expression off stack");
    write2FileWithTab("pop r24");
    write2FileWithTab("call   _Z6DrawPxhhh");
    write2FileWithTab("call   _Z12DisplaySlatev\n");
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
    InputStream mainPrologue = null;
    BufferedReader reader = null;
    try {
      // The syntax for loading a text resource file
      // from a jar file here:
      // http://www.rgagnon.com/javadetails/java-0077.html
      System.out.println("Generate prolog using avrH.rtl.s");
      mainPrologue = this.getClass().getClassLoader().getResourceAsStream("avrH.rtl.s");
      reader = new BufferedReader(new InputStreamReader(mainPrologue));
      String line = null;
      while ((line = reader.readLine()) != null) {
        write2FileWithTab(line);
      }
      write2FileWithTab("\n");
    } catch (Exception e2) {
      e2.printStackTrace();
    } finally {
      try {
        if (mainPrologue != null)
          mainPrologue.close();
        if (reader != null)
          reader.close();
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }

  @Override
  public void outProgram(Program node) {
    InputStream mainPrologue = null;
    BufferedReader reader = null;
    try {
      System.out.println("Generate epilog using avrF.rtl.s");
      mainPrologue = this.getClass().getClassLoader().getResourceAsStream("avrF.rtl.s");
      reader = new BufferedReader(new InputStreamReader(mainPrologue));
      String line = null;
      while ((line = reader.readLine()) != null) {
        write2FileWithTab(line);
      }
    } catch (Exception e2) {
      e2.printStackTrace();
    } finally {
      try {
        if (mainPrologue != null)
          mainPrologue.close();
        if (reader != null)
          reader.close();
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
    this.out.flush(); // write all the buffer to file.
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
