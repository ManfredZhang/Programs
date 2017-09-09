# -*- coding: UTF-8 -*-

import socket
import time
import threading
import MySQLdb



# 打开数据库连接
db = MySQLdb.connect("localhost","root","Aliyun666","EASY_LIFE" )

# 使用cursor()方法获取操作游标 
cursor = db.cursor()

def search(NAMEin,PASSWORDin):
        # SQL 查询语句
        sql = "SELECT * FROM USERS WHERE NAME = '%s' and PASSWORD = '%s'" % (NAMEin, PASSWORDin)
        try:
                # 执行SQL语句
                cursor.execute(sql)
                # 获取所有记录列表
                results = cursor.fetchall()
                if results:
                        return 1
                else:
                        return 0
        except:
                print "Error: unable to fecth data"

def search_name(NAMEin):
        # SQL 查询语句
        sql = "SELECT * FROM USERS WHERE NAME = '%s'" % (NAMEin)
        try:
                # 执行SQL语句
                cursor.execute(sql)
                # 获取所有记录列表
                results = cursor.fetchall()
                if results:
                        return 1
                else:
                        return 0
        except:
                print "Error: unable to fecth data"


def insert(NAMEin,PASSWORDin):
        # SQL 插入语句
        sql = "INSERT INTO USERS (NAME, PASSWORD) VALUES ('%s', '%s')" % (NAMEin, PASSWORDin)
        try:
                # 执行sql语句
                cursor.execute(sql)
                # 提交到数据库执行
                db.commit()
        except:
                # Rollback in case there is any error
                db.rollback()


def tcplink(sock, addr):
        print('Accept new connection from %s:%s...' % addr)
        sock.send(b'Welcome!\n')
        while True:
                data = sock.recv(1024)
                time.sleep(1)
                if not data or data.decode('utf-8') == 'exit':
                        break
                if data.decode('utf-8') == 'reg':
                        sock.send(b'get_reg\n')
                        name = sock.recv(1024)
                        sock.send(b'get_name\n')
                        password = sock.recv(1024)
                        sock.send(b'get_passw\n')

                        outcome = search_name(name.decode('utf-8'))
                        useless = sock.recv(1024)
                        if outcome == 1:
                                sock.send('0\n')
                        else:
                                insert(name.decode('utf-8'),password.decode('utf-8'))
                                sock.send('1\n')

                if data.decode('utf-8') == 'log':
                        sock.send(b'get_log\n')
                        name = sock.recv(1024)
                        sock.send(b'get_name\n')
                        password = sock.recv(1024)
                        sock.send(b'get_passw\n')
                        outcome = search(name.decode('utf-8'),password.decode('utf-8'))
                        useless = sock.recv(1024);
                        if outcome == 0:
                                sock.send('0\n')
                        else:
                                sock.send('1\n')


                else:
                        #sock.send(('Somewhere wrong?').encode('utf-8'))
                        break
        sock.close()
        print('Connection from %s:%s closed.' % addr)





s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)


s.bind(('',9990))

s.listen(5)
print('Waiting for connection...')


while True:

        sock, addr = s.accept()
        t = threading.Thread(target=tcplink, args=(sock,addr))
        t.start()




# 关闭连接
db.close()
