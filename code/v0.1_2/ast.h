
//value
typedef struct {
    char* valueType;
    union {
      int    int_value;
      double double_value;
      char*  string_value;
    }

} Value;

//Variable
typedef struct {
    char* name;
    Value value;
} Variable;

//type
typedef enum {
    VALUE_EXPRESSION = 1,
    ASSIGN_EXPRESSION,
    OPER_EXPRESSION,
    LOGIC_EXPRESSION,
    MINUS_EXPRESSION
} ExpressionType;

typedef enum {
   ADD_OPER = 1,
   SUB_OPER,
   MUL_OPER,
   DIV_OPER,
   MOD_OPER,
   EQ_OPER,
   NE_OPER,
   GT_OPER,
   GE_OPER,
   LT_OPER,
   LE_OPER
} OperType;

typedef enum {
   AND_LOGIC = 1,
   OR_LOGIC,
   NOT_LOGIC,
} LogicType;

//expression
typedef struct {
   int line_number;
   ExpressionType type;
   union {
       Value value;
       AssignExpression assgin_expression;
       OperExpression oper_expression;
       LogicExpression logic_expression;
       MinusExpression minus_expression;
   } u;
} Expression;

//assign expression
typedef struct {
    Variable* variable;
    Expression* expr;
} AssignExpression;

//oper expression
typedef struct {
    OperType  type;
    Expression* left;
    Expression* right;
} OperExpression;

//logic expression
typedef struct {
    LogicType  type;
    Expression* left;
    Expression* right;
} LogicExpression;

Expression* parse_program();
Expression* parse_assgin_expression(Variable* variable, Expression* expr);
Expression* parse_oper_expression( OperType  type,Expression* left, Expression* right);
Expression* parse_logic_expression( LogicType  type,Expression* left, Expression* right);