%{

#include <stdio.h>
#include "sin2.tab.h"

%}

digito     ([0-9])+ 
noDigito       ([a-zA-Z])+
signoExclamacion    "!"
signo   "$"
mas  "++"
resta "--"
comillaSimple   "'"        
identificador      {noDigito}({noDigito}|{digito})*{signoExclamacion}
constante   {signo}({noDigito}|{digito})({noDigito}|{digito})*{signo} 
litCad     {comillaSimple}({noDigito}|{digito})*{comillaSimple} 
operacion   ({digito}{mas}{digito}|{digito}{resta}{digito})+     

%%

{noDigito}			   {sscanf(yytext, "%s", yylval.name); return (STRING);}
{digito}      {yylval.number = atoi(yytext); return (NUM);}
{constante}     {return (CONS);}
{identificador}     {return (IDEN);}
{litCad}     {return (LITCAD);}
{operacion}   {return (OPERACION);}
. ECHO;


%%


