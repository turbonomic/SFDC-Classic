<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Pre_Demo_Notes_Approved</fullName>
        <description>Pre-Demo Notes Approved</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Pre_Demo_Notes_Approved</template>
    </alerts>
    <alerts>
        <fullName>Pre_Demo_Notes_Denied</fullName>
        <description>Pre-Demo Notes Denied</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Pre_Demo_Notes_Denied</template>
    </alerts>
    <fieldUpdates>
        <fullName>Stamp_Demo_Approved_by</fullName>
        <field>Demo_Approved_By__c</field>
        <formula>$User.Full_Name__c</formula>
        <name>Stamp Demo Approved by</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Stamp Demo Approved By</fullName>
        <actions>
            <name>Pre_Demo_Notes_Approved</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Stamp_Demo_Approved_by</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
ISCHANGED(Demo_Approved_Denied__c),
ISPICKVAL(Demo_Approved_Denied__c,&quot;Approved&quot;)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Demo Denied By</fullName>
        <actions>
            <name>Pre_Demo_Notes_Denied</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Stamp_Demo_Approved_by</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
ISCHANGED(Demo_Approved_Denied__c),
ISPICKVAL(Demo_Approved_Denied__c,&quot;Denied&quot;)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
