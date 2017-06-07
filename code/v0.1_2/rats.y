%{
#include <stdlib.h>
#include <stdio.h>
#define YYDEBUG 1
%}

%union {
    char*    identifier;
    int      integer_value;
    double   double_value;
    char     *string_value;
}

%token ADD SUB MUL DIV MOD
%token EQ NE GT GE LT LE AND OR
%token SEMI COLON  ASSIGN LP RP LC RC
%token VAR IF ELSE FOR
%token INT DOUBLE STRING
%token PUTS

%token <identifier>     IDENTIFIER
%token <integer_value>  INTEGER_LITERAL
%token <double_value>   DOUBLE_LITERAL
%token <string_value>   STRING_LITERAL

%type   <expression>        expression  assign_expression value_expression
%type   <statement>         statement declare_statement  if_statement  for_statement puts_statemnt
%type   <statement_list>    statement_list
%type   <block>             block

%%

program: 
    statement_list 
    ;

block: 
    LC statement_list RC
    ;

statement_list: 
    statement
    | statement_list  statement
    ;

statement:
    puts_statemnt 
    | declare_statement 
    | if_statement
    | for_statement 
    |  expression '\n'
    ;

declare_statement:
    VAR identifier COLON type 
    |VAR identifier COLON type ASSIGN expression 
    ;

type:
    INT {
        printf("INT\n");
    } 
    |DOUBLE {
        printf("DOUBLE\n");
    } 
    |STRING{
        printf("STRING\n");
    } 
    ; 
    
if_statement: 
    IF if_header block elseif_list ELSE block
    ;  
if_header:
    expression
    ;
elseif_list:
    |elseif_list elseif
    ;
elseif:
     ELSE IF if_header block
     ;

for_statement:
    FOR for_header block   
    ;
for_header:
    expression SEMI expression SEMI expression
    ;
puts_statemnt:
    PUTS expression {
        printf("PUTS\n");
    }
    ;

expression:
      assign_expression
      | expression  MUL expression
      | expression  DIV expression
      | expression  MOD expression
      | expression  ADD expression
      | expression  SUB expression
      | expression  LT expression
      | expression  LE expression
      | expression  GT expression
      | expression  GE expression
      | expression  EQ expression
      | expression  NE expression
      | expression  AND expression
      | expression  OR expression
      | value_expression 
      ;

assign_expression:
    identifier ASSIGN  expression 
    ;

value_expression:
     INTEGER_LITERAL {
        printf("<INTEGER_LITERAL:%d>\n",$1);
    } 
    | DOUBLE_LITERAL {
        printf("<DOUBLE_LITERAL:%lf>\n",$1);
    }  
    | STRING_LITERAL {
        printf("<STRING_LITERAL:%lf>\n",$1);
    } 
    | identifier
    ;

identifier:
    IDENTIFIER  {
        printf("<IDENTIFIER:%s>\n",$1);
    } 
    ;    
%%    

int main(int argc, char **argv){

  if (argc != 2) {
       fprintf(stderr, "usage:%s filename", argv[0]);
       exit(1);
  }

  FILE* fp=fopen(argv[1], "r");
  if(fp==NULL)
  {
      printf("cannot open %s\n", argv[1]);
      return -1;
  }
  extern FILE *yyin;
  yyin=fp;  //从文件读取输入后
  yyparse();

  return 0;
}
