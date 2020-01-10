global with sharing class AccountMinigrid {
    public static final Integer MAX_SELECT_LIMIT = 49000;
    public AccountMinigrid(ApexPages.StandardController controller) {}
    @RemoteAction
    global static Map<String, String> getIdsByCriteria(String objectAPIName, List<String> fields, Map<String, String> criteria, Integer pageSize) {
        String whereClause = 'IsDeleted = false';
        String aId = '';
        for (String s : criteria.keySet()) {
            // security
            Powerloader.Configero_Funcs.ensureField(objectAPIName, s);
            if(s.equalsIgnoreCase('AccountId') && ('Task'.equalsIgnoreCase(objectAPIName) || 'Event'.equalsIgnoreCase(objectAPIName))){
                aId = String.escapeSingleQuotes(criteria.get(s));
            }else{
                if (whereClause != '') whereClause += ' and ';
                whereClause += s + ' = \'' + String.escapeSingleQuotes(criteria.get(s)) + '\'';
            }
        }
        if(aId != ''){
            List<String> idList = New List<String>();
            for(Contact c : [select Id from Contact where AccountId =: aId]){
                idList.add(c.Id); 
            }
            for(Lead l : [select Id from Lead where Account__c =: aId]){
                idList.add(l.Id);
            }
            if (whereClause != '') whereClause += ' and ';
            whereClause += 'WhoId in :idList';
            return getIdsBySQL(objectAPIName, fields, whereClause, pageSize,idList, true);
        }
        return Powerloader.Configero_GridApp.getIdsBySQL(objectAPIName, fields, whereClause, pageSize, true);
    }
    public static Map<String, String> getIdsBySQL(String objectAPIName, List<String> fields, String whereClause, Integer pageSize,List<String> idList) {
        return getIdsBySQL(objectAPIName, fields, whereClause, pageSize,idList, true);
    }
    public static Map<String, String> getIdsBySQL(String objectAPIName, List<String> fields, String whereClause, Integer pageSize,List<String> idList, Boolean allRows) {
        List<Id> allIds = new List<Id>();
        Powerloader.Configero_Funcs.ensureObject(objectAPIName);
        Id uid = UserInfo.getUserId();
        // get the name field if exists
        String orderBy = Powerloader.Configero_Funcs.getRelationshipNameFieldIfExists(objectAPIName);
        orderBy = orderBy == null ? '' : ' order by ' + orderBy;
        String fullSQL = 'select Id from ' + objectAPIName + ' ' + (whereClause == '' || whereClause == null ? '' : ' where ' + whereClause) + ' ' + orderBy + ' limit ' + MAX_SELECT_LIMIT;
        if (allRows) {
            fullSQL += ' all rows';
        }
        // be careful sorting here - some objects like Idea don't have a Name field - so if you sort by name, make sure it exists first
        for (Sobject sobj : Database.query(fullSQL)) {
            allIds.add(sobj.Id);
        }
        return getIdsByIdList(objectAPIName, fields, allIds, pageSize);
    }
    public static Map<String, String> getIdsByIdList(String objectAPIName, List<String> fields, List<Id> allIds, Integer pageSize) {
        List<Id> idsToLoad = new List<Id>();
        Map<String, String> ret = new Map<String, String>();

        // hopefully Salesforce introduces splice one day
        for (Integer i = 0; i < allIds.size(); i++) {
            if (i >= pageSize) break;
            idsToLoad.add(allIds.get(i));
        }
        ret.put('limit', '' + MAX_SELECT_LIMIT);
        ret.put('ids', System.JSON.serialize(allIds));

        // make sure we have enough left over
        Integer numRecsLeft = 50000 - allIds.size();
        if (!idsToLoad.isEmpty() && numRecsLeft > idsToLoad.size()) {
            ret.put('results', Powerloader.Configero_Framework.getDataForIds(objectAPIName, fields, idsToLoad));
        } else {
            ret.put('results', System.JSON.serialize(new SObject[]{}));
        }
        ret.put('ts', '' + System.now().getTime());

        return ret;
    }
    
}