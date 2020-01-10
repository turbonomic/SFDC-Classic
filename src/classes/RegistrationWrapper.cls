global class RegistrationWrapper implements comparable{
	
	public VartopiaDRS__Registration__c thisReg;
	
	public RegistrationWrapper(VartopiaDRS__Registration__c reg) {
		thisReg = reg;
	}
	
	global Integer compareTO(Object compareTo) {
		
		RegistrationWrapper compareToReg = (RegistrationWrapper) compareTo;
		
		Integer returnValue = 0;
		if (thisReg.VartopiaDRS__Date_Submitted__c > compareToReg.thisReg.VartopiaDRS__Date_Submitted__c) {
			returnValue = 1;
		} else {
			returnValue = -1;
		}
		
		return returnValue;
		
	}
	
}