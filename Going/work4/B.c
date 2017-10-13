#include<stdio.h>
#include<string.h>
#include<algorithm>
using namespace std;
struct node
{
    int x,y;
}a[120];
int ans[100050];
int vis[100050];
int match[100050];
int n;
int find(int u)
{
    for(int i=a[u].x;i<=a[u].y;i++)
    {
        if(vis[i]==0)
        {
            vis[i]=1;
            if(match[i]==-1||find(match[i]))
            {
                match[i]=u;
                return 1;
            }
        }
    }
    return 0;
}
int main()
{
    int t;
    scanf("%d",&t);
    while(t--)
    {
        memset(match,-1,sizeof(match));
        scanf("%d",&n);
        for(int i=1;i<=n;i++)
        {
            scanf("%d%d",&a[i].x,&a[i].y);
        }
        int output=0;
        for(int i=n;i>=1;i--)
        {
            memset(vis,0,sizeof(vis));
            if(find(i))output++;
        }
        printf("%d\n",output);
        int tt=0;
        for(int i=1;i<100050;i++)
        {
            if(match[i]==-1)continue;
            ans[tt++]=match[i];
        }
        sort(ans,ans+tt);
        for(int i=0;i<tt;i++)
        {
            if(i==0)printf("%d",ans[i]);
            else printf(" %d",ans[i]);
        }
        printf("\n");
    }
}
