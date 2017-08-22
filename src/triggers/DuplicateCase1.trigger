trigger DuplicateCase1 on Lead(before insert,before update)
{
 
         Set<string> lastname= new Set<string>();
        
         for(Lead lead : Trigger.new)
         {
           lastname.add(lead .lastname );
         }

       
       List<Lead> duplicateleadList = [Select id,lastname From Lead where lastname = :lastname];

       Set<string > duplicateLeadIds = new Set<string>();

       for(lead dup: duplicateleadList )
       {
         duplicateLeadIds .add(dup.lastname);
       }

       for(lead s : Trigger.new)
       {
            if(s.lastname!=null)
            {
               if(duplicateLeadIds.contains(s.lastname))
               {
                 s.addError('Record already exist with same Name');
               }
            
            }
       }
}