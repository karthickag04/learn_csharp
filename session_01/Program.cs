// // Console.WriteLine("Hello, World!");

// int a=10;
// Console.WriteLine(a);
// Console.WriteLine("the given value for a is " + a);

// // int , float , double, string, char, long, boolean, array
// float b=10.5f;
// Console.WriteLine(b);
// Console.WriteLine("the given value for b is " + b);


// Double c=10.5D;
// Console.WriteLine(c);
// Console.WriteLine("the given value for c is " + c);
// Console.WriteLine(c.GetType());


// char s='k';
// Console.WriteLine(s);
// Console.WriteLine("the given value for c is " + s);
// Console.WriteLine(s.GetType());

// string str="welcome to great karikalan magic show";
// Console.WriteLine(str);
// Console.WriteLine("the given value for c is " + str);
// Console.WriteLine(str.GetType());


// int getvalue;
// getvalue=int.Parse(Console.ReadLine());
// Console.WriteLine(getvalue);
// Console.WriteLine("the given value through  console for getvalue  is " + getvalue);



// // string a="Welcome to C# through variable";
// // Console.WriteLine(a);

class Program{

  static void Main(string [] args){
    string welcome = "Welcome To Classes";
    Console.WriteLine(welcome);

    demoPrint();
    demoPrint(1);
    demoPrint(1,"kk");
    demoPrint1();
    test tt=new test();
    tt.PrintMSG();
    // tt.PrintMSG2();
    // test t=new test();
    // t.PrintMSG();
    // tt.PrintMSG2();

  }


  static void demoPrint(){
    Console.WriteLine("Hello from demoPrint");
  }

  static void demoPrint1(){
    Console.WriteLine("Hello from demoPrint");
  }

  static void demoPrint(int a){
    Console.WriteLine("Hello from demoPrint");
  }
  static void demoPrint(int a,string s){
    Console.WriteLine("Hello from demoPrint");
  }
}


public class test{
  string name="CAD BATCH 01";

  public void PrintMSG(){
    Console.WriteLine(name);
    Console.WriteLine(name);
    Console.WriteLine(name);
    Console.WriteLine(name);
  }

  public void PrintMSG2(){
    Console.WriteLine("hi ..! " + name);
    Console.WriteLine("hi ..! " + name);
    Console.WriteLine("hi ..! " + name);
    Console.WriteLine("hi ..! " + name);
  }

}










