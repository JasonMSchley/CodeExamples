public with sharing class AccountContactController {
    public List<AccountWrapper> accountWrappers { get; private set; }
    public String accountFilter { get; set; }

    public AccountContactController() {
        accountWrappers = new List<AccountWrapper>();
    }

    public PageReference loadAccountsAndContacts() {
        accountWrappers.clear();
        String query = 'SELECT Id, Name, (SELECT Name FROM Contacts) FROM Account';
        
        if (!String.isEmpty(accountFilter)) {
            query += ' WHERE Name LIKE \'%' + String.escapeSingleQuotes(accountFilter) + '%\'';
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
        return null;
    }

    public class AccountWrapper {
        public Account account { get; private set; }
        public String contactNames { get; private set; }

        public AccountWrapper(Account account, String contactNames) {
            this.account = account;
            this.contactNames = contactNames;
        }
    }
}
