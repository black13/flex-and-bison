/***********************************************************
 * parser.y file
 * To generate the parser run: "bison parser.y"
 **********************************************************/
%{

#include "ast.h"
#include "parser.h"
#include "scanner.h"

int yyerror(AST **ast, yyscan_t scanner, const char *msg) {
    // Add error handling routine as needed
    return 0;
}

%}

%code requires {

#ifndef YY_TYPEDEF_YY_SCANNER_T
#define YY_TYPEDEF_YY_SCANNER_T
typedef void* yyscan_t;
#endif

}

%output  "parser.c"
%defines "parser.h"

%define api.pure
%lex-param   { yyscan_t scanner }
%parse-param { AST **root}
%parse-param { yyscan_t scanner }

%union {
    int value;
    AST *ast;
}

%token TOKEN_LPAREN
%token TOKEN_RPAREN
%token TOKEN_PLUS
%token TOKEN_MULTIPLY
%token <value> TOKEN_NUMBER

%type <ast> additive_expression
%type <ast> multiplicative_expression
%type <ast> primary_expression

%%

input
    : additive_expression { *root = $1; }
    ;

additive_expression
    : multiplicative_expression { $$ = $1; }
    | additive_expression '+' multiplicative_expression
    {
        $$ = new_binexp(scAdd, $1, $3);
    }
    | additive_expression '-' multiplicative_expression
    {
        $$ = new_binexp(scSub, $1, $3);
    }
    ;

multiplicative_expression
    : primary_expression { $$ = $1; }
    | multiplicative_expression '*' primary_expression
    {
        $$ = new_binexp(scMul, $1, $3);
    }
    | multiplicative_expression '/' primary_expression
    {
        $$ = new_binexp(scDiv, $1, $3);
    }
    ;

primary_expression
    : '(' additive_expression ')' { $$ = $2; }
    | TOKEN_NUMBER { $$ = new_number($1); }
    ;

%%
