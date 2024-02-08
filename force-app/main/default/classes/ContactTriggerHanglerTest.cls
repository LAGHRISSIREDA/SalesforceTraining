
@istest
public with sharing class ContactTriggerHanglerTest {

    @TestSetup
    static void makeData(){

        List<Account> listAccount = new List<Account>();
        for(Integer i=1;i<=2 ; i++){
            listAccount.add(new Account(Name='Test Account '+i));
        }
        insert listAccount;

        List<Contact> listContacts = new List<Contact>();
        for(Integer i=1 ; i<=2 ;i++){
            listContacts.add(new contact(accountid = listAccount[i].id, LastName = 'Contact'+i,active__c= True));
        }
        insert listContacts;
        
    }


    @isTest
    public static void testAfterInsertMethod(){
        List<Contact> result = [SELECT accountId,Id from contact];
        system.debug('@@@@@@@@@@@ : '+result);
        system.assertEquals(2,ContactTriggerHandler.afterInsertMethod(result));
    }
   
}