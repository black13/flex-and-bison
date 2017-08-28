# Chapter 1 Getting Started

## A Simple Flex Program

A word counter program, just like Unix `wc`:

```
%{
int chars = 0;
int words = 0;
int lines = 0;
%}

%%

[a-zA-Z]+  { words++; chars += strlen(yytext); }
\n         { chars++; lines++;                 }
.          { chars++;                          }

%%

int yywrap() {
    return 1;
}

int main(int argc, char *argv[])
{
    yylex();
    printf("%8d%8d%8d\n", lines, words, chars);
}
```

A flex program consists of three sections, separated by %% lines.
* The first section contains declarations and option settings.
* The second section is a list of patterns and actions.
* The third section is C code that is copied to the generated scanner, usually small routines related to the code in the actions.

In the declaration section, code inside of %{ and %} is copied through verbatim near the beginning of the generated C source file.

In the second section, each patterns is at the beginning of a line, followed by the C code to execute when the pattern matches. The C code can be one statement or possibly a multiline block in braces, { }.

*Each pattern must start at the beginning of the line, since flex considers any line that starts with whitespace to be code to be copied into the generated C program.*

In the third section, function `yywrap` is defined, since `-lfl` not found error is thrown while compiling on macOS.

To translate the flex program and compile the generated C source file:
```
$ flex scanner.l
$ cc lex.yy.c
$ ./a.out
```

## Compiling Flex and Bison Programs Together

The example `calc` is a simple integer arithmetical expression interpreter. The grammar is:
```
exp ::= exp + factor | exp - factor
factor ::= term | factor * term | factor / term
term ::= number | '(' exp ')'
```
