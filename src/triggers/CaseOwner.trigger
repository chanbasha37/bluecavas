trigger CaseOwner on Case (after update) {

  Set<Id> AccountIds = new Set<Id>();    
  for (Case cs: Trigger.new) {
     if (cs.AccountId != null) {
        AccountIds.add(cs.AccountId);
     }
  }

  Map<Id, Account> accountEntries = new Map<Id, Account>(
    [select Id,Name, Sales_responsible__c from Account where id in :AccountIds]
  );

  for (Case cs: Trigger.new) {   

 if (accountEntries.containsKey(cs.AccountId) && 
     accountEntries.get(cs.AccountId).Sales_responsible__c != null) {
     String salesRep= accountEntries.get(cs.AccountId).Sales_responsible__c; 
     System.Debug('Sales responsible is ' + salesRep);

    cs.OwnerId= salesRep;
 }
}


}