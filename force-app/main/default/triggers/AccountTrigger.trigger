trigger AccountTrigger on Account (before delete) {
    switch on Trigger.operationType {
		when BEFORE_DELETE {
            AccountTriggerHelper.CheckAccountOpenOpportunities(Trigger.old);
        }
    }
}