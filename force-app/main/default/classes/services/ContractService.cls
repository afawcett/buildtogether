public with sharing class ContractService {

    public static List<ContractRef> generate(List<ContractInfo> contractInfos) {
        // Mock response
        List<ContractRef> contractRefs = new List<ContractRef>();
        for(ContractInfo contractInfo : contractInfos) {
            ContractRef contractRef = new ContractRef();
            contractRef.Account = contractInfo.Account;
            contractRef.Amount = contractInfo.Term !=null ? contractInfo.Term * 42 : 42;
            contractRefs.add(contractRef);
        }
        return contractRefs;
    }

    public class ContractInfo {
        public Boolean InquiryMode;
        public Id Account;
        public Date StartDate;
        public List<ContractInfoProduct> Products;
        public Integer Term;
    }

    public class ContractInfoProduct {
        public Id ProductId;
        public Integer Quantity;
    }

    public class ContractRef {
        public Id Account;
        public Decimal Amount;   
        public Id ContractId;
    }

}
