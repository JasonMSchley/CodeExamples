public with sharing class AccountContactSearchController {
    public String searchKey { get; set; }
    public ApexPages.StandardSetController setCon { get; set; }
    public List<Account> accounts { get; set; }
    public Integer pageSize { get; set; }
    

    public AccountContactSearchController() {
        pageSize = 10;  // Set the number of records per page
        searchKey = ''; // Initialize search key as empty
        loadAccounts();
    }

    public void init() {
        searchKey = ApexPages.currentPage().getParameters().get('searchKey');
        loadAccounts();
    }

    public void loadAccounts() {
        String query = 'SELECT Id, Name, (SELECT Id, Name FROM Contacts ORDER BY Name) FROM Account ';
        if (!String.isEmpty(searchKey)) {
            query += 'WHERE Name LIKE \'%' + String.escapeSingleQuotes(searchKey) + '%\' ';
        }
        query += 'ORDER BY Name';
        setCon = new ApexPages.StandardSetController(Database.getQueryLocator(query));
        setCon.setPageSize(pageSize);
        accounts = (List<Account>) setCon.getRecords();
    }

    public List<Account> getAccounts() {
        return (List<Account>) setCon.getRecords();
    }

    public void next() {
        setCon.next();
        accounts = (List<Account>) setCon.getRecords();
    }

    public void previous() {
        setCon.previous();
        accounts = (List<Account>) setCon.getRecords();
    }

    public void save() {
        try {
            update setCon.getRecords();
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Records updated successfully.'));
        } catch (Exception e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Error updating records: ' + e.getMessage()));
        }
    }
}
