#include<iostream>
using namespace std;
int a[10000], b[10000];
int * add(int * a, int * b, int n)
{
	int * c = new int[n*n];
	for (int i = 0;i < n;i++)
	{
		for (int j = 0;j < n;j++)
		{
			c[i*n + j] = (*(a + i*n + j))+(*(b + i*n + j));
		}
	}
	return c;
}
int * jian(int * a, int * b, int n)
{
	int * c = new int[n*n];
	for (int i = 0;i < n;i++)
	{
		for (int j = 0;j < n;j++)
		{
			c[i*n + j] = (*(a + i*n + j))-(*(b + i*n + j));
		}
	}
	return c;
}
int * str(int * a,int * b,int n)
{   
	int * c = new int[n*n];
	if ( 1==n)
	{
		c[0] = a[0]*b[0];
		return c;
	}
	else
	{
	int * s1;
	int * s2;
	int * s3;
	int * s4;
	int * s5;
	int * s6;
	int * s7;
	int * s8;
	int * s9;
	int * s10;
	int * a11 = new int[(n*n)/4];
	int * a12 = new int[(n*n)/4];
	int * a21 = new int[(n*n)/4];
	int * a22 = new int[(n*n)/4];
	int * b11 = new int[(n*n)/4];
	int * b12 = new int[(n*n)/4];
	int * b21 = new int[(n*n)/4];
	int * b22 = new int[(n*n)/4];
	for(int i=0; i<n/2; i++) 
	{     
           for(int j=0; j<n/2; j++) 
		   {     
              a11[i*n/2+j] = a[i*n+j] ;
			  a12[i*n/2+j] = a[i*n+j+n/2];
			  a21[i*n/2+j] = a[(i+n/2)*n+j];
			  a22[i*n/2+j] = a[(i+n/2)*n+j+n/2];
			  b11[i*n/2+j] = b[i*n+j] ;
			  b12[i*n/2+j] = b[i*n+j+n/2];
			  b21[i*n/2+j] = b[(i+n/2)*n+j];
			  b22[i*n/2+j] = b[(i+n/2)*n+j+n/2];   
           }             
    }   
    s1 = jian(&b12[0],&b22[0],n/2) ;
	s2 = add(&a11[0],&a12[0],n/2) ;
	s3 = add(&a21[0],&a22[0],n/2) ;
	s4 = jian(&b21[0],&b11[0],n/2) ;
	s5 = add(&a11[0],&a22[0],n/2) ;
	s6 = add(&b11[0],&b22[0],n/2) ;
	s7 = jian(&a12[0],&a22[0],n/2) ;
	s8 = add(&b21[0],&b22[0],n/2) ;
	s9 = jian(&a11[0],&a21[0],n/2) ;
	s10 = add(&b11[0],&b12[0],n/2) ;
	int * p1;
	int * p2;
	int * p3;
	int * p4;
	int * p5;
	int * p6;
	int * p7;
	p1 = str(a11,s1,n/2);
	p2 = str(s2,b22,n/2);
	p3 = str(s3,b11,n/2);
	p4 = str(a22,s4,n/2);
	p5 = str(s5,s6,n/2);
	p6 = str(s7,s8,n/2);
	p7 = str(s9,s10,n/2);
	int * c11 = new int[(n*n)/4];
	int * c12 = new int[(n*n)/4];
	int * c21 = new int[(n*n)/4];
	int * c22 = new int[(n*n)/4];
	int * t1;
	int * t2;
	int * t3;
	int * t4;
	t1 = add(p5,p4,n/2);
	t2 = jian(t1,p2,n/2);
	c11 = add(t2,p6,n/2);
    c12 = add(p1,p2,n/2);
    c21 = add(p3,p4,n/2);
    t3 = add(p5,p1,n/2);
    t4 = jian(t3,p3,n/2);
    c22 = jian(t4,p7,n/2);
    for(int i=0; i<n/2; i++) 
	{     
           for(int j=0; j<n/2; j++) 
		   {     
              c[i*n+j]=c11[i*n/2+j];
			  c[i*n+j+n/2]= c12[i*n/2+j];
			  c[(i+n/2)*n+j] = c21[i*n/2+j] ;
			  c[(i+n/2)*n+j+n/2]= c22[i*n/2+j];
           }             
    }   
	
	
	
	
	delete[] s1;
	delete[] s2;
	delete[] s3;
	delete[] s4;
	delete[] s5;
	delete[] s6;
	delete[] s7;
	delete[] s8;
	delete[] s9;
	delete[] s10;
	delete[] p1;
	delete[] p2;
	delete[] p3;
	delete[] p4;
	delete[] p5;
	delete[] p6;
	delete[] p7;
	delete[] c11;
	delete[] c12;
	delete[] c21;
	delete[] c22;
	delete[] a11;
	delete[] a12;
	delete[] a21;
	delete[] a22;
	delete[] b11;
	delete[] b12;
	delete[] b21;
	delete[] b22;
	delete[] t1;
	delete[] t2;
	delete[] t3;
	delete[] t4;
	return c;	
	}
	
}
int main()
{
	int len;
	cin >> len;
	for (int i = 0;i < len*len;i++)
	{
		cin >> a[i];
	}
	for (int i = 0;i < len*len;i++)
	{
		cin >> b[i];
	}
	int * p = str(&a[0], &b[0], len);
	for (int i = 0;i < len;i++)
	{
		for (int j = 0;j < len;j++)
		{
			cout<< *(p + i*len + j);
			if(j!= len-1)
			{
				cout<<' ';
			}
		}
		cout << endl;
	}
	delete[] p;
	int * q = str(&b[0],&a[0],len);
	for (int i = 0;i < len;i++)
	{
		for (int j = 0;j < len;j++)
		{
			cout<< *(q + i*len + j);
			if(j!= len-1)
			{
				cout<<' ';
			}
		}
		if(i!= len-1)
			{
		      cout << endl;				
			}
   }
	delete[] q;
	return 0;
}

