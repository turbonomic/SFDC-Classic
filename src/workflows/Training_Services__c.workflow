<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Email_Account_Owner_when_Training_Completed</fullName>
        <ccEmails>sungwoo.chon@vmturbo.com,cxteam@vmturbo.com</ccEmails>
        <description>Email Account Owner when Training Completed</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <field>Account_Territory_Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Training_Completed</template>
    </alerts>
    <fieldUpdates>
        <fullName>Stamp_Date_Scheduled</fullName>
        <field>Date_Scheduled__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Date Scheduled</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Kickoff_Date</fullName>
        <field>Date_of_Kickoff__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Kickoff Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Territory_Owner_Email</fullName>
        <description>Stamp Territory Owner&apos;s email for Email alert.</description>
        <field>Territory_Owner_Email__c</field>
        <formula>Account__r.AE_Rep__r.Email</formula>
        <name>Stamp Territory Owner Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Territory_Owner_Email_2</fullName>
        <field>Territory_Owner_Email__c</field>
        <formula>Account__r.AE_Rep__r.Email</formula>
        <name>Stamp Territory Owner Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Alert Training Submitted for Approval</fullName>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3</booleanFilter>
        <criteriaItems>
            <field>Training_Services__c.Type__c</field>
            <operation>equals</operation>
            <value>Training</value>
        </criteriaItems>
        <criteriaItems>
            <field>Training_Services__c.Stage__c</field>
            <operation>equals</operation>
            <value>Submitted</value>
        </criteriaItems>
        <criteriaItems>
            <field>Training_Services__c.Asset_Purchase_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Email Account Owner when Training Complete</fullName>
        <actions>
            <name>Email_Account_Owner_when_Training_Completed</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Training_Services__c.Status__c</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Training_Services__c.Type__c</field>
            <operation>equals</operation>
            <value>Training</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp KickOff Date</fullName>
        <actions>
            <name>Stamp_Kickoff_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
TEXT(Status__c)=&quot;Waiting on Dates&quot;,
ISBLANK(Date_of_Kickoff__c)
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Opportunity Owner Email</fullName>
        <actions>
            <name>Stamp_Territory_Owner_Email_2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Training_Services__c.Status__c</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Training_Services__c.Type__c</field>
            <operation>equals</operation>
            <value>Training</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Scheduled Date</fullName>
        <actions>
            <name>Stamp_Date_Scheduled</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
TEXT(Status__c)=&quot;Scheduled&quot;,
ISBLANK(Date_Scheduled__c)
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
