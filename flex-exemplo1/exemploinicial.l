%option noyywrap
%{
#include <stdio.h>
%}

DIGITO			[0-9]
IDENTIFICADOR		[a-z][a-z0-9]*
DDD			0?[1-9]{2}
NUMERO			{DDD}?[0-9]{4}"-"[0-9]{4}
%%
{NUMERO}			{
				printf("Telefone:%s\n",yytext);
				return(1);	
				}
{IDENTIFICADOR}			{
				printf("\tID:%s\n",yytext);
				return(2);	
				}

[ \n]  				/* nada */
"."				{return(0);}
.				/* nada */


%%
int main(int argc, char **argv){
	if(argc > 1)
		yyin = fopen(argv[1],"r");
	else
		yyin = stdin;

int ch = yylex();

while(ch != 0){
	if(ch == 2){
		printf("Achei um identificador\n");
	}else if(ch ==1){
		printf("chama função que disca para o telefone.\n");
	}
	ch = yylex();	
}
}
