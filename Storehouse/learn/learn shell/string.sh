your_name="runoob"
# 使用双引号拼接
greeting="hello, "$your_name" !"
greeting_1="hello, ${your_name} !"
echo $greeting  $greeting_1
# 使用单引号拼接
greeting_2='hello, '$your_name' !'
greeting_3='hello, ${your_name} !'
echo $greeting_2  $greeting_3


# 提取子字符串
string="runoob is a great site"
echo ${string:1:4} # 输出 unoo

# 查找字符 i 或 o 的位置(哪个字母先出现就计算哪个)：
echo `expr index "$string" io`  # 输出 4
