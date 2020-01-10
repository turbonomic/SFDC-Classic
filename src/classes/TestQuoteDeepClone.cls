/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest 
private class TestQuoteDeepClone {
	/*
    static testMethod void myUnitTest() {
        
        List<Account> insertAccts = new List<Account>();
        Account a1 = new Account(name = 'An Account No one has heard of');
        insertAccts.add(a1);
        insert insertAccts;
        
        List<Opportunity> insertOpps = new List<Opportunity>();
        Opportunity o1 = new Opportunity(name = 'Opp1', accountId = a1.id, type = 'New', amount = 1000, closeDate = date.today().addDays(30), stageName = 'Identify', leadSource = 'Inbound - Website', of_cores__c = 100, of_CPU_Sockets__c = 20, of_virtual_machines__c = 500);
        insertOpps.add(o1);
        insert insertOpps;
        
        List<Product2> insertProducts = new List<Product2>();
        Product2 p1 = new Product2(name = 'Workload Edition 1-Year Term', productCode = 'WE-TERM-1YR', isActive = true);
        insertProducts.add(p1);
        Product2 p2 = new Product2(name = 'RAPID Success Onsite Training 3 Days', productCode = 'PSO-TRN-3DAY', isActive = true);
        insertProducts.add(p2);
        insert insertProducts; 
        
        List<PricebookEntry> insertPBEs = new List<PricebookEntry>();
        PricebookEntry pbe1 = new PricebookEntry(Pricebook2id = Test.getStandardPricebookId(), product2Id = p1.id, isActive = true, unitPrice=200);
        insertPBEs.add(pbe1);
        PricebookEntry pbe2 = new PricebookEntry(Pricebook2id = Test.getStandardPricebookId(), product2Id = p2.id, isActive = true, unitPrice=12500);
        insertPBEs.add(pbe2);
        insert insertPBEs;
        
        List<Quote> insertQuotes = new List<Quote>();
        Quote q1 = new Quote(name = 'quote with no products', opportunityId = o1.id, quote_type__c = 'Direct', expirationDate = date.today(), status = 'Submitted', billingStreet = '123 fake street', billingCity = 'boston', billingState = 'MA', billingCountry = 'United States', billingpostalcode = '02116',
        					shippingstreet = '123 fake street', shippingcity = 'boston', shippingstate = 'MA', shippingCountry = 'United States', pricebook2Id = Test.getStandardPricebookId());
        insertQuotes.add(q1);
        Quote q2 = new Quote(name = 'quote with 1 product',  opportunityId = o1.id, quote_type__c = 'Direct', expirationDate = date.today(), status = 'Submitted', billingStreet = '123 fake street', billingCity = 'boston', billingState = 'MA', billingCountry = 'United States', billingpostalcode = '02116',
        					shippingstreet = '123 fake street', shippingcity = 'boston', shippingstate = 'MA', shippingCountry = 'United States', pricebook2Id = Test.getStandardPricebookId());
        insertQuotes.add(q2);
        Quote q3 = new Quote(name = 'quote with 1 product',  opportunityId = o1.id, quote_type__c = 'Direct', expirationDate = date.today(), status = 'Submitted', billingStreet = '123 fake street', billingCity = 'boston', billingState = 'MA', billingCountry = 'United States', billingpostalcode = '02116',
        					shippingstreet = '123 fake street', shippingcity = 'boston', shippingstate = 'MA', shippingCountry = 'United States', pricebook2Id = Test.getStandardPricebookId());
        insertQuotes.add(q3);
        insert insertQuotes;
        
        List<QuoteLineItem> insertLineItems = new List<QuoteLineItem>();
        QuoteLineItem qli1 = new QuoteLineItem(quoteId = q2.id, pricebookEntryId = pbe1.id, unitPrice = 175, quantity = 100, quantity_type__c = 'Cores');
        insertLineItems.add(qli1);
        QuoteLineItem qli2 = new QuoteLineItem(quoteId = q3.id, pricebookEntryId = pbe1.id, unitPrice = 175, quantity = 100, quantity_type__c = 'Cores');
        insertLineItems.add(qli2);
        QuoteLineItem qli3 = new QuoteLineItem(quoteId = q3.id, pricebookEntryId = pbe2.id, unitPrice = 12500, quantity = 1, quantity_type__c = 'Training');
        insertLineItems.add(qli3);
        insert insertLineItems;
        
        
        //test case 1
        Id newQuoteId = QuoteMethods.cloneQuote(q1.id);
        Quote clonedQuote = [select name, opportunityId, quote_Type__c, expirationDate, status from Quote where id =: newQuoteId];
        system.assert(clonedQuote.name == q1.name);
        system.assert(clonedQuote.opportunityId == q1.opportunityId);
        system.assert(clonedQuote.expirationDate == q1.expirationdate);
        system.assert(clonedQuote.status == q1.status);
        
        String result = QuoteMethods.deepCloneQuoteLineItems(q1.id,newQuoteId);
        system.assertEquals(result,'Please make sure there are Line Items attached to this Quote already.');
        
        //test case 2
        Id newQuoteId2 = QuoteMethods.cloneQuote(q2.id);
        result = QuoteMethods.deepCloneQuoteLineItems(q2.id,newQuoteId2);
        system.assertEquals(result,'Sucessfully cloned line items');
        List<QuoteLineItem> clonedLineItem = [select id, quoteId, pricebookEntryId, unitPrice, quantity, quantity_type__c from QuoteLineItem where quoteId =: newQuoteId2];
        system.assertEquals(clonedLineItem.size(),1);
        system.assertEquals(clonedLineItem.get(0).pricebookEntryId,pbe1.id);
        system.assertEquals(clonedLineItem.get(0).quantity,100);
        system.assertEquals(clonedLineItem.get(0).quantity_type__c,'Cores');
        system.assertEquals(clonedLineItem.get(0).unitPrice,175);
        
        //test case 3
        Id newQuoteId3 = QuoteMethods.cloneQuote(q3.id);
        result = QuoteMethods.deepCloneQuoteLineItems(q3.id,newQuoteId3);
        system.assertEquals(result,'Sucessfully cloned line items');
        List<QuoteLineItem> clonedLineItem2 = [select id, quoteId, pricebookEntryId, unitPrice, quantity, quantity_type__c from QuoteLineItem where quoteId =: newQuoteId3];
        system.assertEquals(clonedLineItem2.size(),2);
        for (QuoteLineItem qli : clonedLineItem2) {
        	if (qli.pricebookEntryId == pbe1.id) {
        		system.assertEquals(qli.quantity,100);
        		system.assertEquals(qli.quantity_type__c,'Cores');
        		system.assertEquals(qli.unitPrice,175);
        	} else if (qli.pricebookEntryId == pbe2.id) {
        		system.assertEquals(qli.quantity,1);
        		system.assertEquals(qli.quantity_type__c,'Training');
        		system.assertEquals(qli.unitPrice,12500);
        	}
        }
        
    }
    */
    
    static testMethod void myUnitTest2() {
    	
    	List<Account> insertAccts = new List<Account>();
        Account a1 = new Account(name = 'An Account No one has heard of');
        insertAccts.add(a1);
        insert insertAccts;
        
        List<Opportunity> insertOpps = new List<Opportunity>();
        Opportunity o1 = new Opportunity(name = 'Opp1', accountId = a1.id, type = 'Maintenance Renewal', Undiscounted_Renewal_Amount__c = 1500, amount = 1000, closeDate = date.today().addDays(30), stageName = 'Identify', leadSource = 'Inbound - Website', of_cores__c = 100, of_CPU_Sockets__c = 20, of_virtual_machines__c = 500);
        insertOpps.add(o1);
        Opportunity o2 = new Opportunity(name = 'Opp2', accountId = a1.id, type = 'Maintenance Renewal', Undiscounted_Renewal_Amount__c = 1500, amount = 1000, closeDate = date.today().addDays(30), stageName = 'Identify', leadSource = 'Inbound - Website', of_cores__c = 100, of_CPU_Sockets__c = 20, of_virtual_machines__c = 500);
        insertOpps.add(o2);
        Opportunity o3 = new Opportunity(name = 'Opp3', accountId = a1.id, type = 'Maintenance Renewal', Undiscounted_Renewal_Amount__c = 1500, amount = 1000, closeDate = date.today().addDays(30), stageName = 'Identify', leadSource = 'Inbound - Website', of_cores__c = 100, of_CPU_Sockets__c = 20, of_virtual_machines__c = 500);
        insertOpps.add(o3);
        Opportunity o4 = new Opportunity(name = 'Opp3', accountId = a1.id, type = 'Maintenance Renewal', Undiscounted_Renewal_Amount__c = 1500, amount = 1000, closeDate = date.today().addDays(30), stageName = 'Identify', leadSource = 'Inbound - Website', of_cores__c = 100, of_CPU_Sockets__c = 20, of_virtual_machines__c = 500);
        insertOpps.add(o4);
        insert insertOpps;
        
        List<Product2> insertProducts = new List<Product2>();
        Product2 p1 = new Product2(name = 'Support & Maintenance for Workload Edition (1 Year)', productCode = 'WE-SNM-1YR', term__c = '12', isActive = true, pricing_type__c = 'Cores');
        insertProducts.add(p1);
        Product2 p2 = new Product2(name = 'Support & Maintenance for Workload Edition (2 Year)', productCode = 'WE-SNM-2YR', term__c = '24', isActive = true, pricing_type__c = 'Cores');
        insertProducts.add(p2);
        Product2 p3 = new Product2(name = 'Support & Maintenance for Workload Edition (3 Year)', productCode = 'WE-SNM-3YR', term__c = '36', isActive = true, pricing_type__c = 'Cores');
        insertProducts.add(p3);
        Product2 p4 = new Product2(name = 'Support & Maintenance for Workload Edition (4 Year)', productCode = 'WE-SNM-4YR', term__c = '48', isActive = true, pricing_type__c = 'Cores');
        insertProducts.add(p4);
        Product2 p5 = new Product2(name = 'Support & Maintenance for Workload Edition (5 Year)', productCode = 'WE-SNM-5YR', term__c = '60', isActive = true, pricing_type__c = 'Cores');
        insertProducts.add(p5);
        Product2 p6 = new Product2(name = 'Support & Maintenance for Application Control Module (1 Year)', productCode = 'SCM-SNM-1YR', term__c = '12', isActive = true, pricing_type__c = 'Cores');
        insertProducts.add(p6);
        Product2 p7 = new Product2(name = 'Support & Maintenance for Application Control Module (2 Year)', productCode = 'SCM-SNM-2YR', term__c = '24', isActive = true, pricing_type__c = 'Cores');
        insertProducts.add(p7);
        insert insertProducts; 
        
        List<PricebookEntry> insertPBEs = new List<PricebookEntry>();
        PricebookEntry pbe1 = new PricebookEntry(Pricebook2id = Test.getStandardPricebookId(), product2Id = p1.id, isActive = true, unitPrice=40);
        insertPBEs.add(pbe1);
        PricebookEntry pbe2 = new PricebookEntry(Pricebook2id = Test.getStandardPricebookId(), product2Id = p2.id, isActive = true, unitPrice=80);
        insertPBEs.add(pbe2);
        PricebookEntry pbe3 = new PricebookEntry(Pricebook2id = Test.getStandardPricebookId(), product2Id = p3.id, isActive = true, unitPrice=120);
        insertPBEs.add(pbe3);
        PricebookEntry pbe4 = new PricebookEntry(Pricebook2id = Test.getStandardPricebookId(), product2Id = p4.id, isActive = true, unitPrice=160);
        insertPBEs.add(pbe4);
        PricebookEntry pbe5 = new PricebookEntry(Pricebook2id = Test.getStandardPricebookId(), product2Id = p5.id, isActive = true, unitPrice=200);
        insertPBEs.add(pbe5);
        PricebookEntry pbe6 = new PricebookEntry(Pricebook2id = Test.getStandardPricebookId(), product2Id = p6.id, isActive = true, unitPrice=50);
        insertPBEs.add(pbe6);
        PricebookEntry pbe7 = new PricebookEntry(Pricebook2id = Test.getStandardPricebookId(), product2Id = p7.id, isActive = true, unitPrice=100);
        insertPBEs.add(pbe7);
        insert insertPBEs;
        
        List<Quote> insertQuotes = new List<Quote>();
        Quote q1 = new Quote(name = 'quote with no products', opportunityId = o1.id, quote_type__c = 'Direct', expirationDate = date.today(), status = 'Submitted', billingStreet = '123 fake street', billingCity = 'boston', billingState = 'MA', billingCountry = 'United States', billingpostalcode = '02116',
        					shippingstreet = '123 fake street', shippingcity = 'boston', shippingstate = 'MA', shippingCountry = 'United States', pricebook2Id = Test.getStandardPricebookId(), Renewal_Clone_Options__c = '2YR');
        insertQuotes.add(q1);
        Quote q2 = new Quote(name = 'quote with 1 product',  opportunityId = o2.id, quote_type__c = 'Direct', expirationDate = date.today(), status = 'Submitted', billingStreet = '123 fake street', billingCity = 'boston', billingState = 'MA', billingCountry = 'United States', billingpostalcode = '02116',
        					shippingstreet = '123 fake street', shippingcity = 'boston', shippingstate = 'MA', shippingCountry = 'United States', pricebook2Id = Test.getStandardPricebookId(), Renewal_Clone_Options__c = '2YR');
        insertQuotes.add(q2);
        Quote q3 = new Quote(name = 'quote with 2 products',  opportunityId = o3.id, quote_type__c = 'Direct', expirationDate = date.today(), status = 'Submitted', billingStreet = '123 fake street', billingCity = 'boston', billingState = 'MA', billingCountry = 'United States', billingpostalcode = '02116',
        					shippingstreet = '123 fake street', shippingcity = 'boston', shippingstate = 'MA', shippingCountry = 'United States', pricebook2Id = Test.getStandardPricebookId(), Renewal_Clone_Options__c = '3YR;4YR');
        insertQuotes.add(q3);
        Quote q4 = new Quote(name = 'quote with 2 products',  opportunityId = o4.id, quote_type__c = 'Direct', expirationDate = date.today(), status = 'Submitted', billingStreet = '123 fake street', billingCity = 'boston', billingState = 'MA', billingCountry = 'United States', billingpostalcode = '02116',
        					shippingstreet = '123 fake street', shippingcity = 'boston', shippingstate = 'MA', shippingCountry = 'United States', pricebook2Id = Test.getStandardPricebookId(), Renewal_Clone_Options__c = '2YR');
        insertQuotes.add(q4);
        insert insertQuotes;
        
        List<QuoteLineItem> insertLineItems = new List<QuoteLineItem>();
        QuoteLineItem qli1 = new QuoteLineItem(quoteId = q2.id, pricebookEntryId = pbe1.id, unitPrice = 175, quantity = 100, quantity_type__c = 'Cores');
        insertLineItems.add(qli1);
        QuoteLineItem qli2 = new QuoteLineItem(quoteId = q3.id, pricebookEntryId = pbe2.id, unitPrice = 175, quantity = 100, quantity_type__c = 'Cores');
        insertLineItems.add(qli2);
        QuoteLineItem qli3 = new QuoteLineItem(quoteId = q3.id, pricebookEntryId = pbe2.id, unitPrice = 100, quantity = 150, quantity_type__c = 'Cores');
        insertLineItems.add(qli3);
        QuoteLineItem qli4 = new QuoteLineItem(quoteId = q4.id, pricebookEntryId = pbe1.id, unitPrice = 100, quantity = 150, quantity_type__c = 'Cores');
        insertLineItems.add(qli4);
        QuoteLineItem qli5 = new QuoteLineItem(quoteId = q4.id, pricebookEntryId = pbe6.id, unitPrice = 50, quantity = 150, quantity_type__c = 'Cores');
        insertLineItems.add(qli5);
        insert insertLineItems;
        
        //no line items
        String result = QuoteMethods.cloneRenewalOptions(q1.id);
        system.assertEquals('Current Quote has no line items. Please add line items before trying to clone renewals.',result);
        
        //1 line item, 1 quote
        result = QuoteMethods.cloneRenewalOptions(q2.id);
        system.assertEquals('Successfully cloned Quote and all associated line items',result);
        List<QuoteLineItem> lineItemsFromQ2clone = [select id, pricebookEntryId, unitPrice, quantity, quantity_type__c from QuoteLineItem where Quote.OpportunityId =: o2.id AND QuoteId !=: q2.id];
        system.assertEquals(lineItemsFromQ2clone.size(),1);
    	system.assertEquals(lineItemsFromQ2clone.get(0).pricebookEntryId, pbe2.id);
    	system.assertEquals(lineItemsFromQ2clone.get(0).quantity, 100);
    	system.assertEquals(lineItemsFromQ2clone.get(0).unitPrice, 332.5);
    	system.assertEquals(lineItemsFromQ2clone.get(0).quantity_type__c, 'Cores');
    	
    	//2 line items, 2 quotes
    	result = QuoteMethods.cloneRenewalOptions(q3.id);
    	system.assertEquals('Successfully cloned Quote and all associated line items',result);
    	List<Quote> newQuotes = [select id, name from Quote where OpportunityId =: o3.id AND id !=: q3.id];
    	system.assertEquals(newQuotes.size(),2);
    	List<id> newQuoteIds = new List<id>();
    	for (Quote q : newQuotes) {
    		newQuoteIds.add(q.id);
    		if (q.name.contains('3YR')) {
    			system.assertEquals('quote with 2 products 3YR',q.name);
    		} else if (q.name.contains('4YR')) {
    			system.assertEquals('quote with 2 products 4YR',q.name);
    		}
    	}
    	List<QuoteLineItem> lineItemsFromQ3clone = [select id, pricebookEntryId, unitPrice, quantity, quantity_type__c, quote.Name from QuoteLineItem where QuoteId in: newQuoteIds];
    	system.assertEquals(4,lineItemsFromQ3clone.size());
    	for (QuoteLineItem qli : lineItemsFromQ3Clone) {
    		if (qli.quote.Name == 'quote with 2 products 3YR') {
    			system.assertEquals(qli.pricebookEntryId, pbe3.id);
    			if (qli.quantity == 100) {
    				system.assertEquals(qli.unitPrice,236.25);
    				system.assertEquals(qli.quantity_type__c,'Cores');
    			} else if (qli.quantity == 150) {
    				system.assertEquals(qli.unitPrice,135);
    				system.assertEquals(qli.quantity_type__c,'Cores');
    			}
    		} else if (qli.quote.Name == 'quote with 2 products 4YR') {
    			system.assertEquals(qli.pricebookEntryId, pbe4.id);
    			if (qli.quantity == 100) {
    				system.assertEquals(qli.unitPrice,280);
    				system.assertEquals(qli.quantity_type__c,'Cores');
    			} else if (qli.quantity == 150) {
    				system.assertEquals(qli.unitPrice,160);
    				system.assertEquals(qli.quantity_type__c,'Cores');
    			}
    		}
    	}
    	
    	//2 different products, 1 option
    	result = QuoteMethods.cloneRenewalOptions(q4.id);
    	List<QuoteLineItem> lineItemsFromQ4clone = [select id, pricebookEntryId, unitPrice, quantity, quantity_type__c from QuoteLineItem where Quote.OpportunityId =: o4.id AND QuoteId !=: q4.id];
    	for (QuoteLineItem qli : lineItemsFromQ4clone) {
    		if (qli.pricebookEntryId == pbe7.id) {
    			system.assertEquals(qli.unitPrice,95);
    			system.assertEquals(qli.quantity_type__c,'Cores');
    			system.assertEquals(qli.quantity,150);
    		} else {
    			system.assertEquals(qli.unitPrice,190);
    			system.assertEquals(qli.quantity_type__c,'Cores');
    			system.assertEquals(qli.quantity,150);
    			system.assertEquals(qli.pricebookEntryId,pbe2.id);
    		}
    	}
    	
    }
    
    
}