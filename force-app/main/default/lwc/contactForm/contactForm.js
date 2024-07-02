import { LightningElement, track, wire } from 'lwc';
import getAccounts from '@salesforce/apex/ContactFormController.getAccounts';
import createContact from '@salesforce/apex/ContactFormController.createContact';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ContactForm extends LightningElement {
    @track firstName = '';
    @track lastName = '';
    @track selectedAccountId = '';
    @track accountOptions = [];

    @wire(getAccounts)
    wiredAccounts({ error, data }) {
        if (data) {
            this.accountOptions = data.map(account => {
                return { label: account.Name, value: account.Id };
            });
        } else if (error) {
            this.showToast('Error', 'Error loading accounts', 'error');
        }
    }

    handleInputChange(event) {
        const field = event.target.dataset.id;
        if (field === 'firstName') {
            this.firstName = event.target.value;
        } else if (field === 'lastName') {
            this.lastName = event.target.value;
        }
    }

    handleAccountChange(event) {
        this.selectedAccountId = event.target.value;
    }

    createContact() {
        createContact({ 
            firstName: this.firstName, 
            lastName: this.lastName, 
            accountId: this.selectedAccountId 
        })
        .then(() => {
            this.showToast('Success', 'Contact created successfully', 'success');
            this.clearForm();
        })
        .catch(error => {
            this.showToast('Error', error.body.message, 'error');
        });
    }

    showToast(title, message, variant) {
        this.dispatchEvent(
            new ShowToastEvent({
                title: title,
                message: message,
                variant: variant
            })
        );
    }

    clearForm() {
        this.firstName = '';
        this.lastName = '';
        this.selectedAccountId = ''; // Reset the selected account ID
        const selectElement = this.template.querySelector('select'); // Get the select element
        if (selectElement) {
            selectElement.value = ''; // Reset the value of the select element
        }
    }
    
}
