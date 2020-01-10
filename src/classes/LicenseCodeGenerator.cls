public class LicenseCodeGenerator {


    public static String GenerateLicenseCode(String email, DateTime expDate, String sockets, List<String> featureNames){
        String licenseCodeUnhashed = LicenseCodeGenerator.GenerateLicenseString(email, expDate, sockets, featureNames);
        
        Blob targetBlob = Blob.valueOf(licenseCodeUnhashed);
        Blob cryptoBlob = Crypto.generateDigest('MD5', targetBlob);
        String licenseCode = EncodingUtil.convertToHex(cryptoBlob);
        return licenseCode;
    }
    
    public static String GenerateLicenseString(String email, DateTime expDate, String sockets, List<String> featureNames)
    {
        List<String> fns = new List<String>();
        for(String fn: featureNames){
            fns.add(fn);
        }
        fns.sort();
        String licenseCodeUnhashed = 'vmt_license_info' + email + expDate.format('yyyy-MM-dd') + sockets;
        for(String fn: fns){
            licenseCodeUnhashed += fn.trim();
        }
        return licenseCodeUnhashed;
    }
    
    public static String GenerateLicenseXml(String firstName, String lastName, String email, DateTime expDate, String sockets, String cores, List<string> featureNames){
        system.debug('### expiration date in GenerateLicenseXML method prior to format' + expDate);
        system.debug('### expiration date in GenerateLicenseXML method ' + expDate.format('yyyy-MM-dd'));
        
        
        String licenseXml = '<?xml version="1.0"?>\n';
        licenseXml += '<!-- Turbonomic license file; license created: ';
        licenseXml += DateTime.now().format('yyyy-MM-dd') + ' -->\n';
        licenseXml += '<license>\n';
        licenseXml += '      <first-name>' + firstName + '</first-name>\n';
        licenseXml += '      <last-name>' + lastName + '</last-name>\n';
        licenseXml += '      <email>' + email + '</email>\n';
        licenseXml += '      <num-sockets>' + sockets + '</num-sockets>\n'; 
        if (cores != '0') licenseXml += '      <num-cores>' + cores + '</num-cores>\n';	
        licenseXml += '      <expiration-date>' + expDate.format('yyyy-MM-dd') + '</expiration-date>\n';
        licenseXml += '      <lock-code>' + GenerateLicenseCode(email, expDate, sockets, featureNames) + '</lock-code>\n';
        for(String fn: featureNames){
           licenseXml += '      <feature FeatureName="' + fn + '" />\n';
        }
        licenseXml += '</license>';
        
        system.debug('This is what the XML looks like : \n' + licenseXml);
        return licenseXml;
        
    }
    
    
    /*
    * Updated license generator for 6.0 release
    * 
    * Parameters: 
	*    	licenseEntity = sockets, vms, or cores
	*		entityAmount = # of sockets/vms/cores
    *
    *
    */
    public static String newGenerateLicenseXml(String firstName, String lastName, String email, DateTime expDate, String licenseEntity, String entityAmount, String edition, List<string> featureNames){
        system.debug('### expiration date in GenerateLicenseXML method prior to format' + expDate);
        system.debug('### expiration date in GenerateLicenseXML method ' + expDate.format('yyyy-MM-dd'));
        
        String licenseUnit;
        String licenseUnitCores; //For Core licenses to seperate the # of Cores
        
        if (licenseEntity == 'Cores') {
        	String [] unitArray = entityAmount.split(';');
        	licenseUnit = unitArray.get(0);
        	licenseUnitCores = unitArray.get(1);
        
        } else licenseUnit = entityAmount;
        
        String licenseXml = '<?xml version="1.0"?>\n';
        licenseXml += '<!-- Turbonomic license file; license created: ';
        licenseXml += DateTime.now().format('yyyy-MM-dd') + ' -->\n';
        licenseXml += '<license>\n';
        licenseXml += '      <first-name>' + firstName + '</first-name>\n';
        licenseXml += '      <last-name>' + lastName + '</last-name>\n';
        licenseXml += '      <email>' + email + '</email>\n';
        if (licenseEntity == 'Workloads') licenseXml += '      <vm-total>' + licenseUnit + '</vm-total>\n';	 
        else licenseXml += '      <num-sockets>' + licenseUnit + '</num-sockets>\n';
        if (licenseEntity == 'Cores') licenseXml += '      <num-cores>' + licenseUnitCores + '</num-cores>\n';
        if (edition != 'N/A' && licenseEntity == 'Workloads') licenseXml += '      <edition>' + edition + '</edition>\n';
        licenseXml += '      <expiration-date>' + expDate.format('yyyy-MM-dd') + '</expiration-date>\n';
        licenseXml += '      <lock-code>' + newGenerateLicenseCode(email, expDate, licenseEntity, licenseUnit, featureNames) + '</lock-code>\n';
        for(String fn: featureNames){
           licenseXml += '      <feature FeatureName="' + fn + '" />\n';
        }
        licenseXml += '</license>';
        
        //system.debug('This is what the XML looks like : \n' + licenseXml);
        return licenseXml;
        
    }
    
    public static String newGenerateLicenseCode(String email, DateTime expDate, String licenseEntity, String entityAmount, List<String> featureNames){
        String licenseCodeUnhashed = LicenseCodeGenerator.newGenerateLicenseString(email, expDate, licenseEntity, entityAmount, featureNames);
                
        Blob targetBlob = Blob.valueOf(licenseCodeUnhashed);
        Blob cryptoBlob = Crypto.generateDigest('MD5', targetBlob);
        String licenseCode = EncodingUtil.convertToHex(cryptoBlob);
        return licenseCode;
    }
    
    public static String newGenerateLicenseString(String email, DateTime expDate, String licenseEntity, String entityAmount, List<String> featureNames)
    {
        List<String> fns = new List<String>();
        for(String fn: featureNames){
            fns.add(fn);
        }
        fns.sort();
        String licenseCodeUnhashed = 'vmt_license_info' + email + expDate.format('yyyy-MM-dd'); 
        if (licenseEntity == 'Workloads') licenseCodeUnhashed += 'vm';
        licenseCodeUnhashed += entityAmount;
        for(String fn: fns){
            licenseCodeUnhashed += fn.trim();
        }
        return licenseCodeUnhashed;
    }
    
}