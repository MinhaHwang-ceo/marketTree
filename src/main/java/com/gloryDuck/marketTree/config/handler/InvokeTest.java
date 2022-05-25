package com.gloryDuck.marketTree.config.handler;

import java.lang.reflect.Method;

class A 
{
	public A() 
	{
		System.out.println("A가 생성되었습니다.");
	}

	public void show(boolean showOK)
	{ 
		if (showOK)
			System.out.println("A 출력");
	}
	
	static
	{
		System.out.println("난 static블럭에 있는 함수");
	}
}

interface c
{
	String getvalue();
}

enum b implements c
{
	TEST("1");
	
	String a;
	
	b(){};
	b(String b){this.a = b;}
	
	@Override
	public String getvalue() {
		// 호출 고민
		// TODO Auto-generated method stub
		return this.a;
	}
}

class bP
{
}

	
public class InvokeTest {

	public static void main(String[] args) {
		
		try
		{
			String Testclass = "A";		
			Class<?> testClass = Class.forName(Testclass);
			
			System.out.println( testClass);
			
			Object newObj = testClass.newInstance();
			
			Method m = testClass.getDeclaredMethod( "show" );
			m.invoke( newObj );
			//m.invoke(arg0);
			m.invoke(newObj, true);
		}
		catch( Exception e )
		{
			e.printStackTrace();
		}
		

	}

}