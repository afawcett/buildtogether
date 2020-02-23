public inherited sharing class NaturalLanguageFormComponentsSelector {

    public List<NaturalLanguageFormComponent__mdt> selectComponentsByFormName(Set<String> formNames) {
        return [select DeveloperName, Sequence__c, Name__c, Type__c, Value__c, Flow__c
              from NaturalLanguageFormComponent__mdt 
              where NaturalLanguageForm__r.DeveloperName in :formNames
              order by Sequence__c];
    }

    public List<NaturalLanguageFormComponent__mdt> selectComponentsByDeveloperName(Set<String> developerNames) {
        return [select DeveloperName, Sequence__c, Name__c, Type__c, Value__c, Flow__c
              from NaturalLanguageFormComponent__mdt 
              where DeveloperName in :developerNames];
    }
}
