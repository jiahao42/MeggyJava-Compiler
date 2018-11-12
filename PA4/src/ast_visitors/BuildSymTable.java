/** 
 *
 * @File:      BuildSymTable
 * @Brief:     Visitor to build a symbol table
 * @Created:   Nov/11/2018
 * @Author:    Jiahao Cai
 *
 */
package ast_visitors;

import symtable.SymTable;
import java.util.*;
import ast.visitor.*;
import ast.node.*;

public class BuildSymTable extends DepthFirstVisitor {
  SymTable ST;

  public BuildSymTable() {
    ST = new SymTable();
  }

  public SymTable getSymTable() {
    return ST;
  }


}