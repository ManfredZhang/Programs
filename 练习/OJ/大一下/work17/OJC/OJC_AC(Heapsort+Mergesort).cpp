#include <iostream>
#include <cstdio>
#include <vector>
#include <algorithm>
using namespace std;
int length;
int a = 4;
int heap_size;


int LEFT_CHILD(int i)
{
    return 2*i + 1;
}

int RIGHT_CHILD(int i)
{
    return 2*i + 2;
}

void MIN_HEAPIFY(int SmallArray[], int i)
{
    int largest = 0;
    int Lchild_index = LEFT_CHILD(i);
    int Rchild_index = RIGHT_CHILD(i);
    if (Lchild_index < heap_size && SmallArray[Lchild_index] < SmallArray[i])
    {
        largest = Lchild_index;
    }
    else largest = i;
    if (Rchild_index < heap_size && SmallArray[Rchild_index] < SmallArray[largest])
    {
        largest = Rchild_index;
    }
    if (largest != i)
    {
        swap(SmallArray[i], SmallArray[largest]);
        MIN_HEAPIFY(SmallArray, largest);
    }
}

void BUILD_MIN_HEAP(int SmallArray[], int head, int size)
{
    heap_size = size;
    for (int i = size / 2; i >= head; i--)
    {
        MIN_HEAPIFY(SmallArray, i);
    }
}

int* HEAPSORT(int A[], int OneSide[], int head, int tail, int size)
{
    for (int i = head, j = 0; i <= tail, j < size; i++, j++)
    {
        OneSide[j] = A[i];
    }
    BUILD_MIN_HEAP(OneSide, 0, size);
    for (int i = size - 1; i >= 1; i--)
    {
        swap(OneSide[0], OneSide[i]);//把最小的头元素交换到最后
        heap_size--;
        MIN_HEAPIFY(OneSide, 0);//堆中只有堆顶元素可能位置有误，故整理它
    }
    return OneSide;
}

void MERGE(int A[], int head, int divide, int tail)
{
    int left_size = divide - head + 1;
    int right_size = tail - divide;
    int i, j, flag =  -2147483647;
    int *L = new int[left_size + 1];
    int *R = new int[right_size + 1];
    L = HEAPSORT(A, L, head, divide, left_size);
    R = HEAPSORT(A, R, divide + 1, tail, right_size);
    

    i = 0; j = 0;
    L[left_size] = flag;
    R[right_size] = flag;
    

    for (int k = head; k <= tail; k++)
    {
        if (L[i] == flag)//左数组已经遍历结束只剩右数组了
        {
            A[k] = R[j];
            j++;
        }
        else if (R[j] == flag)//右数组已经遍历结束只剩左数组了
        {
            A[k] = L[i];
            i++;
        }
        else if (L[i] >= R[j])
        {
            A[k] = L[i];
            i++;
        }
        else
        {
            A[k] = R[j];
            j++;
        }
    }
}

void MERGE_SORT(int A[], int head, int tail, int part_length)
{
    int divide = (tail - head) / 2 + head;
    
    if((divide - head + 1) < part_length)
        return;
    else
    {
        MERGE_SORT(A, head, divide, part_length);
        MERGE_SORT(A, divide + 1, tail, part_length);
        MERGE(A, head, divide, tail);
    }
}




int main()
{
    int x;
    vector <int> Input;
    while (scanf("%d",&x) != EOF)
        Input.push_back(x);

    int t = 0;
    int need_vec_num = 1;
    while (t != Input.size() - 1)
    {
        if (Input[t] > Input[t + 1])
            need_vec_num++;
        t++;
    }

    vector<int> *B = new vector<int>[need_vec_num];
    
    t = 0;
    for (int i = 0; i < need_vec_num; ++i)
    {
        while (t != Input.size())
        {
            if (Input[t] <= Input[t + 1])
                B[i].push_back(Input[t++]);
            else
            {
                B[i].push_back(Input[t++]);
                break;
            }
        }
    }

    int max = 0;
    for (int i = 0; i < need_vec_num; ++i)
    {
        if (B[i].size() > max)
        {
            max = B[i].size();
        }
    }

    a = max;
    


    //int B[4][4]  =  {{-1, 2, 3, 7}, {-3215,-125,15243,23546342}, {6}, {-4}};//这是k = 8个数组在一个2维数组中
    length = max * need_vec_num;
    heap_size = length;

    //cout << max << " " << need_vec_num << " " << length << endl;

    int *A = new int[length];
    for (int i = 0; i < length; ++i)
    {
        A[i] = -2147483547;
    }

    for (int i = 0; i < need_vec_num; ++i)
    {
        int temp_size = B[i].size();
        for (int j = 0; j < max - temp_size; ++j)
        {
            B[i].push_back(214748365);
        }
    }

    /*for (int i = 0; i < need_vec_num; ++i)
    {
        for (int j = 0; j < B[i].size(); ++j)
        {
            cout << B[i][j] << " ";
        }
        cout << endl;
    }*/
    
    for(int i = 0, h = 0; i < need_vec_num; i++)
    {
        for (int j = 0; j < max; j++, h++)
        {
            if(B[i][j] != 214748365) 
                A[h] = B[i][j];
        }
    }

    if (a == 1)
    {
        for (int i = Input.size() - 1; i > 0; i--)
        {
            printf("%d ", A[i]);
        }
        printf("%d\n", A[0]);
    }
    else if (need_vec_num == 1)
    {
        for (int i = 0; i < Input.size() - 1; ++i)
        {
            printf("%d ", A[i]);
        }
        printf("%d\n", A[Input.size() - 1]);
    }
    else
    {
        MERGE_SORT(A, 0, length - 1, a);
        for (int i = Input.size() - 1; i > 0; i--)
        {
            printf("%d ", A[i]);
        }
        printf("%d\n", A[0]);
    }

    /*
    
    for (int i = 0; i < length; ++i)
    {
        cout << A[i] << " ";
    }
    cout << endl;

    MERGE_SORT(A, 0, length - 1, a);//然后将新数组每a = 4个有序数进行归并, 注意a值的选择 2 <= a <= √总元素n

    for (int i = 0; i < length; ++i)
    {
        cout << A[i] << " ";
    }
    cout << endl;

    cout << "排序后：" << endl;
    for (int i = Input.size() - 1; i >= 0; i--)
    {
        cout << A[i] << " ";
    }
    cout << endl;

    */
    return 0;
}
