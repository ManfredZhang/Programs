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
						if (board[i][j] == 2) n_row_count++;
				}
				if (p_row_count == 4) return  1; else p_row_count = 0;
				if (n_row_count == 4) return 2; else n_row_count = 0;
		}

		for (int i = 0; i < 4; ++i) {
				for (int j = 0; j < 4; ++j) {
						if (board[j][i] ==  1) p_col_count++;
						if (board[j][i] == 2) n_col_count++;
				}
				if (p_col_count == 4) return  1; else p_col_count = 0;
				if (n_col_count == 4) return 2; else n_col_count = 0;
		}

		for (int i = 0; i < 4; ++i) {
				if (board[i][i] ==  1) p_l_count++;
				if (board[i][i] == 2) n_l_count++;
		}
		if (p_l_count == 4) return  1; else p_l_count = 0;
		if (n_l_count == 4) return 2; else n_l_count = 0;

		for (int i = 0; i < 4; ++i) {
				if (board[i][3-i] ==  1) p_r_count++;
				if (board[i][3-i] == 2) n_r_count++;
		}
		if (p_r_count == 4) return  1; else n_l_count = 0;
		if (n_r_count == 4) return 2; else n_l_count = 0;

		return 0;
}


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
										board[i][j] = 2;
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
