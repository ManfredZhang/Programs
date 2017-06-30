#include <iostream>
using namespace std;
int A[1000001]={0},B[1000001]={0};
long long s;
void mergesort(int A[],int p, int r);
void merge(int A[], int p, int q, int r);
int main()
{
	int n,i;
	while (cin>>n)
	{
		s=0;
		for (i=1;i<=n;i++)
			cin>>A[i];
		mergesort(A,1,n);
		cout<<s<<endl;
	}
	return 0;
} 
void mergesort(int A[], int p, int r)
{
	if(p<r)
	{
		mergesort(A,p,(p+r)/2);
		mergesort(A,(p+r)/2+1,r);
		merge(A,p,(p+r)/2,r); 
	}
	return;
}
void merge(int A[], int p, int q, int r)
{
	int i,left,right;
	left=p;
	right=q+1;
	for(i=p;i<=r;i++)
	{
		if(left>q)
		{
			B[i]=A[right];
			right++;
		}
		else if(right>r)
		{
			B[i]=A[left];
			left++;
		}
		else if(A[left]>A[right])
		{
			B[i]=A[right];
			right++;
			s+=q-left+1; 
		}
		else
		{
			B[i]=A[left];
			left++;
		}
	}
	for(i=p;i<=r;i++)
	{
		A[i]=B[i];
	}
	return;
}

