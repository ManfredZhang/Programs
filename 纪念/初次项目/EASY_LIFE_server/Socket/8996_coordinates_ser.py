#!/usr/bin/python
# -*- coding: UTF-8 -*-

import socket
import time
import threading
import MySQLdb

# 打开数据库连接
db = MySQLdb.connect("localhost","root","Aliyun666","EASY_LIFE" )

# 使用cursor()方法获取操作游标 
cursor = db.cursor()


# 数据库删除坐标
def delete(jing,wei):
        # SQL 删除语句
        sql = "DELETE FROM COORDINATES WHERE longtitude = '%lf' and latitude = '%lf'" % (jing,wei)
        try:
                # 执行SQL语句
                cursor.execute(sql)
                # 提交修改
                db.commit()
        except:
                # 发生错误时回滚
                db.rollback()

# 数据库里分数覆盖
def upload(jing,wei,score):
        # SQL 删除语句
        sql = "UPDATE COORDINATES SET score = '%d' WHERE longtitude = '%lf' and latitude = '%lf'" % (score,jing,wei)
        try:
                # 执行SQL语句
                cursor.execute(sql)
                # 提交修改
                db.commit()
        except:
                # 发生错误时回滚
                db.rollback()


# 数据库搜索坐标
def search_loc(jing,wei):
        # SQL 查询语句
        sql = "SELECT * FROM COORDINATES WHERE longtitude = '%lf' and latitude = '%lf'" % (jing,wei)
        try:
                # 执行SQL语句
                cursor.execute(sql)
                # 获取所有记录列表
                results = cursor.fetchall()

                # 如果有记录则返回1
                if results:
                        return 1
                else:
                        return 0
        except:
                print "Error: unable to fecth data"

def search_score(jing,wei):
        # SQL 查询语句
        sql = "SELECT score FROM COORDINATES WHERE longtitude = '%lf' and latitude = '%lf'" % (jing,wei)
        try:
                # 执行SQL语句
                cursor.execute(sql)
                # 获取所有记录列表
                result = cursor.fetchone()

                # 如果有记录则返回1
                if result:
                        return result
                else:
                        return 0
        except:
                print "Error: unable to fecth data"


# 数据库插入坐标
def insert(jing, wei):
        # SQL 插入语句
        sql = "INSERT INTO COORDINATES (longtitude, latitude) VALUES ('%lf', '%lf')" % (jing, wei)
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



                # 任务2：DELETE A PAIR OF COORDINATES
                if data.decode('utf-8') == 'delete':
                        sock.send('go')
                        jing = sock.recv(1024)
                        # 转化为浮点类型
                        jing = float(jing)
                        sock.send('go')
                        wei = sock.recv(1024)
                        wei = float(wei)

                        # 看看要删的坐标是否在数据库里
                        outcome = search_loc(jing,wei)
                        # 在的话就做删除操作并送出‘1’
                        if outcome == 0:
                                sock.send('0')
                        else:
                                delete(jing,wei)
                                sock.send('1')


                # 任务3：CREATE A NEW PAIR OF COORDINATES
                if data.decode('utf-8') == 'create':
                        # 接受数据
                        sock.send('go')
                        jing = sock.recv(1024)
                        jing = float(jing)
                        sock.send('go')
                        wei = sock.recv(1024)
                        wei = float(wei)

                        # 插入数据到数据库
                        insert(jing,wei)

                        sock.send('go')


                # 任务4：FIND THE NEAREST LOCATION
                if data.decode('utf-8') == 'near':
                        # 接收数据
                        sock.send('go')
                        jing = sock.recv(1024)
                        jing = float(jing)
                        sock.send('go')
                        wei = sock.recv(1024)
                        wei = float(wei)

                        # SQL 查询语句
                        sql = "SELECT * FROM COORDINATES"
                        try:
                                # 执行SQL语句
                                cursor.execute(sql)

                                # 获取所有记录列表
                                results = cursor.fetchall()

                                num_of_row = 0
                                # 每一行数据即每一对坐标
                                # 计算数据库里所有坐标与传输来的当前位置间距离
                                # 并与当前最小距离比较，最后得到最小值，送出其>坐标
                                for row in results:
                                        jingnow = row[0]
                                        weinow = row[1]
                                        distance = (jing - jingnow)**2 + (wei - weinow)**2
                                        if num_of_row == 0:
                                                mindis = distance
                                                jingout = jingnow
                                                weiout = weinow
                                        else:
                                                if mindis > distance:
                                                        mindis = distance
                                                        jingout = jingnow
                                                        weiout = weinow

                                        num_of_row = num_of_row + 1


                                # 送出结果
                                sock.send('%lf' % jingout)
                                sock.recv(1024)

                                sock.send('%lf' % weiout)
                        except:
                                print "Errorrrrr: unable to fecth data"

                # 任务5：上传并覆盖某坐标的分数
                if data.decode('utf-8') == 'upload_score':
                        sock.send('go')
                        jing = sock.recv(1024)
                        # 转化为浮点类型
                        jing = float(jing)
                        sock.send('go')
                        wei = sock.recv(1024)
                        wei = float(wei)
                        sock.send('go')

                        score = sock.recv(1024)
                        score = int(score)

                        # 看看要删的坐标是否在数据库里
                        outcome = search_loc(jing,wei)
                        # 在的话就做更新操作并送出‘1’
                        if outcome == 0:
                                sock.send('0')
                        else:
                                upload(jing,wei,score)
                                sock.send('1')

                # 任务6：下载某坐标的分数
                if data.decode('utf-8') == 'download_score':
                        sock.send('go')
                        jing = sock.recv(1024)
                        # 转化为浮点类型
                        jing = float(jing)
                        sock.send('go')
                        wei = sock.recv(1024)
                        wei = float(wei)


                        # 看看要删的坐标是否在数据库里
                        outcome = search_loc(jing,wei)

                        if outcome == 0:
                                tempy = 0
                                sock.send('%d' % tempy)
                        else:
                                sock.send('%d' % search_score(jing,wei))

        sock.close()
        print('Connection from %s:%s closed.' % addr)





s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# 接收任何IP的连接
s.bind(('',8996))

s.listen(99)
print('Waiting for connection...')


while True:

        sock, addr = s.accept()
        t = threading.Thread(target=tcplink, args=(sock,addr))
        t.start()




# 关闭连接
db.close()

                          