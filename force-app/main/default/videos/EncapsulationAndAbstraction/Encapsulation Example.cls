public class TomRecord {
    public String recordType { get; set; }
    public String firstName { get; set; }
    public String lastName { get; set; }

    public TomRecord(String recordType, Contact contact) {
        this.recordType = recordType;
        this.firstName = contact.FirstName;
        this.lastName = contact.LastName;
    }

    public TomRecord(String recordType, Lead lead) {
        this.recordType = recordType;
        this.firstName = lead.FirstName;
        this.lastName = lead.LastName;
    }
}

public static List<TomRecord> getToms() {
    List<TomRecord> tomRecords = new List<TomRecord>();

    // SOSL query to find contacts and leads named 'Tom'
    List<List<SObject>> searchResults = [FIND 'Tom' IN NAME FIELDS RETURNING Contact(Id, FirstName, LastName), Lead(Id, FirstName, LastName)];

    // Process results and assign to the tomRecords list
    for (SObject sobj : searchResults[0]) {
        if (sobj instanceof Contact) {
            tomRecords.add(new TomRecord('Contact', (Contact)sobj));
        } else if (sobj instanceof Lead) {
            tomRecords.add(new TomRecord('Lead', (Lead)sobj));
        }
    }

    return tomRecords;
}   