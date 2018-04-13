%token IF ELSE BEGN END LOOP COMMA LP RP LC RC SEMI_COL OR_OP AND_OP IMP_OP IFF_OP NOT_OP
SCAN PRINT COMMENT RETURN LOGIC_VAL ASSIGNMENT_OP VAR PREDICATE_NAME CONST ARRAY_INIT LSQ
RSQ INT
%%
start:      program
program:    BEGN predicates END stmts
             | COMMENT BEGN predicates END stmts
             | stmts
             | /*EMPTY*/
;

predicates: predicate |predicates predicate
;

predicate:  PREDICATE_NAME LP parameter_list RP body
;

body:       LC stmts RETURN proposition SEMI_COL RC
            | LC RETURN proposition SEMI_COL RC
            | LC stmts RETURN predicate_instantiation SEMI_COL RC

;

parameter_list: /*EMPTY*/
             | parameter
             | parameter COMMA parameter_list
	     ;

parameter:   atomic_proposition
;

stmts: stmt
       | stmt stmts
       | COMMENT stmts
       | stmt COMMENT
;

stmt:  matched | unmatched
;

matched: IF LP atomic_proposition RP LC matched RC ELSE LC matched RC
         | other SEMI_COL
;
other: assignment_statement
         | loop_statement
         | print_statement
         | scan_statement
         | list_initialization
;

unmatched: IF LP atomic_proposition RP LC stmts SEMI_COL RC
         | IF LP atomic_proposition RP LC matched RC ELSE LC unmatched RC

;

assignment_statement: VAR ASSIGNMENT_OP proposition
         | VAR ASSIGNMENT_OP list_initialization
         | VAR ASSIGNMENT_OP predicate_instantiation
         | array_index ASSIGNMENT_OP atomic_proposition
         | CONST ASSIGNMENT_OP LOGIC_VAL
;

loop_statement: LOOP LP atomic_proposition RP LC stmts RC
;

list_initialization: ARRAY_INIT LSQ INT RSQ
         | LSQ parameter_list RSQ
;

array_index: VAR LSQ INT RSQ
;

print_statement: PRINT proposition
         | PRINT predicate_instantiation
;

scan_statement: SCAN VAR
;

predicate_instantiation: PREDICATE_NAME LP parameter_list RP
;


proposition: proposition IFF_OP imp_proposition
         | imp_proposition
;

imp_proposition: imp_proposition IMP_OP or_proposition
         | or_proposition
;
or_proposition: or_proposition OR_OP and_proposition
         | and_proposition
;

and_proposition: and_proposition AND_OP not_proposition
         | not_proposition
;

not_proposition: NOT_OP placeholder
         | placeholder
;

placeholder: LP proposition RP
         | atomic_proposition
;

atomic_proposition: VAR | LOGIC_VAL | CONST | array_index
;

%%
#include "lex.yy.c"
extern int lineCounter;
int main(){
  yyparse();
  printf("Input program accepted");
  return 0;
}
int yyerror(char *s){ fprintf ( stderr, "%s in line %d\n", s, lineCounter);}
