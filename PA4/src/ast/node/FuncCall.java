package ast.node;

import java.util.*;
import ast.visitor.*;
import ast.node.*;

@SuppressWarnings("nls")
public interface FuncCall{
  public IExp getExp();
  public String getId();
  public LinkedList<IExp> getArgs();
  public int getLine();
  public int getPos();
}