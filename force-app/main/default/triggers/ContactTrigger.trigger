trigger ContactTrigger on Contact (after insert,after update,after delete,after undelete) {

    switch on Trigger.operationType {
        when  AFTER_INSERT{
            ContactTriggerHandler.afterInsertMethod(Trigger.new);
            
        }
        when  AFTER_UPDATE{

               Set<Id> accountIds = new SET<Id>();
                for(Contact con : Trigger.new){
                    if(String.isNotBlank(con.AccountId) && Trigger.oldMap.get(con.Id).active__c != con.active__c){
                        accountIds.add(con.AccountId);
                    }
                }

                //list Aggregate contact for all account

                List<AggregateResult> results = [SELECT accountId,count(id) totalContacts
                                                FROM Contact
                                                WHERE active__c = TRUE
                                                AND accountId IN :accountIds
                                                GROUP BY accountId];

                List<Account> listAccounts = new List<Account>();
                for(AggregateResult con:results){
                    String accId = String.valueOf(con.get('AccountId'));
                    Integer totalcontacts = Integer.valueOf(con.get('totalContacts'));
                    listAccounts.add(new Account(id=accId,Active_Contacts__c=totalcontacts));
                }
                update listAccounts;

        }
      
       
    }
    

}