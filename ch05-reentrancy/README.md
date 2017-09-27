# Chapter 05 Reentrancy

## Using Pure Scanners and Parsers Together

If you use `%option bison-bridge` in scanner file, the declaration of `yylex` becomes:

`int yylex(YYSTYPE *lvalp, yyscan_t scaninfo);`

If you use `%option bison-bridge bison-locations`,  the declaration of `yylex` becomes:

`int yylex(YYSTYPE *lvalp, YYLTYPE *llocp, yyscan_t scaninfo);`

In parser file, defines:

```
%define api.pure
%lex-param   { yyscan_t scaninfo }
%parse-param { struct State * state }
%parse-param { yyscan_t scaninfo }
```

The parser file defines `api.pure` to generate a reentrant parser and use `parse-param` to declare that the parser now takes an argument, which is the pointer to the application state. The declaration of `yyparse` and `yyerror` becomes:

```
int yyparse(struct State * state, yyscan_t scaninfo);
int yyerror(struct State * state, yyscan_t scaninfo);
```

The declaration of `yylex` becomes:

`int yylex(YYSTYPE *lvalp, yyscan_t scaninfo);`

## References

* [GNU bison on Wikipedia](https://en.wikipedia.org/wiki/GNU_bison#Reentrancy)
* [Make a reentrant parser with Flex and Bison](https://www.lemoda.net/c/reentrant-parser)
