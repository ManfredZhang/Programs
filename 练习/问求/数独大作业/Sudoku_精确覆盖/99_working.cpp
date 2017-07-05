#include <iostream>

using namespace std;

int main()
{
//输入题目
	int sudoku[9][9];

	for (int i = 0; i < 9; ++i)
		for (int j = 0; j < 9; ++j)
			cin >> sudoku[i][j];

//初始化矩阵模板
	int i,j,n,m,p,q;
	int blank_sudoku = 0;
	int key_matrixgo = 0;
	
	int matrix[729][324];
	//全设0
	for (int i = 0; i < 729; ++i)
		for (int j = 0; j < 324; ++j)
			matrix[i][j] = 0;

	//布置：位置唯一性
	for (int n = 0; n < 9; ++n)
	{
		j = 0;
		for (int i = 81*n; i < 81*(n+1); ++i)
		{
			matrix[i][j] = 1;
			j++;
		}		
	}

	//布置：行限制
	for (int n = 0; n < 81; ++n)
	{

		j = 81 + n;
		for (int i = 9*n; i < 9*(n+1); ++i)
		{
			matrix[i][j] = 1;	
		}	
	}

	//布置：列限制
	for (int n = 0; n < 81; ++n)
	{
		m = n/9;
		j = 162 + 9*m;
		for (int i = 9*n; i < 9*(n+1); ++i)
		{
			matrix[i][j] = 1;
			j++;
		}		
	}

	//布置：宫限制
	j = 243;
	for (int n = 0; n < 27 ; ++n)
	{
		for (int m = 3*n; m < 3*(n+1); ++m)
		{
			for (int o = 3*m; o < 3*(m+1); ++o)
			{
				for (int i = 3*o; i < 3*(o+1); ++i)
				{
					matrix[i][j] = 1;
				}
				j = j + 1;	
			}
			j = j - 3;
		}	
		j = j + 3;
	}

//初始化矩阵go
	int matrixgo[729][324];
	hi:	for (int i = 0; i < 729; ++i)
			for (int j = 0; j < 324; ++j)
				matrixgo[i][j] = matrix[i][j];

//将已知数从矩阵go中划去原题
	for (int w = 1; w < 10; ++w)
		for (int x = 0; x < 9; ++x)
			for (int y = 0; y < 9; ++y)
				if(sudoku[x][y] == w)
					for (int i = 0; i < 324; ++i)
					{
						matrixgo[(w-1)*81+9*x+y][i] = 0;

						if(matrix[(w-1)*81+9*x+y][i] == 1)
							for (int j = 0; j < 729; ++j)
								if(matrix[j][i] == 1)
									for (int k = 0; k < 324; ++k)
										matrixgo[j][k] = 0;
					}
	
//标记原题中0的个数
	for (int x = 0; x < 9; ++x)
		for (int y = 0; y < 9; ++y)
			if(sudoku[x][y] == 0)
				blank_sudoku++;

//将解填入原题目
	int appear_times,chosen_row,chosen_column,number;
	for (int j = 0; j < 324; ++j)
	{
		appear_times = 0;
		for (int i = 0; i < 729; ++i)
		{
			if (matrixgo[i][j]==1)
			{
				appear_times++;
				chosen_row = i;
				chosen_column = j;
			}
		}
		
		if (appear_times == 1)
		{
			if(0<=chosen_row && chosen_row<81)
				number = 1;
			if(81<=chosen_row && chosen_row<162)
				number = 2;
			if(162<=chosen_row && chosen_row<243)
				number = 3;
			if(243<=chosen_row && chosen_row<324)
				number = 4;
			if(324<=chosen_row && chosen_row<405)
				number = 5;
			if(405<=chosen_row && chosen_row<486)
				number = 6;
			if(486<=chosen_row && chosen_row<567)
				number = 7;
			if(567<=chosen_row && chosen_row<648)
				number = 8;
			if(648<=chosen_row && chosen_row<729)
				number = 9;

			sudoku[chosen_column/9][chosen_column%9] = number;
			
			for (int p = 0; p < 324; ++p)
			{
				matrixgo[chosen_row][p] = 0;

				if(matrix[chosen_row][p] == 1)
					for (int q = 0; q < 729; ++q)
						if(matrix[q][p] == 1)
							for (int k = 0; k < 324; ++k)
								matrixgo[q][k] = 0;
			}
		}
	}

//计数矩阵中给出的解得个数
	for (int i = 0; i < 729; ++i)
		for (int j = 0; j < 81; ++j)
			if (matrixgo[i][j] == 1)
			{
				key_matrixgo++;
				/*cout << i << ". " ;
				for (int p = 0; p < 81; ++p)
				{
					cout << matrixgo[i][p];
				}
				cout << endl;*/
			}
	
//得出结果
	if (key_matrixgo > blank_sudoku)
		cout << "The number of keys: "<<key_matrixgo <<" "<<">"<<" "<<"The number of blanks: "
		<< blank_sudoku <<"."<<" Sorry, But it may have more than one answer" <<endl <<endl;
	
	else
	{
		bool done = true;

		for (int i = 0; i < 9; ++i)
			for (int j = 0; j < 9; ++j)
				if (sudoku[i][j]==0)
					done = false;

		if (done ==false)
		{	
			cout << "Just a moment......"<<endl<<endl;
			goto hi;
		}

		if (done == true)
			cout << "That's the key. "<<endl;

		//输出数独
		
		cout << endl;
		for (int i = 0; i < 9; ++i)
		{
			for (int j = 0; j < 9; ++j)
				cout << sudoku[i][j] << " ";

			cout << endl;
		}
	}

	return 0;

}





/*正在处理中
 
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
*/






