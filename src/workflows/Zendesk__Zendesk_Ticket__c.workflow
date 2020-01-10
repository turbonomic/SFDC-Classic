<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Notification_for_Zendesk_Ticket_Assignment</fullName>
        <description>Notification for Zendesk Ticket Assignment</description>
        <protected>false</protected>
        <recipients>
            <recipient>charmian.mcintyre@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Zendesk_Ticket_Notifications/Zendesk_Ticket_Notification_Email_Assignee</template>
    </alerts>
    <alerts>
        <fullName>Notification_for_Zendesk_Ticket_Submission</fullName>
        <description>Notification for Zendesk Ticket Submission</description>
        <protected>false</protected>
        <recipients>
            <field>Territory_Owner_Email_for_WF__c</field>
            <type>email</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Zendesk_Ticket_Notifications/Zendesk_Ticket_Notification_Email_Sales_Team</template>
    </alerts>
    <fieldUpdates>
        <fullName>Assignee_Email</fullName>
        <field>Assignee_Email_for_WFR__c</field>
        <formula>Assignee_Email__c</formula>
        <name>Assignee Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Territory_Owner_Email</fullName>
        <description>Fills in the Territory Owner Email for WF field so this WFR can fire off the alert to the correct AE</description>
        <field>Territory_Owner_Email_for_WF__c</field>
        <formula>Territory_Owner_Email__c</formula>
        <name>Territory Owner Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Zendesk Ticket Assignment</fullName>
        <actions>
            <name>Notification_for_Zendesk_Ticket_Assignment</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Assignee_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Zendesk__Zendesk_Ticket__c.Zendesk__Assignee_Name__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>A notification to the Assignee of a new Zendesk Ticket</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Zendesk Ticket Notification</fullName>
        <actions>
            <name>Notification_for_Zendesk_Ticket_Submission</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Territory_Owner_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Zendesk__Zendesk_Ticket__c.Zendesk__Status__c</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <description>An email alert from Zendesk Team to the Sales Team for account management</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
