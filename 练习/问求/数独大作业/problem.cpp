#include <iostream>
#include <ctime>
using namespace std;

char problem[9][9];

//同solve.cpp
bool OK(int row, int column, char number)
{
    for(int i = 0; i < 9; i++)
    {
        if(problem[row][i] == number && i != column)
            return false;
        if(problem[i][column] == number && i != row)
            return false;
    }

    int gong_row;
    for (int i = 0; i < 3; ++i)
    {
        if (row >= 0+ 3*i && row <= 2+ 3*i)
        {
            gong_row = 3*i;
        }
    }
    
    int gong_column;
    for (int i = 0; i < 3; ++i)
    {
        if (column >= 0+ 3*i && column <= 2+ 3*i)
        {
            gong_column = 3*i;
        }
    }

    for(int i = gong_row; i < gong_row +3; i++)
    {
        for(int j = gong_column; j < gong_column +3; j++)
        {
            if(problem[i][j] == number && (i != row && j != column))
                return false;
        }
    }

    return true;
}

//同solve.cpp，除了要挖空
void solve(int location_num)
{
    if(location_num == 81)
    {
        //挖空：随机<=60个空挖掉
        for (int i = 0; i < 60; ++i)
		{
			problem[rand()%9][rand()%9] = '0';
		}

        for(int i = 0; i < 9; i++)
        {
            for(int j = 0; j < 9; j++)
            {
                cout << problem[i][j]<< " ";
            }
            cout << endl;
        }
        exit(0);
    }

    int row = location_num / 9;
    int column = location_num % 9;

    if(problem[row][column] == '0')
    {
        for(int i = 1; i <= 9; i++)
        {
            problem[row][column] = '0'+i;
            
            if(OK(row, column, problem[row][column]))
                solve(location_num+1);
        }

        problem[row][column] = '0';
    }

    else
        solve(location_num+1);
}

//开始出题
int main()
{
	//出随机数用到
    srand(time(0));
	
    //初始化题目，全部置零
	for (int i = 0; i < 9; ++i)
	{
		for (int j = 0; j < 9; ++j)
		{
			problem[i][j] = '0';
		}
	}

    //第一个位置出随机数                   ////////////////
	problem[0][0] = '0' + rand()%9+1;  //此步骤急需优化//
                                       ///////////////
    problem[3][1] = '0' + rand()%9+1;
    problem[6][2] = '0' + rand()%9+1;
    problem[1][3] = '0' + rand()%9+1;
    problem[4][4] = '0' + rand()%9+1;
    problem[7][5] = '0' + rand()%9+1;
    problem[2][6] = '0' + rand()%9+1;
    problem[5][7] = '0' + rand()%9+1;
    problem[8][8] = '0' + rand()%9+1;

    //解出第一个解并挖空                  
	solve(0);

	return 0;
}




