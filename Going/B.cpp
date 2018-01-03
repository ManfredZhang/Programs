#include<cstdio>

typedef long long LL;

LL Exgcd(LL a,LL b,LL &x,LL &y)
{
    if(!b)
    {
        x=1; y=0;
        return a;
    }
    LL R=Exgcd(b,a%b,y,x);
    y-=a/b*x;
    return R;
 } 
 
int main()
{
    LL a,b;
    while(~scanf("%lld %lld",&a,&b))
    {
        LL x=0,y=0; 
        LL d=Exgcd(a,b,x,y);
        if(1%d) {
            printf("sorry\n");
            continue;
        }
        x=1/d*x;
        LL mod=b/d;
        x=(x%mod+mod)%mod;
        y=(1-a*x)/b;
        printf("%lld %lld\n",x,y);
    }
    return 0;
}