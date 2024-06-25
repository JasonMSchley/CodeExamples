import { LightningElement, track } from 'lwc';
import getAccounts from '@salesforce/apex/AccountListController.getAccounts';

export default class AccountListWithApex extends LightningElement {
    @track searchKey = '';
    @track accounts;
    @track error;

    handleSearchKeyChange(event) {
        this.searchKey = event.target.value.trim();
    }

    handleSearch() {
        getAccounts({ searchKey: this.searchKey })
            .then(result => {
                this.accounts = result;
                this.error = undefined;
            })
            .catch(error => {
                this.error = error;
                this.accounts = undefined;
            });
    }
}
