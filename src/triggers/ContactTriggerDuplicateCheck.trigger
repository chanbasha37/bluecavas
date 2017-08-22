trigger ContactTriggerDuplicateCheck on Contact (before insert) {

    //sets to store values to check for duplicates
    set<String> firstNameSet = new set<String>();
    set<String> lastNameSet = new set<String>();
    
    //Add the values to the set
    for(Contact conForVar : Trigger.new){
        
        if(conForVar.FirstName != null && conForVar.LastName != ''){
            firstNameSet.add(conForVar.FirstName);
        }
        
        if(conForVar.LastName != null && conForVar.LastName != ''){
            lastNameSet.add(conForVar.LastName );
        }
    
    }
    
    //Construct the query dynamically
    String queryString = 'select FirstName , LastName from Contact where LastName IN : lastNameSet' ;
    
    if(firstNameSet.size() > 0){
        queryString = queryString + ' AND FirstName IN : firstNameSet ';
    }
    
    //List to store records that matches the criteria
    List<Contact> existingContactList = new List<Contact>();
    
    //Get the existing records that matches the criteria
    existingContactList = database.query(queryString );

    //Check whether any duplicated are there
    //If present show error
    if(existingContactList.size() > 0){
        for(Contact newContact : Trigger.new){
            for(Contact exisitingContact : existingContactList ){
                if((newContact.FirstName == exisitingContact.FirstName)&&(newContact.LastName == exisitingContact.LastName)){
                    newContact.addError('Duplicate contact');
                }
            
            }
        }
    }

}