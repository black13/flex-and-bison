# Implementation of REPL Supporting Multiline Statements

## Introduction

REPLs(read-eval-print-loop) of Python, Lua etc support multiline statements. That is, REPL detects whether the input is finished. Implementations posted on stackoverflow(see references) can be classified as bellowing:
* Using state parameters to control interpreter
* Push parser, an experimental option of bison

A special token is required to end the statement in both cases, since LALR(1) parser need a lookahead token to decides whether it should shift or reduce.

So, it is hard to generate a REPL for the bellowing grammar:
```
calclist: /* empty, matches at beginning of input */
    | calclist exp
    ;

exp: factor
    | exp ADD factor
    | exp SUB factor
    ;

factor: term
    | factor MUL term
    | factor DIV term
    | factor MOD term
    ;

term: NUMBER
    | LPAREN exp RPAREN
    ;
```

As for input '1 - 2 <enter>', when a  push parser encounter a number at the end of line, `yypush_parse` return YYPUSH_MORE (requires input to finish). In fact, the expression is complete, we want to evaluate immediately.

## References

1. [REPL for interpreter using Flex/Bison](https://stackoverflow.com/questions/6636808/repl-for-interpreter-using-flex-bison)
2. [Save and restore parser state manually](https://stackoverflow.com/questions/16612682/save-and-restore-parser-state-manually)
3. [Bison parser expanding rule instead of reducing rule](https://stackoverflow.com/questions/25105717/bison-parser-expanding-rule-instead-of-reducing-rule)
