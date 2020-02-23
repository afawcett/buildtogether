public inherited sharing class NaturalLanguageFormSelector {

    public NaturalLanguageForm__mdt getDefault(String filterByEntityName) {
        List<NaturalLanguageForm__mdt> forms = 
            [select DeveloperName, MasterLabel
                from NaturalLanguageForm__mdt 
                where Object__c = null or Object__c = :filterByEntityName
                order by MasterLabel ASC LIMIT 1];        
        return forms.size() > 0 ? forms[0] : null;
    }

    public List<NaturalLanguageForm__mdt> selectAll(String filterByEntityName) {
        return [select DeveloperName, MasterLabel
                from NaturalLanguageForm__mdt 
                where Object__c = null or Object__c = :filterByEntityName
                order by MasterLabel];
    }
}
