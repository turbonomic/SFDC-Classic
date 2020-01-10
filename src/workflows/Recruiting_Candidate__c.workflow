<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>New_Hire_Acceptance_Alert</fullName>
        <ccEmails>newhire@vmturbo.com</ccEmails>
        <description>New Hire Acceptance Alert</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_Hire_Acceptance_Alert</template>
    </alerts>
    <alerts>
        <fullName>New_Hire_Acceptance_Alert_AE</fullName>
        <description>New Hire Acceptance Alert for AEs</description>
        <protected>false</protected>
        <recipients>
            <recipient>dicken.chaplin@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jim.mcinerny@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>stefan.cohen@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_Hire_Acceptance_Alert</template>
    </alerts>
    <fieldUpdates>
        <fullName>Clean_role_interviewed_for</fullName>
        <field>Role_Interviewed_ForOLD__c</field>
        <formula>CASE(Role_Interviewed_ForOLD__c,
&quot;BDR&quot;,&quot;Business Development Representative&quot;,
&quot;EMEA - BDR&quot;,&quot;Business Development Representative EMEA&quot;,
&quot;BDR EMEA&quot;,&quot;Business Development Representative EMEA&quot;,
&quot;BDR - EMEA&quot;,&quot;Business Development Representative EMEA&quot;,
Role_Interviewed_ForOLD__c)</formula>
        <name>Clean role interviewed for</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Highest_Status_Reached</fullName>
        <field>Highest_Status_Reached__c</field>
        <formula>RIGHT(TEXT(Status__c),LEN(TEXT(Status__c))-4)</formula>
        <name>Stamp Highest Status Reached</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Alert Jim%2FStefan of new AE</fullName>
        <actions>
            <name>New_Hire_Acceptance_Alert_AE</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>AND(TEXT(Status__c)= &quot;7 - Offer Accepted&quot;,
CONTAINS(Recruiting_Spec__r.Name,&quot;Account Executive&quot;))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Alert NewHire Distribution List</fullName>
        <actions>
            <name>New_Hire_Acceptance_Alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>TEXT(Status__c)= &quot;7 - Offer Accepted&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Clean up role interviewed for</fullName>
        <actions>
            <name>Clean_role_interviewed_for</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>TRUE</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Highest Status Reached</fullName>
        <actions>
            <name>Stamp_Highest_Status_Reached</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
OR(ISNEW(),ISCHANGED(Status__c)),
OR(ISNUMBER(LEFT(TEXT(Status__c),FIND(&quot; -&quot;,TEXT(Status__c))-1)),
ISNUMBER(LEFT(TEXT(Status__c),FIND(&quot;a -&quot;,TEXT(Status__c))-1)),
ISNUMBER(LEFT(TEXT(Status__c),FIND(&quot;b -&quot;,TEXT(Status__c))-1))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
