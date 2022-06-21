/**
 * Class Name	:	Test_Util
 * Created Date	:	30May2022
 * Created By	:	Chitresh Bhargava
 * Description	:	Created to cover test coverage for Util Class
 **/
@IsTest
public class Test_Util {
    
    /**
     * Description	:	This method is written to coverage bypassTriggerForSpecificObject
     * Version		:	V_0.1 - Modified By - Chitresh Bhargava - 30May2022
     **/
    @IsTest
    static void test_bypassTriggerForSpecificObject(){
        //Calling method in util class - return output as false as we are not updating custom setting
        Boolean bypassTriggerFalse = Util.bypassTriggerForSpecificObject('Case');
        System.assertEquals(false, bypassTriggerFalse);
        
        //Update custom Setting - return output will be true
        Bypass_Logic_Switch__c bypassLogicSwitchInstance = new Bypass_Logic_Switch__c();
        bypassLogicSwitchInstance.Object_To_Bypass__c = 'Case';
        bypassLogicSwitchInstance.Bypass_Trigger__c = true;
        bypassLogicSwitchInstance.Bypass_Validation_Rule__c = false;
        insert bypassLogicSwitchInstance;
        Boolean bypassTriggerTrue = Util.bypassTriggerForSpecificObject('Case');
        System.assertEquals(true, bypassTriggerTrue);
        
        //Update custom Setting - return output will be true
        bypassLogicSwitchInstance.Object_To_Bypass__c = 'All';
        update bypassLogicSwitchInstance;
        Boolean bypassTriggerTrueForAllObject = Util.bypassTriggerForSpecificObject('all');
        System.assertEquals(true, bypassTriggerTrueForAllObject);
    }

}