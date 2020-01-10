public class MyLeadReassignmentClass {
	
	public static boolean futureMethodAlreadyCalled = false;
	
	@future
	public static void reassignLeadWithActiveRule(Set<id> leadIds) {
		futureMethodAlreadyCalled = true;
		
		system.debug('### Entering reassign with assignment rules');
		system.debug('### leadIds has ' + leadIds.size() + ' elements');
		
		AssignmentRule ar = new AssignmentRule();
		ar = [select id from AssignmentRule where SobjectType = 'Lead' and Active = true limit 1];
		
		Database.DMLOptions dmlOpts = new Database.DMLOptions();
		dmlOpts.assignmentRuleHeader.assignmentRuleId = ar.id;
//		dmlOpts.assignmentRuleHeader.useDefaultRule = true;
		
		List<Lead> leadList = [select id, ownerId, retrigger_assignment_rules__c, email, phone, personal_email__c from Lead where id in: leadIds];
		List<Lead> updateList = new List<Lead>();
		
		for (Lead l : leadList) {
			if (l.retrigger_assignment_rules__c) {
				system.debug(l);
				l.setOptions(dmlOpts);
				l.retrigger_assignment_rules__c = false;
				updateList.add(l);
			}
		}
		
		try {
			Database.update(updateList,dmlOpts);
		}catch (DMLException e) {
			system.debug(e);
		}
	}
	
}