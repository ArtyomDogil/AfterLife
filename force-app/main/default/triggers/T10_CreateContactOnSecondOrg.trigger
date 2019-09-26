trigger T10_CreateContactOnSecondOrg on Contact (after insert) {
    new T10_CreateContactOnSecondOrgHandler().run();
}