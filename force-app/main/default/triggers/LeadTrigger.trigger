trigger LeadTrigger on Lead (Before insert,after insert,Before update) {
 	System.debug('Trigger Size : '+Trigger.size );
 	System.debug('is Trigger : '+Trigger.isExecuting);
    System.debug('Operation type : '+Trigger.operationType);
    
    
    
    switch on Trigger.operationType{
        when BEFORE_INSERT{
            LeadTriggerHandler.beforeTriggerMethod(Trigger.new);
       			 		  }
        when BEFORE_UPDATE{
                             system.debug('Hello From before update');
        				  }
    }
}