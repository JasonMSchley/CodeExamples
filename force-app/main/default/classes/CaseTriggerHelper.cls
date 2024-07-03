public with sharing class CaseTriggerHelper {

    //************************************************after insert triggers********************** */
    //Create a platform event that will trigger when a high priority case is created. 
    //Next, subscribe to the platform event from within a Lightning Web Component. 
    //You should display the following on the component, provided from data of the 
    //platform event: "HIGH Priority Alert: Case Number:CASENUMBERHERE"
    public static void publishHighPriorityCaseEvents(List<Case> newCases) {
        List<High_Priority_Case_Event__e> events = new List<High_Priority_Case_Event__e>();
        for (Case c : newCases) {
            if (c.Priority == 'High') {
                High_Priority_Case_Event__e event = new High_Priority_Case_Event__e(
                    CaseNumber__c = c.CaseNumber
                );
                events.add(event);
            }
        }
        if (!events.isEmpty()) {
            EventBus.publish(events);
        }
    }
}
