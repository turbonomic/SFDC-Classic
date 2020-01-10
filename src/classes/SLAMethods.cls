public class SLAMethods {
	
	public static DateTime AdjustedSLATime(DateTime dt, Integer gmtOffset) {
		Integer eodHour = 17; //5pm EOD Hour
    		
		Integer tempHour;
		if (dt.hourGmt() + gmtOffset < 0) tempHour = 24 + dt.hourGmt() + gmtOffset;
		else tempHour = dt.hourGmt() + gmtOffset;
		
		//Normal
		DateTime adjDt = dt;
		
		Map<Integer, String> dayofWeekIndex = new Map<Integer, String>();
		dayofWeekIndex.put(0, 'Sun'); dayofWeekIndex.put(1, 'Mon'); dayofWeekIndex.put(2, 'Tue'); dayofWeekIndex.put(3, 'Wed'); dayofWeekIndex.put(4, 'Thu'); dayofWeekIndex.put(5, 'Fri'); dayofWeekIndex.put(6, 'Sat');
		Map<String, Integer> dayofWeekReverseIndex = new Map<String, Integer>();
		dayofWeekReverseIndex.put('Sun', 0); dayofWeekReverseIndex.put('Mon', 1); dayofWeekReverseIndex.put('Tue', 2); dayofWeekReverseIndex.put('Wed', 3); dayofWeekReverseIndex.put('Thu', 4); dayofWeekReverseIndex.put('Fri', 5); dayofWeekReverseIndex.put('Sat', 6);
		
		
		String dayOfWeek = dt.formatGMT('EEE');
		String dayOfWeekOffset;
		
		
		//Adjust Day of the week for Time zone if necessary
		if (dt.hourGmt() + gmtOffset < 0) {
			if (dayOfWeek == 'Sun') {
				dayOfWeekOffset = 'Sat';
			}
			else dayOfWeekOffset = dayofWeekIndex.get(dayofWeekReverseIndex.get(dayOfWeek)-1);
		}
		else dayOfWeekOffset = dayOfWeek;
		
		//Respond the next day
		if (tempHour >= eodHour || dayOfWeek == 'Sat' || dayOfWeek == 'Sun') {
			Integer daysToAdjust = 1; //Default to respond next day
			
			if (dayOfWeekOffset == 'Sat') daysToAdjust = 2; //If Saturday, offset response by 2 days for Monday
			else if (dayOfWeekOffset == 'Fri' && tempHour >= eodHour) daysToAdjust = 3; //If Friday after 5pm, offset response by 3 days for Monday
			
			Time myTime = Time.newInstance(8, 0, 0, 0);
			adjDt = DateTime.newInstance(dt.addDays(daysToAdjust).Date(),myTime); 
		}
		
		return adjDt;
	}
    
}