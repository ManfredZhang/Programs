import java.util.Scanner;

public class array_for
{
	public static void main(String[] args)
	{
		System.out.println("输入5个数，空格隔开：");
		Scanner get = new Scanner(System.in);

		int[] arr = new int[5];
		for (int i = 0; i < 5; i++)
			arr[i] = get.nextInt();

		for (int i = 0; i < arr.length; i++) 
		{
			for (int j = i; j < arr.length; j++) 
			{
				if (arr[j] < arr[i]) 
				{
					int temp = arr[i];
					arr[i] = arr[j];
					arr[j] = temp;			
				}		
			}	
		}

		//前方高能
		for (int i: arr) 
			System.out.print(i + " ");

		System.out.println();
	}
}