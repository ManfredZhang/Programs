#!/usr/bin/python
# -*- coding: UTF-8 -*-

import MySQLdb

# 打开数据库连接
db = MySQLdb.connect("localhost","root","Aliyun666","test1" )

# 使用cursor()方法获取操作游标 
cursor = db.cursor()

def delete(limit_age):
	# SQL 删除语句
	sql = "DELETE FROM EMPLOYEE WHERE AGE > '%d'" % (limit_age)
	try:
	   # 执行SQL语句
	   cursor.execute(sql)
	   # 提交修改
	   db.commit()
	except:
	   # 发生错误时回滚
	   db.rollback()

def update(add):
	# SQL 更新语句
	sql = "UPDATE EMPLOYEE SET AGE = AGE + %d WHERE SEX = '%c'" % (add,'M')
	try:
	   # 执行SQL语句
	   cursor.execute(sql)
	   # 提交到数据库执行
	   db.commit()
	except:
	   # 发生错误时回滚
	   db.rollback()

def search(limit_income):
	# SQL 查询语句
	sql = "SELECT * FROM EMPLOYEE \
	       WHERE INCOME > '%d'" % (limit_income)
	try:
	   # 执行SQL语句
	   cursor.execute(sql)
	   # 获取所有记录列表
	   results = cursor.fetchall()
	   for row in results:
	      fname = row[0]
	      lname = row[1]
	      age = row[2]
	      sex = row[3]
	      income = row[4]
	      # 打印结果
	      print "%s %s, age %d, %sale, income %d" % \
	             (fname, lname, age, sex, income )
	except:
	   print "Error: unable to fecth data"

def insert(firstname,lastname,age,sex,income):
	# SQL 插入语句
	sql = 	"INSERT INTO EMPLOYEE \
			(FIRST_NAME, LAST_NAME, AGE, SEX, INCOME) \
	        VALUES ('%s', '%s', '%d', '%c', '%d')" % \
	        (firstname, lastname, age, sex, income)
	try:
	   # 执行sql语句
	   cursor.execute(sql)
	   # 提交到数据库执行
	   db.commit()
	except:
	   # Rollback in case there is any error
	   db.rollback()

# 关闭连接
db.close()