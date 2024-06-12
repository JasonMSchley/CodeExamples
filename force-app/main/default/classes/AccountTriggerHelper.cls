public class AccountTriggerHelper {

    //Write an Apex trigger that stops the deletion of an account record if it 
    //has any related opportunity records that are still open.
    public static void CheckAccountOpenOpportunities(List<Account> accounts) {

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
                AND StageName != 'Closed Lost'
        ];

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
}