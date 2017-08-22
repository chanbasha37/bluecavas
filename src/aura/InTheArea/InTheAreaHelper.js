({
    getLocalList: function(component) {
        var location = component.get("v.location");
        var action = component.get("c.getLocal");
        var searchTerm = component.find("searchTerm").get("v.value");
        if (!searchTerm) {
            searchTerm = component.get("v.defaultSearch");
        }
        location = JSON.parse(location);
        action.setParams({
            "searchTerm": searchTerm,
            "lat": location.coords.latitude,
            "lon": location.coords.longitude
        });
        action.setCallback(this, function(response) {
            this.doLayout(response, component);
        });
        $A.enqueueAction(action);
    },
    doLayout: function(response, component) {
        var data = JSON.parse(response.getReturnValue());
        component.set("v.restaurantList", data.bizArray);
        console.log("The Data: ", data);
    }
})