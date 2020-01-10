<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Promo_Alert_Finance</fullName>
        <ccEmails>hr@vmturbo.com,salesops@vmturbo.com</ccEmails>
        <description>Promotion Notification for Finance</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Promotion_Notification</template>
    </alerts>
    <alerts>
        <fullName>Promotion_Notification_for_Finance</fullName>
        <ccEmails>hr@vmturbo.com</ccEmails>
        <description>Promotion Notification for Finance</description>
        <protected>false</protected>
        <recipients>
            <recipient>justin.chang@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>stefan.cohen@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Promotion_Notification</template>
    </alerts>
    <fieldUpdates>
        <fullName>Clear_Current_Promotion_Date</fullName>
        <field>Promotion_to_Key_BDR_Date__c</field>
        <name>Clear Current Promotion Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Demotion_Date</fullName>
        <field>Demotion_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Demotion Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Division_Alignment</fullName>
        <field>Division</field>
        <formula>CASE(TEXT(Team__c),
&quot;The Pack&quot;,&quot;West&quot;,
&quot;The Foundation&quot;,&quot;Central&quot;,
&quot;Spartans&quot;,&quot;East&quot;,&quot;&quot;)</formula>
        <name>Stamp Division Alignment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Geo_Team_Alignment_Change_Date</fullName>
        <field>Geo_Team_Transition_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Geo/Team Alignment Change Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Old_Team</fullName>
        <field>Transition_from_Team__c</field>
        <formula>TEXT(PRIORVALUE(Team__c))</formula>
        <name>Stamp Old Team</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Original_Promotion_Date</fullName>
        <field>Original_KBDR_Promotion_Date__c</field>
        <formula>Promotion_to_Key_BDR_Date__c</formula>
        <name>Stamp Original Promotion Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Sales_Start_Date</fullName>
        <field>Sales_Start_Date__c</field>
        <formula>TODAY()+30</formula>
        <name>Stamp Sales Start Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Promotion Occurs</fullName>
        <actions>
            <name>Promo_Alert_Finance</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>User.Promotion_to_AE_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>User.Promotion_to_Bus_Driver_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Demotion Date</fullName>
        <actions>
            <name>Clear_Current_Promotion_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Demotion_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(UserRole.Name=&quot;Business Development Rep&quot;,NOT(ISBLANK( Promotion_to_Key_BDR_Date__c)))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Division</fullName>
        <actions>
            <name>Stamp_Division_Alignment</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>User.User_Role_Name__c</field>
            <operation>contains</operation>
            <value>Business Development Rep,BDR</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Geo%2FTeam Transition Date</fullName>
        <actions>
            <name>Stamp_Geo_Team_Alignment_Change_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Old_Team</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
ISCHANGED(Team__c),
NOT(ISNEW()))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Original Promotion Date</fullName>
        <actions>
            <name>Stamp_Original_Promotion_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(NOT(ISBLANK(Promotion_to_Key_BDR_Date__c)),ISBLANK(Original_KBDR_Promotion_Date__c),CONTAINS(UserRole.Name,&quot;Key Account&quot;))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Sales Start Date</fullName>
        <actions>
            <name>Stamp_Sales_Start_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
ISBLANK(Sales_Start_Date__c),
OR(
CONTAINS(UserRole.Name,&quot;Business Development Rep&quot;),
CONTAINS(UserRole.Name,&quot;Sales Development Rep&quot;)
))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
