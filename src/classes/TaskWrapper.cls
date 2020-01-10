global class TaskWrapper implements comparable{
	
	public Task tsk;
	
	public TaskWrapper(Task tk) {
		tsk = tk;
	}
	
	
	global Integer compareTo(Object compareTo) {
		
		TaskWrapper compareToTsk = (TaskWrapper) compareTo;
		
		Integer returnValue = 0;
		if (tsk.CreatedDate > compareTotsk.tsk.CreatedDate) {
			returnValue = 1;
		} else {
			returnValue = -1;
		}
		
		return returnValue;
	}
	
	
}