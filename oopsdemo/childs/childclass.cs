// ChildClass.cs - Demonstrates Encapsulation and Polymorphism (Method Overloading)
namespace oopsdemo.childs;

public class ChildClass
{
    // Method Overloading: Same method name, different parameters
    public void childmethod(int a)
    {
        Console.WriteLine("This is integer output  " + a);
    }

    public void childmethod(float a)
    {
        Console.WriteLine("This is float output  " + a);
    }

    public void childmethod(string a)
    {
        Console.WriteLine("this is string output  " + a);
    }

    public void childmethod(string a, string b)
    {
        Console.WriteLine("this is string output from both strings: " + a + " " + b);
    }

    public void childmethod(string a, int b)
    {
        Console.WriteLine("this is string output from one string and one int: " + a + " " + b);
    }

    // Additional Methods in ChildClass
    public void childmethod1()
    {
        Console.WriteLine("This is child class method 1");
    }

    public void childmethod2()
    {
        Console.WriteLine("This is child class method 2");
    }

    public void childmethod3()
    {
        Console.WriteLine("This is child class method 3");
    }

    public void childmethod4()
    {
        Console.WriteLine("This is child class method 4");
    }
}