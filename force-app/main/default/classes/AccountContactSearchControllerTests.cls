@isTest
public class AccountContactSearchControllerTests {
    

    //Test Setup, create 20 accounts with 3 contacts each //////////////////////////// 
    @testSetup
    static void setup() {
        // Create test data
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 20; i++) {
            Account acc = new Account(Name = 'Test Account ' + i);
            accounts.add(acc);
        }
        insert accounts;
        
        List<Contact> contacts = new List<Contact>();
        for (Account acc : accounts) {
            for (Integer j = 0; j < 2; j++) {
                Contact con = new Contact(FirstName = 'Contact ' + j, LastName = 'Test', AccountId = acc.Id);
                contacts.add(con);
            }
        }
        insert contacts;
    }
    
    //Start testing//////////////////////////////////////////////////
    //Test Setups//////////
    @isTest
    static void testInitialization() {
        AccountContactSearchController controller = new AccountContactSearchController();
        System.assertEquals(10, controller.pageSize);
        System.assertEquals('', controller.searchKey);
        System.assertNotEquals(null, controller.accounts);
        System.assertEquals(10, controller.accounts.size());
    }

    @isTest
    static void testInitMethod() {
        AccountContactSearchController controller = new AccountContactSearchController();
        String mockSearchKey = 'Test'; 
        Test.setCurrentPageReference(new PageReference('/apex/YourPageName'));
        ApexPages.currentPage().getParameters().put('searchKey', mockSearchKey);
        controller.init();
        System.assertEquals(mockSearchKey, controller.searchKey);
        System.assertNotEquals(null, controller.getAccounts());
        System.assert(controller.getAccounts().size() > 0);
    }

    @isTest
    static void testRedirectMethod() {
        AccountContactSearchController controller = new AccountContactSearchController();
        String mockSearchKey = 'Test'; 
        controller.searchKey = mockSearchKey;
        PageReference pageRef = controller.redirectToAccountContactSearch();
        System.assertNotEquals(null, pageRef);
        System.assertEquals('AccountContactSearch', pageRef.getUrl());
        System.assertEquals(mockSearchKey, pageRef.getParameters().get('filter'));
    }
    
    //Test Loading accounts
    @isTest
    static void testLoadAccounts() {
        AccountContactSearchController controller = new AccountContactSearchController();
        System.assertNotEquals(null, controller.accounts);
        System.assertEquals(10, controller.accounts.size());
    }
    
    @isTest
    static void testSearchAccounts() {
        AccountContactSearchController controller = new AccountContactSearchController();
        controller.searchKey = 'Test Account 1';
        controller.loadAccounts();
        System.assertNotEquals(null, controller.accounts);
        System.assert(controller.accounts.size() > 0);
        for (Account acc : controller.accounts) {
            System.assert(acc.Name.contains('Test Account 1'));
        }
    }

    @isTest
    static void testGetAccountsMethod() {
        AccountContactSearchController controller = new AccountContactSearchController();
        List<Account> accounts = controller.getAccounts();
        System.assertNotEquals(null, accounts);
    }
    
    //Tests Pagination
    @isTest
    static void testPagination() {
        AccountContactSearchController controller = new AccountContactSearchController();
        System.assertEquals(1, controller.setCon.getPageNumber());
        controller.next();
        System.assertEquals(2, controller.setCon.getPageNumber());
        System.assertNotEquals(null, controller.accounts);
        controller.previous();
        System.assertEquals(1, controller.setCon.getPageNumber());
        System.assertNotEquals(null, controller.accounts);
    }
    
    //Tests Saving
    @isTest
    static void testSaveRecords() {
        AccountContactSearchController controller = new AccountContactSearchController();
        Account acc = controller.accounts[0];
        acc.Name = 'Updated Account Name';
        controller.save();
        Account updatedAcc = [SELECT Name FROM Account WHERE Id = :acc.Id];
        System.assertEquals('Updated Account Name', updatedAcc.Name);
        System.assertEquals(true, ApexPages.hasMessages(ApexPages.Severity.CONFIRM));
    }

}
