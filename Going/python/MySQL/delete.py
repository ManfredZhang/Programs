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

delete(20)

# 关闭连接
db.close()