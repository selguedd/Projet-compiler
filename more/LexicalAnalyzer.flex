%%// Options of the scanner

%class Main	//Name
%unicode		//Use unicode
%line         	//Use line counter (yyline variable)
%column       	//Use character counter by line (yycolumn variable)
%type Symbol    //Says that the return type is Symbol
%standalone		//Standalone mode

// Return value of the program
%eofval{
    Identifiers.parcoursList();
	return new Symbol(LexicalUnit.END_OF_STREAM, yyline, yycolumn);
%eofval}

// Extended Regular Expressions

AlphaUpperCase = [A-Z]
AlphaLowerCase = [a-z]
Alpha          = {AlphaUpperCase}|{AlphaLowerCase}
Numeric        = [0-9]
AlphaNumeric   = {Alpha}|{Numeric}
Number         = (([1-9][0-9]*)|0)
Identifier     = {Alpha}{AlphaNumeric}*{Alpha}*
CommentLine    ="co".*
Endofline      ="\n"

//Declare exclusive states
%xstate YYINITIAL, COMMENT

%% //Identification of tokens

//switch between mode, default : YYINITIAL

<YYINITIAL> {
{CommentLine}   {}
{Endofline}     {}
"CO"            {yybegin(COMMENT);}
"begin"		    {Symbol symb= new Symbol(LexicalUnit.BEG,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());return symb;}
"end"	        {Symbol symb= new Symbol(LexicalUnit.END,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());return symb;}
{Number}	    {Symbol symb= new Symbol(LexicalUnit.NUMBER,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());return symb;}
";"             {Symbol symb= new Symbol(LexicalUnit.SEMICOLON,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());return symb;}
":="            {Symbol symb= new Symbol(LexicalUnit.ASSIGN,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());return symb;}
"("	            {Symbol symb= new Symbol(LexicalUnit.LEFT_PARENTHESIS,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());return symb;}
")"		        {Symbol symb= new Symbol(LexicalUnit.RIGHT_PARENTHESIS,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());return symb;}



// OPERATOR
"-"             {Symbol symb= new Symbol(LexicalUnit.MINUS,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());return symb;}
"+"             {Symbol symb= new Symbol(LexicalUnit.PLUS,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());return symb;}
"*"             {Symbol symb= new Symbol(LexicalUnit.TIMES,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());return symb;}
"/"             {Symbol symb= new Symbol(LexicalUnit.DIVIDE,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());return symb;}



// If/Else keywords
"if"	        {Symbol symb= new Symbol(LexicalUnit.IF,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());return symb;}
"then"          {Symbol symb= new Symbol(LexicalUnit.THEN,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());}
"endif"         {Symbol symb= new Symbol(LexicalUnit.ENDIF,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());}
"else"          {Symbol symb= new Symbol(LexicalUnit.ELSE,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());}
//comparaison
"not"		    {Symbol symb= new Symbol(LexicalUnit.NOT,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());}
"and"		    {Symbol symb= new Symbol(LexicalUnit.AND,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());}
"or"		    {Symbol symb= new Symbol(LexicalUnit.OR,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());}



//Condition
"="	            {Symbol symb= new Symbol(LexicalUnit.EQUAL,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());return symb;}
">"	            {Symbol symb= new Symbol(LexicalUnit.GREATER,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());return symb;}
">="	        {Symbol symb= new Symbol(LexicalUnit.GREATER_EQUAL,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());return symb;}
"<"		        {Symbol symb= new Symbol(LexicalUnit.SMALLER,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());return symb;}
"<="	        {Symbol symb= new Symbol(LexicalUnit.SMALLER_EQUAL,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());return symb;}
"/="            {Symbol symb= new Symbol(LexicalUnit.DIFFERENT,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());return symb;}
// while keywords
"while"	        {Symbol symb= new Symbol(LexicalUnit.WHILE,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());return symb;}
"do"            {Symbol symb= new Symbol(LexicalUnit.DO,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());return symb;}
"endwhile"      {Symbol symb= new Symbol(LexicalUnit.ENDWHILE,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());return symb;}
// for keywords
"for"           {Symbol symb= new Symbol(LexicalUnit.FOR,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());return symb;}
"from"          {Symbol symb= new Symbol(LexicalUnit.FROM,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());return symb;}
"by"            {Symbol symb= new Symbol(LexicalUnit.BY,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());return symb;}
"to"            {Symbol symb= new Symbol(LexicalUnit.TO,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());return symb;}
// functions
"print"         {Symbol symb= new Symbol(LexicalUnit.PRINT,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());return symb;}
"read"		    {Symbol symb= new Symbol(LexicalUnit.READ,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());return symb;}



// C99 variable identifier
{Identifier}  {Symbol symb= new Symbol(LexicalUnit.VARNAME,yyline, yycolumn,new String(yytext()));System.out.println(symb.toString());
                Identifiers ident = new Identifiers(yyline, yycolumn, yytext());}

// Ignore other characters
.             {}
}

<COMMENT>      {

  "CO"         {yybegin(YYINITIAL);}
  <<EOF>>      {System.out.println("the comment is never closed.");yybegin(YYINITIAL);}
  [^]          {} //ignore
}





