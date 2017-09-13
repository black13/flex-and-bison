# Chapter 2 Scanner 

## Token Numbers

When a flex scanner returns a stream of tokens, each token actually has two parts, the token and the token's value. The token is a small integer. The token numbers are arbitrary, except that the token zero always means end-of-file. When `bison` creates a parser, `bison` assigns the token numbers automatically starting at 258 (this avoids collisions with literal character tokens) and creates a .h with definitions of the tokens numbers. We can just define a few tokens by hand.

## Definitions

The definitions section is composed of substitutions, code, and start states. Code in the definitions section is simply copied as-is to the top of the generated C file and must be bracketed with “%{“ and “%}” markers. Substitutions simplify pattern-matching rules. For example, we may define digits and letters:
```
digit [0-9]
alphabet [a-zA-Z]
```

## Token Values

The values of tokens are whatever was in `yylval` when the scanner returned the token. We can define `yylval` as a primitive type or a union:
```
int yylval;
```
or
```
union {
    int num;
    char *name;
} yylval;
```

## Locations

If you set `%option yylineno`, flex defines `yylineno` to contains the current line number and automatically updates it each time it reads a `\n` character. `YY_USER_ACTION` macro is expanded just before the code for each scanner action, after `yytext` and `yyleng` are set up. It can be use to set token locations.

## Start States

A start state let us control which patterns can be match when. For example, if we want skip comments in a C source file, that is characters between `/*` and '*/'. The `%x` line defines a start state (INITIAL is defined by flex by default):
```
%x COMMENT
```
The rules:
```
"/*"                 { BEGIN(COMMENT);                   }
<COMMENT>"*/"        { BEGIN(INITIAL);                   }
<COMMENT>\n          { /* skip */                        }
<COMMENT>.           { /* skip */                        }
<COMMENT>"/*"        { yyerror("Nested Comments\n");     }
<COMMENT><<EOF>>     { yyerror("Incomplete Comments\n"); }
```

## Resolving Ambiguous Patterns

When there is more than one match, lex uses the following strategy:
1. Always match to the longest possible string.
2. If two different rules match the same longest string, use the regular expression that appears first in the input file.
