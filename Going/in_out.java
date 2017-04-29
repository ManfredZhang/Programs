import java.util.Scanner;

public class in_out
{
	public static void main(String[] args)
	{
		String name = "Java";
		System.out.println("Hello, I'm " + name + "!");
		System.out.print("What's your name?\n");
		Scanner get = new Scanner(System.in);
		String yourname = get.next();
		System.out.println("Nice to meet you, " + yourname + "!");
	}
}

//System.out.println(); <=> System.out.print("\n");