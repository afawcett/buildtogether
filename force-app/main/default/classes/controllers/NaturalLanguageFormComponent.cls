public with sharing class NaturalLanguageFormComponent {

    @AuraEnabled
    public Integer sequence;
    @AuraEnabled
    public Boolean label;
    @AuraEnabled    
    public Boolean input;
    @AuraEnabled    
    public Boolean action;
    @AuraEnabled    
    public String type;
    @AuraEnabled    
    public String name;
    @AuraEnabled    
    public String value;

    public NaturalLanguageFormComponent(NaturalLanguageFormComponent__mdt formComponent) {
        sequence = Integer.valueOf(formComponent.Sequence__c);
        value = formComponent.Value__c;
        name = formComponent.Name__c == null ? formComponent.DeveloperName : formComponent.Name__c;
        switch on formComponent.Type__c {
            when 'Label' { label = true; }
            when 'Action' { action = true; }
            when else {
                if(formComponent.Type__c!=null && 
                   formComponent.Type__c.startsWith('Input')) {
                    input = true;
                    type = formComponent.Type__c.replace('Input_', '');
                }
            }
        }
    }
}
