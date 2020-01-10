global class TerritoryWrapper implements Comparable{
	
	public Territory__c territory;
	
	public TerritoryWrapper(Territory__c t) {
		territory = t;
	}
	
	global Integer compareTo(Object compareTo) {
		
		TerritoryWrapper compareToTerritory = (TerritoryWrapper) compareTo;
		
		Integer returnValue = 0;
		if (territory.sort_order__c < compareToTerritory.territory.sort_order__c) {
			returnValue = 1;
		} else {
			returnValue = -1;
		}
		
		return returnValue;
	}
	
	
}