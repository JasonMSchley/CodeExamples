// ChildComponentController.js
({
    sendMessage: function(component, event, helper) {
        var message = component.get("v.message");
        var sendMessageEvent = component.getEvent("sendMessage");
        sendMessageEvent.setParams({ "message": message });
        sendMessageEvent.fire();
        console.log("Message sent: " + message);
    },

    clearInput: function(component, event, helper) {
        console.log("Clear input called");
        component.set("v.message", "");
    }
})
