trigger trgr_Account_DuplicateCheck on Account (before Insert, before Update) {
    Map<String, Id> mapAccount = new Map<String, Id>();
    
    Set<String> setAccName = new Set<String>();
    for(Account acc : trigger.new)
        setAccName.add(acc.Name);
        
    for(
        Account acc :
        [
            SELECT Id, Name
            FROM   Account
            WHERE  Name IN :setAccName
        ]
    )
        mapAccount.put(acc.Name, acc.Id);
    
    for(Account acc : trigger.new)
        if(
            mapAccount.containsKey(acc.Name) &&
            mapAccount.get(acc.Name) != acc.Id
        )
            acc.addError(
                'There is already another Account with the same Name. ' + 
                'Refer: <a href=\'/' + 
                mapAccount.get(acc.Name) + '\'>' + 
                acc.Name + '</a>',
                FALSE
            );
}