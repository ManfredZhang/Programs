#--utf-8--
import socket
import time
import threading
import MySQLfunction

def tcplink(sock, addr):
    print('Accept new connection from %s:%s...' % addr)
    sock.send(b'Welcome!')
    while True:
        data = sock.recv(1024)
        time.sleep(1)
        if not data or data.decode('utf-8') == 'exit':
            break
        if data.decode('utf-8') == 'reg':
            sock.send(b'get_reg')
            name = sock.recv(1024)
            sock.send(b'get_name')
            password = sock.recv(1024)
            sock.send(b'get_passw')
            MySQLfunction.insert(name.decode('utf-8'),password.decode('utf-8'))


        else:
            sock.send(('Somewhere wrong?').encode('utf-8'))
            break
    sock.close()
    print('Connection from %s:%s closed.' % addr)





s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)


s.bind(('127.0.0.1',9998))

s.listen(5)
print('Waiting for connection...')


while True:

    sock, addr = s.accept()
    t = threading.Thread(target=tcplink, args=(sock,addr))
    t.start()