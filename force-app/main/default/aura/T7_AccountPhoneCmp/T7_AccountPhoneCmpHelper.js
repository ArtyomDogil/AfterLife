({
    handleSearch: function(component) {
        var searchAccount = component.get("v.recordId");
        var action = component.get("c.getAccountById");
        action.setParams({
            "inputId": searchAccount
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state == "SUCCESS") {
                component.set("v.account", response.getReturnValue());
                component.set("v.phoneOld", response.getReturnValue().Phone);
            }
        });
        $A.enqueueAction(action);
    },

    saveExpense: function(component) {
        var self = this;
        var phoneNumber = component.get("v.account");
        var phoneNumberOld = component.get("v.phoneOld");
        var action = component.get("c.savePhoneNumber");
        action.setParams({
            "dataToSave" : phoneNumber,
            "dataPhoneOld" : phoneNumberOld
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state == "SUCCESS") {
                var returnValue = response.getReturnValue();
                component.set("v.account.Phone", returnValue.newPhone);
                component.set("v.phoneOld", returnValue.newPhone);
                self.showToast(component, returnValue);
            }
        });
        $A.enqueueAction(action);
    },

    showToast : function(component, returnValue) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            message: returnValue.message,
            type: returnValue.status
        });
        toastEvent.fire();
    }
})