/* 
* Created by: Eustace Consulting [www.eustaceconsulting.com][Developer: Jennifer Blair] 
* Description: Wrapper to track technology fields to set on the Account based on Tasks. This is used by TaskAfterInsertUpdate.trigger
*
*/
public with sharing class TechWrapper {
	public Date cpuDate;
	public Decimal cpuSockets;
	public Date vmDate;
	public Decimal vms;
	public Decimal cores;
	public Date coreDate;
	public String hwVendor;
	public String hvVendor;
	public String stVendor;
	
	public TechWrapper() {
		cpuDate = null;
		cpuSockets = null;
		vmDate = null;
		vms = null;
		cores = null;
		coreDate = null;
		hwVendor = null;
		hvVendor = null;
		stVendor = null;
	}
}