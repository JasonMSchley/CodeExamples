import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountListController.getAccounts';

export default class AccountListWithWire extends LightningElement {
    searchKey = '';
    accounts;
    error;

    handleSearchKeyChange(event) {
        this.searchKey = event.target.value.trim();
    }

    @wire(getAccounts, { searchKey: '$searchKey' })
    wiredAccounts({ error, data }) {
        if (data) {
            this.accounts = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.accounts = undefined;
        }
    }
}
