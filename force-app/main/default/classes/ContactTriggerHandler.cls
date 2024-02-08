public with sharing class ContactTriggerHandler {
    public static Integer afterInsertMethod(List<Contact> newRecords){

        Set<Id> accountIds = new Set<Id>();
        for(Contact con : newRecords){
            if(String.isNotBlank(con.accountId)){
                accountIds.add(con.accountId);
            }
        }

        List<AggregateResult> results = [SELECT accountId,count(id) totalContacts
                                        FROM Contact
                                        WHERE active__c = TRUE
                                        AND accountId IN :accountIds
                                        GROUP BY accountId];
        
        List<Account> listAccounts = new List<Account>();
        for(AggregateResult con : results){
            String accId = String.valueOf(con.get('AccountId'));
            Integer totalContacts = Integer.valueOf(con.get('totalContacts'));
            listAccounts.add(new Account(id=accId,Active_contacts__c=totalContacts));
        }
        update listAccounts;
        return listAccounts.size();
    }
}