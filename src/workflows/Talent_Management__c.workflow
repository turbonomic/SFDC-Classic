<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Match_Talent_Name_and_Owner_Name</fullName>
        <field>Name</field>
        <formula>Owner:User.Full_Name__c</formula>
        <name>Match Talent Name and Owner Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Match Talent Name with Owner</fullName>
        <actions>
            <name>Match_Talent_Name_and_Owner_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>Owner:User.Full_Name__c&lt;&gt;Name</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
