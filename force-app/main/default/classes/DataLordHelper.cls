public with sharing class DataLordHelper {

    //SOQL Challenges
    //Challenge I
    //Write a class called DataLord that has 1 method called NumAccounts. 
    //This method should return the number of Accounts that exist in org
    public static Integer NumAccounts() {
        return  [SELECT COUNT() FROM Account];
    }

    //Challenge II
    //Write a method called NumHot. This method should return the number of Accounts with a Rating of Hot
    public static Integer NumHot() {
        return [SELECT COUNT() FROM Account WHERE Rating = 'Hot'];
    }

    //Challenge III
    //Write a method called NumComplex. This method should return the number of Accounts that have an ampersand (&) in the Name
    public static Integer NumComplex() {
        return [SELECT COUNT() FROM Account WHERE Name LIKE '%&%'];
     }

    //Challenge IV
    //Write a method called BigFive. This method should return the top 5 Accounts in terms of Annual Revenue. 
    //You may only use 1 line of code for the method body
    public static List<Account> BigFive() {
        return [SELECT Name, AnnualRevenue FROM Account WHERE AnnualRevenue > 0 ORDER BY AnnualRevenue DESC LIMIT 5];
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
        return [SELECT Id, FirstName, LastName, Email, AccountId 
                FROM Contact 
                WHERE AccountId IN (SELECT Id FROM Account WHERE Rating = 'Hot')];
    }
    

    //Challenge VII
    //Write a method called MostPopularAccount. This method should return the Account Name that has the most associated Contacts.
    public static String MostPopularAccount() {
        return (String)[
            SELECT Account.Name 
            FROM Contact 
            GROUP BY Account.Name 
            ORDER BY COUNT(Id) 
            DESC LIMIT 1]
            [0].get('Name');
    }

        // Elite Challenge I
    // Universal Containers is interested in knowing the top 5 Lead Sources that are most likely to close and how likely those Sources are to close. 
    // They also wish to ignore the case where the Lead Source is blank. Write a single SOQL query to retrieve this information.
    public class LeadSourceResult {
        public String leadSource { get; set; }
        public Integer closedCount { get; set; }
        public Double closeProbability { get; set; }

        public LeadSourceResult(String leadSource, Integer closedCount, Double closeProbability) {
            this.leadSource = leadSource;
            this.closedCount = closedCount;
            this.closeProbability = closeProbability;
        }
    }

    public static List<LeadSourceResult> getTopLeadSources()  {
        // Perform the SOQL query to get the top 5 lead sources with the most closed leads
        List<AggregateResult> results = [
            SELECT LeadSource, COUNT(Id) closedCount
            FROM Lead
            WHERE IsConverted = TRUE AND LeadSource != NULL
            GROUP BY LeadSource
            ORDER BY COUNT(Id) DESC
            LIMIT 5
        ];

        // List to hold the results
        List<LeadSourceResult> leadSourceResults = new List<LeadSourceResult>();

        // Calculate the total number of closed leads for all lead sources
        Integer totalClosedLeads = 0;
        for (AggregateResult result : results) {
            totalClosedLeads += (Integer)result.get('closedCount');
        }

        // Process the query results and calculate the close probability for each lead source
        for (AggregateResult result : results) {
            String leadSource = (String)result.get('LeadSource');
            Integer closedCount = (Integer)result.get('closedCount');
            Double closeProbability = totalClosedLeads > 0 ? ((Double)closedCount / totalClosedLeads * 100) : 0;

            leadSourceResults.add(new LeadSourceResult(leadSource, closedCount, closeProbability));
        }

        return leadSourceResults;
    }

    //SOSL Challenges
    //Challenge I
    //Write a method to retrieve all Contacts and Leads that are named Tom.
    public class TomRecord {
        public String recordType { get; set; }
        public String firstName { get; set; }
        public String lastName { get; set; }

        public TomRecord(String recordType, Contact contact) {
            this.recordType = recordType;
            this.firstName = contact.FirstName;
            this.lastName = contact.LastName;
        }

        public TomRecord(String recordType, Lead lead) {
            this.recordType = recordType;
            this.firstName = lead.FirstName;
            this.lastName = lead.LastName;
        }
    }

    public static List<TomRecord> getToms() {
        List<TomRecord> tomRecords = new List<TomRecord>();

        // SOSL query to find contacts and leads named 'Tom'
        List<List<SObject>> searchResults = [FIND 'Tom' IN NAME FIELDS RETURNING Contact(Id, FirstName, LastName), Lead(Id, FirstName, LastName)];

        // Process results and assign to the tomRecords list
        for (SObject sobj : searchResults[0]) {
            if (sobj instanceof Contact) {
                tomRecords.add(new TomRecord('Contact', (Contact)sobj));
            } else if (sobj instanceof Lead) {
                tomRecords.add(new TomRecord('Lead', (Lead)sobj));
            }
        }

        return tomRecords;
    }   
    
    //Challenge II
    //Write a method to retrieve all Accounts that have an 'a' and an 'o' in one of their fields.
    public static List<Account> getAOAccounts() {
        return [SELECT Id, Name FROM Account WHERE Name LIKE '%a%' AND Name LIKE '%o%'];
    }
    

    //Elite Challenge I
    //Robin knows that there is a phone number that ends in 1000, but has no idea which field it is in. 
    //They know it is either on an Account, Contact, or Lead and just need the Name. Write a method that solves Robin's issue.
    public class PhoneRecord {
        public String recordType { get; set; }
        public String name { get; set; }
        public String phoneNumber { get; set; }

        public PhoneRecord(String recordType, Account account) {
            this.recordType = recordType;
            this.name = account.Name;
            this.phoneNumber = account.Phone;
        }

        public PhoneRecord(String recordType, Contact contact) {
            this.recordType = recordType;
            this.name = contact.Name;
            this.phoneNumber = contact.Phone;
        }

        public PhoneRecord(String recordType, Lead lead) {
            this.recordType = recordType;
            this.name = lead.Name;
            this.phoneNumber = lead.Phone;
        }
    }

    public static List<PhoneRecord> findRecordsWithPhoneNumber1000() {
        List<PhoneRecord> phoneRecords = new List<PhoneRecord>();

        // SOSL query to find records with phone numbers ending in '1000'
        List<List<SObject>> searchResults = [FIND '1000' IN PHONE FIELDS RETURNING Account(Id, Name, Phone), Contact(Id, Name, Phone), Lead(Id, Name, Phone)];

        // Process results and assign to the phoneRecords list
        for (List<SObject> resultList : searchResults) {
            for (SObject sobj : resultList) {
                if (sobj instanceof Account) {
                    phoneRecords.add(new PhoneRecord('Account', (Account)sobj));
                } else if (sobj instanceof Contact) {
                    phoneRecords.add(new PhoneRecord('Contact', (Contact)sobj));
                } else if (sobj instanceof Lead) {
                    phoneRecords.add(new PhoneRecord('Lead', (Lead)sobj));
                }
            }
        }

        return phoneRecords;
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
            contact.AccountId = allAccounts[Math.mod(Math.abs(Crypto.getRandomInteger()), allAccounts.size())].Id;
        }
        
        // Update the Contacts to save the changes
        update allContacts;
    }
}