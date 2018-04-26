#include <am.h>
#include <amdev.h>
#include <zmfio.h>
#include <test.h>
#include <kb.h>
#include <game.h>

int board[4][4];
int have_x;
int x;
int A_turn;

void deal(int num) {
	have_x ^= 1;
	if (have_x && A_turn) {
		if (board[x][num-1] == 0) {
			board[x][num-1] = 1; 
			A_turn = 0;
		}
	}
	else if (have_x && !A_turn) {
		if (board[x][num-1] == 0) {
			board[x][num-1] = 2; 
			A_turn = 1;
		}
	}
	else if (!have_x) x = num-1;
}




// TODO: implement necessary libraries

int main() {
  general_test();

	printf("GAME BEGIN!!!\n");

	have_x = 1;
	x = 0;
	A_turn = 1;
	int outcome = 0;
	//int on_board = 0;

	while(1) {
		_KbdReg kbreg = readkb();
		if (kbreg.keycode != _KEY_NONE) {
			printf("ready\n");
			if (kbreg.keydown == 1) {
				switch (kbreg.keycode) {
					case _KEY_1:
						deal(1);deal(1);break;
				  case _KEY_2:
						deal(1);deal(2);break;
					case _KEY_3:
						deal(1);deal(3);break;
					case _KEY_4:
						deal(1);deal(4);break;
				  case _KEY_Q:
						deal(2);deal(1);break;
				  case _KEY_W:
						deal(2);deal(2);break;
				  case _KEY_E:
						deal(2);deal(3);break;
				  case _KEY_R:
						deal(2);deal(4);break;
				  case _KEY_A:
						deal(3);deal(1);break;
				  case _KEY_S:
						deal(3);deal(2);break;
				  case _KEY_D:
						deal(3);deal(3);break;
				  case _KEY_F:
						deal(3);deal(4);break;
				  case _KEY_Z:
						deal(4);deal(1);break;
				  case _KEY_X:
						deal(4);deal(2);break;
				  case _KEY_C:
						deal(4);deal(3);break;
				  case _KEY_V:
						deal(4);deal(4);break;
					case _KEY_SPACE:
						printf("see space!\n");
						update_screen(board);
						break;
				  case _KEY_RETURN:
						printf("see return!\n");
						for (int i = 0; i < 4; i++) {
							for (int j = 0; j < 4; j++) {
								printf("%d ",board[i][j]);
							}
							printf("\n");
						}
						break;
					default:
						printf("no effective move\n");
						break;
				}
			}
		}
		update_screen(board);
		outcome = judge(board);
		if (outcome != 0) break;
	}

  screen_win(board, outcome);
  

  return 0;
}

