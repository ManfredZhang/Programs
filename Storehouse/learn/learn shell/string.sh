your_name="runoob"
# ʹ��˫����ƴ��
greeting="hello, "$your_name" !"
greeting_1="hello, ${your_name} !"
echo $greeting  $greeting_1
# ʹ�õ�����ƴ��
greeting_2='hello, '$your_name' !'
greeting_3='hello, ${your_name} !'
echo $greeting_2  $greeting_3


# ��ȡ���ַ���
string="runoob is a great site"
echo ${string:1:4} # ��� unoo

# �����ַ� i �� o ��λ��(�ĸ���ĸ�ȳ��־ͼ����ĸ�)��
echo `expr index "$string" io`  # ��� 4
