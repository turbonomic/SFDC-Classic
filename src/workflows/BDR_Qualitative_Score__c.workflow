<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Stamp_BDR_team</fullName>
        <field>Team__c</field>
        <formula>TEXT(BDR__r.Team__c)</formula>
        <name>Stamp BDR team</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Stamp BDR team</fullName>
        <actions>
            <name>Stamp_BDR_team</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(ISNEW(),ISCHANGED(BDR__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
