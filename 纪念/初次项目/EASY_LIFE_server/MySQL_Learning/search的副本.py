#!/usr/bin/python
# -*- coding: UTF-8 -*-

import MySQLdb

# 打开数据库连接
db = MySQLdb.connect("localhost","root","Aliyun666","EASY_LIFE" )

# 使用cursor()方法获取操作游标 
cursor = db.cursor()

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
        level = row[2]
        modelID = row[3]
        # 打印结果
        print "%lf, %lf, %d, %d" % (jing, wei, level, modelID)
except:
    print "Error: unable to fecth data"

# 关闭数据库连接
db.close()