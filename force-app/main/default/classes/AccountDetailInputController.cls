public class AccountDetailInputController {
    public String accountName { get; set; }
    public Account account { get; private set; }

    public AccountDetailInputController(ApexPages.StandardController sc) {
        super(sc);
    }
    
    public AccountDetailInputController(ApexPages.StandardSetController sc) {
    }

    // Method to find and display the account based on user input
    public PageReference findAccount() {
        if (String.isEmpty(accountName)) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Please enter a valid Account Name.'));
            return null;
        } else {
            try {
                String sanitizedQuery = String.escapeSingleQuotes(accountName);
                this.account = [SELECT Id, Name, Phone, Industry, Type, AnnualRevenue, Website 
                           FROM Account 
                           WHERE Name = :sanitizedQuery 
                           LIMIT 1];              
            } catch (Exception e) {
                // Handle exception if no account is found
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'No account found with the specified name.'));
                account = null;
            }          
        return null;
        }
    }
}

