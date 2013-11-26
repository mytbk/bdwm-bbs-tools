#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[])
{
    char buf[1000];
    char tmp[1000];
    FILE *fp;
    char c;
    
    if (argc==1){
        fp = stdin;
    }
    else{
        fp = fopen(argv[1], "r");
        if (fp==NULL){
            fprintf(stderr, "Error open file.\n");
            exit(1);
        }
    }
    
// search for control sequence
    while (1){
        c = fgetc(fp);
        if (c==EOF){
            break;
        }
        if (c=='\n'){
            // clear buf
            buf[0]=0;
            puts("");
            continue;
        }
        if (c=='\x1b'){
            int i=0;
            while (1){
                tmp[i] = c;
                if (tmp[i]=='m'){
                    tmp[i+1]=0;
                    break;
                }
                c = fgetc(fp);
                ++i;
            }
            if (strcmp(tmp, buf)!=0){
                strcpy(buf, tmp);
                printf("%s", buf);
            }
        }else{
            putchar(c);
        }
    }
    fclose(fp);
    return 0;
}

        



