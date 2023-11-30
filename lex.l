%{
#include <stdio.h>
int tokens=0;
int keyword=0;
int literal=0;
int operator=0;
int special =0;
int punctuation=0;
int variable=0;
int constant=0;

%}

DIGIT [0-9]
WS [ \t\n]

%%

"chief"                  {printf("main keyword: %s\n" ,yytext);variable++;tokens++;}
"repay"                  {printf("return keyword: %s\n" ,yytext);keyword++;tokens++;}
"write"                  {printf("print keyword : %s\n", yytext);keyword++;tokens++;}
"int"                    {printf("Integer TYPE Keyword: %s\n",yytext);keyword++;tokens++;}
"void"                   {printf("Keyword TYPE: %s\n",yytext);keyword++;tokens++;}
"chain"                  {printf("String Keyword : %s\n" , yytext);keyword++;tokens++;}
"Characater"              {printf("Char keyword - %s\n" ,yytext);keyword++;tokens++;}
"decimal"                 {printf("Float keyword - %s\n" ,yytext);keyword++;tokens++;}
"%%"                     { /* ignore comments */}
"plus"                   {printf("Addition operator : %s\n", yytext);operator++;tokens++;}
"minus"                  {printf("Subtraction operator : %s\n", yytext);operator++;tokens++;}
"div"                    {printf("Division operator: %s\n",yytext);operator++;tokens++;}
"mul"                    {printf("Multiplication operator: %s\n", yytext);operator++;tokens++;}
"="                     {printf("Equals operator: %s\n",yytext);operator++;tokens++;}
"<"                     {printf("Less_Than: %s\n",yytext);operator++;tokens++;}
">"                      { printf("GREATER_THAN: %s\n",yytext); operator++;tokens++;}
"<="                     {printf("Less_Than_Equal_To: %s\n",yytext);operator++;tokens++;}
">="                     {printf("Greater_Than_Equal_To: %s\n",yytext);operator++;tokens++;}
"("                       { printf("Left Parenthesis Punctuation: %s\n", yytext);punctuation++;tokens++; }
")"                      { printf("Right Parenthesis Punctuation: %s\n", yytext);punctuation++;tokens++; }
"{"                       { printf("Left Curly Bracket Punctuation: %s\n", yytext); punctuation++;tokens++;}
"}"                       { printf("Right Curly Bracket Punctuation: %s\n", yytext);punctuation++;tokens++; }
";"                        { printf("SEMICOLON Punctuation: %s\n", yytext);punctuation++;tokens++; }
","                        { printf("COMMA Punctuation: %s\n", yytext); punctuation++;tokens++;}
"\\n"                     { printf("NEWLINE: \\n\n"); }
"condition"                {printf("IF Statement: %s\n",yytext);keyword++;tokens++;}
"another"                 {printf("ELSE Statement : %s\n",yytext);keyword++;tokens++;}
"elseways"                {printf("ELSEIF Statement : %s\n",yytext);keyword++;tokens++;}
"span"                    {printf("while loop keyword: %s\n",yytext);keyword++;tokens++;}
"for"                     {printf("for loop keyword: %s\n",yytext);keyword++;tokens++;}
"button"                   {printf("Switch keyword: %s\n",yytext);keyword++;tokens++;}
"holder"                    {printf("case keywords: %s\n",yytext);keyword++;tokens++;}
"crack"                     {printf("break keyword: %s\n",yytext);keyword++;tokens++;}
"revert"                      {printf("default keyword: %s\n",yytext);keyword++;tokens++;}
\"[^"]*\"                   { printf("STRING_LITERAL: %s\n", yytext);literal++;tokens++; }
"\'[^\'\n]\'"             { printf("CHAR_LITERAL: %s\n", yytext);literal++;tokens++; }
"@"                      { printf("special symbol: %s\n", yytext); special++;tokens++;}
"#"                      { printf("special symbol %s\n", yytext); special++;tokens++;}
"&"                      { printf("special symbol %s\n", yytext); special++;tokens++;}
"++"                     {printf("Unary operator: %s\n",yytext);operator++;}
"--"                     {printf("Unary operator: %s\n",yytext);operator++;}
[a-zA-Z_][a-zA-Z0-9_]*    { printf("IDENTIFIER: %s\n", yytext); variable++;tokens++;}
[0-9]+                     { printf("INTEGER CONSTANT: %s\n", yytext); constant++;tokens++;}
{WS}+                    /* Skip whitespace and tabs */
.                        { printf("INVALID: %s\n", yytext); }

%%
int yywrap() {
    return 1;
}

int main() {
    yylex();
    printf("Total number of keywords: %d\n", keyword);
    printf("Total number of literals: %d\n", literal);
    printf("Total number of operator: %d\n", operator);
    printf("Total number of identifiers: %d\n", variable);
    printf("Total number of constants: %d\n", constant);
    printf("Total number of punctuation: %d\n", punctuation);
    printf("Total number of special symbols: %d\n", special);
    printf("Total number of tokens: %d\n", tokens);

    return 0;
}
