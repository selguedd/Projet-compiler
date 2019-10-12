%%// Options of the scanner

%class Main	//Name
%unicode		//Use unicode
%line         	//Use line counter (yyline variable)
%column       	//Use character counter by line (yycolumn variable)
%type Symbol  //Says that the return type is Symbol
%standalone		//Standalone mode

// Return value of the program
%eofval{
	return new Symbol(LexicalUnit.END_OF_STREAM, yyline, yycolumn);
%eofval}

// Extended Regular Expressions

AlphaUpperCase = [A-Z]
AlphaLowerCase = [a-z]
Alpha          = {AlphaUpperCase}|{AlphaLowerCase}
Numeric        = [0-9]
AlphaNumeric   = {Alpha}|{Numeric}

Sign           = [+-]
Integer        = {Sign}?(([1-9][0-9]*)|0)
Decimal        = \.[0-9]*
Exponent       = [eE]{Integer}
Real           = {Integer}{Decimal}?{Exponent}?
Identifier     = {Alpha}{AlphaNumeric}*
space          =[\\s+]
ID             ={Identifier}{space}*
Comments       =[CO][CO]

%%// Identification of tokens
"co".*               { }
"CO".*"CO"           { }

"begin"		        {System.out.println("BEG: " + yytext()); return new Symbol(LexicalUnit.BEG,yyline, yycolumn);}
"end"	        {System.out.println("END: " + yytext()); return new Symbol(LexicalUnit.END,yyline, yycolumn);}
{Numeric}	        {System.out.println("NUMBER: " + yytext()); return new Symbol(LexicalUnit.NUMBER,yyline, yycolumn, new Double(yytext()));}
"read"		        {System.out.println("READ: " + yytext()); return new Symbol(LexicalUnit.READ,yyline, yycolumn);}
"("	        {System.out.println("LEFT_PARENTHESIS: " + yytext()); return new Symbol(LexicalUnit.LEFT_PARENTHESIS,yyline, yycolumn);}
")"		        {System.out.println("RIGHT_PARENTHESIS: " + yytext()); return new Symbol(LexicalUnit.RIGHT_PARENTHESIS,yyline, yycolumn);}
"while"	        {System.out.println("WHILE: " + yytext()); return new Symbol(LexicalUnit.WHILE,yyline, yycolumn);}
"not"		        {System.out.println("NOT: " + yytext()); return new Symbol(LexicalUnit.NOT,yyline, yycolumn);}
"="	        {System.out.println("EQUAL: " + yytext()); return new Symbol(LexicalUnit.EQUAL,yyline, yycolumn);}
">"		        {System.out.println("GREATER: " + yytext()); return new Symbol(LexicalUnit.GREATER,yyline, yycolumn);}
">="	        {System.out.println("GREATER_EQUAL: " + yytext()); return new Symbol(LexicalUnit.GREATER_EQUAL,yyline, yycolumn);}
"<"		        {System.out.println("SMALLER: " + yytext()); return new Symbol(LexicalUnit.SMALLER,yyline, yycolumn);}
"<="	        {System.out.println("SMALLER_EQUAL: " + yytext()); return new Symbol(LexicalUnit.SMALLER_EQUAL,yyline, yycolumn);}
"/="            {System.out.println("DIFFERENT: " + yytext()); return new Symbol(LexicalUnit.DIFFERENT,yyline, yycolumn);}
"do"            {System.out.println("DO: " + yytext()); return new Symbol(LexicalUnit.DO,yyline, yycolumn);}
"-"             {System.out.println("MINUS: " + yytext()); return new Symbol(LexicalUnit.MINUS,yyline, yycolumn);}
"endwhile"      {System.out.println("ENDWHILE: " + yytext()); return new Symbol(LexicalUnit.ENDWHILE,yyline, yycolumn);}
"print"         {System.out.println("PRINT: " + yytext()); return new Symbol(LexicalUnit.PRINT,yyline, yycolumn);}  

// If/Else keywords
"if"	        {System.out.println("IF: " + yytext()); return new Symbol(LexicalUnit.IF,yyline, yycolumn);}
"then"        {System.out.println("THEN: " + yytext()); return new Symbol(LexicalUnit.THEN,yyline, yycolumn);}
"else"        {System.out.println("ELSE: " + yytext()); return new Symbol(LexicalUnit.ELSE,yyline, yycolumn);}


// C99 variable identifier
{Identifier}  {System.out.println("VARNAME: " + yytext()); return new Symbol(LexicalUnit.VARNAME,yyline, yycolumn, yytext());}

// Ignore other characters
.             {}