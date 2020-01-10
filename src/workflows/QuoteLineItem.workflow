<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Calculate_Sales_Price</fullName>
        <field>UnitPrice</field>
        <formula>(1-Discount_Percentage__c) * PricebookEntry.UnitPrice</formula>
        <name>Calculate Sales Price</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Recalculate_Discount</fullName>
        <field>Discount_Percentage__c</field>
        <formula>1- (UnitPrice/PricebookEntry.UnitPrice)</formula>
        <name>Recalculate Discount %</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_List_Price_copy_field</fullName>
        <field>List_Price_copy__c</field>
        <formula>PricebookEntry.UnitPrice</formula>
        <name>Update List Price (copy) field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Product_Name_field</fullName>
        <field>Product_Name_Text__c</field>
        <formula>Product2.Name</formula>
        <name>Update Product Name field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Calculate Sales Price</fullName>
        <actions>
            <name>Calculate_Sales_Price</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>OR(
AND(ISNEW(),NOT(ISBLANK(Discount_Percentage__c))),
AND(ISCHANGED(Discount_Percentage__c),NOT(ISBLANK(Discount_Percentage__c))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Recalculate Discount</fullName>
        <actions>
            <name>Recalculate_Discount</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>OR(
AND(
  NOT(ISNEW()),
  ISCHANGED(UnitPrice),
  NOT(ISCHANGED(Discount_Percentage__c))),
AND(
  ISNEW(),
  UnitPrice&lt;&gt;PricebookEntry.UnitPrice,
  ISBLANK(Discount_Percentage__c)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp List Price %28copy%29</fullName>
        <actions>
            <name>Update_List_Price_copy_field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>User.IsActive</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Need to duplicate the native List Price field because it is cross-object (can&apos;t be used in rollup summary)</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Product Name</fullName>
        <actions>
            <name>Update_Product_Name_field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>User.IsActive</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
