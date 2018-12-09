package symtable;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/** 
 *
 * @File:      SymTableVisualize
 * @Brief:     Visualize Symbol Table
 * @Created:   Dec/09/2018
 * @Author:    Jiahao Cai
 *
 */

public class SymTableVisualize {
  private SymTable ST;
  private PrintWriter out;
  private int nodeCount;
  private HashMap<STE, Integer> nodeRecord;
  public SymTableVisualize (SymTable ST, PrintWriter out) {
    this.ST = ST;
    this.out = out;
    nodeCount = 0;
    nodeRecord = new HashMap<>();
    out.println(
      "digraph ASTGraph {\n" +
      "graph [rankdir=\"LR\"];\n" +
      "node [shape=record];"
      );
  }

  public void visualize() {
    HashMap<STE, Integer> classRecord = new HashMap<>();
    Scope globaScope = ST.getGlobalScope();
    // Sample
    // 0 [label=" <f0> Scope | <f1> mDict\[ArraryTest\] "];
    // global scope
    int global_index = nodeCount;
    out.print(nodeCount++);
    out.print(" [ label=\"");
    out.print(" <f0> Scope ");
    // record all the class members and generate index
    int classCount = 1;
    for (Map.Entry<String, STE> entry : globaScope.getDict().entrySet()) {
      String s = entry.getKey();
      STE memberSTE = entry.getValue();
      classRecord.put(memberSTE, classCount);
      nodeRecord.put(memberSTE, nodeCount);
      out.print("| <f" + String.valueOf(nodeCount) + "> mDict\\[" + s + "\\] ");
      nodeCount++;
      classCount++;
    }
    out.println("\"];");
    // classSTE
    for (STE classSTE : globaScope.getDict().values()) {
      int classIndex = classRecord.get(classSTE);
      out.print(classIndex);
      out.print(
        "[ label=\"" +
        "  <f0> ClassSTE" +
        "| <f1> mName = " + classSTE.getName() +
        "| <f2> mMain = " + String.valueOf(((ClassSTE)classSTE).getMain()) + 
        "| <f3> mSuperClass = null" +
        "| <f4> mScope \"];\n"
      );
      // link: global -> class
      // 0:<f1> -> 1:<f0>;
      out.println(String.valueOf(global_index) + ":<f" + classIndex + "> -> " + String.valueOf(classIndex) + ":<f0>");
      // iterate classSTE
      int classScopeIndex = nodeCount;
      out.print(nodeCount++);
      out.print(" [ label=\"");
      out.print(" <f0> Scope ");
      HashMap<STE, Integer> memberRecord = new HashMap<>();
      // record all the VarSTE and MethodSTE of this class
      int memberCount = 1;
      for (Map.Entry<String, STE> entry : classSTE.getScope().getDict().entrySet()) {
        String s = entry.getKey();
        STE memberSTE = entry.getValue();
        memberRecord.put(memberSTE, memberCount);
        nodeRecord.put(memberSTE, nodeCount);
        out.print("| <f" + String.valueOf(memberCount) + "> mDict\\[" + s + "\\] ");
        nodeCount++;
        memberCount++;
      }
      out.println("\"];");
      // link: class -> class members
      // 1:<f4> -> 2:<f0>;
      out.println(String.valueOf(classIndex) + ":<f4> -> " + String.valueOf(classScopeIndex) + ":<f0>");
      for (STE memberSTE : classSTE.getScope().getDict().values()) {
        if (memberSTE instanceof VarSTE) {
          VarSTE varSTE = (VarSTE)memberSTE;
          out.print(nodeRecord.get(memberSTE));
          out.println(
            " [ label=\"" + 
            "  <f0> VarSTE " +
            "| <f1> mName = " + varSTE.getName() + 
            "| <f2> mType = " + varSTE.getType().toString() + 
            "| <f3> mBase = " + varSTE.getBase() + 
            "| <f4> mOffset = " + String.valueOf(varSTE.getOffset()) +
            "\"];"
          );
          // link: class -> variable
          // 1:<f2> -> 2:<f0>;
          out.println(String.valueOf(classScopeIndex) + ":<f" + String.valueOf(memberRecord.get(memberSTE)) + "> -> " + String.valueOf(nodeRecord.get(memberSTE)) + ":<f0>");
        } else { // MethodSTE
          MethodSTE methodSTE = (MethodSTE)memberSTE;
          out.print(nodeRecord.get(memberSTE));
          out.println(
            " [ label=\"" + 
            "  <f0> MethodSTE " +
            "| <f1> mName = " + methodSTE.getName() + 
            "| <f2> mSignatrue = " + methodSTE.getSignature().toString() + 
            "| <f3> mScope" + 
            "\"];"
          );
          // link: class -> method
          // 1:<f2> -> 2:<f0>;
          out.println(String.valueOf(classScopeIndex) + ":<f" + String.valueOf(memberRecord.get(memberSTE)) + "> -> " + String.valueOf(nodeRecord.get(memberSTE)) + ":<f0>");
          // create scope for methods
          int methodIndex = nodeRecord.get(methodSTE);
          int methodScopeIndex = nodeCount;
          out.print(nodeCount++);
          out.print(" [ label=\"");
          out.print(" <f0> Scope ");
          HashMap<STE, Integer> localParamRecord = new HashMap<>();
          int locolParamCount = 1;
          for (Map.Entry<String, STE> entry : methodSTE.getScope().getDict().entrySet()) {
            String s = entry.getKey();
            STE localParamSTE = entry.getValue();
            localParamRecord.put(localParamSTE, locolParamCount);
            nodeRecord.put(localParamSTE, nodeCount);
            out.print("| <f" + String.valueOf(locolParamCount) + "> mDict\\[" + s + "\\] ");
            nodeCount++;
            locolParamCount++;
          }
          out.println("\"];");
          // link: class -> class members
          // 1:<f4> -> 2:<f0>;
          out.println(String.valueOf(methodIndex) + ":<f3> -> " + String.valueOf(methodScopeIndex) + ":<f0>");
          for (STE localParamSTE : methodSTE.getScope().getDict().values()) {
            VarSTE varSTE = (VarSTE)localParamSTE;
            out.print(nodeRecord.get(varSTE));
            out.println(
              " [ label=\"" + 
              "  <f0> VarSTE " +
              "| <f1> mName = " + varSTE.getName() + 
              "| <f2> mType = " + varSTE.getType().toString() + 
              "| <f3> mBase = " + varSTE.getBase() + 
              "| <f4> mOffset = " + String.valueOf(varSTE.getOffset()) +
              "\"];"
            );
            // link: method -> variable
            // 1:<f2> -> 2:<f0>;
            out.println(String.valueOf(methodScopeIndex) + ":<f" + String.valueOf(localParamRecord.get(varSTE)) + "> -> " + String.valueOf(nodeRecord.get(varSTE)) + ":<f0>");
          }
        }
      }
    }
    
    out.println("}");
    out.flush();
  }
}