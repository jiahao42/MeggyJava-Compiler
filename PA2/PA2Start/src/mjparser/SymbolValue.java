package mjparser;

/* semantic value of token returned by scanner */
public class SymbolValue {          
  public int line;
  public int pos;
  public String lexeme;
  public int value;
  

  public SymbolValue() {
  }

  public SymbolValue(int line, int pos, String lexeme, int value) {
    this.line = line; 
    this.pos = pos;
    this.lexeme = lexeme;
    this.value = value;
  }

  public SymbolValue(int line, int pos, String lexeme) {
      this.line = line; 
      this.pos = pos;
      this.lexeme = lexeme;
      this.value = -1;
    }

  public String toString() { 
    return this.lexeme;
  }
}
