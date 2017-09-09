import socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

s.connect(('127.0.0.1', 9990))

print(s.recv(1024).decode('utf-8'))
for data in [b'reg', b'register_test', b'succeed']:
        s.send(data)
        print((s.recv(1024)).decode('utf-8'))

s.send(b'result?')
print('%s' % s.recv(1024))
s.send(b'exit')
s.close()