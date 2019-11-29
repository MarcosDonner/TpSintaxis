%option noyywrap

%{ 
	
	#pragma warning (disable: 4005)

	#include <iostream>
	#include <string.h>
	

	using namespace std;

	#include "parser.h"

%}

NUMB	([0-9]+)|([0-9]*\.[0-9]+)
NODIGIT	([a-zA-Z])+
EXCLA	"!"
PESO	"$"
COMSIM	"'"
MAS		"++"
RESTA	"--"
IDENT	{NODIGIT}({NODIGIT}|{NUMB})*{EXCLA}
CONS	{PESO}({NODIGIT}|{NUMB})({NODIGIT}|{NUMB})*{PESO} 
LITCAD	{COMSIM}({NODIGIT}|{NUMB})*{COMSIM}
OPERA	({NUMB}{MAS}{NUMB}|{NUMB}{RESTA}{NUMB})+  

%%

{NUMB}			{ yylval = atof(yytext); return NUM; }
{NODIGIT}		{return (STRING);}
{CONS}			{return (CONST);}
{IDENT}			{return (IDENTI);}
{LITCAD}		{return (LICADE);}
{OPERA}			{return (OPERAC);}
[\n]			{ return '\n'; }
[ \t]			{ /* empty */ }
"quit"			{ yyterminate(); }
.				

