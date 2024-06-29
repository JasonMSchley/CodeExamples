//100% - Test coverage for CalculatorController.cls
//100% - Test Coverage for Calculator.cls

@isTest
public class CalculatorControllerTests {

    @isTest
    static void testPerformAddition() {
        CalculatorController controller = new CalculatorController();
        controller.addInputA = 2;
        controller.addInputB = 3;
        
        Test.startTest();
        controller.performAddition();
        Test.stopTest();
        
        System.assertEquals(5, controller.addResult, 'Addition result should be 5');
    }

    @isTest
    static void testPerformSubtraction() {
        CalculatorController controller = new CalculatorController();
        controller.subInputA = 5;
        controller.subInputB = 3;
        
        Test.startTest();
        controller.performSubtraction();
        Test.stopTest();
        
        System.assertEquals(2, controller.subResult, 'Subtraction result should be 2');
    }

    @isTest
    static void testPerformMultiplication() {
        CalculatorController controller = new CalculatorController();
        controller.mulInputA = 2;
        controller.mulInputB = 3;
        
        Test.startTest();
        controller.performMultiplication();
        Test.stopTest();
        
        System.assertEquals(6, controller.mulResult, 'Multiplication result should be 6');
    }

    @isTest
    static void testPerformDivision() {
        CalculatorController controller = new CalculatorController();
        controller.divInputA = 6;
        controller.divInputB = 3;
        
        Test.startTest();
        controller.performDivision();
        Test.stopTest();
        
        System.assertEquals(2, controller.divResult, 'Division result should be 2');
    }

    @isTest
    static void testPerformDivisionByZero() {
        CalculatorController controller = new CalculatorController();
        controller.divInputA = 6;
        controller.divInputB = 0;
        
        Test.startTest();
        controller.performDivision();
        Test.stopTest();
        
        System.assertEquals(null, controller.divResult, 'Division by zero should return NULL');
    }

    @isTest
    static void testPerformModulus() {
        CalculatorController controller = new CalculatorController();
        controller.modInputA = 10;
        controller.modInputB = 3;
        
        Test.startTest();
        controller.performModulus();
        Test.stopTest();
        
        System.assertEquals(1, controller.modResult, 'Modulus result should be 1');
    }

    @isTest
    static void testPerformCalculation() {
        CalculatorController controller1 = new CalculatorController();
        CalculatorController controller2 = new CalculatorController();
        CalculatorController controller3 = new CalculatorController();
        CalculatorController controller4 = new CalculatorController();
        CalculatorController controller5 = new CalculatorController();

        controller1.calcExpression = '1 + 2 * 3';
        controller2.calcExpression = '2 * 2 + 3';
        controller3.calcExpression = '(1 + 2) * 3';
        controller4.calcExpression = '((3 * (4 + 2) - 8) + 10) / 2';
        controller5.calcExpression = '(10.5 * 2 - 10) * 0.5';      

        Test.startTest();
        controller1.performCalculation();
        controller2.performCalculation();
        controller3.performCalculation();
        controller4.performCalculation();
        controller5.performCalculation();
        Test.stopTest();
        
        System.assertEquals(7.0, controller1.calcResult, 'Calculation result should be 7.0');
        System.assertEquals(7.0, controller2.calcResult, 'Calculation result should be 7.0');
        System.assertEquals(9.0, controller3.calcResult, 'Calculation result should be 9.0');
        System.assertEquals(10.0, controller4.calcResult, 'Calculation result should be 10');
        System.assertEquals(5.5, controller5.calcResult, 'Calculation result should be 5.5');
    }

    @isTest
    static void testPerformInvalidCalculation() {
        CalculatorController controller = new CalculatorController();
        controller.calcExpression = '1 + a';
        
        Test.startTest();
        controller.performCalculation();
        Test.stopTest();
        
        // Check that an error message is displayed
        List<ApexPages.Message> messages = ApexPages.getMessages();
        System.assertNotEquals(0, messages.size(), 'Error message should be displayed for invalid calculation');
        System.assertEquals('Input not formatted properly', messages[0].getSummary(), 'Error message summary should match');
    }
}
