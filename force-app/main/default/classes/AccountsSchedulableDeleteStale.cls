global class AccountsSchedulableDeleteStale implements Schedulable {

    global void execute(SchedulableContext sc) {
        // Schedule the batch class
        AccountBatchDeleteStale batch = new AccountBatchDeleteStale();
        Database.executeBatch(batch);
    }

    // Schedule your schedulable apex to run at 12 am at the first of every month. 
    public static void scheduleMonthly() {
                               //S M H D M W Y
        String cronExpression = '0 0 0 1 * ? *'; 
        AccountsSchedulableDeleteStale sched = new AccountsSchedulableDeleteStale();
        System.schedule('Monthly Delete Stale Accounts', cronExpression, sched);
    }
}