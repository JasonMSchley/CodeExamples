public class AccountTriggerHelper {


    //************************************************before delete triggers********************** */
    //Trigger challenge Extra
    //Write an Apex trigger that stops the deletion of an account record if it 
    //has any related opportunity records that are still open.
    public static void ProtectAccountOpenOpportunities(List<Account> accounts) {

        // Create a unqiue Set to hold account ids being deleted
        Set<Id> accountIds = new Set<Id>();
        for (Account acc : accounts) {
            accountIds.add(acc.Id);
        }

        // Find Accounts with Open Opportunities
        List<Opportunity> openOpportunities = [
            SELECT Id, AccountId 
            FROM Opportunity 
            WHERE AccountId 
            IN :accountIds 
                AND StageName != 'Closed Won' 
                AND StageName != 'Closed Lost'];

        // Create a Set of accounts that have open opportunities
        Set<Id> accountsWithOpenOpportunities = new Set<Id>();
        for (Opportunity opp : openOpportunities) {
            accountsWithOpenOpportunities.add(opp.AccountId);
        }

        // Add an error if Account has open opportunities
        for (Account acc : accounts) {
            if (accountsWithOpenOpportunities.contains(acc.Id)) {
                acc.addError('Cannot delete account with open opportunities.');
            }
        }
    }

    
    //Trigger Challenge I
    //Create a trigger to prevent the deletion of Accounts with Contacts
    public static void ProtectAccountWithContacts(List<Account> accounts) {

        // Create a unqiue Set to hold account ids being deleted
        Set<Id> accountIds = new Set<Id>();
        for (Account acc : accounts) {
            accountIds.add(acc.Id);
        }
        
        // Query for Contacts associated with the Accounts being deleted
        List<Contact> activeContacts = [SELECT Id FROM Contact WHERE AccountId IN :accountIds];
        

        // Create a Set of accounts that have contacts
        Set<Id> accountsWithContacts = new Set<Id>();
        for (Contact opp : activeContacts) {
            accountsWithContacts.add(opp.AccountId);
            }

        
        // Loop through the Accounts being deleted
        for (Account acc : accounts) {
            if (accountsWithContacts.contains(acc.Id)) {
                acc.addError('You cannot delete an Account that has associated Contacts.');
            }
        }
    }

    //************************************************after insert triggers********************** */
    //Trigger Challenge III
    //Create a trigger to create a new related Contact when an Account is inserted.
    public static void createRelatedContacts(List<Account> accounts)  {

        List<Contact> contactsToInsert = new List<Contact>();

        for (Account acc : accounts) {
            // Create a new Contact related to the Account
            Contact newContact = new Contact(
                FirstName = 'DefaultFirstName',
                LastName = acc.Name,
                AccountId = acc.Id
            );
            contactsToInsert.add(newContact);
        }

        // Insert all new Contacts
        if (!contactsToInsert.isEmpty()) {
            insert contactsToInsert;
        }
    }
}