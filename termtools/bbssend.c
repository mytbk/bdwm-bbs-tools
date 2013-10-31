#include <stdio.h>
#include <curses.h>

int main(int argc, char *argv[])
{
  if (argc!=2){
    fprintf(stderr, "usage: sendkey <FIFO>\n");
  }
  FILE *fp = fopen(argv[1],"w");
  if (fp == NULL){
    fprintf(stderr, "Open %s error.\n", argv[1]);
  }
  
  initscr();
  raw();
  noecho();
  keypad(stdscr,TRUE);
  printf("Press F12 to exit.\n");

  int c;
  while (1){
    c = getch();
    if (c == KEY_F(12)){
      printw("F12 pressed, press anykey to exit.\n");
      getch();
      break;
    }
    fprintf(fp, "%c",c);
	 fflush(fp);
  }

  endwin();
  fclose(fp);
  return 0;
}
