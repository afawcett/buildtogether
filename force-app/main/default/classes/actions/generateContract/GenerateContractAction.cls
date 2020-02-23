public with sharing class GenerateContractAction {

    @InvocableMethod(label = 'Generate Contract')
    public static List<GenerateContractActionResponse> generate(List<GenerateContractActionRequest> requests) {        
        return toGenerateContractActionResponse(ContractService.generate(toContactInfo(requests)));
    }

    private static List<ContractService.ContractInfo> toContactInfo(List<GenerateContractActionRequest> requests) {
        if(requests==null) { return null; }
        List<ContractService.ContractInfo> contractInfos = new List<ContractService.ContractInfo>();
        for(GenerateContractActionRequest request : requests) {
            ContractService.ContractInfo contractInfo = new ContractService.ContractInfo();
            contractInfo.Account = request.Account;
            contractInfo.InquiryMode = request.InquiryMode;
            contractInfo.Products = toProductInfo(request.Products);
            contractInfo.StartDate = request.StartDate;
            contractInfo.Term = request.Term;
            contractInfos.add(contractInfo);
        }
        return contractInfos;
    }

    public static List<ContractService.ContractInfoProduct> toProductInfo(List<GenerateContractActionRequestProduct> requestProducts) {
        if(requestProducts==null) { return null; }
        List<ContractService.ContractInfoProduct> contractInfoProducts = new List<ContractService.ContractInfoProduct>();
        /**
        for(GenerateContractActionRequestProduct requestProduct : requestProducts) {
            ContractService.ContractInfoProduct contractInfoProduct = new ContractService.ContractInfoProduct();
            contractInfoProduct.ProductId = requestProduct.ProductId;
            contractInfoProduct.Quantity = requestProduct.Quantity;
            contractInfoProducts.add(contractInfoProduct);
        }
         */
        return contractInfoProducts;
    }

    public static List<GenerateContractActionResponse> toGenerateContractActionResponse(List<ContractService.ContractRef> contractRefs) {
        if(contractRefs ==null) { return null; }
        List<GenerateContractActionResponse> contractActionResponses = new List<GenerateContractActionResponse>();
        for(ContractService.ContractRef contractRef : contractRefs) {
            GenerateContractActionResponse response = new GenerateContractActionResponse();
            response.Amount = contractRef.Amount;
            response.ContractId = contractRef.ContractId;
            contractActionResponses.add(response);
        }
        return contractActionResponses;
    }
}
