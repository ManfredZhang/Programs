import java.util.Scanner;

public class subroutine_hasNext
{
	public static void main(String[] args)
	{
		Scanner get = new Scanner(System.in);
		System.out.println("输入一个整数来计算它的阶乘：");
		int num;

		while(get.hasNext())
		{
			num = get.nextInt();
			System.out.println(f(num));
			System.out.println("输入一个整数来计算它的阶乘：");
		}
	}

	public static int f(int a)
	{
		if (a == 0)
			return 1;
		else
			return a * f(a - 1);
	}
}

//子函数可以在定义前使用