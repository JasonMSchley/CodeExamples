public with sharing class Calculator {

    //Challenge I
    // Create a class called Calculator with a single method called Add. This method should take 2 Integer parameters and return their sum.
    public Integer Add(Integer a, Integer b) {
        return a + b;
    }

    public Integer Subtract(Integer a, Integer b) {
        return Add(a, -b);
    }

    //Challenge II
    //Create a method called Multiply that takes 2 Integer parameters and returns their product. 
    //You are not allowed to use the * operator to multiply the two Integers, and you must use your Add method you created in Challenge I.
    public Integer Multiply(Integer a, Integer b) {
        integer total = 0;

        //checks if B is negative
        Boolean IsNegative = false;
        if (b < 0) {
            b = -b;
            isNegative = true;
         }

         //multiply A and B (add B number of A together)
        for (Integer c=0; c<b; c++){
            total = add(total,a);
        }

        //if B was negative return negative version
        if (IsNegative){
            return - total;
        } else {
            return total;
        }
    }
    

    //Challenge III
    //Create a method called Divide that takes 2 Integer parameters and returns their quotient (Parameter 1 / Parameter 2). 
    //Once again, you are not allowed to use the / operator, and you must use your Add method. 
    //For this challenge, do not consider if zero is the divisor.
    //checks if B is negative
    public Integer Divide(Integer a, Integer b){

        //Challenge IV
        //Modify your Divide method so that it will return null if zero is the divisor.
         // Check if the divisor is zero and return null as a error
         if (b == 0) {
            return null;
         }

        // Initialize the quotient to 0
        Integer quotient = 0;
    
        // Loop until 'a' is less than 'b'
        while (a >= b) {
            // Subtract 'b' from 'a' and increment quotient
            a = Subtract(a, b);
            quotient = Add(quotient, 1);
            }
    
         // Return the quotient
         return quotient;
        
    }
    
    //Challenge V
    //Create a method called Mod that takes 2 Integer parameters and returns their remainder. You are not allowed to use the Math.Mod() method.
    // Method to find the remainder of two integers (a % b)
    public Integer Mod(Integer a, Integer b) {
        // Initialize the remainder
        Integer remainder = a;

        // Subtract 'b' from 'remainder' until 'remainder' is less than 'b'
        while (remainder >= b) {
            remainder = Subtract(remainder, b);
        }

        // Return the remainder
        return remainder;
    }
}