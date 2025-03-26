// ParentClass.cs - Demonstrates Inheritance and Virtual Methods
namespace oopsdemo.parent;

public class ParentClass
{
    // A simple parent method
    public void parentmethod()
    {
        Console.WriteLine("This is parent method");
    }

    // Virtual method - Can be overridden in child classes
    public virtual void asset()
    {
        Console.WriteLine("This is Parent asset");
    }
}
