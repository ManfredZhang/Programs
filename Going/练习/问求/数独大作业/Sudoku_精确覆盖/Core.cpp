//判断终止条件：Sudoku里没有没有0了
bool done(int sudoku[9][9])
{
	for (int i = 0; i < 9; ++i)
		for (int j = 0; j < 9; ++j)
			if (sudoku[i][j] == 0)
				return false;

	return true;
}

void try_it(int sudoku[9][9],int matrixgo[729][324],min[324])
{
	if (done(sudoku))
		return;

	else
	{
		//构造found1row[]数列，其前count1个数是"1数最少的列"上1的行号
		int count1 = 0;
		int found1row[729];
		for (int i = 0; i < 729; ++i)
			if (matrixgo[i][min[0]] == 1)//这里的min[0]的0日后要循环去
			{
				found1row[count] = i;
				count++;
			}
	}
}