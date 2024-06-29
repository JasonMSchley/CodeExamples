public with sharing class CalculatorHelper {

    //Challenge I
    // Create a class called Calculator with a single method called Add. This method should take 2 Integer parameters and return their sum.
    public static Integer Add(Integer a, Integer b) {
        return a + b;
    }

    public static Integer Subtract(Integer a, Integer b) {
        return Add(a, -b);
    }

    //Challenge II
    //Create a method called Multiply that takes 2 Integer parameters and returns their product. 
    //You are not allowed to use the * operator to multiply the two Integers, and you must use your Add method you created in Challenge I.
    public static Integer Multiply(Integer a, Integer b) {
        integer total = 0;
        boolean isNegative = b < 0;
        b = Math.abs(b);
        for (integer c = 0; c < b; c++)
            total = add(total,a);
        return isNegative ? -total : total;
    }
    

    //Challenge III
    //Create a method called Divide that takes 2 Integer parameters and returns their quotient (Parameter 1 / Parameter 2). 
    //Once again, you are not allowed to use the / operator, and you must use your Add method. 
    //For this challenge, do not consider if zero is the divisor.
    //checks if B is negative
    public static Integer Divide(Integer a, Integer b){

        //Challenge IV
        //Modify your Divide method so that it will return null if zero is the divisor.
         // Check if the divisor is zero and return null as a error
         if (b == 0) 
            return null;
        Integer quotient = 0;
        while (a >= b) {
            a = Subtract(a, b);
            quotient = Add(quotient, 1);
            }
         return quotient;   
    }
    
    //Challenge V
    //Create a method called Mod that takes 2 Integer parameters and returns their remainder. You are not allowed to use the Math.Mod() method.
    // Method to find the remainder of two integers (a % b)
    public static Integer Mod(Integer a, Integer b) {
        // Initialize the remainder
        Integer remainder = a;
        while (remainder >= b)
            remainder = Subtract(remainder, b);
        return remainder;
    }

    //## Elite Challenge I
    //Create a method called Calculate that takes in a String in proper mathematical format (eg. 1 + 1) and returns the result.
    public static Double Calculate(String expression) {
        return evaluatePostfix(infixToPostfix(expression));
    }

    // Convert infix expression to postfix////////////////////////////////////////////
    private static List<String> infixToPostfix(String expression) {
  
        Map<String, Integer> precedence = new Map<String, Integer>{
            '+' => 1, '-' => 1,
            '*' => 2, '/' => 2,
            '(' => 0
        };
        List<String> output = new List<String>();
        List<String> operators = new List<String>();

        Integer i = 0;
        while (i<expression.length())
        {
            String token = expression.substring(i, i + 1);
            switch on token {
                // Check if the token is a digit or decimal point
                when '.','1','2','3','4','5','6','7','8','9','0'  {
                    String num = '';
                    // Collect the entire number including decimals
                    while (i < expression.length() && (expression.substring(i, i + 1).isNumeric() || (expression.substring(i, i + 1) == '.'))) {
                        num += expression.substring(i, i + 1);
                        i++;
                    }
                    output.add(num);
                    i--; // Step back one position after the inner loop
                }
                // Check if the token is a parentheses
                when '(' {
                    operators.add(token);
                }
                when ')' {
                    while (!operators.isEmpty() && operators.get(operators.size() - 1) != '(') {
                        output.add(operators.remove(operators.size() - 1));
                    }
                    operators.remove(operators.size() - 1); // Remove '(' from stack
                }
                when else {
                    if (precedence.containsKey(token)) {
                        while (!operators.isEmpty() && precedence.get(token) <= precedence.get(operators.get(operators.size() - 1))) {
                            output.add(operators.remove(operators.size() - 1));
                        }
                        operators.add(token);
                    }
                }
            }
            i++;
        }//end of while (i<expression.length() loop

        while (!operators.isEmpty()) {
            output.add(operators.remove(operators.size() - 1));
        }
        return output;
    }

    //Evaluate the post fix//////////////////////////////////////////////////////////////////////////
    private static Double evaluatePostfix(List<String> rpn) {
        List<Double> stack = new List<Double>();
        
        for (String token : rpn) {
            if (token == '+' || token == '-' || token == '*' || token == '/') {
                Double b = stack.remove(stack.size() - 1);
                Double a = stack.remove(stack.size() - 1);
                switch on token {
                    when '+' {
                        stack.add(a + b);
                    }
                    when '-' {
                        stack.add(a - b);
                    }
                    when '*' {
                        stack.add(a * b);
                    }
                    when '/' {
                        stack.add(a / b);
                    }
                }
            } else {
                stack.add(Double.valueOf(token));
            }
        }
        return stack.remove(stack.size() - 1);
    }


}