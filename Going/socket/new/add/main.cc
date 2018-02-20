#include "server.h"
#include "argv.h"
#include <string>

HTTPResponse add(Session &session, CallbackArgs &args) {
	std::ostringstream oss;
	assert(args.size() == 3);
	oss << args[1] << " + " << args[2] << " = " << atoi(args[1].c_str()) + atoi(args[2].c_str()) << std::endl;
	return oss.str();
}

static cl::opt<int> Port(cl::BothOpt, "p", "port");

int main(int argc, const char **argv) {
	auto port = Port ? Port.value() : 8080;
	
	HTTPServer server(port);
	server.register_callback({R"(add/(\d+)/(\d+))", add});
	server.run();
	return 0;
}



