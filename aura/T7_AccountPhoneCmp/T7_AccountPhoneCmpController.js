({
    doInit: function(component, event, helper) {
        helper.handleSearch(component);
    },

    handleClick : function (component, event, helper) {
        helper.saveExpense(component);
        helper.showToast(component);
    }
});