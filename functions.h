#include<stdio.h>
#include<string.h>
#include<stdlib.h>
int object_code_locctr[100];//list of locctr of corresponding object_codes
char object_codes[100];
int num_codes = 0;

struct symbol{
    char label[30];
    int addr;
    struct symbol *next;
}symtab[30];

void make_obj_code(int locctr,char obj_code[]){
    object_code_locctr[num_codes]=locctr;
    strcpy(object_codes[num_codes],obj_code);
    num_codes++;
}
