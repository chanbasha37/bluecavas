trigger AvoidDuplicateInsertions on Case(before insert,before update){
  
  
       Set<string > duplicatecaseIds = new Set<string >();
       
       List<Case> duplicatecaseList = [Select id,case.Account.Name,IntegrationTo__c,SFType__c From Case where SFType__c=TRUE];

       System.debug('All sftype cases' +duplicatecaseList );
       

       for(Case dup: duplicatecaseList ){
        
          duplicatecaseIds .add(dup.Account.Name);
          duplicatecaseIds .add(dup.IntegrationTo__c);
          system.debug('AccountName:::::'+dup.Account.Name);
          system.debug('IntegrationTo::::'+dup.IntegrationTo__c);
                    
       }

       for(Case s : Trigger.new){
        
            if(s.Account.Name!=null && s.IntegrationTo__c!=null){
                            
                
               if(duplicatecaseIds.contains(s.Account.Name) && duplicatecaseIds.contains(s.IntegrationTo__c)){
                              
                    if(s.SFType__c){
                    
                      s.addError('Record already exist with same Service');
                 }
               
               }
             }
           }
}