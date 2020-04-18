using System;

namespace ConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            Console.WriteLine($"1 + 2 = {1.Add(2)}");
        }
    }

    public static class Calculator
    {
        public static int Add(this int a, int b)
        {
            return a + b;
        }
    }
}
