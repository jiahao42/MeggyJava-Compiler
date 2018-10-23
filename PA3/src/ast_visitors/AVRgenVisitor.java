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

  private void write2File(String s) {
    this.out.println(s);
  }

  @Override
  public void visitAndExp(AndExp node) {
    write2File(
      "\n\t#### short-circuited && operation" +
      "\n\t# &&: left operand"
    );
    // inAndExp(node);
    if (node.getLExp() != null) {
      node.getLExp().accept(this);
    }
    // if the first expr is false, no need to eval the second expr
    String trueBranch = new Label().toString();
    String falseBranch = new Label().toString();
    write2File(
      "\n\tbrne " + falseBranch + " # if the left expr is false" + 
      "\n\n" + trueBranch + ": # if left expr is true"
    );
    if (node.getRExp() != null) {
      node.getRExp().accept(this);
    }
    write2File(
      "\n\n" + falseBranch + ": "
    );
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
    write2File(
      "\n\t#push " + node.getLexeme() + 
      "\n\tldi r24, " + node.getIntValue() +
      "\n\tpush r24"
    );
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
     write2File(
        "\n\t# Casting int to byte by popping" +
        "\n\t# 2 bytes off stack and only pushing low order bits" +
        "\n\t# back on.  Low order bits are on top of stack." +
        "\n\tpop r24 # pop lower bits" +
        "\n\tpop r25 # pop higher bits" +
        "\n\tpush r24 # push lower bits back \n");
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
     write2File(
        "\n\t# Color expression " + node.getLexeme() + 
        "\n\tldi r22," + node.getIntValue() + 
        "\n\t# push one byte expression onto stack" +
        "\n\tpush r22\n");
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
     write2File("\n\t# start equality check");
  }

  @Override
  public void outEqualExp(EqualExp node) {
    // TODO: only support byte comparison
     write2File(
        "\n\t# load a one byte expression off stack" +
        "\n\tpop r18" + 
        "\n\t# load a one byte expression off stack" +
        "\n\tpop r24" + 
        "\n\t# compare the operands" +
        "\n\tcp r24, r18");
  }

  @Override
  public void inFalseExp(FalseLiteral node) {
    write2File(
      "\n\t# False/0 expression" +
      "\n\tldi    r22, 0" +
      "\n\t# push one byte expression onto stack" +
      "\n\tpush   r22"
    );
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
     write2File("\n#### if statement\n");
  }

  @Override
  public void visitIfStatement(IfStatement node) {
    String trueBranch = new Label().toString();
    String falseBranch = new Label().toString();
    String compareBranch = new Label().toString();
    String thenBranch = new Label().toString();
    String elseBranch = new Label().toString();
    String nextBlock = new Label().toString();
    inIfStatement(node);
    if (node.getExp() != null) {
      node.getExp().accept(this);
    }
    write2File(
        "\n\tbreq " + trueBranch +
        "\n\n" + falseBranch + ": # false branch" +
        "\n\tldi r24, 0" +
        "\n\tjmp " + compareBranch +
        "\n\n" + trueBranch + ": # true branch" +
        "\n\tldi r24, 1" +
        "\n\n" + compareBranch + ": # get comparison result" +
        "\n\t# push comparison result onto stack" +
        "\n\tpush r24" +
        "\n\t# load condition and branch if false" +
        "\n\t# load a one byte expression off stack" +
        "\n\tpop r24" +
        "\n\t# load zero into reg" +
        "\n\tldi r25, 1" +
        "\n\t# use cp to set SREG" +
        "\n\tcp r24, r25" +
        "\n\tbreq " + thenBranch +
        "\n\tjmp " + elseBranch +
        "\n\n" + thenBranch + ": # then branch"
        );
    if (node.getThenStatement() != null) {
      node.getThenStatement().accept(this);
    }
    write2File(
      "\n\tjmp " + nextBlock + " # jump over the else branch" +
      "\n\n" + elseBranch + ": # else branch"
      );
    if (node.getElseStatement() != null) {
      node.getElseStatement().accept(this);
    }
    outIfStatement(node);
    write2File("\n" + nextBlock + ": ");
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
     write2File(
        "\n\t# Load constant int " + node.getIntValue() + 
        "\n\tldi r24,lo8(" + node.getIntValue() + ")" + 
        "\n\tldi r25,hi8(" + node.getIntValue() + ")" + 
        "\n\t# push two byte expression onto stack" +
        "\n\tpush r25 # higher bits" +
        "\n\tpush r24 # lower bits\n");
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
    String trueBranch = new Label().toString();
    String falseBranch = new Label().toString();
    String resultBranch = new Label().toString();
    ButtonLiteral b = (ButtonLiteral) node.getExp(); 
    String lexeme = b.getLexeme(); // e.g. Meggy.Button.Down
    int idx = lexeme.lastIndexOf('.') + 1;
    // desired format: Button_Left
    String avrButton = "Button_" + lexeme.substring(idx);
    write2File(
      "\n\tpop r25 # get button literal" + 
      "\n\t### MeggyCheckButton" +
      "\n\tcall    _Z16CheckButtonsDownv" +
      "\n\tlds    r24, " + avrButton +
      "\n\t# if button value is zero, push 0 else push 1" +
      "\n\ttst    r24" + 
      "\n" + trueBranch + ": # if true" + 
      "\n\tldi r24, 1" + 
      "\n\tjmp " + resultBranch + 
      "\n" + falseBranch + ": # false branch, r24 is already 0, do nothing" +  
      "\n" + resultBranch + ": " + 
      "\n" + "push r24"
    );
  }

  @Override
  public void inMeggyDelay(MeggyDelay node) {
    defaultIn(node);
  }

  @Override
  public void outMeggyDelay(MeggyDelay node) {
    write2File(
      "\n\t### Meggy.delay() call" +
      "\n\t# load delay parameter" +
      "\n\t# load a two byte expression off stack" +
      "\n\tpop    r24" +
      "\n\tpop    r25" +
      "\n\tcall   _Z8delay_msj"
    );
  }

  @Override
  public void inMeggyGetPixel(MeggyGetPixel node) {
    defaultIn(node);
  }

  @Override
  public void outMeggyGetPixel(MeggyGetPixel node) {
    write2File(
      "\n\t### Meggy.getPixel(x,y) call" +
      "\n\t# load a one byte expression off stack" +
      "\n\tpop    r22" +
      "\n\t# load a one byte expression off stack" +
      "\n\tpop    r24" +
      "\n\tcall   _Z6ReadPxhh" +
      "\n\t# push one byte expression onto stack" +
      "\n\tpush   r24");
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
     write2File(
        "\n\t### Meggy.setPixel(x,y,color) call" + 
        "\n\t# load a one byte expression off stack" + 
        "\n\tpop r20" + 
        "\n\t# load a one byte expression off stack" + 
        "\n\tpop r22" + 
        "\n\t# load a one byte expression off stack" + 
        "\n\tpop r24" + 
        "\n\tcall   _Z6DrawPxhhh" + 
        "\n\tcall   _Z12DisplaySlatev\n");
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
    write2File(
      "\n\t# load a two byte expression off stack" +
      "\n\tpop    r18" +
      "\n\tpop    r19" +
      "\n\t# load a two byte expression off stack" +
      "\n\tpop    r24" +
      "\n\tpop    r25" +
      "\n\t# Do INT sub operation" +
      "\n\tsub    r24, r18" +
      "\n\tsbc    r25, r19" +
      "\n\t# push hi order byte first" +
      "\n\t# push two byte expression onto stack" +
      "\n\tpush   r25" +
      "\n\tpush   r24");
  }

  @Override
  public void inMulExp(MulExp node) {
    defaultIn(node);
  }

  @Override
  public void outMulExp(MulExp node) {
    // TODO: don't know how to do it yet
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
    write2File(
    "\n\t# neg int" +
    "\n\t# load a two byte expression off stack" +
    "\n\tpop    r24" +
    "\n\tpop    r25" +
    "\n\tldi     r22, 0" +
    "\n\tldi     r23, 0" +
    "\n\tsub     r22, r24" +
    "\n\tsbc     r23, r25" +
    "\n\t# push two byte expression back to stack" +
    "\n\tpush   r23" +
    "\n\tpush   r22");
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
     write2File("# start a add operation");
  }

  @Override
  public void outPlusExp(PlusExp node) {
     write2File(
        "\n\t# load a two byte expression off stack" + 
        "\n\tpop    r18" + 
        "\n\tpop    r19" + 
        "\n\t# load a two byte expression off stack" + 
        "\n\tpop    r24" +
        "\n\tpop    r25" +
        "\n\t# Do add operation" +
        "\n\tadd    r24, r18" +
        "\n\tadc    r25, r19" +
        "\n\t# push two byte expression onto stack" +
        "\n\tpush   r25" +
        "\n\tpush   r24");
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
         write2File(line);
      }
       write2File("\n");
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
         write2File(line);
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
    write2File(
      "\n\t# True/1 expression" +
      "\n\tldi    r22, 1" +
      "\n\t# push one byte expression onto stack" +
      "\n\tpush   r22"
    );
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
