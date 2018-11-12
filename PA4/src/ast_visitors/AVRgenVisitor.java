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
import symtable.SymTable;
import symtable.Type;

public class AVRgenVisitor extends DepthFirstVisitor {
  private PrintWriter out;
  private SymTable ST;

  /** Constructor takes a PrintWriter, and stores in instance var. */
  public AVRgenVisitor(PrintWriter out, SymTable ST) {
    this.out = out;
    this.ST = ST;
  }

  private void write2File(String s) {
    this.out.print(s);
  }

  private boolean isByte(Type t) {
		return t == Type.BYTE;
  }

  private boolean isInt(Type t) {
		return t == Type.INT;
  }

  private Type getType(Node node) {
		return this.ST.getExpType(node);
  }
  
  private void setType(Node node, Type t) {
    this.ST.setExpType(node, t);
  }
  
  private void dumpWarning(int line, int pos, String msg) {
    if (msg != null) {
      System.out.println("[" + line + "," + pos + "]: Warning: " + msg);
    }
  }

  // promote Byte to Int if possible
  private void promoteByte2Int(Node n) {
    if (isByte(getType(n))) {
      // dumpWarning(n.getLine(), n.getPos(), "Promoting a BYTE to INT...");
      /**
       * | lower bits  | 
       * | higher bits |
       */
      String negBranch = new Label().toString();
      String storeResult = new Label().toString();
      write2File(
        "\n\n\t## This is a auto typecast: promote Byte to Int" + 
        "\n\tpop r24 # pop byte as the lower bits" + 
        "\n\ttst r24" +
        "\n\tbrlt " + negBranch +
        "\n\tldi r25, 0" + 
        "\n\tjmp " + storeResult +
        "\n" + negBranch + ": " +
        "\n\tldi r25, hi8(-1)" +
        "\n" + storeResult + ": " +
        "\n\tpush r25" + 
        "\n\tpush r24"
      );
    }
  }

  private void promoteTo2Bytes(Node n) {
    String negBranch = new Label().toString();
    String storeResult = new Label().toString();
    write2File(
      "\n\n\t## This is a auto typecast: promote Byte to Int" + 
      "\n\tpop r24 # pop byte as the lower bits" + 
      "\n\ttst r24" +
      "\n\tbrlt " + negBranch +
      "\n\tldi r25, 0" + 
      "\n\tjmp " + storeResult +
      "\n" + negBranch + ": " +
      "\n\tldi r25, hi8(-1)" +
      "\n" + storeResult + ": " +
      "\n\tpush r25" + 
      "\n\tpush r24"
    );
  }

  private void demoteInt2Byte(Node n) {
    if (isInt(getType(n))) {
      dumpWarning(n.getLine(), n.getPos(), "Demoting a INT to BYTE, may lose precision here...");
      write2File(
        "\n\n\t## This is a auto typecast: demote Int to Byte" +
        "\n\t# 2 bytes off stack and only pushing low order bits" +
        "\n\t# back on.  Low order bits are on top of stack." +
        "\n\tpop r24 # pop lower bits" +
        "\n\tpop r25 # pop higher bits" +
        "\n\tpush r24 # push lower bits back \n"
      );
    }
  }

  @Override
  public void inAndExp(AndExp node) {
    write2File(
      "\n\t#### short-circuited && operation" +
      "\n\t# &&: left operand"
    );
  }

  @Override
  public void visitAndExp(AndExp node) {
    inAndExp(node);
    if (node.getLExp() != null) {
      node.getLExp().accept(this);
    }
    // if the first expr is false, no need to eval the second expr
    String trueBranch = new Label().toString();
    String falseBranch = new Label().toString();
    String nextBlock = new Label().toString();
    write2File(
      "\n\tldi r24, 1" + 
      "\n\tpop r25" + 
      "\n\tcp r24, r25" +
      "\n\tbrne " + falseBranch + " # if the left expr is false" + 
      "\n\n" + trueBranch + ": # if left expr is true" + 
      "\n\t# &&: right operand"
    );
    if (node.getRExp() != null) {
      node.getRExp().accept(this);
    }
    write2File(
      "\n\tjmp " + nextBlock +
      "\n\n" + falseBranch + ": # false branch" + 
      "\n\tldi r24, 0" + 
      "\n\tpush r24 # push false on stack" +
      "\n\n" + nextBlock + ": "
    );
    outAndExp(node);
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
  public void outByteCast(ByteCast node) {
    // if it's already byte, do nothing
    if (node != null && !isByte(getType(node.getExp()))) {
      write2File(
        "\n\n\t# Casting int to byte by popping" +
        "\n\t# 2 bytes off stack and only pushing low order bits" +
        "\n\t# back on.  Low order bits are on top of stack." +
        "\n\tpop r24 # pop lower bits" +
        "\n\tpop r25 # pop higher bits" +
        "\n\tpush r24 # push lower bits back \n"
      );
    }
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
    // Convert everything to Int and compare
    String trueBranch = new Label().toString();
    String falseBranch = new Label().toString();
    String nextBlock = new Label().toString();
    if (!isInt(getType(node.getRExp()))) {
      promoteTo2Bytes(null);
    }
    write2File(
      "\n\t# right operand of ==" +
      "\n\tpop r18" + 
      "\n\tpop r19"
    );

    if (!isInt(getType(node.getLExp()))) {
      promoteTo2Bytes(null);
    }

    write2File(
      "\n\t# left operand of ==" +
      "\n\tpop r24" + 
      "\n\tpop r25"
    );

    write2File(
      "\n\t# compare the operands" +
      "\n\tcp    r24, r18" + 
      "\n\tcpc   r25, r19" + 
      "\n\tbreq " + trueBranch + " # goto true branch" + 
      "\n" + falseBranch + ": # false branch" + 
      "\n\tldi r24, 0" + 
      "\n\tjmp " + nextBlock + 
      "\n" + trueBranch + ": # true branch" + 
      "\n\tldi r24, 1" +
      "\n" + nextBlock + ": " +
      "\n\tpush r24 # push the result on stack"
    );
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
     write2File("\n#### if statement");
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
      "\n\tldi r24, 1" +
      "\n\tpop r25" +
      "\n\tcp r24, r25" + 
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
      "\n\t# load one into reg" +
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
      "\n\tpush r24 # lower bits\n"
    );
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
    InputStream mainPrologue = null;
    BufferedReader reader = null;
    try {
      System.out.println("Generate epilog using avrF.rtl.s");
      mainPrologue = this.getClass().getClassLoader().getResourceAsStream("avrF.rtl.s");
      reader = new BufferedReader(new InputStreamReader(mainPrologue));
      String line = null;
      while ((line = reader.readLine()) != null) {
         this.out.println(line);
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
      "\n\ttst    r24 # Test for Zero or Minus" + 
      "\n\tbreq " + falseBranch + " # goto false branch" + 
      "\n" + trueBranch + ": # if true" + 
      "\n\tldi r24, 1" + 
      "\n\tjmp " + resultBranch + 
      "\n" + falseBranch+ ": # false branch, r24 is already 0, do nothing" +  
      "\n" + resultBranch + ": " + 
      "\n\t" + "push r24"
    );
  }

  @Override
  public void inMeggyDelay(MeggyDelay node) {
    defaultIn(node);
  }

  @Override
  public void visitMeggyDelay(MeggyDelay node) {
    inMeggyDelay(node);
    if (node.getExp() != null) {
      node.getExp().accept(this);
      promoteByte2Int(node.getExp());
    }
    outMeggyDelay(node);
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
  public void visitMeggyGetPixel(MeggyGetPixel node) {
    inMeggyGetPixel(node);
    if (node.getXExp() != null) {
      node.getXExp().accept(this);
      demoteInt2Byte(node.getXExp());
    }

    if (node.getYExp() != null) {
      node.getYExp().accept(this);
      demoteInt2Byte(node.getYExp());
    }

    outMeggyGetPixel(node);
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
  public void visitMeggySetPixel(MeggySetPixel node) {
    inMeggySetPixel(node);
    if (node.getXExp() != null) {
      node.getXExp().accept(this);
      demoteInt2Byte(node.getXExp());
    }
    
    if (node.getYExp() != null) {
      node.getYExp().accept(this);
      demoteInt2Byte(node.getYExp());
    }
    
    if (node.getColor() != null) {
      node.getColor().accept(this);
    }
    outMeggySetPixel(node);
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
  public void visitMethodDecl(MethodDecl node) {
    inMethodDecl(node);
    String className = ((TopClassDecl)(node.parent())).getName();
    String methodName = className + "_" + node.getName();
    write2File(
      "\n.text" +
      "\n.global " + methodName + 
      "\n\t.type " + methodName + ", @function" +
      "\n" + methodName + ":" +
      "\n\tpush r29" +
      "\n\tpush r28" + 
      "\n\t# make space for locals and params" + 
      "\n\tldi r30, 0"
    );
    if (node.getType() != null) {
      node.getType().accept(this);
    }
    int formalSize = 2; // 2 for the implicit this pointer
    {
      List<Formal> copy = new ArrayList<Formal>(node.getFormals());
      for (Formal e : copy) {
        e.accept(this);
        formalSize += getType(e.getType()).getAVRTypeSize(); // calculate size for params
      }
    }
    for (int i = 0; i < formalSize; i++) {
      write2File(
        "\n\tpush r30" // allocate space on stack
      );
    }
    write2File(
      "\n\t# Copy stack pointer to frame pointer" +
      "\n\tin r28,__SP_L__" +
      "\n\tin r29,__SP_H__"
    );
    write2File(
      "\n\t# save off parameters" + 
      "\n\t# implicit this pointer" + 
      "\n\tstd Y + 2, r25" + 
      "\n\tstd Y + 1, r24"
    );

    int reg = 23;
    int offset = 3;
    for (Formal e : node.getFormals()) {
      int size = getType(e.getType()).getAVRTypeSize();
      if (size == 2) {
        write2File(
          "\n\tstd Y + " + String.valueOf(offset + 1) + ", r" + String.valueOf(reg) + 
          "\n\tstd Y + " + String.valueOf(offset) + ", r" + String.valueOf(reg)
        );
        offset += 2;
      } else if (size == 1) {
        write2File(
          "\n\tstd Y + " + String.valueOf(offset) + ", r" + String.valueOf(reg)
        );
        offset += 1;
      }
      reg -= 2;
    }
    write2File("\n\t/* done with function " + methodName + " prologue */");
    int varSize = 0;
    {
      List<VarDecl> copy = new ArrayList<VarDecl>(node.getVarDecls());
      for (VarDecl e : copy) {
        e.accept(this);
        varSize += getType(e).getAVRTypeSize(); // calculate size for locals
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
    write2File(
      "\n\t/* epilogue start for Class1_func2 */" + 
      "\n\t# handle return value"
    );
    int retSize = getType(node.getType()).getAVRTypeSize();
    if (retSize == 1) {
      write2File(
        "\n\t# load a one byte expression off stack" + 
        "\n\tpop    r25"
      );
    } else {
      write2File(
        "\n\t# load a two byte expression off stack" + 
        "\n\tpop    r24" + 
        "\n\tpop    r25"
      );
    }
    write2File("\n\t# pop space off stack for parameters and locals");
    for (int i = 0; i < formalSize; i++) {
      write2File("\n\tpop r30");
    }
    write2File(
      "\n\t# restoring the frame pointer" + 
      "\n\tpop    r28" + 
      "\n\tpop    r29" + 
      "\n\tret" +
      "\n\t.size " + methodName + ", .-" + methodName
    );
    outMethodDecl(node);
  }

  @Override
  public void inMinusExp(MinusExp node) {
    defaultIn(node);
  }

  @Override
  public void visitMinusExp(MinusExp node) {
    inMinusExp(node);
    if (node.getLExp() != null) {
      node.getLExp().accept(this);
      promoteByte2Int(node.getLExp());
    }
    if (node.getRExp() != null) {
      node.getRExp().accept(this);
      promoteByte2Int(node.getRExp());
    }
    outMinusExp(node);
  }

  @Override
  public void outMinusExp(MinusExp node) {
    write2File(
      "\n\n\t# x = x - y" + 
      "\n\t# load y" + 
      "\n\tpop r18 # lower bits of y" +
      "\n\tpop r19 # higher bits of y" +
      "\n\t# load x" + 
      "\n\tpop r24 # lower bits of x" +
      "\n\tpop r25 # higher bits of x" +
      "\n\t# Do INT sub operation" +
      "\n\tsub    r24, r18" +
      "\n\tsbc    r25, r19" +
      "\n\t# push two byte expression onto stack" +
      "\n\tpush   r25 # higher bits" +
      "\n\tpush   r24 # lower bits");
  }

  @Override
  public void inMulExp(MulExp node) {
    defaultIn(node);
  }

  @Override
  public void visitMulExp(MulExp node) {
    inMulExp(node);
    if (node.getLExp() != null) {
      node.getLExp().accept(this);
      demoteInt2Byte(node.getLExp());
    }
    if (node.getRExp() != null) {
      node.getRExp().accept(this);
      demoteInt2Byte(node.getRExp());
    }
    outMulExp(node);
  }

  @Override
  public void outMulExp(MulExp node) {
    write2File(
      "\n\n\t# MulExp, only works for byte" + 
      "\n\t# load a one byte expression off stack" + 
      "\n\tpop    r18" + 
      "\n\t# load a one byte expression off stack" + 
      "\n\tpop    r22" + 
      "\n\t# move low byte src into dest reg" + 
      "\n\tmov    r24, r18" + 
      "\n\t# move low byte src into dest reg" + 
      "\n\tmov    r26, r22" + 
      "\n\t# Do mul operation of two input bytes" + 
      "\n\tmuls   r24, r26" + 
      "\n\t# push two byte expression onto stack" + 
      "\n\tpush   r1" + 
      "\n\tpush   r0" + 
      "\n\t# clear r0 and r1" + 
      "\n\teor    r0,r0" + 
      "\n\teor    r1,r1"
    );
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
    // TODO: should NEW with parameters in the future
    // TODO: Should calculate the size of object
    write2File(
      "\n\t# NewExp" +
      "\n\tldi    r24, lo8(0)" +
      "\n\tldi    r25, hi8(0)" +
      "\n\t# allocating object of size 0 on heap" +
      "\n\tcall    malloc" +
      "\n\t# push object address" +
      "\n\t# push two byte expression onto stack" +
      "\n\tpush   r25" +
      "\n\tpush   r24"
    );
  }

  @Override
  public void inNegExp(NegExp node) {
    defaultIn(node);
  }

  @Override
  public void visitNegExp(NegExp node) {
    inNegExp(node);
    if (node.getExp() != null) {
      node.getExp().accept(this);
    }
    outNegExp(node);
  }

  @Override
  public void outNegExp(NegExp node) {
    String negBranch = new Label().toString();
    String thenBranch = new Label().toString();
    if (isByte(getType(node.getExp()))) {
      write2File(
        "\n\n\t# neg byte" +
        "\n\t# load a one byte expression off stack" +
        "\n\tpop r24" +
        "\n\t# promoting a byte to an int" +
        "\n\ttst r24" +
        "\n\tbrlt " + negBranch +
        "\n\tldi r25, 0" +
        "\n\tjmp " + thenBranch +
        "\n" + negBranch + ": " +
        "\n\tldi r25, hi8(-1)" +
        "\n" + thenBranch + ": " +
        "\n\tldi r22, 0" +
        "\n\tldi r23, 0" +
        "\n\tsub r22, r24" +
        "\n\tsbc r23, r25" +
        "\n\t# pushtwo byte expression onto stack" +
        "\n\tpush r23" +
        "\n\tpush r22"
      );
    } else { // Int
      write2File(
        "\n\n\t# neg int" +
        "\n\t# load a two byte expression off stack" +
        "\n\tpop    r24" +
        "\n\tpop    r25" +
        "\n\tldi     r22, 0" +
        "\n\tldi     r23, 0" +
        "\n\tsub     r22, r24" +
        "\n\tsbc     r23, r25" +
        "\n\t# push two byte expression onto stack" +
        "\n\tpush   r23" +
        "\n\tpush   r22"
      );
    }
  }

  @Override
  public void inNotExp(NotExp node) {
    defaultIn(node);
  }

  @Override
  public void outNotExp(NotExp node) {
    write2File(
      "\n\t# not operation" +
      "\n\t# load a one byte expression off stack" +
      "\n\tpop r24" +
      "\n\tldi r22, 1" +
      "\n\teor r24,r22 # xor" +
      "\n\t# push the result onto stack" +
      "\n\tpush r24"
    );
  }

  @Override
  public void inPlusExp(PlusExp node) {
     write2File("\n\t# start a add operation");
  }

  @Override
  public void visitPlusExp(PlusExp node) {
    inPlusExp(node);
    if (node.getLExp() != null) {
      node.getLExp().accept(this);
      promoteByte2Int(node.getLExp());
    }
    if (node.getRExp() != null) {
      node.getRExp().accept(this);
      promoteByte2Int(node.getRExp());
    }
    outPlusExp(node);
  }

  @Override
  public void outPlusExp(PlusExp node) {
     write2File(
        "\n\t# left operand of +" + 
        "\n\tpop    r18" + 
        "\n\tpop    r19" + 
        "\n\t# right operand of +" + 
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
        this.out.println(line);
      }
      this.out.println("\n");
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
    this.out.flush();
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
    write2File(
      "\n\n\t### start of while loop"
    );
    
  }

  @Override
  public void visitWhileStatement(WhileStatement node) {
    String cond = new Label().toString();
    String body = new Label().toString();
    String nextBlock = new Label().toString();
    inWhileStatement(node);
    write2File(
      "\n" + cond + ": # while loop condition"
    );
    if (node.getExp() != null) {
      node.getExp().accept(this);
    }
    write2File(
      "\n\t# examine condition" +
      "\n\t# load a one byte expression off stack" +
      "\n\tpop r24" +
      "\n\tldi r25,1" +
      "\n\tcp r24, r25" +
      "\n\tbreq " + body + " # if true, go to body" +
      "\n\tjmp " + nextBlock + " # if false, go to next block" +
      "\n" + body + ": # while loop body"
    );
    if (node.getStatement() != null) {
      node.getStatement().accept(this);
    }
    write2File(
      "\n\tjmp " + cond + " # go back to condition" + 
      "\n" + nextBlock + ": "
    );
    outWhileStatement(node);
  }

  @Override
  public void outWhileStatement(WhileStatement node) {
    write2File(
      "\n\t### end of while loop"
    );
  }
}