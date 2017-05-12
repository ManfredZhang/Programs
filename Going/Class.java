import java.util.Scanner;

class dog
{
	double weight;
	private String name;
	boolean cute;
	boolean disabled;

	dog()
	{
		disabled = false;
	}

	dog(String a)
	{
		if (a.charAt(0) == 'Y') 
		{
			disabled = true;
		}
	}

	public void setname(String a)
	{
		this.name = a;
	}

	public String showname()
	{
		return this.name;
	}

	public void bark()
	{
		System.out.println("Wool! Wool!");
	}
}

public class Class
{
	public static void main(String[] args)
	{
		dog puppy = new dog("Y");
		puppy.bark();

		Scanner get = new Scanner(System.in);

		System.out.println("What's my name?");
		puppy.setname(get.next());

		System.out.println("How much is my weight?(kg)");
		puppy.weight = get.nextDouble();

		System.out.println("Am I cute?(Y/N)");
		String answer = get.next();
		if (answer.charAt(0) == 'Y')
			puppy.cute = true;
		else
			puppy.cute = false;


		System.out.println("\nOK, thank you, master!");
		for (int i = 0; i < 2; i++) 
			puppy.bark();

		System.out.print("My name is " + puppy.showname() + ", weighing " + puppy.weight + "kg");
		if (puppy.cute == false && puppy.disabled == false)
			System.out.println(", but I'm not cute.");
		else if (puppy.cute == false && puppy.disabled == true)
			System.out.println(", but I'm disabled.");
		else
			System.out.println(", I'm disabled but I'm very cute.");

	}
}