public with sharing class T8_ContactTable {

    @AuraEnabled
    public static List<Contact> getContacts() {
        List<Contact> contactList = [
            SELECT Id, Name
            FROM Contact
            ORDER BY Name
            LIMIT 50000
        ];
        return contactList;
    }

}
