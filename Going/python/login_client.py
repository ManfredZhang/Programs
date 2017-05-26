import socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

s.connect(('127.0.0.1', 9997))

print(s.recv(1024).decode('utf-8'))
for data in [b'log', b'hahaha', b'chenggongle']:
	s.send(data)
	print((s.recv(1024)).decode('utf-8'))
s.send(b'result?')
print('%s' % s.recv(1024))
s.send(b'exit')
s.close()