%{
#include <stdio.h>

int tokens = 0;
int keyword = 0;
int literal = 0;
int operator = 0;
int special = 0;
int punctuation = 0;
int variable = 0;
int constant = 0;
%}

%token MAIN_KEYWORD RETURN_KEYWORD PRINT_KEYWORD
%token INT_TYPE_KEYWORD KEYWORD_TYPE STRING_KEYWORD CHAR_KEYWORD FLOAT_KEYWORD
%token ADD_OP SUB_OP DIV_OP MULT_OP EQUALS_OP LESS_THAN GREATER_THAN
%token LESS_THAN_EQUAL_TO GREATER_THAN_EQUAL_TO LEFT_PAREN RIGHT_PAREN
%token LEFT_CURLY RIGHT_CURLY SEMICOLON COMMA NEWLINE
%token IF_STATEMENT ELSE_STATEMENT ELSEIF_STATEMENT WHILE_LOOP_KEYWORD
%token FOR_LOOP_KEYWORD SWITCH_KEYWORD CASE_KEYWORD BREAK_KEYWORD DEFAULT_KEYWORD
%token STRING_LITERAL CHAR_LITERAL SPECIAL_SYMBOL
%token UNARY_OP IDENTIFIER INTEGER_CONSTANT

%%

program:
    statements {
        printf("Total number of keywords: %d\n", keyword);
        printf("Total number of literals: %d\n", literal);
        printf("Total number of operators: %d\n", operator);
        printf("Total number of identifiers: %d\n", variable);
        printf("Total number of constants: %d\n", constant);
        printf("Total number of punctuation: %d\n", punctuation);
        printf("Total number of special symbols: %d\n", special);
        printf("Total number of tokens: %d\n", tokens);
    }
    ;

statements:
    /* Empty */
    | statements statement
    ;

statement:
    MAIN_KEYWORD
    | RETURN_KEYWORD
    | PRINT_KEYWORD
    | INT_TYPE_KEYWORD
    | KEYWORD_TYPE
    | STRING_KEYWORD
    | CHAR_KEYWORD
    | FLOAT_KEYWORD
    | ADD_OP
    | SUB_OP
    | DIV_OP
    | MULT_OP
    | EQUALS_OP
    | LESS_THAN
    | GREATER_THAN
    | LESS_THAN_EQUAL_TO
    | GREATER_THAN_EQUAL_TO
    | LEFT_PAREN
    | RIGHT_PAREN
    | LEFT_CURLY
    | RIGHT_CURLY
    | SEMICOLON
    | COMMA
    | NEWLINE
    | IF_STATEMENT
    | ELSE_STATEMENT
    | ELSEIF_STATEMENT
    | WHILE_LOOP_KEYWORD
    | FOR_LOOP_KEYWORD
    | SWITCH_KEYWORD
    | CASE_KEYWORD
    | BREAK_KEYWORD
    | DEFAULT_KEYWORD
    | STRING_LITERAL
    | CHAR_LITERAL
    | SPECIAL_SYMBOL
    | UNARY_OP
    | IDENTIFIER
    | INTEGER_CONSTANT
    ;
%%

int yywrap() {
    return 1;
}

int main() {
    yyparse();
    return 0;
}
