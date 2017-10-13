# 服务器

# ECS配置

（来源：阿里云 教程）

* 配置选型
* 创建实例
* 登陆实例
* 格式化和挂载数据盘


命令：ssh root@106.14.177.210

# 数据库

（来源：MySQL必知必会）

数据库（database）是一个以某种有组织的方式储存的数据集合。

可以说<u>数据库是“保存有组织的数据的容器”（通常是一个文件或一组文件）</u>

混淆：人们常错用数据库这个术语来代表他们使用的数据库软件。而数据库软件应称为DBMS（数据库管理系统）。数据库是通过DBMS创建和操纵的容器。

我们不直接访问数据库，而是使用DBMS来帮我们访问数据库

## 表

要将文件放进数据库，应先创建一个文件，将相关的资粮放入特定的文件中，这种文件成为“表”。

<u>表（table）是某种特定类型数据的结构化清单</u>

数据库中每个表都有一个唯一的名字，称“表名”

“模式”（schema）：描述表的这组信息，也可以用来描述数据库中特定的表以及整个数据库（和其中表的关系，即布局）

### 列和数据类型

表由一个或多个列组成。列中储存着表中的某部分的信息

<u>列（column）：表中的一个字段。</u>

例如一个顾客表，一个列储存着顾客名，一个列储存其地址

正确的将数据分解成多个列极为重要，以方便排序和过滤。

<u>数据类型（datatype）：每个表列都有相应的数据类型，限制其中储存的数据。</u>

### 行

表中所保存的每个记录储存在自己的行内。

<u>行（row）是表中的一个记录（record）</u>

一个顾客的所有数据在同一行内。

### 主键

主键（primary key）：一列（或一组列），其值能够唯一区分表中的每个行。以便于以后的数据操纵和管理

主键特点：

1. 任意两行都不具有相同的主键值
2. 每个行都必须有一个主键值

多个列作为主键时：所有列值得组合唯一即可，单个列可以不唯一。

习惯：

1. 不更新主键列中的值
2. 不重用主键列的值
3. 不在主键列中使用可能会更改的值

## MYSQL使用

(不区分大小写)

登录：mysql -u root -p

密码：Aliyun666

USE …(DATABASE)…;

SHOW DATABASES;

SHOW TABLES;

SHOW COLUMNS FROM …(TABLE)…;

###### 检索数据

SELECT …(COLUMN)… FROM …(TABLE)…;

SELECT …(COLUMN1)…, …(COLUMN2)…, …(COLUMN3)… FROM …(TABLE)…;

SELECT * FROM …(TABLE)…;//通配符

SELECT DISTINCT …(COLUMN)… FROM …(TABLE)…;

SELECT …(COLUMN)… FROM …(TABLE)… LIMIT 5;//该列的前5行

SELECT …(COLUMN)… FROM …(TABLE)… LIMIT 5，6;//该列的第5行开始的6行

//LIMIT 1,1将检索出第二行

###### 排序检索数据

SELECT (COLUMN0) FROM (TABLE) ORDER BY (COLUMN0);

SELECT (COLUMN0) FROM (TABLE) ORDER BY (COLUMN0) LIMIT 1;//返回该列最小值

SELECT (COLUMN0), (COLUMN1), (COLUMN2) FROM (TABLE) ORDER BY (COLUMN0), (COLUMN1);//优先按0排序，齐次按1排序

SELECT (COLUMN0), (COLUMN1), (COLUMN2) FROM (TABLE) ORDER BY (COLUMN0) DESC, (COLUMN1);//优先按0降序排序，齐次按1升序排序

###### 过滤数据

SELECT (COLUMN1), (COLUMN2) FROM (TABLE) WHERE (COLUMN2) = 2.50 ORDER BY (COLUMN1)//顺序检索column2=2.50的所有column1中的元素,ORDER放最后

* WHERE操作符
  * <> 和 != 都表示不等于
  * BETWEEN 5 AND 10
  * IS NULL//不是0或空字符或空格

###### 数据过滤

WHERE (COLUMN1) = 13 AND (COLUMN2) <= 10 //AND

WHERE (COLUMN1) = 13 OR (COLUMN2) <= 10 //OR

//优先处理AND操作符，可用圆括号强制优先



WHERE (COLUMN0) IN (1002,1003,1004) //IN

WHERE (COLUMN0) NOT IN (1002,1003,1004) //NOT IN

#### 基本操作

http://database.51cto.com/art/200511/12524.htm

# Python网络编程

（来源：廖雪峰的Python教程

http://www.liaoxuefeng.com/wiki/0014316089557264a6b348958f449949df42a6d3a2e542c000/0014320037768360d53e4e935ca4a1f96eed1c896ad1217000）

网络通信就是两个进程之间在通信。

用Python进行网络编程，就是在Python程序本身这个进程内，连接别的服务器进程的通信端口进行通信。

计算机网络的出现比互联网要早很多，计算机为了联网，就必须规定网络协议，为了实现全球通用的协议，互联网协议簇（Internet Protocol Suite）就成为了通用协议标准。

互联网协议包含上百种协议标准，但是最重要的两个协议是TCP和IP协议。所以，大家把互联网的协议简称TCP/IP协议。

通信时，双方要明确对方的标识，而互联网上每个计算机唯一的标识就是IP地址，类似`123.123.123.123`。如果一台计算机同时接入到两个或更多的网络，比如路由器，它就会有两个或多个IP地址，所以，IP地址对应的实际上是计算机的网络接口，通常是网卡。

##### IP协议

<u>IP协议负责把数据从一台计算机通过网络发送到另一台计算机。</u>

数据被分割成一小块一小块，然后通过<u>IP包</u>发送出去。

由于互联网链路复杂，两台计算机之间经常有多条线路，因此，<u>路由器</u>就负责决定如何把一个IP包转发出去。IP包的特点是按块发送，途径多个路由，但不保证能到达，也不保证顺序到达。

<u>IP地址</u>实际上是一个32位整数（称为IPv4），以字符串表示的IP地址如`192.168.0.1`实际上是把32位整数按8位分组后的数字表示，目的是便于阅读。

<u>IPv6地址</u>实际上是一个128位整数，它是目前使用的IPv4的升级版，以字符串表示类似于`2001:0db8:85a3:0042:1000:8a2e:0370:7334`。

##### TCP协议

TCP协议建立在IP协议之上。

<u>TCP协议负责在两台计算机之间建立可靠连接，以保证数据白按顺序到达</u>

TCP协议会通过握手建立连接，然后对每个IP包编号，确保对方按顺序收到，若包丢掉了，就自动重发。

一个IP包除了包含要传输的数据，还包含<u>源IP地址和目标IP地址</u>，<u>源端口和目标端口</u>

<u>端口的作用</u>：在两台计算机通信时，只发IP地址是不够的，因为同一台计算机上跑着多个网络程序。一个IP包来了之后，到底是交给浏览器还是QQ，就需要端口号来区分。每个网络程序都向操作系统申请唯一的端口号，这样，两个进程在两台计算机之间建立网络连接就需要各自的IP地址和各自的端口号。

一个进程也可能同时与多个计算机建立链接，因此它会申请很多端口。

### TCP编程

Socket：网络编程的一个抽象概念，用一个Socket表示“打开了一个网络连接”，而打开一个Socket需要知道目标计算机的IP地址和端口号，再指定协议类型即可。

#### 客户端

大多数链接都是可靠的TCP链接。

创建TCP链接时，主动发起的叫<u>客户端</u>，被动响应的叫<u>服务器</u>

```python
# 导入socket库:
import socket

# 创建一个socket:
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
# 建立连接:
s.connect(('www.sina.com.cn', 80))
```

创建`Socket`时，`AF_INET`指定使用*IPv4协议*，如果要用更先进的IPv6，就指定为`AF_INET6`。`SOCK_STREAM`指定使用*面向流的TCP协议*，这样，一个`Socket`对象就创建成功，但是还没有建立连接。

客户端要主动发起TCP连接，必须知道服务器的IP地址和端口号。新浪网站的IP地址可以用*域名`www.sina.com.cn`自动转换到IP地址*，但是怎么知道新浪服务器的端口号呢？

答案是作为服务器，提供什么样的服务，端口号就必须固定下来。由于我们想要访问网页，因此新浪提供网页服务的服务器必须把端口号固定在`80`端口，因为*`80`端口是Web服务的标准端口*。其他服务都有对应的标准端口号，例如SMTP服务是`25`端口，FTP服务是`21`端口，等等。<u>端口号小于1024的是Internet标准服务的端口，端口号大于1024的，可以任意使用。</u>

因此，我们连接新浪服务器的代码如下：

```python
s.connect(('www.sina.com.cn', 80))
```

注意参数是一个`tuple`，包含地址和端口号。

---

建立TCP连接后，我们就可以向新浪服务器发送请求，要求返回首页的内容：

```python
# 发送数据:
s.send(b'GET / HTTP/1.1\r\nHost: www.sina.com.cn\r\nConnection: close\r\n\r\n')
```

*TCP连接创建的是双向通道*，双方都可以同时给对方发数据。但是谁先发谁后发，怎么协调，要根据具体的协议来决定。例如，HTTP协议规定客户端必须先发请求给服务器，服务器收到后才发数据给客户端。

发送的文本格式必须符合HTTP标准，如果格式没问题，接下来就可以接收新浪服务器返回的数据了：

```python
# 接收数据:
buffer = []
while True:
    # 每次最多接收1k字节:
    d = s.recv(1024)
    if d:
        buffer.append(d)
    else:
        break
data = b''.join(buffer)
```

接收数据时，调用*`recv(max)`方法*，一次最多接收指定的字节数，因此，在一个while循环中反复接收，直到`recv()`返回空数据，表示接收完毕，退出循环。

当我们接收完数据后，调用`close()`方法关闭Socket，这样，一次完整的网络通信就结束了：

```python
# 关闭连接:
s.close()
```

接收到的数据包括HTTP头和网页本身，我们只需要把HTTP头和网页分离一下，把HTTP头打印出来，网页内容保存到文件：

```python
header, html = data.split(b'\r\n\r\n', 1)
print(header.decode('utf-8'))
# 把接收的数据写入文件:
with open('sina.html', 'wb') as f:
    f.write(html)
```

现在，只需要在浏览器中打开这个`sina.html`文件，就可以看到新浪的首页了。

#### 服务器

和客户端编程相比，服务器编程就要复杂一些。

1. 服务器进程<u>首先要绑定一个端口并监听来自其他客户端的连接</u>。如果某个客户端连接过来了，服务器就与该客户端建立Socket连接，随后的通信就靠这个Socket连接了。

   所以，<u>服务器会打开固定端口（比如80）监听</u>，<u>每来一个客户端连接，就创建该Socket连接</u>。由于服务器会有大量来自客户端的连接，所以，*服务器要能够区分一个Socket连接是和哪个客户端绑定的*。一个Socket依赖4项：<u>服务器地址、服务器端口、客户端地址、客户端端口</u>来唯一确定一个Socket。

   但是服务器还需要同时响应多个客户端的请求，所以，每个连接都需要一个新的进程或者新的线程来处理，否则，服务器一次就只能服务一个客户端了。

   我们来编写一个简单的服务器程序，它接收客户端连接，把客户端发过来的字符串加上`Hello`再发回去。

   首先，创建一个基于IPv4和TCP协议的Socket：

```python
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
```

2. <u>然后，我们要绑定监听的地址和端口。</u>服务器可能有多块网卡，可以绑定到某一块网卡的IP地址上，也可以用`0.0.0.0`绑定到<u>所有的网络地址</u>，还可以用`127.0.0.1`绑定到<u>本机地址</u>。`127.0.0.1`是一个特殊的IP地址，表示本机地址，如果绑定到这个地址，客户端必须同时在本机运行才能连接，也就是说，外部的计算机无法连接进来。

   端口号需要预先指定。因为我们写的这个服务不是标准服务，所以用`9999`这个端口号。请注意，小于`1024`的端口号必须要有管理员权限才能绑定：

```python
# 监听端口:
s.bind(('127.0.0.1', 9999))
```

3. <u>紧接着，调用`listen()`方法开始监听端口，传入的参数指定等待连接的最大数量：</u>

```python
s.listen(5)
print('Waiting for connection...')
```

4. <u>接下来，服务器程序通过一个永久循环来接受来自客户端的连接</u>，`accept()`会等待并返回一个客户端的连接:

```python
while True:
    # 接受一个新连接:
    sock, addr = s.accept()
    # 创建新线程来处理TCP连接:
    t = threading.Thread(target=tcplink, args=(sock, addr))
    t.start()
```

5. 每个连接都必须创建新线程（或进程）来处理，否则，单线程在处理连接的过程中，无法接受其他客户端的连接：

```python
def tcplink(sock, addr):
    print('Accept new connection from %s:%s...' % addr)
    sock.send(b'Welcome!')
    while True:
        data = sock.recv(1024)
        time.sleep(1)
        if not data or data.decode('utf-8') == 'exit':
            break
        sock.send(('Hello, %s!' % data.decode('utf-8')).encode('utf-8'))
    sock.close()
    print('Connection from %s:%s closed.' % addr)
```

连接建立后，服务器首先发一条欢迎消息，然后等待客户端数据，并加上`Hello`再发送给客户端。如果客户端发送了`exit`字符串，就直接关闭连接。

要测试这个服务器程序，我们还需要编写一个客户端程序：

```python
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
# 建立连接:
s.connect(('127.0.0.1', 9999))
# 接收欢迎消息:
print(s.recv(1024).decode('utf-8'))
for data in [b'Michael', b'Tracy', b'Sarah']:
    # 发送数据:
    s.send(data)
    print(s.recv(1024).decode('utf-8'))
s.send(b'exit')
s.close()
```

我们需要打开两个命令行窗口，一个运行服务器程序，另一个运行客户端程序，就可以看到效果了

源码：https://github.com/michaelliao/learn-python3/tree/master/samples/socket



