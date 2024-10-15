class Program
{
  static void Main(string[] args)
  {
    visiter v=new visiter();
    v.visiting_member();    

    student st=new student();
    st.active_student();
    st.lab();
  }
}


class gtech{
    public void welcome(){
        Console.WriteLine("Welcome to G-Tech");
    }

    public string courselist(){
        return "We have list of following courses, c,c++,java, c# ... etc ";
    }

    public string counsling(){
        return "Can have career Guidance";
    }
    public string lab(){
        return "lab";
    }
    public string classroom(){
        return "classroom";
    }


}


class student : gtech

{

    public void lab(){
        Console.WriteLine("you can attend your lab session for C#");
    }
    public void active_student(){
        // Console.WriteLine("Active student");
        welcome();
        Console.WriteLine("as a student you " + counsling() + " after your course completion too");
        Console.WriteLine("as a student you attend your classes at our " + classroom());
        // Console.WriteLine("as a student you can practice in our  " + lab());
     
    }

    
}
class visiter : gtech

{
    public void visiting_member(){
        welcome();
        Console.WriteLine("as a visitor you " + counsling());
        Console.WriteLine("as a visitor you visit and check " + classroom());
        Console.WriteLine("as a visitor you visit and look into " + lab());
     }
}