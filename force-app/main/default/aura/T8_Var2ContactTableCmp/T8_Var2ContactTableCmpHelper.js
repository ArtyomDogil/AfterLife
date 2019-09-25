({
    preloadContacts : function(component) {
        var cols = [
            {
                'label': 'Name',
                'fieldName': 'Name',
                'type': 'text'
            },
            {
                'label': 'Id',
                'fieldName': 'Id',
                'type': 'text'
            }
        ]
        component.set('v.columns', cols);

        var action = component.get("c.getContacts");
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state == "SUCCESS") {
                component.set("v.data", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },

    showModalHelper : function(component, event, helper) {
        $A.createComponent("c:T8_ShowModal", {},
            function(content, status) {
                if (status === "SUCCESS") {
                    component.find('overlayLib').showCustomModal({
                        header: "Contact Detail",
                        body: content,
                        showCloseButton: true,
                        cssClass: "mymodal",
                    })
                }
            }
        );
    }
})