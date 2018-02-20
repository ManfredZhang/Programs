import re
from socket import *

def parse_header(raw_data):
    if not '\r\n\r\n' in raw_data:
        print('Unable to parse the data:{}.'.format(raw_data))
        return False
    proto_headers, body = raw_data.split('\r\n\r\n', 1)
    proto, headers = proto_headers.split('\r\n', 1)
    ma = re.match(r'(GET|POST)\s+(\S+)\s+HTTP/1.1', proto)
    if not ma:
        print('unsupported protocol')
        return False
    method, path = ma.groups()
    if path[0] == '/':
        path = path[1:]
    lis = path.split('?')
    lis.append('')
    rfile, query_string = lis[0:2]
    params = [tuple((param+'=').split('=')[0:2])
            for param in query_string.split('&')]
    
    ma_headers = re.findall(r'^\s*(.*?)\s*:\s*(.*?)\s*\r?$', headers, re.M)
    headers = {item[0]:item[1] for item in ma_headers}
    print("version\t: 1.1")
    print("method\t: {}".format(method))
    print("path\t: {}".format(rfile))
    print("params\t: {}".format(params))
    print("headers\t: {}".format(headers))

def handle_request(request):
    #print(request)
    parse_header(request)
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
