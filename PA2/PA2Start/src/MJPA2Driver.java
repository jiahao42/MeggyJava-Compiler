/*
 * MJDriver.java for just the scanner
 *
 */
import java.io.FileReader;
import java.io.PrintWriter;
// needed because we DON'T parse (see below)
import java_cup.runtime.*;

import mjparser.*;
//import ast_visitors.*;

public class MJPA2Driver {

      private static void usage() {
          System.err.println(
            "MJPA2: Specify input file in program arguments");
      }
     
      public static void main(String args[]) 
      {
        
        if(args.length < 1)
        {         
            usage();
            System.exit(1);
        }

        // filename should be the last command line option
        String filename = args[args.length-1];

        try {
          // construct the lexer, 
          // the lexer will be the same for all of the parsers
          Yylex lexer = new Yylex(new FileReader(filename));
          
          // Exercise the lexer: print out all of the tokens 
          java_cup.runtime.Symbol symbol = lexer.next_token();
          while (symbol.sym != sym.EOF) {
              System.out.print("symbol: " + symbol + "  symbolValue: ");
              if(symbol.value!=null) {
                SymbolValue symval = (SymbolValue)symbol.value;
                System.out.println(" [" + symval.lexeme + "]" + symval.line);
              } else {
                System.out.println(" null value");
              }
              symbol = lexer.next_token();
          }
          
        }catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        }  
      }

}
