public with sharing class T10_CreateContactOnSecondOrgHandler extends TriggerHandler{

    private List<Contact> newContactList;

    public T10_CreateContactOnSecondOrgHandler() {
        this.newContactList = (List<Contact>) Trigger.new;
    }

    public override void afterInsert() {

    }
}