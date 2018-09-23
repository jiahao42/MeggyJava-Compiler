/*
  mj.lex
  
    Tokens/Symbols for MeggyJava language.
 
    NO dollars, but underscores anywhere in identifiers 
    (to avoid problems later when generating AVR labels from id-s)

    8 colors (not all the CPP colors)
    
    The values for the colors, buttons, and tones were found in
    MeggyJrSimple.h and MeggyJrSimple.cpp.
    

    Ignore single line comments: // until eol 
    ALSO: ignore C style comments, see http://ostermiller.org/findcomment.html

    Wim Bohm and Michelle Strout, 6/2011
  
*/

package mjparser;
import java_cup.runtime.Symbol;

%%
%cup
%line
%char
%public

%eofval{
  return new Symbol(sym.EOF, new SymbolValue(yyline, yychar+1, "EOF"));
%eofval}


EOL=(\r|\n|\r\n)

%%
/\*.*\*/    { /* ignore the comments */ }
//.*        { /* ignore the comments */ }
"+"         { return new Symbol(sym.PLUS,new SymbolValue(yyline, yychar+1, yytext()));}
"-"         { return new Symbol(sym.MINUS,new SymbolValue(yyline, yychar+1, yytext()));}
"*"         { return new Symbol(sym.TIMES,new SymbolValue(yyline, yychar+1, yytext()));}
"("         { return new Symbol(sym.LPAREN,new SymbolValue(yyline, yychar+1, yytext()));}
")"         { return new Symbol(sym.RPAREN,new SymbolValue(yyline, yychar+1, yytext()));}
";"         { return new Symbol(sym.SEMI,new SymbolValue(yyline, yychar+1, yytext()));}
","         { return new Symbol(sym.COMMA,new SymbolValue(yyline, yychar+1, yytext()));}
[0-9]+      { return new Symbol(sym.INT_LITERAL, new SymbolValue(yyline, yychar+1, yytext(), new Integer(yytext()))); }
[_a-zA-Z][_a-zA-Z0-9]* { return new Symbol(sym.ID, new SymbolValue(yyline, yychar+1, yytext()));}

{EOL} {/*reset pos to -1, if 0, otherwise line 1 starts at 0, rest start at 1 */ yychar=-1;}
[ \t\r\n\f] { /* ignore white space. */ }
. { return new Symbol(sym.error, new SymbolValue(yyline, yychar+1, yytext()));}


