using oopsdemo.childs;
using oopsdemo.parent;

namespace oopsdemo
{
    public class Program
    {
        // Main method: Entry point of the application
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");

            // Creating an instance of ChildClass and demonstrating method overloading
            ChildClass cc1 = new ChildClass();
            cc1.childmethod(10); // Calls integer overload
            cc1.childmethod2(); // Calls childmethod2()
            Console.WriteLine("************************************");

            ChildClass cc12 = new ChildClass();
            cc12.childmethod(10.5f); // Calls float overload
            cc12.childmethod4(); // Calls childmethod4()
            Console.WriteLine("************************************");

            ChildClass cc123 = new ChildClass();
            cc123.childmethod("demo output"); // Calls string overload
            cc123.childmethod1();
            cc123.childmethod2();
            cc123.childmethod3();
            cc123.childmethod4();

            // Demonstrating Inheritance: Creating ParentClass object
            ParentClass pc = new ParentClass();
            pc.parentmethod(); // Calls parent method
            pc.asset(); // Calls asset method
            Console.WriteLine("************************************");

            // Demonstrating Polymorphism and Method Overriding
            SecondClass sc = new SecondClass();
            sc.childmethod(10); // Calls method in SecondClass
            sc.parentmethod(); // Calls inherited method from ParentClass
            sc.asset(); // Calls overridden asset() method from SecondClass

            // Parsing and conditional execution
            int x = int.Parse(sc.newmethod()); 
            if (x == 10)
            {
                Console.WriteLine("this is 10");
            }
            else
            {
                Console.WriteLine("this is not 10");
            }
            Console.WriteLine("************************************");

            // Demonstrating method overloading with different parameters
            ChildClass sc1 = new ChildClass();
            sc1.childmethod("string one", "string two"); 
            sc1.childmethod("string one", 12);  

            // Demonstrating constructors in SecondClass
            SecondClass sc2 = new SecondClass();  
            Console.WriteLine("************");
            SecondClass sc3 = new SecondClass(20); 
        }
    }
}