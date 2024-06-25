public with sharing class AccountDetailPaginationController {
    // Number of records to display per page
    public Integer pageSize { get; set; }
    // Current page number
    public Integer pageNumber { get; set; }
    // Total number of pages
    public Integer totalPages { get; private set; }
    // List of accounts to display
    public List<Account> accounts { get; private set; }
    // Total number of accounts
    public Integer totalAccounts { get; private set; }

    // Constructor
    public AccountDetailPaginationController() {
        pageSize = 10; // Set default page size
        pageNumber = 1; // Start at the first page
        loadAccounts();
    }

    // Method to load the accounts for the current page
    public void loadAccounts() {
        // Count total number of accounts
        totalAccounts = [SELECT COUNT() FROM Account];
        
        // Calculate total number of pages
        totalPages = (Integer) Math.ceil((Decimal)totalAccounts / pageSize);

        // Query accounts for the current page
        accounts = [SELECT Id, Name, Phone, Industry, Type, AnnualRevenue, Website
                    FROM Account
                    ORDER BY Name
                    LIMIT :pageSize
                    OFFSET :((pageNumber - 1) * pageSize)];
    }

    // Method to go to the next page
    public void nextPage() {
        if (pageNumber < totalPages) {
            pageNumber++;
            loadAccounts();
        }
    }

    // Method to go to the previous page
    public void previousPage() {
        if (pageNumber > 1) {
            pageNumber--;
            loadAccounts();
        }
    }
}
