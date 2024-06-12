public class DataLord {

    //Challenge I
    //Write a class called DataLord that has 1 method called NumAccounts. 
    //This method should return the number of Accounts that exist in org
    public static Integer NumAccounts() {
        Integer numAccounts = [SELECT COUNT() FROM Account];
        return numAccounts;
    }

    //Challenge II
    //Write a method called NumHot. This method should return the number of Accounts with a Rating of Hot
    public static Integer NumHot() {
        Integer numHotAccounts = [SELECT COUNT() FROM Account WHERE Rating = 'Hot'];
        return numHotAccounts;
    }

    //Challenge III
    //Write a method called NumComplex. This method should return the number of Accounts that have an ampersand (&) in the Name
    public static Integer NumComplex() {
        Integer numComplexAccounts = [SELECT COUNT() FROM Account WHERE Name LIKE '%&%'];
        return numComplexAccounts;
    }

    //Challenge IV
    //Write a method called BigFive. This method should return the top 5 Accounts in terms of Annual Revenue. 
    //You may only use 1 line of code for the method body
    public static List<Account> BigFive() {
        return [SELECT Name, AnnualRevenue FROM Account ORDER BY AnnualRevenue DESC LIMIT 5];
    }

    //Challenge V
    //Write a method called LastBigOpportunity. This method should return the Opportunity with the most recent Close Date 
    //that had an Amount over $100,000.
    public static Opportunity LastBigOpportunity() {
        return [SELECT Id, Name, CloseDate, Amount FROM Opportunity WHERE Amount > 100000 ORDER BY CloseDate DESC LIMIT 1];
    }

    //Challenge VI
    //Write a method called MajorPlayers. This method should return all Contacts that are associated to an Account with a Rating of Hot.
    public static List<Contact> MajorPlayers() {
        List<Account> hotAccounts = [SELECT Id FROM Account WHERE Rating = 'Hot'];
        Set<Id> accountIds = new Set<Id>();
        for (Account acc : hotAccounts) {
            accountIds.add(acc.Id);
        }
        return [SELECT Id, FirstName, LastName, Email, AccountId FROM Contact WHERE AccountId IN :accountIds];
    }

    //Challenge VII
    //Write a method called MostPopularAccount. This method should return the Account Name that has the most associated Contacts.
    public static String MostPopularAccount() {
        List<AggregateResult> results = [SELECT AccountId, COUNT(Id) contactCount FROM Contact GROUP BY AccountId ORDER BY COUNT(Id) DESC LIMIT 1];
        if (!results.isEmpty()) {
            Id mostPopularAccountId = (Id)results[0].get('AccountId');
            Account mostPopularAccount = [SELECT Name FROM Account WHERE Id = :mostPopularAccountId];
            return mostPopularAccount.Name;
        }
        return null;
    }
}