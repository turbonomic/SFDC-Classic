<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Stamp_EJF_50_Risk</fullName>
        <field>Split_Risk_Projection_50_EFJ__c</field>
        <formula>CASE(Opportunity.StageName, 
&quot;PO Received&quot;,Forecasted_Split_Bookings_editable__c+ Split_Anchor_Realization_EJF__c, 
&quot;Commit&quot;,Forecasted_Split_Bookings_editable__c+ Split_Anchor_Realization_EJF__c, 
&quot;Strong Upside&quot;,Forecasted_Split_Bookings_editable__c+ Split_Anchor_Realization_EJF__c, 
&quot;Upside&quot;, Split_Anchor_Realization_EJF__c* 0.50 + Forecasted_Split_Bookings_editable__c,Forecasted_Split_Bookings_editable__c)</formula>
        <name>Stamp EJF 50% Risk</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_EJF_75_Risk</fullName>
        <field>Split_Risk_Projection_75_EFJ__c</field>
        <formula>CASE(Opportunity.StageName, 
&quot;PO Received&quot;,Forecasted_Split_Bookings_editable__c+ Split_Anchor_Realization_EJF__c, 
&quot;Commit&quot;,Forecasted_Split_Bookings_editable__c+ Split_Anchor_Realization_EJF__c, 
&quot;Strong Upside&quot;,Forecasted_Split_Bookings_editable__c+ Split_Anchor_Realization_EJF__c, 
Forecasted_Split_Bookings_editable__c)</formula>
        <name>Stamp EJF 75% Risk</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_EJF_90_Risk</fullName>
        <field>Split_Risk_Projection_90_EFJ__c</field>
        <formula>IF(Opportunity.Probability &gt;= 0.9, Forecasted_Split_Bookings_editable__c+Split_Anchor_Realization_EJF__c,Forecasted_Split_Bookings_editable__c)</formula>
        <name>Stamp EJF 90% Risk</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_New_Split</fullName>
        <field>New_Split__c</field>
        <literalValue>1</literalValue>
        <name>Stamp New Split</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Opportunity_Split_Owner_Team</fullName>
        <field>Split_Owner_Team__c</field>
        <formula>TEXT(SplitOwner.Team__c)</formula>
        <name>Stamp Opportunity Split Owner Team</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Check New Opp Split box</fullName>
        <actions>
            <name>Stamp_New_Split</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>New_Split__c=false</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EJF Risk Projections</fullName>
        <actions>
            <name>Stamp_EJF_50_Risk</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_EJF_75_Risk</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_EJF_90_Risk</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(New_Split__c=true,NOT(ISNEW()))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Opportunity Split Owner</fullName>
        <actions>
            <name>Stamp_Opportunity_Split_Owner_Team</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(
SplitOwner.Full_Name__c&lt;&gt;&quot;Gerry Sengendo&quot;,
NOT(CONTAINS(TEXT(SplitOwner.Team__c),&quot;The Pipelime&quot;)),
NOT(CONTAINS(TEXT(SplitOwner.Team__c),&quot;The Pack&quot;)),
NOT(CONTAINS(TEXT(SplitOwner.Team__c),&quot;The Foundation&quot;)),
NOT(CONTAINS(TEXT(SplitOwner.Team__c),&quot;Spartans&quot;)),
NOT(CONTAINS(TEXT(SplitOwner.Team__c),&quot;Candy Time&quot;)),
NOT(CONTAINS(TEXT(SplitOwner.Team__c),&quot;Finance&quot;)),
NOT(CONTAINS(TEXT(SplitOwner.Team__c),&quot;Xccelerators&quot;)),
NOT(CONTAINS(TEXT(SplitOwner.Team__c),&quot;The Hounds&quot;)),
NOT(CONTAINS(TEXT(SplitOwner.Team__c),&quot;SalesTeam6&quot;)),
NOT(CONTAINS(TEXT(SplitOwner.Team__c),&quot;The Bulldogs&quot;)),
NOT(CONTAINS(TEXT(SplitOwner.Team__c),&quot;Marketing&quot;)),
ISBLANK(Split_Owner_Team__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
