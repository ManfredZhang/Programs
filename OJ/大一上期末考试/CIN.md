# CIN

1. #### 输入以-1为结尾的一组数

```c++
    int a[64];
	int i=0;
	while(i<64)
    {
        cin >> a[i++];
        if ( a[i-1] == -1 )
            break;
    }
	//注意开数组至少要多开一位
```

2. #### 输入动态数组

```c++
    int num;
    cin >> num;
    int* name = new int[num];
    
	int i=0;
    while(i<num)
        cin >> name[i++];
```

3. #### cin.get()：读取一切输入‘字符’（空格、回车）//数字会被转化

```c++
	int i=0;
	int a[64];
    
	while(i<64)
    {
        cin >> a[i++];
        if ( cin.get() == '\n' ) //遇到回车，结束输入
            break;
    }
```

```c++
	for (int i = 1; i <= 22; i++)
	{
		for (int j = 1; j <= 80; j++)
		{
			char temp;
			temp = cin.get();
			if (temp == ' ')
				matrix[i][j] = 0;
			else if (temp == '*')
				matrix[i][j] = 1;
			else
				j--;	//遇到回车不算
		}
	}
```

#### cin.get vs cin.getline

1. ##### 输入的字符串不超过限定大小

        get(str,Size)：读取所有字符，遇到'\n'时止，并且将'\n'留在输入缓冲区中，其将被下一个读取输入的操作捕获，影响该输入处理；

        getline(str,Size)：读取所有字符，遇到'\n'时止，并且将'\n'直接从输入缓冲区中删除掉，不会影响下面的输入处理。

2. ##### 输入的字符数超出限定的大小

        get(str,Size)：读取Size-1个字符，并将str[Size-1]置为'\0'，然后将剩余字符(包括'\n')留在输入缓冲区中，这些字符将被下一个读取输入的操作捕获，影响该输入处理；

        getline(str,Size)：读取Size-1个字符，并将str[Size-1]置为'\0'，剩余字符(包括'\n')留在输入缓冲区中，随即设置cin实效位(即if(!cin)的判断为真)，关闭输入。其后的所有输入都无法得到任何东西，当然也无法得到输入缓冲区中剩余的字符串。但如果象本例一样用clear()重置cin，其后的输入便可用并会得到遗留在输入缓冲区中的字符。

3. ##### 输入一个空行（即直接回车）

        get(str,Size)：str将得到'\0'，并设置cin实效位，关闭输入，但回车依然留在输入缓冲区中，因此如果我们用clear()重置cin，其下一个读取输入的操作将捕获'\n'；

        getline(str,Size)：str将得到'\0'，并将'\n'删除掉，不置实效位，不关闭输入。所以对于cin.getline来说空行是合法的输入，且不会影响下面的输入处理。