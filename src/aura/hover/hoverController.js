({
    getInput : function(cmp, evt) {
        var myName = cmp.find("name").get("v.value");
        var myText = cmp.find("outName");
        var greet = "Hi, " + myName;
        myText.set("v.value", greet);
    },
    
     
    showForm :  function(component,event,helper){
         document.getElementById('loginForm').style.display = "block";
   },

    hideForm : function (component,event,helper){
        
    document.getElementById('loginForm').style.display = "none";
} 

})