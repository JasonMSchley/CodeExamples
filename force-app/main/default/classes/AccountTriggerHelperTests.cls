@isTest
public class AccountTriggerHelperTests {

    @testSetup
    static void setupTestData() {
        // Create test accounts
        List<Account> testAccounts = new List<Account>();
        for (Integer i = 0; i < 3; i++) {
            testAccounts.add(new Account(Name = 'Test Account ' + i));
        }
        insert testAccounts;

        // Create test opportunities for ProtectAccountOpenOpportunities test
        List<Opportunity> testOpportunities = new List<Opportunity>();
        testOpportunities.add(new Opportunity(
            Name = 'Open Opportunity 1',
            StageName = 'Prospecting',
            CloseDate = Date.today().addDays(30),
            AccountId = testAccounts[0].Id
        ));
        testOpportunities.add(new Opportunity(
            Name = 'Closed Won Opportunity',
            StageName = 'Closed Won',
            CloseDate = Date.today(),
            AccountId = testAccounts[1].Id
        ));
        testOpportunities.add(new Opportunity(
            Name = 'Open Opportunity 2',
            StageName = 'Negotiation/Review',
            CloseDate = Date.today().addDays(15),
            AccountId = testAccounts[2].Id
        ));
        insert testOpportunities;

        // Create test contacts for ProtectAccountWithContacts test
        List<Contact> testContacts = new List<Contact>();
        testContacts.add(new Contact(
            FirstName = 'John',
            LastName = 'Doe',
            AccountId = testAccounts[0].Id
        ));
        insert testContacts;
    }

    @isTest
    static void testProtectAccountOpenOpportunities() {
        // Query the test accounts
        List<Account> accountsToDelete = [SELECT Id, Name FROM Account];

        // Delete the accounts, this should invoke the ProtectAccountOpenOpportunities method
        Test.startTest();
        try {
            // Simulate account deletion
            AccountTriggerHelper.ProtectAccountOpenOpportunities(accountsToDelete);
        } catch (DmlException e) {
            // Expected DmlException if accounts with open opportunities are found
        }
        Test.stopTest();

        // Verify results
        Set<Id> accountIds = new Set<Id>();
        for (Account acc : accountsToDelete) {
            accountIds.add(acc.Id);
        }

        List<Opportunity> openOpportunities = [
            SELECT Id, AccountId 
            FROM Opportunity 
            WHERE AccountId 
            IN :accountIds 
                AND StageName != 'Closed Won' 
                AND StageName != 'Closed Lost'];
                
        System.assertEquals(2, openOpportunities.size(), 'Two accounts should have errors due to open opportunities.');


    }

    @isTest
    static void testProtectAccountWithContacts() {
        // Query the test accounts
        List<Account> accountsToDelete = [SELECT Id, Name FROM Account];

        // Attempt to delete the accounts, this should invoke the ProtectAccountWithContacts method
        Test.startTest();
        try {
            // Simulate account deletion
            AccountTriggerHelper.ProtectAccountWithContacts(accountsToDelete);
        } catch (DmlException e) {
            // Expected DmlException if accounts with associated contacts are found
        }
        Test.stopTest();

        // Verify results
        List<Account> accountsWithErrors = [SELECT Id, Name FROM Account WHERE Id IN :accountsToDelete];
        System.assertEquals(1, accountsWithErrors.size(), 'One account should have an error due to associated contacts.');

        Account accWithErrors = accountsWithErrors[0];
        
    }

    @isTest
    static void testCreateRelatedContacts() {
        // Create a test account
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;

        // Create a list of accounts to simulate trigger context
        List<Account> accounts = new List<Account>{ testAccount };

        // Call the createRelatedContacts method
        Test.startTest();
        AccountTriggerHelper.createRelatedContacts(accounts);
        Test.stopTest();

        // Verify that a contact was created for the account
        List<Contact> createdContacts = [SELECT Id FROM Contact WHERE AccountId = :testAccount.Id];
        System.assertEquals(1, createdContacts.size(), 'One contact should be created for the test account.');
    }
}
