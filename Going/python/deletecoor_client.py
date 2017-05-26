import socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

s.connect(('127.0.0.1', 8998))

print(s.recv(1024).decode('utf-8'))

s.send('delete')

s.recv(1024)

jing = 319.89
wei = 621.814
s.send('%lf' % jing)
s.recv(1024)

s.send('%lf' % wei)

print('%s' % s.recv(1024))

s.send(b'exit')
s.close()