#include <iostream>  
using namespace std;  
class IntSet { 
	private :  
		int * a;
		int length; 
	public : 
		IntSet(); 
		IntSet(int a[],int i);
		IntSet Merge(IntSet set2);
		void Print(); 
		IntSet Intersection(IntSet newSet);
		IntSet Difference(IntSet newSet);  
		bool IsSubSet(IntSet newSet);
};
/* PRESET CODE BEGIN - NEVER TOUCH CODE BELOW */

int main() 
{
	int a[]={1,2,3,5,8,10};
	int b[]={2,8,9,11,30,50,67};
	int c[]={11,30};
	
	IntSet set1(a,6),set2(b,7),set3(c,2),set4;
	cout<<"集合1:"; 
	set1.Print(); 
	cout<<"集合2:"; 
	set2.Print(); 
	cout<<"集合3:"; 
	set3.Print();
	cout<<endl;
	cout<<"集合1与集合2的交集:"; 
	set4=set1.Intersection(set2); 
	set4.Print();
	cout<<"集合1与集合3的交集:"; 
	set4=set1.Intersection(set3); 
	set4.Print();
	cout<<"集合1与集合2的并集:"; 
	set4=set1.Merge(set2); 
	set4.Print();
	cout<<"集合1与集合2的差集:"; 
	set4=set1.Difference(set2); 
	set4.Print();
	if(set2.IsSubSet(set3)) 
		cout<<"集合3是集合2的子集"<<endl;
	else
		cout<<"集合3不是集合2的子集"<<endl; 
	return 0;
}

/* PRESET CODE END - NEVER TOUCH CODE ABOVE */
IntSet::IntSet() 
{
	this->a=new int[100]; 
	length=0; 
	this->a[0]=-1;
}

IntSet::IntSet(int a[],int i) 
{
	this->a=new int[i+1]; 
	this->length=i; 
	for(int j=1;j<=i;j++) 
	{
		this->a[j]=a[j-1]; 
	}
	a[0]=-1;
}

IntSet IntSet::Merge(IntSet set2) 
{
//集合与集合的并集
	IntSet x;
	int i=1,j=1,k=1;//i指向this->a ; j===set2.a k===x.a 
	while(i<=length&&j<=set2.length)
	{
		if(a[i]==x.a[k-1]||set2.a[j]==x.a[k-1]) 
		{
			if(a[i]==x.a[k-1])
				i++;
			else j++; 
		}
		else
		{	
			if(a[i]<=set2.a[j]) 
			{
				x.a[k++]=a[i++]; 
			}
			else
			{
				x.a[k++]=set2.a[j++];
			} 
		}
	}	 

	while(i<=length) 
	{
		x.a[k++]=a[i++]; 
	}

	while(j<=set2.length) 
	{
		x.a[k++]=set2.a[j++]; 
	}
	x.length=k-1; 
	return x;
}


void IntSet::Print() 
{
	if(this->length==0) 
	{
		cout<<"Empty"; 
	}
	else
	{
		for(int j=1;j<=this->length;j++) 
		{
			cout<<this->a[j]<<" "; 
		}
	}
	cout<<endl;
}

IntSet IntSet::Intersection(IntSet newSet) 
{//集合与集合的交集
	//set4=set1.Intersection(set2);
	IntSet returnSet;
	int i=0,j=0,k=1; 
	for(i=1;i<=this->length;i++) 
	{
		for(j=1;j<=newSet.length;j++) 
		{
			if(this->a[i]==newSet.a[j]) 
			{
				returnSet.a[k++]=this->a[i]; 
			}
		} 
	}
	returnSet.length=k-1; 
	return returnSet;
}
   
IntSet IntSet::Difference(IntSet newSet) 
{
	IntSet returnSet;
	int i,j; 
	for(i=1;i<=this->length;i++) 
	{
		returnSet.a[i]=this->a[i]; 
	}
	returnSet.length=this->length;
	for(i=1;i<=returnSet.length;i++) 
	{
		for(j=1;j<newSet.length;j++) 
		{
			if(returnSet.a[i]==newSet.a[j]) 
			{
				returnSet.a[i]=-1; 
			}
		} 
	}
	
	for(i=1;i<=returnSet.length;i++) 
	{
		if(returnSet.a[i]==-1) 
		{
			for(j=i;j<returnSet.length;j++) 
			{
				returnSet.a[j]=returnSet.a[j+1]; 
			}
			returnSet.length--; 
		}
	}
return returnSet;
}


bool IntSet::IsSubSet(IntSet newSet) 
{
	int i,j; 
	for(i=1;i<=newSet.length;i++) 
	{
		j=1; 
		for(;j<=this->length;j++)
		{
			if(this->a[j]==newSet.a[i])
				break; 
		}
		if(j==this->length+1) 
			return false;
	}
return true; 
}

