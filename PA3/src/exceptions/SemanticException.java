package exceptions;

public class SemanticException
      extends RuntimeException
{
  public SemanticException(String msg, int line, int pos)
  {
    super("[" + line + "," + pos + "] " + msg);

    if(msg == null)
    {
      throw new InternalException("unexpected null argument");
    }
  }
  public SemanticException(String msg)
  {
    super(msg);

    if(msg == null)
    {
      throw new InternalException("unexpected null argument");
    }
  }
}
