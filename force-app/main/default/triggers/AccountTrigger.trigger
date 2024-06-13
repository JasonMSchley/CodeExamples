trigger AccountTrigger on Account (before delete, after insert) {
    switch on Trigger.operationType {
		when BEFORE_DELETE {
            AccountTriggerHelper.ProtectAccountOpenOpportunities(Trigger.old);
            AccountTriggerHelper.ProtectAccountWithContacts(Trigger.old);
        }
        when AFTER_INSERT {
            AccountTriggerHelper.createRelatedContacts(Trigger.new);
        }
    }
}