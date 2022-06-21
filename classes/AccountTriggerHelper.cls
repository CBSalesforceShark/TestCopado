/**
 * Class Name	:	AccountTriggerHelper
 * Created Date	:	29May2022
 * Created By	:	Chitresh Bhargava
 * Description	:	AccountTriggerHelper is written for AccountTrigger
**/
public class AccountTriggerHelper {
    
    /**
     * 
     * Description	: When an account insert, automatically account billing address should populate into the account shipping address.
     * 
    **/
    public static void updateAccountShippingAddress(List<Account> newAccountList, Map<Id,Account> mapOldAccountDetails)
    {
        for(Account accData : newAccountList!= null? newAccountList : mapOldAccountDetails.values())
        {
            if((String.isNotBlank(accData.Billingstreet) || String.isNotBlank(accData.Billingcity)
                || String.isNotBlank(accData.Billingstate) || String.isNotBlank(accData.Billingcountry)
                || String.isNotBlank(accData.BillingpostalCode))
               && (mapOldAccountDetails == null || (mapOldAccountDetails != null
                                                    && (mapOldAccountDetails.get(accData.Id).Billingstreet != accData.Billingstreet
                                                        || mapOldAccountDetails.get(accData.Id).Billingcity != accData.Billingcity
                                                        || mapOldAccountDetails.get(accData.Id).Billingstate != accData.Billingstate
                                                        || mapOldAccountDetails.get(accData.Id).Billingcountry != accData.Billingcountry
                                                        || mapOldAccountDetails.get(accData.Id).BillingpostalCode != accData.BillingpostalCode
                                                       )))
              )
            {
                accData.ShippingStreet = accData.Billingstreet;
                accData.ShippingCity = accData.Billingcity;
                accData.ShippingState = accData.Billingstate;
                accData.ShippingCountry = accData.Billingcountry;
                accData.ShippingPostalCode = accData.BillingpostalCode;
            }
        }
    }
}