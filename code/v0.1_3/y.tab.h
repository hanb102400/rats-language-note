/* A Bison parser, made by GNU Bison 3.0.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    ADD = 258,
    SUB = 259,
    MUL = 260,
    DIV = 261,
    MOD = 262,
    EQ = 263,
    NE = 264,
    GT = 265,
    GE = 266,
    LT = 267,
    LE = 268,
    AND = 269,
    OR = 270,
    SEMI = 271,
    COLON = 272,
    ASSIGN = 273,
    LP = 274,
    RP = 275,
    LC = 276,
    RC = 277,
    VAR = 278,
    IF = 279,
    ELSE = 280,
    FOR = 281,
    INT = 282,
    DOUBLE = 283,
    STRING = 284,
    PUTS = 285,
    IDENTIFIER = 286,
    INTEGER_LITERAL = 287,
    DOUBLE_LITERAL = 288,
    STRING_LITERAL = 289
  };
#endif
/* Tokens.  */
#define ADD 258
#define SUB 259
#define MUL 260
#define DIV 261
#define MOD 262
#define EQ 263
#define NE 264
#define GT 265
#define GE 266
#define LT 267
#define LE 268
#define AND 269
#define OR 270
#define SEMI 271
#define COLON 272
#define ASSIGN 273
#define LP 274
#define RP 275
#define LC 276
#define RC 277
#define VAR 278
#define IF 279
#define ELSE 280
#define FOR 281
#define INT 282
#define DOUBLE 283
#define STRING 284
#define PUTS 285
#define IDENTIFIER 286
#define INTEGER_LITERAL 287
#define DOUBLE_LITERAL 288
#define STRING_LITERAL 289

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 7 "rats.y" /* yacc.c:1915  */

    char*    identifier;
    int      integer_value;
    double   double_value;
    char     *string_value;

#line 129 "y.tab.h" /* yacc.c:1915  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
