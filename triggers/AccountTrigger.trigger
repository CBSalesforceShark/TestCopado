/**
 * Trigger Name	:	AccountTrigger
 * Created Date	:	29May2022
 * Created By	:	Chitresh Bhargava
 * Description	:	Trigger is created for Account Object
 **/
trigger AccountTrigger on Account (before insert, before update) {
    
    if(Util.bypassTriggerForAllObjects || Util.bypassTriggerForSpecificObject('Account'))
    {
        System.debug('Trigger Bypass Working -->');
        return;
    }
	
    if(Trigger.isBefore)
    {
        if(Trigger.isInsert || Trigger.isUpdate)
        {
            AccountTriggerHelper.updateAccountShippingAddress(Trigger.New, Trigger.OldMap);
        }
    }
}