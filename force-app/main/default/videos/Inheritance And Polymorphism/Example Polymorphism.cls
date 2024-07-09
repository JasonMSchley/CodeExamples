public class MathOperations {
    public Integer add(Integer a, Integer b) {
        return a + b;
    }

    public Double add(Double a, Double b) {
        return a + b;
    }

    public Double add(Double a, Double b, Double c) {
        return a + b + c;
    }


    public String add(String a, String b) {
        return a + b;
    }
}

// Usage
MathOperations math = new MathOperations();
System.debug(math.add(5, 10));        // Output: 15
System.debug(math.add(5.5, 2.5));     // Output: 8.0
System.debug(math.add('Hello', ' World')); // Output: Hello World
