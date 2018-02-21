import re
from socket import *

# http://127.0.0.1:8080/login.do?username=wierton&passwd=123456
def handle_request(request):
    print(request)
    #return parse_header(request)[0][0]
    return 'Welcome to wiertons site'

s = socket(AF_INET, SOCK_STREAM)
s.setsockopt(SOL_SOCKET, SO_REUSEADDR, 1)

s.bind(('127.0.0.1', 8080))
s.listen(10)
while 1:
    conn,addr = s.accept()
    print("connected by {}".format(addr))
    recv_data = conn.recv(64*1024)
    resp_data = handle_request(recv_data)
    conn.sendall(resp_data)
    conn.close()
s.close()
