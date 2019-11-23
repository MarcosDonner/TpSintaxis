
%{
#include <stdio.h>
#include "lex2.l"

int yylex();
int yyerror(char *s);

%}

%token STRING NUM CONS IDEN LITCAD OPERACION
%start instrucciones

%%

instrucciones: instrucciones instruccion | instrucciones expresion | instrucciones palabraConComillas |  instrucciones constante | instruccion | expresion | palabraConComillas | constante ;

instruccion: IDEN | instruccion IDEN ;

expresion: OPERACION | expresion OPERACION ;

palabraConComillas: LITCAD | palabraConComillas LITCAD ;

constante: CONS | constante CONS ;

%%

int yyerror(char *s)
{
	printf("Syntax Error on line %s\n", s);
	return 0;
}

int main()
{
    yyparse();
    return 0;
}
