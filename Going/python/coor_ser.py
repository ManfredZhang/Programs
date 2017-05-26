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


# 数据库删除操作
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


def tcplink(sock, addr):
	print('Accept new connection from %s:%s...' % addr)
	sock.send(b'Welcome!')
	while True:
		data = sock.recv(1024)
		time.sleep(1)
		if not data or data.decode('utf-8') == 'exit':
			break
		

		# GET ALL THE COORDINATES
		if data.decode('utf-8') == 'get_all':
			# SQL 查询语句
			sql = "SELECT * FROM COORDINATES"
			try:
				# 执行SQL语句
				cursor.execute(sql)
				
				# 获取所有记录列表
				results = cursor.fetchall()
				
				for row in results:
					
					jing = row[0]
					wei = row[1]
					
					# 打印结果
					sock.send('%lf' % jing)
					sock.recv(1024)
					
					sock.send('%lf' % wei)
					sock.recv(1024)
					
				sock.send('exit')
			except:
				print "Errorrrrr: unable to fecth data"

		
		
		# DELETE A LOCATION
		if data.decode('utf-8') == 'delete':
			sock.send('go')
			jing = sock.recv(1024)
			jing = float(jing)
			sock.send('go')
			wei = sock.recv(1024)
			wei = float(wei)

			outcome = search_loc(jing,wei)
			
			if outcome == 0:
				sock.send('0')
			else:
				delete(jing,wei)
				sock.send('1')


		# CREATE A NEW LOCATION
		if data.decode('utf-8') == 'create':
			sock.send('go')
			jing = sock.recv(1024)
			jing = float(jing)
			sock.send('go')
			wei = sock.recv(1024)
			wei = float(wei)

			insert(jing,wei)

			sock.send('go')


		# FIND NEAREST WA
		if data.decode('utf-8') == 'near':
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

					
				# 打印结果
				sock.send('%lf' % jingout)
				sock.recv(1024)
				
				sock.send('%lf' % weiout)
			except:
				print "Errorrrrr: unable to fecth data"


	sock.close()
	print('Connection from %s:%s closed.' % addr)





s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)


s.bind(('',8998))

s.listen(5)
print('Waiting for connection...')


while True:

	sock, addr = s.accept()
	t = threading.Thread(target=tcplink, args=(sock,addr))
	t.start()




# 关闭连接
db.close()