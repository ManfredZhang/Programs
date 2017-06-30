#include <iostream>
#include <cstdio>
#include <vector>
using namespace std;

int PARENT(int i)
{
	return i / 2;
}

int LEFT_CHILD(int i)
{
	return 2 * i;
}

int RIGHT_CHILD(int i)
{
	return 2 * i + 1;
}

void SWAP(int &a, int &b)
{
	int temp;
	temp = b;
	b = a;
	a = temp;
}

void MIN_HEAPIFY(vector<int> &a, vector<int> &index, int n, int heapsize)
{
	int smallest = 1;
	int l = LEFT_CHILD(n);
	int r = RIGHT_CHILD(n);
	if (l <= heapsize && a[l] < a[n])
		smallest = l;
	else
		smallest = n;
	if (r <= heapsize && a[r] < a[smallest])
		smallest = r;

	if (smallest != n)
	{
		SWAP(a[n], a[smallest]);
		SWAP(index[n], index[smallest]);
		MIN_HEAPIFY(a, index, smallest, heapsize);
	}
}

void BUILD_MIN_HEAP(vector<int> &a, vector<int> &index, int heapsize)
{
	for (int i = heapsize / 2; i >= 1; i--)
		MIN_HEAPIFY(a, index, i, heapsize);
}



int main()
{
//用一个vector获得所有输入
    int x;
    vector <int> Input;
    while (scanf("%d",&x) != EOF)
        Input.push_back(x);
    
    
    


//计算有多少个有序段，并new相同数量的vector，把有序段分别装进去
//之后用一个装二维vector把有序段都装起来
    int t = 0;
    int need_vec_num = 1;
    while (t != Input.size() - 1)
    {
        if (Input[t] > Input[t + 1])
            need_vec_num++;
        t++;
    }

    vector<int> *vec = new vector<int>[need_vec_num];
        
    t = 0;
    for (int i = 0; i < need_vec_num; ++i)
    {
        while (t != Input.size())
        {
            if (Input[t] <= Input[t + 1])
                vec[i].push_back(Input[t++]);
            else
            {
                vec[i].push_back(Input[t++]);
                break;
            }
        }
    }





//1、将每个数组的第一个元素保存到堆Heap中，并用Index记录其来自哪个数组。整理堆。
//2、如果堆不为空且数组没有遍历完，弹出堆顶。否则转4。
//3、将该值输出，将该值所在数组的下一个元素读入堆，整理堆并转2。
//4、结束。
    vector<int> Heap;
    vector<int> Index;
    Heap.push_back(-1);
    Index.push_back(-1);

    for (int i = 0; i < need_vec_num; ++i)
    {
    	Heap.push_back(vec[i][0]);
    	Index.push_back(i);
    	vec[i].erase(vec[i].begin());
    }

    BUILD_MIN_HEAP(Heap, Index, Heap.size()-1);

    t = 0;
    int temp_index = 0;
    while (Heap.size() > 1)
    {
    	Input[t++] = Heap[1];
    	Heap.erase(Heap.begin() + 1);
        temp_index = Index[1];
        Index.erase(Index.begin() + 1);
    	if (vec[temp_index].size() != 0)
    	{
    		Heap.push_back(vec[temp_index][0]);
	    	Index.push_back(temp_index);
	    	vec[temp_index].erase(vec[temp_index].begin());

	    	BUILD_MIN_HEAP(Heap, Index, Heap.size()-1);
            
            /*
            for (int i = 1; i < Heap.size(); ++i)
            {
                cout << Heap[i] << " ";
                if (i == 1 || i == 3 || i == 7 || i == 15 || i == 31)
                    cout << endl;
            }
            cout << endl<< endl;
            */
            
    	}
        else
        {
            BUILD_MIN_HEAP(Heap, Index, Heap.size()-1);
            /*for (int i = 1; i < Heap.size(); ++i)
            {
                cout << Heap[i] << " ";
                if (i == 1 || i == 3 || i == 7 || i == 15 || i == 31)
                    cout << endl;
            }
            cout << endl << endl;*/
        }
    }
    
//输出结果    
    for (int i = 0; i < Input.size() - 1; ++i)
    {
    	printf("%d ", Input[i]);
    }
    printf("%d\n", Input[Input.size() - 1]);
    return 0;
}