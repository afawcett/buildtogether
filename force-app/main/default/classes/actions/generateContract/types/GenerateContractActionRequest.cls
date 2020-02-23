public class GenerateContractActionRequest {
    @InvocableVariable @AuraEnabled
    public Boolean InquiryMode;
    @InvocableVariable @AuraEnabled
    public Id Account;
    @InvocableVariable @AuraEnabled   
    public Date StartDate;
    @InvocableVariable @AuraEnabled   
    public List<GenerateContractActionRequestProduct> Products;
    @InvocableVariable @AuraEnabled   
    public Integer Term;
}
