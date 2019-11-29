%defines "parser.h"

%{
	#include <cmath>
	#include <cstdio>
	#include <iostream>

	#pragma warning (disable: 4005)
	
	extern int yylex();
	 
	extern void yyerror(const char*);

	using namespace std;
%}

%define api.value.type { double }

%token NUM STRING CONST IDENTI LICADE OPERAC

%left '-' '+'
%left '*' '/'

%%		
instrucciones: instrucciones instruccion | instrucciones expresion | instrucciones palabraConComillas |  instrucciones constante | instruccion | expresion | palabraConComillas | constante ;

instruccion: IDENTI | instruccion IDENTI ;

expresion: OPERAC | expresion OPERAC;

palabraConComillas: LICADE| palabraConComillas LICADE ;

constante: CONST | constante CONST ;

%%
