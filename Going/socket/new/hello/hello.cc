#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <pthread.h>
#include <signal.h>
#include <unistd.h>
#include <stdlib.h>
#include <memory.h>
#include <iostream>

int servfd = -1;

void interrupt (int signum)
{
	printf("keyboard interrupt, close server\n");
	exit(0);
}

int main()
{
	// 创建一个套接字
	servfd = socket(AF_INET, SOCK_STREAM, 0);
	signal(SIGINT, interrupt);

	struct sockaddr_in servaddr;
	memset(&servaddr, 0, sizeof(servaddr));
	servaddr.sin_family = AF_INET;
	servaddr.sin_port = htons(8080);
	servaddr.sin_addr.s_addr = htonl(INADDR_ANY);

	// 将套接字绑定到一个特殊的地址上
	bind(servfd, (struct sockaddr*)&servaddr, sizeof(servaddr));

	// 监听套接字
	listen(servfd, 50);

	// 服务器在线后开始收发数据
	struct sockaddr_in client_addr;
	socklen_t length = sizeof(client_addr);

	int conn = -1;
	while ((conn = accept(servfd, (struct sockaddr*)&client_addr, &length)) != -1)
	{	
		const char response[] = "HTTP/1.1 200 OK\r\n" "Content-Length: 20\r\n" "\r\n" 
			"<h2>Hello World</h2>\n";
		int len = write(conn, response, sizeof(response));
		close(conn);
	}

	return 0;
}
