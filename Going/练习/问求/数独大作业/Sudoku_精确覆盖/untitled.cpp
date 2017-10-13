//标记矩阵中每列0的个数
	
	int column0num[324];
	for (int i = 0; i < 324; ++i)
		column0num[i] = 0;

	for (int column = 0; column < 324; ++column)
	{
		for (int row = 0; row < 729; ++row)
			if(matrixgo[row][column] == 1)
				column0num[column]++;	
		if (column0num[column] == 0)
			column0num[column] = 730;//如果这一列全都是0，说明之前已经选过并划掉了，不用再考虑
	}

//构造min[]数列前min_num个数是1数最少的列的列号
	int min[324];
	int min_num = 0;
	for (int i = 0; i < 324; ++i)
		min[i] = 0;

	int temp_minimum = column0num[0];//第0列的1数
	for (int i = 0; i < 324; ++i)
	{
		if (column0num[i] > temp_minimum)
			continue;
		if (column0num[i] == temp_minimum)
		{//使得min[]数列前min_num个数是1数最少的列的列号
			min[min_num] = i;
			min_num++;
		}
		if (column0num[i] < temp_minimum)
		{
			for (int j = 0; j < 324; ++j)
				min[j] = 0;
			min_num = 0;//min[]数列和min_num之前数据作废

			temp_minimum = column0num[i];
			min[min_num] = i;
			min_num++;
		}
	}

//判断是否有sudoku阵里某位置还是0，但其所对应大矩阵位置上1-9那些行都是0了则false
	
	bool here_solvable(int i, int j, int sudoku[9][9], int matrixgo[729][324])
	{
		if (sudoku[i][j] != 0)
			return true;
		else
		{
			for (int p = 0; p < 9; ++p)
				for (int q = 0; q < 324; ++q)
					if (matrixgo[9*i+j+81*p][q] != 0)
						return true;

			return false;
		}
	}

	bool solvable(int sudoku[9][9], int matrixgo[729][324])
	{
		for (int i = 0; i < 9; ++i)
			for (int j = 0; j < 9; ++j)
				if (here_solvable(i,j,sudoku,matrixgo) == false)
					return false;
		
		return true;
	}








