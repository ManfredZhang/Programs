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

int key = -1;

void interrupt (int signum)
{
	printf("keyboard interrupt, close server\n");
	exit(0);
}

int main()
{
	key = socket(AF_INET, SOCK_STREAM, 0);
	signal(SIGINT, interrupt);

	struct sockaddr_in server_address;
	memset(&server_address, 0, sizeof(server_address));

	server_address.sin_family = AF_INET;
	server_address.sin_port = htons(8080);
	server_address.sin_addr.s_addr = htonl(INADDR_ANY);

	bind(key, (struct sockaddr*)&server_address, sizeof(server_address));



	listen(key, 50);
	struct sockaddr_in client_address;
	socklen_t length = sizeof(client_address);

	int connect = -1;
	while ((connect = accept(key, (struct sockaddr*)&client_address, &length)) != -1)
	{	
		const char response[] = 
			"HTTP/1.1 200 OK\r\n"
			"Content-Length: 20\r\n"
			"\r\n"
			"<h2>Hello World</h2>\n";
		[[maybe_unused]]
			int len = write(connect, response, sizeof(response));
		close(connect);
	}

	return 0;
}
