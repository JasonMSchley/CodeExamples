// ChildComponentHelper.js
({
    clearInput : function(component) {
        component.set("v.message", "");
        var inputComponent = component.find("messageInput");
        inputComponent.set("v.value", "");
    }
})
