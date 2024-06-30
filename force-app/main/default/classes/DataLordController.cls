public with sharing class DataLordController {
    
    // Properties to store results
    public Integer numAccounts { get; private set; }
    public Integer numHot { get; private set; }
    public Integer numComplex { get; private set; }
    public List<Account> topFiveAccounts { get; private set; }
    public Opportunity lastBigOpportunity { get; private set; }
    public List<Contact> majorPlayers { get; private set; }
    public String mostPopularAccount { get; private set; }
    public List<DataLordHelper.LeadSourceResult> leadSourceResults { get; private set; }
    public List<DataLordHelper.TomRecord> tomRecords { get; set; }
    public List<Account> aoAccounts { get; private set; }
    public List<DataLordHelper.PhoneRecord> recordsWithPhoneNumber1000 { get; set; }
    public Boolean contactsSpawned { get; set; }
    public Boolean homesCreated { get; set; }
    public Boolean contactsRelocated { get; set; }
    public Boolean homesAssigned { get; set; }

    // Constructor to initialize properties
    public DataLordController() {
        numAccounts = DataLordHelper.NumAccounts();
        numHot = DataLordHelper.NumHot();
        numComplex = DataLordHelper.NumComplex();
        topFiveAccounts = DataLordHelper.BigFive();
        lastBigOpportunity = DataLordHelper.LastBigOpportunity();
        majorPlayers = DataLordHelper.MajorPlayers();
        mostPopularAccount = DataLordHelper.MostPopularAccount();
        leadSourceResults = DataLordHelper.getTopLeadSources();
        tomRecords = DataLordHelper.getToms();
        aoAccounts = DataLordHelper.getAOAccounts();
        recordsWithPhoneNumber1000 = DataLordHelper.findRecordsWithPhoneNumber1000();
    }

    // Methods to call helper functions to run on demand.
    public void spawnContacts() {
        DataLordHelper.spawnContacts();
        contactsSpawned = true;
    }

    public void createHomes() {
        DataLordHelper.createHomes();
        homesCreated = true;
    }

    public void relocate() {
        DataLordHelper.relocate();
        contactsRelocated = true;
    }

    public void assignHomes() {
        DataLordHelper.assignHomes();
        homesAssigned = true;
    }
    
}
