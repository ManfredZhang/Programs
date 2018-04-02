#include <stdio.h>                               
#include <sys/types.h>
#include <regex.h>
#include <memory.h>
#include <stdlib.h>

int main(){

    char *bematch = "aahhhqqqbb\nhhhqqq\n";
    char *pattern = "^h.{1,4}q";
    char errbuf[1024];
    char match[100];
    regex_t reg;
    int err,nm = 10;
    regmatch_t pmatch[nm];

    if(regcomp(&reg,pattern,REG_NEWLINE) < 0){
        regerror(err,&reg,errbuf,sizeof(errbuf));
        printf("err:%s\n",errbuf);
    }

    err = regexec(&reg,bematch,nm,pmatch,0);

    if(err == REG_NOMATCH){
        printf("no match\n");
        exit(-1);

    }else if(err){
        regerror(err,&reg,errbuf,sizeof(errbuf));
        printf("err:%s\n",errbuf);
        exit(-1);
    }

    for(int i=0; i<10 && pmatch[i].rm_so != -1; i++) {
        int len = pmatch[i].rm_eo-pmatch[i].rm_so;
        if(len){
            memset(match,'\0',sizeof(match));
            memcpy(match,bematch+pmatch[i].rm_so,len);
            printf("pmatch[%d]: %s\n",i,match);
        }
    }
    return 0;
}