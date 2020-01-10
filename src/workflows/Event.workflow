<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Team_assigned_update</fullName>
        <field>Team_Assigned_Static__c</field>
        <formula>TEXT(Owner:User.Team__c)</formula>
        <name>Team (assigned) update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Team_created_by_update</fullName>
        <field>Team_Created_By_Static__c</field>
        <formula>text(CreatedBy.Team__c)</formula>
        <name>Team (created by) update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Update team %28assigned%29</fullName>
        <actions>
            <name>Team_assigned_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>OR( 
ISCHANGED(OwnerId), 
ISNEW())</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update team %28created by%29</fullName>
        <actions>
            <name>Team_created_by_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>User.IsActive</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
