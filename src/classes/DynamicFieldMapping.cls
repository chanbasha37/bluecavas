public with sharing class DynamicFieldMapping {
    
    public void getFields(){
    
        String objectName = 'Incident__c';  
        String query = 'SELECT';
        Map<String, Schema.SObjectField> objectFields = Schema.getGlobalDescribe().get(objectName).getDescribe().fields.getMap();
        System.debug(objectFields);
                
        for(String s : objectFields.keySet()) {
           query += ' ' + s + ', ';
        }
                    
        if (query.subString(query.Length()-1,query.Length()) == ','){
            query = query.subString(0,query.Length()-1);
        }
        
        query += 'FROM' + objectName;        
        query += ' WHERE impact__c = \'true\'';//need to be change as per requirement
        /*
           if(objdlt.impact == true || objdlt.incident_state == true || objdlt.short_description == true || objdlt.contact_type == true){
                lst_selected_check.add(objdlt);     
            }**         
            lst.add(objdlt);
            
            */
          
        try {
            
              List<Incident__c> incidents = database.query(query);              
              
              System.debug('All the fields with check box is true :::' +incidents);
                
        }catch (QueryException e){
            
              System.debug('query exception:::'+e.getMessage());
        }
    }
  
}