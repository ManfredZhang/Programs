# 导入socket库
import socket

# 创建一个socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# 监听来及本机地址，9999端口
s.bind(('127.0.0.1',9999))

# 开始监听，等待连接的最大数量为5
s.listen(5)
print('Waiting for connection...')

# 永久循环接受来自客户端的连接，accpt()会等待并返回一个客户端的连接
while True:
        # 接受一个新连接：
        sock, addr = s.accept()
        # 创建新线程来处理TCP连接：
        t = threading.Thread(target=tcplink, args=(sock,addr))
        t.start()

def tcplink(sock, addr):
        print('Accept new connection from %s:%s...' % addr)
        sock.send(b'Welcome!')
        while True:
                data = sock.recv(1024)
                time.sleep(1)
                if not data or data.decode('utf-8') == 'exit':
                        break
                sock.send(('Hello, %s!' % data.decode('utf-8')).encode('utf-8'))
        sock.close()
        print('Connection from %s:%s closed.' % addr)

