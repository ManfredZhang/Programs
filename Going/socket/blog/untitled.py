connected by ('127.0.0.1', 42646)


GET /login.do?username=wierton&passwd=123456 HTTP/1.1
Host: 127.0.0.1:8080
User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:58.0) Gecko/20100101 Firefox/58.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate
Connection: keep-alive
Upgrade-Insecure-Requests: 1
Cache-Control: max-age=0
k
k


def parse_header(raw_data):
	# no two-part structure 
    if not '\r\n\r\n' in raw_data:
        print('Unable to parse the data:{}.'.format(raw_data))
        return False
    # seperate two-part structure
    proto_headers, body = raw_data.split('\r\n\r\n', 1)

    # seperate the first-line and the other lines
    proto, headers = proto_headers.split('\r\n', 1)

    # match the first line with the format
    ma = re.match(r'(GET|POST)\s+(\S+)\s+HTTP/1.1', proto)
    if not ma:
        print('unsupported protocol')
        return False

    # get the matched contents
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

