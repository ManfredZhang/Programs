#include <stdlib.h>
#include <stdio.h>

int V[200][200];//前i个物品装入容量为j的背包中获得的最大价值

int max(int a,int b)  //一个大小比较函数，用于当总重大于第I行时 
{
   if(a>=b)
	   return a;
   else return b;
}

int Knap(int number_item,int weight[],int value[],int choose[],int volume)
{
	int i,j;
	for(i=0;i<=number_item;i++)
		value[i][0]=0;
	for(j=0;j<=volume;j++)
		value[0][j]=0;
	for(i=0;i<=number_item-1;i++)
	{
          	for(j=0;j<=volume;j++)
        	{
    			if(j<weight[i])
    				value[i][j]=value[i-1][j];
    			else
    				value[i][j]=max(value[i-1][j],value[i-1][j-weight[i]]+value[i]);
            }
    }
	
    j=volume;
	
    for(i=number_item-1;i>=0;i--)
	{
		if(value[i][j]>value[i-1][j])
		{
    		choose[i]=1;
    		j=j-weight[i];
		}
        else
		    choose[i]=0;   
	}
			
    printf("选中的物品是:\n");
			
    for(i=0;i<number_item;i++)
        printf("%d ",choose[i]);
			
    printf("\n");
		
    return value[number_item-1][volume];
		
}

int main()
{
	int s;//获得的最大价值
	int w[4];//物品的重量   重量  价值  和物品的状态 均对应着存到数组中，物品从1开始。 
	int v[4];//物品的价值
	int choose[4];//物品的选取状态   选中则是1  没选中为0 
	int n,i;
	int C;//背包最大容量
	n=4;
	printf("请输入背包的最大容量:\n");
	scanf("%d",&C);
	
	printf("物品数:\n");
	scanf("%d",&n);
	printf("请分别输入物品的重量:\n");
	for(i=0;i<n;i++)
		scanf("%d",&w[i]);

	printf("请分别输入物品的价值:\n");
	for(i=0;i<n;i++)
		scanf("%d",&v[i]);

	s=Knap(n,w,v,x,C);  //调用核心函数 

	printf("最大物品价值为:\n");
	printf("%d\n",s);
	system("pause");
	return 0;
   
	
}
