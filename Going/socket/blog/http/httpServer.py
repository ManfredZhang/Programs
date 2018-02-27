#!/usr/bin/env python
#coding=utf-8

import socket
import re
import time
import threading
import MySQLdb

db = MySQLdb.connect("localhost","root","zhang","abc" )

cursor = db.cursor()

def insert(NAMEin,PASSWORDin):
    sql = "INSERT INTO USERINF (name, password) VALUES ('%s', '%s')" % (NAMEin, PASSWORDin)
    try:
        cursor.execute(sql)
        db.commit()
    except:
        db.rollback()

def search(NAMEin):
    sql = "SELECT * FROM USERINF WHERE name = '%s'" % (NAMEin)
    try:
            print sql
            cursor.execute(sql)
            results = cursor.fetchall()
            if results:
                    return 1
            else:
                    return 0
    except:
            print "Error: unable to fecth data"

def verify(NAMEin,PASSWORDin):
    sql = "SELECT * FROM USERINF WHERE name = '%s' and password = '%s'" % (NAMEin, PASSWORDin)
    try:
        cursor.execute(sql)
        results = cursor.fetchall()
        if results:
            return 1
        else:
            return 0
    except:
        print "Error: unable to fecth data"

HOST = ''
PORT = 8000

#Read index.html, put into HTTP response data
index_content = '''
HTTP/1.x 200 ok
Content-Type: text/html

'''

file = open('index.html', 'r')
index_content += file.read()
file.close()




#Read reg.html, put into HTTP response data
reg_content = '''
HTTP/1.x 200 ok
Content-Type: text/html

'''

file = open('reg.html', 'r')
reg_content += file.read()
file.close()




#Read a.css, put into HTTP response data
css_content = '''
HTTP/1.x 200 ok
Content-Type: text/css

'''

file = open('a.css', 'r')
css_content += file.read()
file.close()


#Read picture, put into HTTP response data
file = open('T-mac.jpg', 'rb')
pic_content = '''
HTTP/1.x 200 ok
Content-Type: image/jpg

'''
pic_content += file.read()
file.close()



#Configure socket
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.bind((HOST, PORT))
sock.listen(100)

#infinite loop
while True:
    # maximum number of requests waiting
    conn, addr = sock.accept()
    request = conn.recv(1024)
    method = request.split(' ')[0]
    src  = request.split(' ')[1]

    print 'Connect by: ', addr
    print 'Request is:\n', request

    #deal wiht GET method
    if method == 'GET':
        if src == '/index.html':
            content = index_content
        elif src == '/T-mac.jpg':
            content = pic_content
        elif src == '/reg.html':
            content = reg_content
        elif src == '/a.css':
            content = css_content
        elif re.match('^/\?.*$', src):
            entry = src.split('?')[1]      # main content of the request
            content = 'HTTP/1.x 200 ok\r\nContent-Type: text/html\r\n\r\n'
            content += entry
            content += '<br /><font color="green" size="7">register successs!</p>'
        else:
            continue

    
    #deal with POST method
    elif method == 'POST':
        form = request.split('\r\n')
        entry = form[-1]      # main content of the request
        content = 'HTTP/1.x 200 ok\r\nContent-Type: text/html\r\n\r\n'
        #content += entry
        big = entry.split('&')
        user = big[0].split('=')
        pw = big[1].split('=')
        exist_or_not = search(user[1])
        if exist_or_not == 1:
            pw_correct = verify(user[1], pw[1])
            if pw_correct == 1:
                content += 'username exist and password correct, you are in'
            else:
                content += 'username exist but wrong password, try again'
        else:
            content += 'welcome to join us, register success'
            insert(user[1], pw[1])
        
    
    ######
    # More operations, such as put the form into database
    # ...
    ######
    
    else:
        continue

    conn.sendall(content)
    
    #close connection
    conn.close()
