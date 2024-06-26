/*
Challenge: 
Create batchable apex that will delete stale Account records. 
Stale account records are Accounts with no related open opportunities for the last 6 months. 
Create schedulable apex that will execute the batch class above. 
Schedule your schedulable apex to run at 12 am at the first of every month. 
Take a screenshot of your scheduled job from within the setup menu and include it in the repo 
*/

global with sharing class AccountBatchDeleteStale implements Database.Batchable<sObject> {

    global List<sObject> deleteRecords = new List<sObject>();

    global Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator(
            'SELECT Id ' +
            'FROM Account ' +
            'WHERE NOT IN ' +
               '(SELECT AccountId FROM Opportunity WHERE isClosed = false AND LastModifiedDate < LAST_N_MONTHS:6');
    }

    global void execute(Database.BatchableContext BC, List<sObject> records) {
        for (sObject record : records) {
            deleteRecords.add(record);
        }
        
         // perform DML statements in execute       
        try {
           delete deleteRecords;
        } catch (DMLException e) {
            System.debug('Error deleting stale accounts: ' + e.getMessage());
        }
    }

    global void finish(Database.BatchableContext BC) {
        // perform DML statements in execute
        //try {
        //    delete deleteRecords;
        //} catch (DMLException e) {
        //    System.debug('Error deleting stale accounts: ' + e.getMessage());
        //}
    }
}