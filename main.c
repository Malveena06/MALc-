#include <stdio.h>
#include "parse.tab.h"

extern FILE* yyin; // Declare yyin to set input stream for the lexer

int main() {
    FILE* file = fopen("input.txt", "r"); // Change "input.txt" to your input file
    if (!file) {
        fprintf(stderr, "Error opening file\n");
        return 1;
    }
    
    yyin = file; // Set the input stream for the lexer
    
    yyparse(); // Call the parser
    
    fclose(file);
    return 0;
}
