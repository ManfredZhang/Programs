public class SimpleServer
{
	public static void main(String[] args)
		throws IOException
	{
		SeverSocket ss = new SeverSocket(30000);
		while (true)
		{
			Socket s = ss.accept();
			OutputStream os = s.getOutputStream();
			os.write("您好，you receive a message from the 服务器\n"
				.getBytes("utf-8"));

			os.close();
			s.close();
		}
	}
}