import socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

s.connect(('127.0.0.1', 8996))

s.send('go')
print(s.recv(1024).decode('utf-8'))

s.send('download_score')

s.recv(1024)

jing = 32.12123
wei = 118.960491
s.send('%lf' % jing)
s.recv(1024)

s.send('%lf' % wei)


print('%s' % s.recv(1024))



s.send(b'exit')
s.close()

