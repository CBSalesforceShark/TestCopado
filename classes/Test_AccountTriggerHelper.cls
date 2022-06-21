/**
 * Class Name	:	Test_AccountTriggerHelper
 * Created Date	:	30May2022
 * Created By	:	Chitresh Bhargava
 * Description	:	Created to cover test coverage for AccountTriggerHelper Class
 **/
@IsTest
public class Test_AccountTriggerHelper {
    @IsTest
    static void test_UpdateAccountShippingAddress(){
        Account acc = TestDataFactory.createAccountRecord(true);
        List<Account> checkAccountRecord = [Select Id, Name, Billingstreet, Billingcity, Billingstate, Billingcountry, BillingpostalCode,
                                            ShippingStreet, ShippingCity, ShippingState,ShippingCountry, ShippingPostalCode
                                            from Account
                                            Where ID =: acc.Id];
        System.assertEquals(checkAccountRecord[0].Billingstreet, checkAccountRecord[0].ShippingStreet);
        System.assertEquals(checkAccountRecord[0].Billingcity, checkAccountRecord[0].ShippingCity);
        System.assertEquals(checkAccountRecord[0].Billingstate, checkAccountRecord[0].ShippingState);
        System.assertEquals(checkAccountRecord[0].Billingcountry,checkAccountRecord[0].ShippingCountry);
        System.assertEquals(checkAccountRecord[0].BillingpostalCode, checkAccountRecord[0].ShippingPostalCode);
        
        checkAccountRecord[0].Billingstreet = '';
		checkAccountRecord[0].Billingcity = '';
		checkAccountRecord[0].BillingState = 'Test_State_Update';
        update checkAccountRecord[0];
        List<Account> checkAccountRecordUpdateBS = [Select ID, BillingState, ShippingState from Account Where ID =: checkAccountRecord[0].Id];
        System.assertEquals(checkAccountRecordUpdateBS[0].BillingState, checkAccountRecordUpdateBS[0].ShippingState);
        
        checkAccountRecord[0].BillingState = '';
		checkAccountRecord[0].Billingcountry = '';
		checkAccountRecord[0].BillingpostalCode = 'Test_PC_Update';
        update checkAccountRecord[0];
        List<Account> checkAccountRecordUpdateBPC = [Select ID, BillingpostalCode, ShippingpostalCode from Account Where ID =: checkAccountRecord[0].Id];
        System.assertEquals(checkAccountRecordUpdateBPC[0].BillingpostalCode, checkAccountRecordUpdateBPC[0].ShippingpostalCode);

        checkAccountRecord[0].Billingcountry = 'Test_Country_Update';
        update checkAccountRecord[0];
        List<Account> checkAccountRecordUpdateBCountry = [Select ID, Billingcountry, ShippingCountry from Account Where ID =: checkAccountRecord[0].Id];
        System.assertEquals(checkAccountRecordUpdateBCountry[0].Billingcountry, checkAccountRecordUpdateBCountry[0].ShippingCountry);
        
        checkAccountRecord[0].BillingpostalCode = 'Test_PCUpdate';
        update checkAccountRecord[0];
        List<Account> checkAccountRecordUpdateBPCU = [Select ID, BillingpostalCode, ShippingpostalCode from Account Where ID =: checkAccountRecord[0].Id];
        System.assertEquals(checkAccountRecordUpdateBPCU[0].BillingpostalCode, checkAccountRecordUpdateBPCU[0].ShippingpostalCode);
    }

}