# Chapter 3 Parser

## What Bison's LALR(1) Parser Cannot Parse

Bison parsers can use either of two parsing methods, known as LALR(1)(Look Ahead Left to Right with a one-token lookahead) and GLR(Generalized Left to Right).

LALR parsing is quite powerful and fast. It cannot deal with ambiguous grammars, ones in which the input can match more than one parse tree. It also cannot deal with grammars that need more than one token of lookahead to tell whether it has matched a rule.

## Symbol Values

Bison uses the `%unoin` construct to declare types to be used in the values of symbols in the parser. In a bison parser, every symbol, both tokens and nonterminals, can have a value associated with it. By default, the values are all integers, but useful programs generally need more sophiscated values. The `%unoin` construct, as its name suggests, is used to create a C language `unoin` declarartion for symbol values.
