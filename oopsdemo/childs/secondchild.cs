// SecondClass.cs - Demonstrates Inheritance and Method Overriding
using oopsdemo.parent;
namespace oopsdemo.childs;

public class SecondClass : ParentClass
{
    // Constructor - Called when object is created
    public SecondClass()
    {
        childmethod(10);
        asset();  // Calls overridden method
        Console.WriteLine(newmethod());
    }

    // Constructor with parameter
    public SecondClass(int a)
    {
        childmethod(a);
        asset();
        Console.WriteLine(newmethod());
    }

    // Method Overriding (Polymorphism) - Overrides asset() from ParentClass
    public override void asset()
    {
        Console.WriteLine("This is Child asset");
    }

    public void childmethod(int a)
    {
        Console.WriteLine("This is integer output  " + a);
    }

    // Additional method
    public string newmethod()
    {
        return "10";
    }
}