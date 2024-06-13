public class ContactTriggerHelper {

    //************************************************BEFORE_INSERT Triggers********************** */
    //Trigger Challenge II
    //Create a trigger to set a default value for Email on Contacts that are inserted without one.
    public static void setDefaultEmail(List<Contact> contacts) {

    // Define the default email address
        String DEFAULT_EMAIL = 'default@example.com';

        for (Contact con : contacts) {
            if (String.isBlank(con.Email)) {
                con.Email = DEFAULT_EMAIL;
            }
        }
    }



    //************************************************AFTER_UPDATE Triggers********************** */
    public static void updateAccountPhone(List<Contact> updatedContacts, Map<Id, Contact> oldContacts) {
        Map<Id, Account> accountsToUpdate = new Map<Id, Account>();

        for (Contact con : updatedContacts) {
            // Check if the Contact has a related Account and if the phone number has changed
            if (con.AccountId != null && con.Phone != oldContacts.get(con.Id).Phone) {
                // Add the Account to the map with the updated phone value
                accountsToUpdate.put(con.AccountId, new Account(
                    Id = con.AccountId,
                    Phone = con.Phone
                ));
            }
        }
        
        // Update all Accounts with the new phone values
        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate.values();
        }
    }
}