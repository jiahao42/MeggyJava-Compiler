package exceptions;

public class InternalException
      extends RuntimeException
{
  public InternalException(String msg)
  {
    super(msg);

    if(msg == null)
    {
      throw new InternalException("unexpected null argument");
    }
  }
}
