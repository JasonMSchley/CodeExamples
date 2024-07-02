//controller for ContactForm LWC
public with sharing class ContactFormController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [SELECT Id, Name FROM Account];
    }

    @AuraEnabled
    public static void createContact(String firstName, String lastName, Id accountId) {
        Contact newContact = new Contact(
            FirstName = firstName,
            LastName = lastName,
            AccountId = accountId
        );
        insert newContact;
    }
}
