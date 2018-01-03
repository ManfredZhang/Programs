#include <iostream>
using namespace std;

char sudoku[9][9];

bool OK(int row, int column, char number)
{
    for(int i = 0; i < 9; i++)
    {
        //行内限制（跳过自己，不能有一样的数）
        if(sudoku[row][i] == number && i != column)
            return false;
        //列内限制
        if(sudoku[i][column] == number && i != row)
            return false;
    }
    
    //宫内限制
    /* 00 03 06
       30 33 36
       60 63 66 */

    //找到其属于的宫
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

    //在宫内，除了自己不能有一样的数
    for(int i = gong_row; i < gong_row +3; i++)
    {
        for(int j = gong_column; j < gong_column +3; j++)
        {
            if(sudoku[i][j] == number && (i != row && j != column))
                return false;
        }
    }


    //满足所有条件
    return true;
}


void solve(int location_num)
{
    //结束条件：达到第82位数
    if(location_num == 81)
    {
        cout << endl <<"Here is the solution!" <<endl;
        cout << "-----------------------" << endl;
        for(int i = 0; i < 9; i++)
        {
            for(int j = 0; j < 9; j++)
            {
                cout << sudoku[i][j]<< " ";
                if (j%3 == 2)
                cout << "|" << " ";
            }
            cout << endl;
            if(i%3 == 2)
                cout << "-----------------------"<< endl;
        }
        
        return;     //输出所有解
    }

    //否则先确定该位置在数独中行列
    int row = location_num / 9;
    int column = location_num % 9;

    //如果该位置上有已知数则去解决下个位置
    //如果该位置上是空（0）则从1开始试到9，看合不合法，若合法则去解决下个位置
    if(sudoku[row][column] == '0')
    {
        for(int i = 1; i <= 9; i++)
        {
            sudoku[row][column] = '0'+i;
            
            if(OK(row, column, sudoku[row][column]))
                solve(location_num+1);
        }
        /*如果1-9都不合法，那么重新把这个位置置0，退到上次层递归，即上一个位置。
          试上一个位置如果换下一个数，使下一个位置有没有解，若依然无解，则换再下一个数，
          如果换完1-9，下个位置都无解，那么也将其置0，退到上次层递归，即上一个位置，
          直到使第81个位置（编号是80）合法*/
        sudoku[row][column] = '0';
    }

    else
        solve(location_num+1);
}


int main()
{
    for(int i = 0; i < 9; i++)
    {
        for(int j = 0; j < 9; j++)
        {
            cin >> sudoku[i][j];
        }
    }
    
    //从第一位开始解题，即（0，0）位置    
    solve(0);

    return 0;
} 
