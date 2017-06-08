
#!/usr/bin/python
# -*- coding: UTF-8 -*-

import socket
import time
import threading
import MySQLdb
import datatime

# 打开数据库连接
db = MySQLdb.connect("localhost","root","Aliyun666","EASY_LIFE" )

# 使用cursor()方法获取操作游标 
cursor = db.cursor()


# 数据库搜索坐标
def search_log():
        # SQL 查询语句
        sql = "SELECT * FROM CHAT_LOG"
        try:
                # 执行SQL语句
                cursor.execute(sql)
                # 获取所有记录列表
                results = cursor.fetchall()
                for data in results:
                        sock.send(data[0])
                        sock.recv(1024)
                        sock.send(data[1])
                        sock.recv(1024)
        except:
                print "Error: unable to fecth data"


# 数据库插入坐标
def insert(users,chat_log):
        # SQL 插入语句
        now = datatime.datatime.now()
        sql = "INSERT INTO CHAT_LOG (users,chat_log, time) VALUES ('%s', '%s',%s)" % (users, chat_log, now.strftime('%Y-%m-%d %H:%M:%S'))
        try:
                # 执行sql语句
                cursor.execute(sql)
                # 提交到数据库执行
                db.commit()
        except:
                # Rollback in case there is any error
                db.rollback()

# Socket具体操作
def tcplink(sock, addr):
        print('Accept new connection from %s:%s...' % addr)
        sock.recv(1024)
        sock.send('Welcome!\n')
        print("Welcome has been send")
        while True:
                #接收本指令来选择做什么任务
                data = sock.recv(1024)
                time.sleep(1)
                # 客户端最后要send('exit')来结束任务
                if not data or data.decode('utf-8') == 'exit':
                        break


                # 任务1：GET ALL THE COORDINATES
                if data == 'get_all':
                        # SQL 查询语句
                        sql = "SELECT * FROM COORDINATES"
                        print("get_all received")
                        try:
                                # 执行SQL语句
                                cursor.execute(sql)

                                # 获取所有记录列表
                                results = cursor.fetchall()

                                for row in results:

                                        jing = row[0]
                                        wei = row[1]
                                        level = row[2]
                                        modelID = row[3]

                                        # 送出结果
                                        sock.send('%lf\n' % jing)
                                        sock.recv(1024)

                                        sock.send('%lf\n' % wei)
                                        sock.recv(1024)

                                        sock.send('%d\n' % level)
                                        sock.recv(1024)

                                        sock.send('%d\n' % modelID)
                                        sock.recv(1024)

                                sock.send('exit\n')
                        except:
                                print "Errorrrrr: unable to fecth data"



                # 任务3：CREATE A NEW PAIR OF COORDINATES
                if data.decode('utf-8') == 'create':
                        # 接受数据
                        sock.send('go')
                        users = sock.recv(1024)
                        sock.send('go')
                        chat_log = sock.recv(1024)

                        # 插入数据到数据库
                        insert(users,chat_log)

                        sock.send('go')



        sock.close()
        print('Connection from %s:%s closed.' % addr)





s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# 接收任何IP的连接
s.bind(('',7999))

s.listen(99)
print('Waiting for connection...')


while True:

        sock, addr = s.accept()
        t = threading.Thread(target=tcplink, args=(sock,addr))
        t.start()




# 关闭连接
db.close()
