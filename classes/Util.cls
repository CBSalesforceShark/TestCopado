/**
 * Class Name	:	Util
 * Created Date	:	29May2022
 * Created By	:	Chitresh Bhargava
 * Description	:	The Util class is a general purposed utility class using which we can reuse the existing block of code
 * 				  	without creating instance of the class.
 **/
public class Util {
    
    //Trigger Flag
    public static Boolean bypassTriggerForAllObjects = false;
    
    /**
     * Description	:	This method is created to bypass trigger for the respective object
     **/
    public static boolean bypassTriggerForSpecificObject(String objectName){
        
        //Varibale to hold boolean value
        Boolean bypassTrigger = false;
        
        //Get Bypass_Logic_Switch custom setting for the current user
        Bypass_Logic_Switch__c bypassLogicSwitch = Bypass_Logic_Switch__c.getInstance(UserInfo.getUserId());
        
        //Check Object Name is not blank or empty + Checkbox i.e. Bypass_Trigger is true + contains objectName or consider All Objects
        if(String.isNotBlank(bypassLogicSwitch.Object_To_Bypass__c) && bypassLogicSwitch.Bypass_Trigger__c == true
           && (bypassLogicSwitch.Object_To_Bypass__c.contains(objectName)
               || bypassLogicSwitch.Object_To_Bypass__c.equalsIgnoreCase('All'))
          )
        {
            bypassTrigger = true;
        }
        
        return bypassTrigger;
        
    }

}