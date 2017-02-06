# COUT

1. #### 输出的结尾不带空格

```c++
	for( i=0; i<num-1; i++ ) 
    {
         cout << a[i] << " ";
    }

    cout << a[num-1] <<endl;
```

2. #### 保留几位小数

```c++
	#include <iomanip>
	cout << setprecision(3) << fixed << x;
```

