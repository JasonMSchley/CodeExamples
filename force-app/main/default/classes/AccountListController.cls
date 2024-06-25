public with sharing class AccountListController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(String searchKey) {
        String searchTerm = '%' + searchKey + '%';
        return [SELECT Id, Name, Phone FROM Account WHERE Name LIKE :searchTerm LIMIT 10];
    }
}
