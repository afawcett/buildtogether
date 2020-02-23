public with sharing class NaturalLanguageFormController {

    @AuraEnabled(cacheable=true)
    public static List<NaturalLanguageFormComponent> findForm(String formName) {
        List<NaturalLanguageFormComponent> components = new List<NaturalLanguageFormComponent>();
        for(NaturalLanguageFormComponent__mdt component :
            new NaturalLanguageFormComponentsSelector().selectComponentsByFormName(
                new Set<String> { formName})) {
            components.add(new NaturalLanguageFormComponent(component) );
        }
        return components;
    }

    @AuraEnabled
    public static String submitForm(String action, String fieldMapAsJSON) {
        Map<String, Object> fieldMap = (Map<String, Object>) JSON.deserializeUntyped(fieldMapAsJSON);
        NaturalLanguageFormComponent__mdt formAction = 
            new NaturalLanguageFormComponentsSelector().selectComponentsByDeveloperName(
                new Set<String> { action })[0];
        Flow.Interview formFlow = Flow.Interview.createInterview(formAction.Flow__c, fieldMap);
        formFlow.start();
        return (String) formFlow.getVariableValue('Response');
    }
}
