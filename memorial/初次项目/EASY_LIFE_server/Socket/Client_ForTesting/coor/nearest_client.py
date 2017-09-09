import socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

s.connect(('127.0.0.1', 8996))

print(s.recv(1024).decode('utf-8'))

s.send('near')

s.recv(1024)

jing = 319.45
wei = 632.46
s.send('%lf' % jing)
s.recv(1024)

s.send('%lf' % wei)

jingout = s.recv(1024)
print(jingout)
s.send('go')

weiout = s.recv(1024)
print(weiout)
s.send(b'exit')
s.close()