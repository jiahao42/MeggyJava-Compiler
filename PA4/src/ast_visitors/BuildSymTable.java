/** 
 *
 * @File:      BuildSymTable
 * @Brief:     Visitor to build a symbol table
 * @Created:   Nov/11/2018
 * @Author:    Jiahao Cai
 *
 */
package ast_visitors;

import symtable.SymTable.*;
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

  public void inTopClassDecl(TopClassDecl node)
  {
    ClassSTE
  }

  public void outTopClassDecl(TopClassDecl node)
  {
      defaultOut(node);
  }

  public void inMethodDecl(MethodDecl node)
  {
      defaultIn(node);
  }

  public void outMethodDecl(MethodDecl node)
  {
      defaultOut(node);
  }

  @Override
  public void visitMethodDecl(MethodDecl node)
  {
      inMethodDecl(node);
      if(node.getType() != null)
      {
          node.getType().accept(this);
      }
      {
          List<Formal> copy = new ArrayList<Formal>(node.getFormals());
          for(Formal e : copy)
          {
              e.accept(this);
          }
      }
      {
          List<VarDecl> copy = new ArrayList<VarDecl>(node.getVarDecls());
          for(VarDecl e : copy)
          {
              e.accept(this);
          }
      }
      {
          List<IStatement> copy = new ArrayList<IStatement>(node.getStatements());
          for(IStatement e : copy)
          {
              e.accept(this);
          }
      }
      if(node.getExp() != null)
      {
          node.getExp().accept(this);
      }
      outMethodDecl(node);
  }

  public void inFormal(Formal node)
  {
      defaultIn(node);
  }

  public void outFormal(Formal node)
  {
      defaultOut(node);
  }

  @Override
  public void visitFormal(Formal node)
  {
      inFormal(node);
      if(node.getType() != null)
      {
          node.getType().accept(this);
      }
      outFormal(node);
  }
}