trigger ContactTrigger on Contact (before insert, after update) {
    switch on Trigger.operationType {
		when BEFORE_INSERT {
            ContactTriggerHelper.setDefaultEmail(Trigger.new);
        }
        when AFTER_UPDATE {
            ContactTriggerHelper.updateAccountPhone(Trigger.new, Trigger.oldMap);
        }
    }
}           