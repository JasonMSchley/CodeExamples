public class AccountDetailInputController {
    public String accountName { get; set; }
    public Account account { get; private set; }
    public List<Contact> relatedContacts { get; private set; }

    //read records
    public AccountDetailInputController(ApexPages.StandardController stdController) {
        this.account = (Account) stdController.getRecord();
        this.relatedContacts = new List<Contact>();
    }

    // Method to find and display the account based on user input
    public PageReference findAccount() {
        if (String.isEmpty(accountName)) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Please enter a valid Account Name.'));
            account = null;
            relatedContacts = null;
            return null;
        } else {
            try {
                String sanitizedQuery = String.escapeSingleQuotes(accountName);
                account = [SELECT Id, Name, Phone, Industry, Type, AnnualRevenue, Website 
                           FROM Account 
                           WHERE Name = :sanitizedQuery 
                           LIMIT 1];              
                if (account != null) {
                    relatedContacts = [SELECT Id, Name FROM Contact WHERE AccountId = :account.Id];
                } else {
                    relatedContacts = null;
                }
            } catch (Exception e) {
                // Handle exception if no account is found
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'No account found with the specified name.'));
                account = null;
                relatedContacts = null;
            }          
            return null;
        }
    }
}
