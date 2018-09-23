package mjparser;

/*
 * A ParseException includes an error message with the line and position of
 * error.
 */

public class ParseException extends RuntimeException {

    private static final long serialVersionUID = 6828388735790025215L;

    public ParseException(String msg, int line, int pos) {
        super("[" + line + "," + pos + "] " + msg);
    }
}
