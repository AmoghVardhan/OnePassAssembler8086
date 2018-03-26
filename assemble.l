%{
#include"y.tab.h"
#include<string.h>
int locctr ;
%}
Arith ("ADD"|"ADC"|"INC"|"AAA"|"DAA"|"SUB"|"SBB"|"DEC"|"NEG"|"CMP"|"AAS"|"DAS"|"MUL"|"IMUL"|"AAM"|"DIV"|"IDIV"|"CBW"|"CWD")
Log ("NOT"|"SHL"|"SAH"|"ROL"|"ROR"|"RCL"|"RCR"|"AND"|"TEST"|"OR"|"XOR"|"SHR")
DataTrnsfr ("MOV"|"PUSH"|"POP"|"XCHG"|"XLAT"|"LEA"|"LDS"|"LAHF"|"SAHF"|"PUSHF"|"POPF")
CtrlTrnsfr ("CALL"|"JMP"|"RET"|"JE"|"JZ"|"JL"|"JNGE"|"JLE"|"JNG"|"JB"|"JNAE"|"JBE"|"JNA"|"JP"|"JPE"|"JO"|"JS"|"JNE"|"JNZ"|"JML"|"JGE"|"JNLE"|"JG"|"JNB"|"JAE"|"JNBE"|"JA"|"JNP"|"JNO"|"JNS"|"LOOP"|"LOOPZ"|"LOOPE"|"LOOPNZ"|"LOOPNE"|"JCXZ"|"INT"|"INTO"|"IRET"|"CLC"|"CMC"|"STC"|"CLD"|"STD"|"CLI"|"STI"|"HLT"|"WAIT"|"ESC"|"LOCK")
Inout ("IN"|"OUT")
Reg8 ("AL"|"AH"|"BL"|"BH"|"CL"|"CH"|"DL"|"DH")
Reg16 ("AX"|"BX"|"CX"|"DX"|"SP"|"BP"|"SI"|"DI")
Segreg ("CS"|DS"|"ES"|"SS")
Mem  ("[BX][SI]"|"[BX][DI]"|"[BP][SI]"|"[BP][DI]"|"[BP]"|"[BX]"|"[DI]"|"[SI]")
Hex [0-9|a-f|A-F]
word ([a-zA-Z])([a-zA-Z0-9]*)
String ['"'][a-z|A-Z|0-9|,|"."|;|:|/|-|+|*|?|!|*|"("    |")"|_|=|"$"| ]+['"']
Spaces [ \t]*
%%
{Arith}  {ECHO; strcpy(yylval.str,yytext); return ARITH;}
{Log}    {ECHO; strcpy(yylval.str,yytext);return LOG; }
{DataTrnsfr} {ECHO; strcpy(yylval.str,yytext);return DTTF;}
{CtrlTrnsfr} {ECHO; strcpy(yylval.str,yytext);return CTTF;}
{Inout} {ECHO;strcpy(yylval.str,yytext); return IO;}
{Spaces} {ECHO;}
"DB"  {ECHO; return DB;}
"DW" {ECHO; return DW;}
{word} {ECHO;strcpy(yylval.str,yytext);return LABEL;}
{String} {ECHO;strcpy(yylval.str,yytext); return STR;}
":"  {ECHO; return COLON; }
(";"[^\n]*)  {;}
\n {ECHO; return E;}
. {ECHO; return yytext[0]; }
%%
