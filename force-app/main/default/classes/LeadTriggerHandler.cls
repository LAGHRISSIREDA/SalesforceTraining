public with sharing class LeadTriggerHandler {
    public LeadTriggerHandler() {

    }

    public static void beforeTriggerMethod(List<Lead> newRecords){

        for(Lead leadRecord : newRecords){
            if(String.isBlank(leadRecord.leadSource)){
                leadRecord.leadSource = 'Other';
            }
            if(String.isBlank(leadRecord.industry)){
                leadRecord.addError('Industry Field cannot be Blank');
            }
        }

    }


}