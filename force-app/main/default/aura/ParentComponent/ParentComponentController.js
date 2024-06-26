// ParentComponentController.js
({
    handleMessage : function(component, event, helper) {
        var message = event.getParam("message");
        var messages = component.get("v.messages");
        messages.push(message);
        component.set("v.messages", messages);
    },
    
    clearChildInput : function(component, event, helper) {
        var childComponent = component.find("child");
        if (childComponent) {
            childComponent.clearInput();
        }
    }
})
