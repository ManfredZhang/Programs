#include <iostream>
#include <cstdio>
using namespace std;

int judge(int board[4][4]) {
	int p_row_count = 0;
	int n_row_count = 0;
	int p_col_count = 0;
	int n_col_count = 0;
	int p_l_count = 0;
	int n_l_count = 0;
	int p_r_count = 0;
	int n_r_count = 0;
	for (int i = 0; i < 4; ++i) {
		for (int j = 0; j < 4; ++j) {
			if (board[i][j] ==  1) p_row_count++;
			if (board[i][j] == -1) n_row_count++;
		}
		if (p_row_count == 4) return  1; else p_row_count = 0;
		if (n_row_count == 4) return -1; else n_row_count = 0;
	}

	for (int i = 0; i < 4; ++i) {
		for (int j = 0; j < 4; ++j) {
			if (board[j][i] ==  1) p_col_count++;
			if (board[j][i] == -1) n_col_count++;
		}
		if (p_col_count == 4) return  1; else p_col_count = 0;
		if (n_col_count == 4) return -1; else n_col_count = 0;
	}
	
	for (int i = 0; i < 4; ++i) {
		if (board[i][i] ==  1) p_l_count++;
		if (board[i][i] == -1) n_l_count++;
	}
	if (p_l_count == 4) return  1; else p_l_count = 0;
	if (n_l_count == 4) return -1; else n_l_count = 0;

	for (int i = 0; i < 4; ++i) {
		if (board[i][3-i] ==  1) p_r_count++;
		if (board[i][3-i] == -1) n_r_count++;
	}
	if (p_r_count == 4) return  1; else n_l_count = 0;
	if (n_r_count == 4) return -1; else n_l_count = 0;

	return 0;
}

int ans,ansx,ansy;
int alpha_beta(int player, int alpha, int beta, int board[4][4]) {
	int i, j;
	int flag = judge(board);
	if(flag != 0) return flag;

	if (player == 1) { // x 执子
		for (i = 0; i < 4; i++) {
			for (j = 0; j < 4; j++) {
				if(board[i][j] == 0) {
					board[i][j] = 1;
					int val = alpha_beta(player^1, alpha, beta, board);
					board[i][j] = 0;
					if (val > alpha) {
						alpha = val;
						ansy = i;
						ansx = j;
					}
					if (alpha >= beta)
						return alpha;
				}
			}
		}
		return alpha;
	}
	else { // o 执子
		for (i = 0; i < 4; i++) {
			for (j = 0; j < 4; j++) {
				if (board[i][j] == 0) {
					board[i][j] = -1;
					int val = alpha_beta(player^1, alpha, beta, board);
					board[i][j] = 0;
					if (val < beta)
						beta = val;
					if (alpha >= beta)
						return beta;
				}
			}
		}
		return beta;	
	}
}

int main() {
	int board[4][4];
	char go;
	while (cin >> go) {
		if (go == '$') break;
		memset(board,0,sizeof(board));
		int count = 16;

		for (int i = 0; i < 4; ++i) {
			for (int j = 0; j < 4; ++j) {
				cin >> go;
				if (go == 'x') board[i][j] = 1;
				else if (go == 'o') board[i][j] = -1;
				else count--;
			}
		}

		int alpha = -1;
		int beta = 1;
		int player = 1;

		if(count <= 4) { printf("#####\n"); continue;}
		ans = alpha_beta(player, alpha, beta, board);
		if(ans > 0)
			printf("(%d,%d)\n", ansy, ansx);
		else 
			printf("#####\n");
	}
	return 0;
}