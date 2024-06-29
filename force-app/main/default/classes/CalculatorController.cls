public with sharing class CalculatorController {
    
    // Properties to hold input values and results
    public Integer addInputA { get; set; }
    public Integer addInputB { get; set; }
    public Integer addResult { get; set; }
    
    public Integer subInputA { get; set; }
    public Integer subInputB { get; set; }
    public Integer subResult { get; set; }
    
    public Integer mulInputA { get; set; }
    public Integer mulInputB { get; set; }
    public Integer mulResult { get; set; }
    
    public Integer divInputA { get; set; }
    public Integer divInputB { get; set; }
    public Integer divResult { get; set; }
    
    public Integer modInputA { get; set; }
    public Integer modInputB { get; set; }
    public Integer modResult { get; set; }
    
    public String calcExpression { get; set; }
    public Double calcResult { get; set; }
    
    // Method to initialize values
    public CalculatorController() {
        addInputA = 0;
        addInputB = 0;
        addResult = 0;
        
        subInputA = 0;
        subInputB = 0;
        subResult = 0;
        
        mulInputA = 0;
        mulInputB = 0;
        mulResult = 0;
        
        divInputA = 0;
        divInputB = 0;
        divResult = 0;
        
        modInputA = 0;
        modInputB = 0;
        modResult = 0;
        
        calcExpression = '';
        calcResult = 0.0;
    }
    
    // Action methods for button clicks
    
    public void performAddition() {
        addResult = CalculatorHelper.Add(addInputA, addInputB);
    }
    
    public void performSubtraction() {
        subResult = CalculatorHelper.Subtract(subInputA, subInputB);
    }
    
    public void performMultiplication() {
        mulResult = CalculatorHelper.Multiply(mulInputA, mulInputB);
    }
    
    public void performDivision() {
        divResult = CalculatorHelper.Divide(divInputA, divInputB);
    }
    
    public void performModulus() {
        modResult = CalculatorHelper.Mod(modInputA, modInputB);
    }
    
    public void performCalculation() {
        try{
            calcResult = CalculatorHelper.Calculate(calcExpression);
        } catch (Exception e){
            try {calcResult = CalculatorHelper.Calculate('\'' + calcExpression +'\'');
            } catch (Exception f){
                calcResult = 0;
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Input not formatted properly'));
                }
        }
    }
}
