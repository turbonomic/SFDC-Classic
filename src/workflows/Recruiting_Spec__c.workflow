<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Date_Spec_Filled</fullName>
        <field>Date_Filled__c</field>
        <formula>TODAY()</formula>
        <name>Date Spec Filled</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Close Date Calculation</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Recruiting_Spec__c.Status__c</field>
            <operation>contains</operation>
            <value>Closed</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Date Spec Filled</fullName>
        <actions>
            <name>Date_Spec_Filled</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Recruiting_Spec__c.Status__c</field>
            <operation>contains</operation>
            <value>Filled</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
