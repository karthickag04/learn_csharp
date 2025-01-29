

namespace session_02b
{

    class Program
    {
        public Program(){
            Console.WriteLine("Welcome to Gtech under constructor in main class - default constructor");
        }
        public Program(int a){
            Console.WriteLine("constructor with one argument");   
        }
        
        public Program(int a, int b){
            Console.WriteLine("constructor over loading example");
        }
        public Program(string a, int b){
            Console.WriteLine("constructor over loading example");
        }



        public static void Main(String[] args)
        {
            // example call to check the constructor working or not
            Program p=new Program();
        
            // example call to check the access modifiers declared in another class
            gtech gt=new gtech();
            // Console.WriteLine(gt.trainerlaptopNo);
        
            Console.WriteLine(gt.practicelaptopNo);

        }

    }

    class gtech{
        private string trainerlaptopNo="NO08";
        public string practicelaptopNo="NO10";
    }

}