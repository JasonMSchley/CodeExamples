public class DataLord {

    //SOQL Challenges
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


    //SOSL Challenges
    //Challenge I
    //Write a method to retrieve all Contacts and Leads that are named Tom.
    public static List<SObject> getToms() {
        List<SObject> toms = new List<SObject>();
    
        // Search for Contacts and Leads named "Tom" using SOSL
        List<List<SObject>> searchResults = [FIND 'Tom' IN NAME FIELDS RETURNING Contact(FirstName, LastName), Lead(FirstName, LastName)];
        
        for (List<SObject> result : searchResults) {
            toms.addAll(result);
        }
        
        return toms;
    }

    //Challenge II
    //Write a method to retrieve all Accounts that have an 'a' and an 'o' in one of their fields.
    public static List<Account> getAOAccounts() {
        List<Account> accounts = new List<Account>();
        
        // Search for Accounts with 'a' and 'o' in one of their fields using SOSL
        List<List<Account>> searchResults = [FIND '(a AND o)' IN ALL FIELDS RETURNING Account];
        
        // Flatten the search results
        for (List<Account> result : searchResults) {
            accounts.addAll(result);
        }
        
        return accounts;
    }

    //Elite Challenge I
    //Robin knows that there is a phone number that ends in 1000, but has no idea which field it is in. 
    //They know it is either on an Account, Contact, or Lead and just need the Name. Write a method that solves Robin's issue.
    public static List<SObject> findRecordsWithPhoneNumber1000() {
        List<SObject> records = new List<SObject>();
        
        // Search for records with a phone number ending in 1000 using SOSL
        List<List<SObject>> searchResults = [FIND '*1000' IN PHONE FIELDS RETURNING Account(Name), Contact(Name), Lead(Name)];
        
        // Flatten the search results
        for (List<SObject> result : searchResults) {
            records.addAll(result);
        }
        
        return records;
    }

    //DML
    //Challenge I
    //Write a method called SpawnContacts that creates and inserts 200 uniquely named Contacts into the database.
    public static void spawnContacts() {
        List<Contact> newContacts = new List<Contact>();
        
        // Generate and insert 200 uniquely named Contacts
        for (Integer i = 1; i <= 200; i++) {
            Contact newContact = new Contact(FirstName = 'Contact ' + i);
            newContacts.add(newContact);
        }
        
        insert newContacts;
    }
    
    //Challenge II
    //Write a method called CreateHomes that creates and inserts 3 uniquely named Accounts into the database.
    public static void createHomes() {
        List<Account> newAccounts = new List<Account>();
        
        // Generate and insert 3 uniquely named Accounts
        for (Integer i = 1; i <= 3; i++) {
            Account newAccount = new Account(Name = 'Home ' + i);
            newAccounts.add(newAccount);
        }
        
        insert newAccounts;
    }

    //Challenge III
    //Write a method called Relocate that deletes the 50 most recent Contacts in the database.    
    public static void relocate() {
        List<Contact> recentContacts = [SELECT Id FROM Contact ORDER BY CreatedDate DESC LIMIT 50];
        
        delete recentContacts;
    }

    //Challenge IV
    //Write a method called AssignHomes that relates the all Contacts created in these challenges to the 3 Accounts randomly.
    public static void assignHomes() {
        // Retrieve all Contacts and Accounts
        List<Contact> allContacts = [SELECT Id FROM Contact WHERE FirstName = 'Contact'];
        List<Account> allAccounts = [SELECT Id FROM Account WHERE Name = 'Home'];
        
        // Assign each Contact to one of the Accounts randomly
        for (Contact contact : allContacts) {
            // Get a random index to select one of the Accounts
            Integer randomIndex = Math.mod(Math.abs(Crypto.getRandomInteger()), allAccounts.size());
            Account selectedAccount = allAccounts[randomIndex];
            
            // Relate the Contact to the selected Account
            contact.AccountId = selectedAccount.Id;
        }
        
        // Update the Contacts to save the changes
        update allContacts;
    }
}