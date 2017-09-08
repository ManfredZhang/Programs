# GDB学习

#### 准备部分

g++ -g name.cpp -o name

gdb name

遇到该输入时，行首无"(gdb)"是一个提示

#### 浏览代码

l: 列出部分代码，再执行再列

#### 添加断点

b(break) 10: 在第10行添加断点(运行时程序执行到第10行之前)

tbreak 10：在第10行添加临时断点，停一次后自动删除该断点

b 10 if i==50：在达到条件i=50时，在第10行之前停下来

info b: 列出所有断点的信息

#### 运行程序

r: 运行直到撞断点之前

> https://segmentfault.com/a/1190000004136351
> 解决问题
> Unable to find Mach task port for process-id 23330: (os/kern) failure (0x5).
>  (please check gdb is codesigned - see taskgated(8))
>  全地址：codesign -s ...... /usr/local/bin/gdb 
>
> eg. codesign -s gdb_codesign/usr/local/bin/gdb

n(next)：主函数内单步调试，不进入子函数里

s(step)：全局单步调试，会进入子函数里

c(continue)：（继续执行直到下次撞断点之前）

#### 查看变量数值

p sum: 打印变量“sum”现在的值

p *a@5：打印一维数组前五个元素

p **a@2@5：打印二维数组前2列前5行元素（注意与定义时a\[5\]\[2\]相反）

display sum: 每步追踪显示变量"sum"的值

watch sum: 当sum变化时，显示sum的原值与现值

#### 查看调试信息

info display: 列出所有每步追踪的信息

info b: 列出所有断点的信息

#### 删除与禁用操作

delete 3：删除3号断点

clear 4：删除第四行的所有断点

delete display 1: 删除编号为1的display

disable 3：令3号断点处于失效状态

disable display 2: 使编号为2的display处于失效状态

enable 3：令3号断点处于恢复有效状态

enable display 2: 使编号为2的display恢复有效状态


