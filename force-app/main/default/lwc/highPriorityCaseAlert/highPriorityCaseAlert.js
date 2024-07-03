import { LightningElement, wire } from 'lwc';
import { subscribe, unsubscribe, onError } from 'lightning/empApi';

export default class HighPriorityCaseAlert extends LightningElement {
    subscription = null;
    caseNumber = '';

    connectedCallback() {
        this.subscribeToEvent();
    }

    subscribeToEvent() {
        // Define the channel and event handler
        const channelName = '/event/High_Priority_Case_Event__e';
        const messageCallback = (response) => {
            this.handleMessage(response);
        };

        // Subscribe to the channel
        subscribe(channelName, -1, messageCallback).then((response) => {
            this.subscription = response;
        }).catch(error => {
            console.error('Error subscribing to channel:', JSON.stringify(error));
        });
    }

    handleMessage(response) {
        this.caseNumber = response.data.payload.CaseNumber__c;
    }

    disconnectedCallback() {
        // Unsubscribe from the channel when component is disconnected
        if (this.subscription) {
            unsubscribe(this.subscription, (response) => {
                console.log('Unsubscribed successfully:', response);
            });
            this.subscription = null;
        }
    }
}
