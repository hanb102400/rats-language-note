%{

#include <stdio.h>
#include "y.tab.h"

int yywrap(void);

%}

number [1-9]([0-9]*)|[0-9]+\.([0-9])+


%%

"+"       return ADD;
"-"       return SUB;
"*"       return MUL;
"/"       return DIV;
"("       return LP;
")"       return RP;
"\n"      return CR;

{number}  {
  double temp;
  sscanf(yytext,"%lf",&temp);
  yylval.double_val = temp;
  return DOUBLE_LITERAL;
}

[ \t]; /* ignore white space */

. {
  fprintf(stderr,"lexical error.\n");
  exit(1);
}

%%

int yywrap(void){
	return 1;
}