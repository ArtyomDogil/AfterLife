({
    doInit: function(component, event, helper) {
        helper.preloadContacts(component);
    },

    showModal : function(component, event, helper) {
        helper.showModalHelper(component, event, helper);
    }
})