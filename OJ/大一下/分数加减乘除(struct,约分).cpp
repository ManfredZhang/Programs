#include <iostream>
using namespace std;

int absolute(int a)
{
	if (a >= 0)
		return a;
	else
		return -a;
}

struct num
{
	int ason;
	int amum;
	int bson;
	int bmum;

	int plusup;
	int plusdown;

	int minusup;
	int minusdown;

	int timesup;
	int timesdown;

	int divideup;
	int dividedown;
};

/*void yuefen(int *a,int *b)
{
	for (int i = 2; absolute(*a)>=i; i++) 
		if (*a%i == 0 && *b%i == 0)
		{
    		*a /= i;
        	*b /= i;
        	i--;       
      	}
}*/

void yuefen(int *a,int *b)
{
	int c = 1;
	int e = absolute(*a);
	int f = absolute(*b);
	while(c != 0)
	{
		c = e % f;
		e = f;
		f = c;
	}

	*a = *a/e;
	*b = *b/e;
}

int main()
{
	//输入
	int time = 0;
	num array[1001];
	while (cin >> array[time].ason >> array[time].amum >> array[time].bson >> array[time].bmum)
		time++;
	
	for (int i = 0; i < time; ++i)
	{

	//基本运算
		int num1 = array[i].amum * array[i].bmum;
		int num2 = array[i].amum * array[i].bson;
		int num3 = array[i].ason * array[i].bmum;
		array[i].plusdown = num1;
		array[i].minusdown = array[i].plusdown;
		array[i].timesdown = array[i].plusdown;
		array[i].dividedown = num2;

		array[i].plusup = num3 + num2;
		array[i].minusup = num3 - num2;
		array[i].timesup = array[i].ason * array[i].bson;
		array[i].divideup = num3;



	//约分
	
		yuefen(&array[i].plusup,&array[i].plusdown);
		yuefen(&array[i].minusup,&array[i].minusdown);
		yuefen(&array[i].timesup,&array[i].timesdown);
		yuefen(&array[i].divideup,&array[i].dividedown);
	
	}


//输出
	for (int i = 0; i < time; ++i)
	{

		cout << array[i].plusup;
		if (array[i].plusdown != 1 && array[i].plusup != 0)
			cout << "/" << array[i].plusdown << " ";
		else
			cout << " ";
		cout << array[i].minusup;
		if (array[i].minusdown != 1 && array[i].minusup != 0)
			cout << "/" << array[i].minusdown << " ";
		else
			cout << " ";
		cout << array[i].timesup;
		if (array[i].timesdown != 1 && array[i].timesup != 0)
			cout << "/" << array[i].timesdown << " ";
		else
			cout << " ";
		cout << array[i].divideup;
		if (array[i].dividedown != 1 && array[i].divideup != 0)
			cout << "/" << array[i].dividedown << " ";
		else
			cout << " ";
		
		if (array[i].minusup < 0)
			cout << "true" << endl;
		else
			cout << "false" << endl;
	}
	

	return 0;
}