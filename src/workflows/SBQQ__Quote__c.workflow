<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Quote_Approval_Email_Alert</fullName>
        <description>Quote Approval Email Alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Quote_Approved_Notification</template>
    </alerts>
    <alerts>
        <fullName>Quote_Rejection_Email_Alert</fullName>
        <description>Quote Rejection Email Alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Quote_Rejected_Notification</template>
    </alerts>
    <fieldUpdates>
        <fullName>Remove_Watermark</fullName>
        <description>Removes Watermark from Quote being printed</description>
        <field>SBQQ__WatermarkShown__c</field>
        <literalValue>0</literalValue>
        <name>Remove Watermark</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Quote_License_Entity_to_Workload</fullName>
        <description>Sets the Quote license entity to workloads by default</description>
        <field>License_Entity__c</field>
        <literalValue>Workloads</literalValue>
        <name>Set Quote License Entity to Workload</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Quote_Status_to_Approved</fullName>
        <description>Set the Quote Status to Approved upon being approved by approval process</description>
        <field>SBQQ__Status__c</field>
        <literalValue>Approved</literalValue>
        <name>Set Quote Status to Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Quote_Status_to_Denied</fullName>
        <description>Set the Quote Status to Denied upon being rejected by approval process</description>
        <field>SBQQ__Status__c</field>
        <literalValue>Denied</literalValue>
        <name>Set Quote Status to Denied</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Quote_Status_to_Draft</fullName>
        <description>Sets quote status back to Draft if quote is recalled from Approval process</description>
        <field>SBQQ__Status__c</field>
        <literalValue>Draft</literalValue>
        <name>Set Quote Status to Draft</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Quote_Status_to_In_Review</fullName>
        <description>Set the Quote Status to In Review upon entering approval process</description>
        <field>SBQQ__Status__c</field>
        <literalValue>In Review</literalValue>
        <name>Set Quote Status to In Review</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Set Quote License Entity Default to Workloads</fullName>
        <actions>
            <name>Set_Quote_License_Entity_to_Workload</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISPICKVAL(License_Entity__c,&quot;&quot;)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
