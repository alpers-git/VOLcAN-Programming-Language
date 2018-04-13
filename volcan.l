%option main
letters [a-z_]+
%%
eðer printf("IF");
deðülse printf("ELSE");
tanum_baþladu printf("BEGIN");
tanum_bittu printf("END");
turla printf("LOOP");
, printf("COMMA");
\( printf("LP");
\) printf("RP");
\{ printf("LC");
\} printf("RC");
\; printf("SEMI_COL");
\| printf("OR_OP");
& printf("AND_OP");
-> printf ("IMP_OP");
\<-> printf("IFF_OP");
~ printf("NOT_OP");
tarattur printf("SCAN");
bastur printf("PRINT");
dondür printf("RETURN");
doðri|yanluþ  printf("LOGIC_VAL");
= printf("ASSINGMENT_OP");
{letters} printf("VAR");
[A-Z]{letters} printf("PREDICATE_NAME");
[A-Z_]+ printf("CONST");
$[^$]+\$ printf("COMMENT");
