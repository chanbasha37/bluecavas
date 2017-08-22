trigger ContactTriggerDuplicateCheck1 on Case(before insert) {

    //sets to store values to check for duplicates
    set<String> firstNameSet = new set<String>();
    set<String> lastNameSet = new set<String>();
    
    //Add the values to the set
    for(Case conForVar : Trigger.new){
        
        if(conForVar.Account.Name!= null && conForVar.integrationTo__c!= ''){
            firstNameSet.add(conForVar.Account.Name);
        }
        
        if(conForVar.integrationTo__c != null && conForVar.integrationTo__c != ''){
            lastNameSet.add(conForVar.integrationTo__c );
        }
    
    }
    
    //Construct the query dynamically
    String queryString = 'select Case.Account.Name, integrationTo__c from Case where integrationTo__c IN : lastNameSet' ;
    
    if(firstNameSet.size() > 0){
        queryString = queryString + ' AND Account.Name IN : firstNameSet ';
    }
    
    //List to store records that matches the criteria
    List<Case> existingContactList = new List<Case>();
    
    //Get the existing records that matches the criteria
    existingContactList = database.query(queryString );

    //Check whether any duplicated are there
    //If present show error
    if(existingContactList.size() > 0){
        for(Case newContact : Trigger.new){
            for(Case exisitingContact : existingContactList ){
                if((newContact.Account.Name== exisitingContact.Account.Name)&&(newContact.integrationTo__c== exisitingContact.integrationTo__c)){
                    newContact.addError('Duplicate contact');
                }
            
            }
        }
    }

}