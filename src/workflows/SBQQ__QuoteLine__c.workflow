<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Set_Service_Offering_to_True</fullName>
        <field>Service_Offering__c</field>
        <literalValue>1</literalValue>
        <name>Set Service Offering to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Product_Family</fullName>
        <field>Product_Family_Stamped__c</field>
        <formula>SBQQ__ProductFamily__c</formula>
        <name>Stamp Product Family</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Set Service Offering Field</fullName>
        <actions>
            <name>Set_Service_Offering_to_True</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Sets Service offering field on quote line to assist with the Approval Level Formula</description>
        <formula>SBQQ__ProductFamily__c=&quot;Services&quot;</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Product Family</fullName>
        <actions>
            <name>Stamp_Product_Family</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Stamps Product Family (Stamp) field on quote line to assist with the Roll-up fields on the CPQ Quote Object</description>
        <formula>true</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
