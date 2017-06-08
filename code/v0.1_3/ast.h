
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

/**
 * Expression
 */

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
   LE_OPER,
   ADD_OPER,
   OR_OPER
} OperType;

typedef struct {
   OperType  type;
   Expression* left;
   Expression* right;
} Expression;


typedef struct {
   OperType  type;
   Expression* left;
   Expression* right;
} Expression;

/**
 * Stmt
 */
typedef struct Stmt_Tag Stmt;
typedef struct StmtList_Tag StmtList;
struct StmtList_Tag {
    int            size;
    Stmt           *statement;
    StmtList       *next;
};

typedef struct {
    StmtList *stmtList;
} Block;

typedef struct {
    char* variable;
    Expression* operand;
} DeclareStmt;

typedef struct {
    Expression  *condition;
    Block       *thenBlock;
    Block       *elseBlock;
} IfStmt;

struct Stmt_Tag {
   StatementType       type;
   union {
       Expression       *exprStatement;       //表达式语句
       DeclareStmt      *declareStmt;    //声明语句
       IfStmt           *ifStmt;         //if语句
       PutsStmt         *putsStmt
   } stmt;
};

/**
 * Node
 */
typedef enum  {
    NODE_IDENTIFIER = 1,
    NODE_VALUE,
    NODE_EXPRESSION, 
    NODE_STATEMENT,
} NodeType;

typedef	struct Node_Tag Node;
struct Node_Tag{
    Node *left;
    Node *right;
    NodeType nodeType;
    union {
      char *identifier;
      Value *value;
      Expression *assignExpression;
      BinaryExpression *binaryExpression;
    } v;
} ;


Expression* parse_program();
Expression* parse_assgin_expression(Variable* variable, Expression* expr);
Expression* parse_oper_expression( OperType  type,Expression* left, Expression* right);
Expression* parse_logic_expression( LogicType  type,Expression* left, Expression* right);