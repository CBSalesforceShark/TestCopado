/**
 * Class Name	:	TestDataFactory
 * Created Date	:	30May2022
 * Created By	:	Chitresh Bhargava
 * Description	:	TestDataFactory Class is created to hold data for all the classes
 **/
public class TestDataFactory {
    
    //Create Account Record
    public static Account createAccountRecord(boolean createAndInsert){
        Account accData = new Account(Name = 'Test_BA_Populate_SA', Billingstreet = 'Test_Street', Billingcity = 'Test_City',
                                      Billingstate = 'Test_State', Billingcountry = 'Test_Country',
                                      BillingpostalCode = 'Test12345', BillingLatitude = 26.464090, BillingLongitude = 74.642593);
        if(createAndInsert)
            insert accData;
        
        System.debug('---->'+ accData);
        return accData;
    }
    
}