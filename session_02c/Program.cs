using System;

class Animal
{
    // Base class method
    public virtual string AnimalSound()
    {
        return "Some sound";
    }
}

class Dog : Animal
{
    // Override the base class method
    public override string AnimalSound()
    {
        return "Woof!";
    }
}

class Cat : Animal
{
    // Override the base class method
    public override string AnimalSound()
    {
        return "Meow!";
    }
}

class Bird : Animal
{
    // Override the base class method
    public override string AnimalSound()
    {
        return "Chirp!";
    }
}

class Program
{
    static void MakeSound(Animal animal)
    {
        Console.WriteLine(animal.AnimalSound());
    }

    static void Main(string[] args)
    {
        // Creating instances of each animal
        Animal dog = new Dog();
        Animal cat = new Cat();
        Animal bird = new Bird();

        // Calling the same method on different objects
        MakeSound(dog);  // Output: Woof!
        MakeSound(cat);  // Output: Meow!
        MakeSound(bird); // Output: Chirp!
    }
}
