%{
#include <stdlib.h>
#include <stdio.h>
#include "lex.tab.h"

int yywrap(void);
int yyerror(char const *str) ;
int currentLineNumber = 1;

%}

%start  STRING_STATE SINGLE_COMMENT_STATE MUL_COMMENT_STATE

indentifer      [A-Za-z_][A-Za-z_0-9]*
integer         ([1-9][0-9]*)|"0"
double          [0-9]+\.[0-9]+
whitespace      [ \t]
newline         \n

%%

<INITIAL>"+"             {return ADD;}
<INITIAL>"-"             {return SUB;}
<INITIAL>"*"             {return MUL;}
<INITIAL>"/"             {return DIV;}
<INITIAL>"%"             {return MOD;}


<INITIAL>"<"              {return LT;}
<INITIAL>"<="             {return LE;}
<INITIAL>">"              {return GT;}
<INITIAL>">="             {return GE;}

<INITIAL>"=="             {return EQ;}
<INITIAL>"!="             {return NE;}
<INITIAL>"&&"             {return AND;}
<INITIAL>"||"             {return OR;}

<INITIAL>"{"             {return LC;}
<INITIAL>"}"             {return RC;}
<INITIAL>"("             {return LP;}
<INITIAL>")"             {return RP;}

<INITIAL>";"             {return SEMI;}
<INITIAL>":"             {return COLON;}
<INITIAL>"="             {return ASSIGN;}

<INITIAL>"var"           {return VAR;}
<INITIAL>"if"            {return IF;}
<INITIAL>"else"          {return ELSE;}
<INITIAL>"for"           {return FOR;}



<INITIAL>"int"          return INT;
<INITIAL>"double"       return DOUBLE;
<INITIAL>"string"       return STRING;


<INITIAL>{whitespace} { /** 空白符 **/ }

<INITIAL>\n  {currentLineNumber++; }

<INITIAL>{indentifer} { /** 标识符 **/
    return IDENTIFIER;
}

<INITIAL>{integer} {    /** 整型 **/
    return INTEGER_LITERAL;
}

<INITIAL>{double} {  /** 浮点型 **/
    return DOUBLE_LITERAL;
}

<INITIAL>\"      { /** 字符串 **/
    BEGIN STRING_STATE;
}
   
<STRING_STATE>\" {
    BEGIN INITIAL;
    return STRING_LITERAL;
}

<STRING_STATE>\n {
    currentLineNumber++;
}

<INITIAL>"//"              { /**     单行注释    **/
    BEGIN SINGLE_COMMENT_STATE;
}
<SINGLE_COMMENT_STATE>\n {
    currentLineNumber++;
    BEGIN INITIAL;
}

<INITIAL>"/*"              {  /**     多行注释    **/
    BEGIN MUL_COMMENT_STATE;
}
<MUL_COMMENT_STATE>"*/"    { 
    BEGIN INITIAL;
} 

<MUL_COMMENT_STATE>\n     { 
    currentLineNumber++;
}        

%%
int yywrap(void){      
    return 1;
}

int yyerror(char const *str) {
    char *nearToken;
    if (yytext[0] == '\0') {
        nearToken = "EOF";
    } else {
        nearToken = yytext;
    }
    fprintf(stderr, "error for read token:[line:%3d,token:%s,error::%s]\n", currentLineNumber, nearToken,str);
    return 0;
}

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

    int token;
    while(token = yylex()){                             
        printf(">>>token:[%s]=%d\n",yytext,token);  
    }
    yywrap();
}

