global class QuoteMethods {
	
	webservice static String cloneQuote(Id oldQuoteId) {
		
		Schema.SObjectType sobjectType = oldQuoteId.getSObjectType();
		String objType = sobjectType.getDescribe().getName();
		String whereClause = 'id = \'' + oldQuoteId + '\'';

		String query = VMTUtils.getCreatableFieldsSOQL(objType,whereClause);
		system.debug('Query is: ' + query);
		Quote original = (Quote)Database.query(query);
		
		if (original != null) {
			Quote newQuote = original.clone(false,true);
			try {
				insert newQuote;
				return newQuote.id;
			} catch (Exception e) {
				return 'Error: ' + e;
			}
		} else {
			return 'Error: failed to create cloned quote.';
		}
	}
	
	webservice static String deepCloneQuoteLineItems(Id oldQuoteId, Id newQuoteId) {
		
		List<QuoteLineItem> lineItems = [select id from QuoteLineItem where QuoteId =: oldQuoteId];
		
		if (lineItems.size() > 0) {
		
			Schema.SObjectType sobjectType = lineItems.get(0).id.getSObjectType();
			String objType = sobjectType.getDescribe().getName();
			String whereClause = 'QuoteId = \'' + oldQuoteId + '\'';

		
			String query = VMTUtils.getCreatableFieldsSOQL(objType,whereClause);
			
			List<QuoteLineItem> originalLineItems = Database.query(query);
			system.debug('### line items to clone: ' + originalLineItems.size());
			
			List<QuoteLineItem> clonedLineItems = new List<QuoteLineItem>();
			
			for (QuoteLineItem qli : originalLineItems) {
				QuoteLineItem newClonedItem = new QuoteLineItem();
				
				newClonedItem.QuoteId = newQuoteId;
				newClonedItem.PricebookEntryId = qli.PricebookEntryId;
				//newClonedItem.Product2Id = qli.Product2Id;
				newClonedItem.Quantity = qli.quantity;
				newClonedItem.UnitPrice = qli.UnitPrice;
				if (qli.quantity_type__c != null) newClonedItem.Quantity_Type__c = qli.Quantity_Type__c;
				
				clonedLineItems.add(newClonedItem);
			}
			
			if (clonedLineItems.size() > 0) {
				try {
					insert clonedLineItems;
					return 'Sucessfully cloned line items';
				} catch (exception e) {
					return 'Error occurred: ' + e;
				}
			} else {
				return 'An error occurred adding line items to insert list. Please contact Sales Ops.';
			}
			
		} else {
			return 'Please make sure there are Line Items attached to this Quote already.';
		}
		
	}
	
	webservice static String cloneRenewalOptions(Id oldQuoteId) {
		//query old quote for clone
		String whereClause = 'Id = \'' + oldQuoteId + '\'';
		String query = VMTUtils.getCreatableFieldsSOQL('Quote',whereClause);
		Quote oldQuote = Database.query(query);
		
		Integer failures = 0;
		
		//query all associated line items
		List<QuoteLineItem> oldQuoteLineItems = [select id, unitPrice, product2Id, product2.productCode, product2.Term__c, product2.pricing_type__c, pricebookEntryId, quantity, quantity_type__c, maintenance_start_date__c from QuoteLineItem where quoteId =: oldQuoteId and product2.productCode like '%SNM%'];
		
		
		//give error if no line items found
		if (oldQuoteLineItems.size() > 0) {
			
			Integer term = Integer.valueOf(oldQuoteLineItems.get(0).product2.Term__c)/12;
			system.debug('### term of original line item is ' + term + ' years');
			
			String originalPricingType = oldQuoteLineItems.get(0).product2.pricing_type__c;
			String originalPricebook = oldQuote.Pricebook2Id;
			if (originalPricebook == null) originalPricebook = '01sD0000000GpnnIAC';
			
			List<String> originalSKUTypes = new List<String>();
			for(QuoteLineItem qli : oldQuoteLineItems) {
				originalSKUTypes.add(qli.product2.productCode.substring(0,qli.product2.productCode.lastIndexOf('-')+1));
			}
			
			system.debug('### product types we are cloning from ' + originalSKUTypes);
			
			//String originalSKUType = oldQuoteLineItems.get(0).product2.productCode.substring(0,oldQuoteLineItems.get(0).product2.productCode.lastIndexOf('-')+1);
			//system.debug('### the product type we are cloning from starts with ' + originalSKUType);
			
			if (oldQuote.Renewal_Clone_Options__c != null) {
				Map<String,List<String>> pbeCodes = new Map<String,List<String>>();
				List<String> pbecodesforQuery = new List<String>();
				Map<String,Quote> newQuotesMap = new Map<String,Quote>();
				
				List<String> renewalOptions = oldQuote.Renewal_Clone_options__c.split(';');
				for (String s : renewalOptions) {
					system.debug('### clone option ' + s + ' selected');
					for (String s2 : originalSKUTypes) {
						system.debug('### current SKU is ' + s2);
						if (pbeCodes.containsKey(s)) {
							List<String> pbes = pbeCodes.get(s);
							pbes.add(s2+s);
							pbeCodes.put(s,pbes);		
							pbecodesforQuery.add(s2+s);											//////////////////////////WORKING HERE
							system.debug('### adding product code to list ' + s2+s);
						} else {
							List<String> pbes = new List<String>();
							pbes.add(s2+s);
							pbeCodes.put(s,pbes);
							pbecodesforQuery.add(s2+s);
							system.debug('### adding product code to list ' + s2+s);
						}
						//pbeCodes.put(s,s2 + s);
						system.debug('### adding ' + s2 + s);
					}
					
					Quote newQuote = oldQuote.clone(false,true);
					newQuote.name += ' ' + s;
					newQuote.Renewal_Clone_options__c = null;
					newQuotesMap.put(s,newQuote);
				}
				try {
					insert newQuotesMap.values();
					
					Map<String,Map<String,PricebookEntry>> pbeMap = new Map<String,Map<String,PricebookEntry>>();
					List<PricebookEntry> newPBEs = [select id, Product2.productCode, Product2.Term__c from PricebookEntry where Product2.ProductCode in: pbecodesforQuery and isActive = true and Product2.Pricing_Type__c =: originalPricingType and Pricebook2Id =: originalPricebook];
					system.debug('### Found ' + newPBEs.size() + ' pricebook entries for the cloned line items');
					
					for (PricebookEntry pbe : newPBEs) {
						system.debug('### adding to key in map for PBEs: ' + pbe.Product2.ProductCode.substring(0,pbe.Product2.ProductCode.lastIndexOf('-')+1));
						if (pbeMap.containsKey(pbe.Product2.ProductCode.substring(0,pbe.Product2.ProductCode.lastIndexOf('-')+1))) {
							Map<String,PricebookEntry> pbes = pbeMap.get(pbe.Product2.ProductCode.substring(0,pbe.Product2.ProductCode.lastIndexOf('-')+1));
							if (!pbes.containsKey(pbe.Product2.ProductCode.substring(pbe.Product2.ProductCode.lastIndexOf('-')+1))) {
								pbes.put(pbe.Product2.ProductCode.substring(pbe.Product2.ProductCode.lastIndexOf('-')+1),pbe);
								pbeMap.put(pbe.Product2.ProductCode.substring(0,pbe.Product2.ProductCode.lastIndexOf('-')+1),pbes);
							}
						} else {
							Map<String,PricebookEntry> pbes = new Map<String,PricebookEntry>();
							pbes.put(pbe.Product2.ProductCode.substring(pbe.Product2.ProductCode.lastIndexOf('-')+1),pbe);
							pbeMap.put(pbe.Product2.ProductCode.substring(0,pbe.Product2.ProductCode.lastIndexOf('-')+1),pbes);
						}
						//pbeMap.put(pbe.Product2.productCode.substring(0,pbe.Product2.productCode.lastIndexOf('-')+1),pbe);
					}
					system.debug('### overall there are ' + newPBEs.size() + ' in the map');
					
					List<QuoteLineItem> insertNewLineItems = new List<QuoteLineItem>();
					for (String s : renewalOptions) {
						system.debug('### running through loop of renewal options for ' + s);
						if (newQuotesMap.containsKey(s)) {
							Quote q = newQuotesMap.get(s);
														
							//PricebookEntry thisPBE = pbeMap.get(s);
							//Integer newTerm = Integer.valueOf(thisPBE.Product2.Term__c)/12;
							for (QuoteLineItem qli : oldQuoteLineItems) {
								QuoteLineItem newLineItem = new QuoteLineItem();
								newLineItem.QuoteId = q.id;
								newLineItem.Quantity = qli.quantity;
								//newLineItem.PricebookEntryId = thisPBE.id;
								
								Map<String,PricebookEntry> pbes;
								if (pbeMap.containsKey(qli.Product2.ProductCode.substring(0,qli.Product2.ProductCode.lastIndexOf('-')+1))) {
									pbes = pbeMap.get(qli.Product2.ProductCode.substring(0,qli.Product2.ProductCode.lastIndexOf('-')+1));
								}
								if (pbes.size() > 0) {
									newLineItem.PricebookEntryId = pbes.get(s).id;
									
									Integer newTerm = Integer.valueOf(pbes.get(s).Product2.Term__c)/12;
									
									if (qli.Maintenance_Start_Date__c != null) newLineItem.Maintenance_Start_Date__c = qli.Maintenance_Start_Date__c;
									if(qli.quantity_type__c != null) newLineItem.quantity_type__c = qli.quantity_type__c;
									
									Decimal multiplier = (Decimal)newTerm/term;
									system.debug('### multiplier for this quote is: ' + multiplier);
									system.debug('### original unit price: ' + qli.unitPrice);
									newLineItem.UnitPrice = multiplier * qli.unitPrice;
									system.debug('### new unit price (excluding discount): ' + newLineItem.UnitPrice);
									if (newTerm == 2) newLineItem.UnitPrice *= 0.95;
									else if (newTerm == 3) newLineItem.UnitPrice *= 0.90;
									else if (newTerm == 4) newLineItem.UnitPrice *= 0.80;
									system.debug('### new unit price (including discount): ' + newLineItem.UnitPrice);
									insertNewLineItems.add(newLineItem);
								} else {
									failures++;
								}
							}

						} else {
							failures++;
						}
					}
					
					if (insertNewLineItems.size() > 0) {
						insert insertNewLineItems;
						if (failures == 0) {
							return 'Successfully cloned Quote and all associated line items';
						} else {
							return 'Partially Succeeded in cloning Quote and associated line items. All quotes were succesfully added, but ' + String.valueOf(failures) + 'quote line items failed to insert because associated SKU was not found.';
						}
					} else {
						return 'Failed to clone associated line items';
					}
				} catch (exception e) {
					return 'Error: ' + e;
				}
			} else {
				//give error if no renewal clone options found
				return 'Please select Renewal Clone Options prior to cloning the renewal.';
			}
			
		} else {
			return 'Current Quote has no line items. Please add line items before trying to clone renewals.';
		}
		
		return '';
	}

}