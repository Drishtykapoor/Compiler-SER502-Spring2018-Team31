//Define a grammar called Cherish
grammar Cherish;

progBlock
    : 'start' progCode 'end'
    ;

progCode
    : varDecl progCode
    | statements
    ;

varDecl
    : 'int' varAssign
    | 'string' charAssign
    ;

statements
    : assignStatement statements
    | conditionalExp statements
    | iterationExp statements
    | 'display' word
    |
    ;

varAssign
    : word '=' numeral
    ;

charAssign
    : word '=' wordNew
    ;

wordNew: alphabet word;


assignStatement
    : word ('=' arithExp)?    #assignArith
    | word ('=' unary)?       #assignUnary
    ;

word
    : alphabet alphanumeral
    | '_' alphanumeral
    ;

alphanumeral
    : alphabet alphanumeral
    | numeral alphanumeral
    | symbol
    ;

symbol
    : alphabet
    | numeral
    |
    ;

alphabet
    : lowercase
    | uppercase
    ;

arithExp
    : term '+' arithExp
    | term '-' arithExp
    | term
    ;

term
    : factor '*' term
    | factor '/' term
    | factor '%' term
    | factor
    ;

factor
    : unary
    | '(' unary ')'
    | '(rightArithExp)'
    | numeral
    | word
    ;

unary
    : numeral '++'
    | numeral '--'
    | word '++'
    | word '--'
    ;

conditionalExp
    : 'if' '('singleExp')' statements
    | 'if' '('singleExp')' statements 'else' statements
    ;

iterationExp
    : 'while' '('singleExp')' statements
    ;


singleExp
    : 'not' '('singleExp')'
    | relativeExp
    ;

relativeExp
    : terminal operator terminal
    | boolVal
    ;

operator
    : '<='
    | '<'
    | '>'
    | '>='
    | '=='
    | '!='
    ;

terminal
    : word
    | numeral
    ;

boolVal
    : 'true'
    | 'false'
    ;

numeral
    : digit numeral
    | digit
    ;

digit
    : '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9'
    ;

lowercase
    : 'a'|'b'|'c'|'d'|'e'|'f'|'g'|'h'|'i'|'j'|'k'|'l'|'m'|'n'|'o'|'p'|'q'|'r'|'s'|'t'|'u'|'v'|'w'|'x'|'y'|'z'
    ;

uppercase
    : 'A'|'B'|'C'|'D'|'E'|'F'|'G'|'H'|'I'|'J'|'K'|'L'|'M'|'N'|'O'|'P'|'Q'|'R'|'S'|'T'|'U'|'V'|'W'|'X'|'Y'|'Z'
    ;

WS
    : [ \t\n]+ -> skip
    ;
