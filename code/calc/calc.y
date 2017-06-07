%{

#include <stdio.h>
#include <stdlib.h>
#define YYDEBUG 1

%}

%union {
	double double_val;
}


%type   <double_val> expression term factor

%token  <double_val> DOUBLE_LITERAL
%token  ADD SUB MUL DIV LP RP CR


%%

line_list: line | line_list line ;

line: expression CR { printf(">>%lf\n",$1); } ;

expression: term { $$ = $1; } | term ADD term { $$ = $1 + $3; } | term SUB term { $$= $1- $3; } ;

term: factor { $$ = $1; } | factor MUL factor {$$ = $1 * $3; } | factor DIV factor { $$ = $1 / $3; }  ;

factor: DOUBLE_LITERAL { $$ = $1; } | LP expression RP {$$ = $2;} ;

%%
int yyerror(char const *str){
	extern char *yytext;
	fprintf(stderr,"parse error near %s\n",yytext);
	return 0;
}
int main(void){
	extern int yyparse(void);
	extern FILE * yyin;

	yyin = stdin;
	if(yyparse()){
		fprintf(stderr,"ERRPR !!!");
		exit(1);
	}
}