import socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

s.connect(('106.14.177.210', 8997))

print(s.recv(1024).decode('utf-8'))

s.send('get_all')

while True:
	data = s.recv(1024)
	if data != 'exit':
		s.send('go')
		print(data)
	else:
		break

s.send(b'exit')
s.close()