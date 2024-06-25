public with sharing class AccountContactController {
    public List<AccountWrapper> accountWrappers { get; private set; }
    public String accountFilter { get; set; }

    public AccountContactController() {
        accountWrappers = new List<AccountWrapper>();
    }
    public class AccountWrapper {
        public Account account { get; private set; }
        public String contactNames { get; private set; }

        public AccountWrapper(Account account, String contactNames) {
            this.account = account;
            this.contactNames = contactNames;
        }
    }

    public void init() {
        String filter = ApexPages.currentPage().getParameters().get('filter');
        loadAccountsAndContacts(filter);
    }
    public PageReference redirectToAccountContact() {
        PageReference pageRef = Page.AccountContact;
        pageRef.getParameters().put('filter', accountFilter);
        return pageRef;
    }
    
    public PageReference updateAccountList() {
        loadAccountsAndContacts(accountFilter);
        return null; 
    }
    
    public void loadAccountsAndContacts(String filter) {
        accountWrappers.clear();
        String query = 'SELECT Id, Name, (SELECT Name FROM Contacts) FROM Account';
        
        if (!String.isEmpty(filter)) {
            query += ' WHERE Name LIKE \'%' + String.escapeSingleQuotes(filter) + '%\'';
        }
        
        List<Account> accounts = Database.query(query);

        for (Account acc : accounts) {
            String contactNames = '';
            if (acc.Contacts != null && !acc.Contacts.isEmpty()) {
                List<String> names = new List<String>();
                for (Contact con : acc.Contacts) {
                    names.add(con.Name);
                }
                contactNames = String.join(names, ', ');
            }
            accountWrappers.add(new AccountWrapper(acc, contactNames));
        }
    }
}