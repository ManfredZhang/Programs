public class math
{
	public static void main(String[] args)
	{
		double a = -3.14;
		double b = -7.26;

		System.out.println(Math.abs(a));
		System.out.println(Math.ceil(a));
		System.out.println(Math.floor(a));
		System.out.println(Math.round(a));//round 四舍五入，float时返回int值，double时返回long值 
		System.out.println(Math.rint(a));//rint 四舍五入，返回double值 注意.5的时候会取偶数 

		System.out.println(Math.round(Math.random()*100));//0~100随机数

		System.out.println(Math.max(a,b));
		System.out.println(Math.min(a,b));

		System.out.println(Math.pow(a,b));
	}
}