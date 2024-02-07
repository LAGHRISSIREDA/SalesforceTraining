trigger ContactTrigger on Contact (after insert,after update,after delete,after undelete) {

    switch on Trigger.operationType {
        when  AFTER_INSERT{
            List<Account> listAccounts = new List<Account>();
            for(Contact ctn : Trigger.new){
                if(String.isNotBlank(ctn.accountId)){
                    String accountd = ctn.accountId;
                    List<AggregateResult> results = [SELECT AccountId,count(id) totalContacts 
                                                     FROM Contact 
                                                     WHERE active__c = TRUE
                                                     AND AccountId = :accountd 
                                                     GROUP BY AccountId];
                    for(AggregateResult ct :results ){
                        String acctId = String.valueOf(ct.get('AccountId'));
                        Integer totalContact = Integer.valueOf(ct.get('totalcontacts'));
                        listAccounts.add(new Account(id = acctId,Active_Contacts__c=totalContact));
                    }
                    update listAccounts;
                }
                

            }
            
        }
       
    }
    

}