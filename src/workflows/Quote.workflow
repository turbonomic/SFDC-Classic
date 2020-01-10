<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Approved_Opportunity</fullName>
        <description>Approved Opportunity</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/opp_approval_email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Deals_Approval_Mail</fullName>
        <description>Channel Deals Approval Mail</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/opp_approval_email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Deals_Approval_Mail_2</fullName>
        <description>Channel Deals Approval Mail 2</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/opp_approval_email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Deals_Rejection_Email</fullName>
        <description>Channel Deals Rejection Email</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/opp_rejection_email</template>
    </alerts>
    <alerts>
        <fullName>New_Quote_Creation_Alert</fullName>
        <description>New Quote Creation Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>steve.rajcula@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Quote_Creation_Alert_Email</template>
    </alerts>
    <alerts>
        <fullName>New_Quote_Creation_Alert_Commerical</fullName>
        <description>New Quote Creation Alert Commerical</description>
        <protected>false</protected>
        <recipients>
            <recipient>ryan.faria@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>steve.rajcula@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Quote_Creation_Alert_Email</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_rejection</fullName>
        <description>Opportunity rejection</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/opp_rejection_email</template>
    </alerts>
    <alerts>
        <fullName>Quote_Note_Change</fullName>
        <description>Quote Note Change</description>
        <protected>false</protected>
        <recipients>
            <recipient>ryan.faria@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>steve.rajcula@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Quote_Note_Change</template>
    </alerts>
    <alerts>
        <fullName>Quote_Submissions_Response</fullName>
        <description>Quote Submissions Response</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Quote_Submission_Response_Email</template>
    </alerts>
    <alerts>
        <fullName>discount_approval_email_alert</fullName>
        <description>discount approval email alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>steve.rajcula@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/quote_approval_email</template>
    </alerts>
    <alerts>
        <fullName>registration_confirmation_Partner</fullName>
        <description>registration confirmation Partner</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/opp_registration_confirmation</template>
    </alerts>
    <fieldUpdates>
        <fullName>Add_Z_s_to_Email_Update_Stamp</fullName>
        <field>Email_Update_Stamp__c</field>
        <formula>Email_Update_Stamp__c&amp;&quot;ZZZ&quot;</formula>
        <name>Add Z&apos;s to Email Update Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>AssignMaintenanceTerms</fullName>
        <field>Maintenance_Terms__c</field>
        <formula>CASE(Deal_Structure__c , 
&quot;1YR Term License&quot;, &quot;Maintenance is included in the price of the term license&quot;,
&quot;Multi-Year Term License, Paid Annually&quot;, &quot;Maintenance is included in the price of the term license&quot;,
&quot;Multi-Year Term License, Paid Upfront&quot;, &quot;Maintenance is included in the price of the term license&quot;,
&quot;Perpetual&quot;, &quot;Maintenance in future years, if elected, will be billed at the same amount of annualized maintenance for the prior year + 3%.&quot;,
&quot;Services Only&quot;, &quot;Maintenance in future years, if elected, will be billed at the same amount of annualized maintenance for the prior year + 3%.&quot;,
&quot;Maintenance Renewal&quot;, &quot;Maintenance in future years, if elected, will be billed at the same amount of annualized maintenance for the prior year + 3%.&quot;,
&quot;&quot;)</formula>
        <name>Assign Maintenance Terms</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Quote_Approved</fullName>
        <field>Status</field>
        <literalValue>Approved</literalValue>
        <name>Quote Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Quote_Rejected</fullName>
        <field>Status</field>
        <literalValue>Rejected</literalValue>
        <name>Quote Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Registration_Expiration</fullName>
        <field>ExpirationDate</field>
        <formula>today()+90</formula>
        <name>Registration Expiration</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Registration_Expiration_update</fullName>
        <field>ExpirationDate</field>
        <formula>Today() + 90</formula>
        <name>Registration Expiration update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Registration_Status_update</fullName>
        <field>Status</field>
        <literalValue>Approved</literalValue>
        <name>Registration Status update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Registration_denied</fullName>
        <field>Status</field>
        <literalValue>Denied</literalValue>
        <name>Registration denied</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Quote_to_Approved</fullName>
        <field>Status</field>
        <literalValue>Approved</literalValue>
        <name>Update Quote to Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Quote_to_Rejected</fullName>
        <field>Status</field>
        <literalValue>Rejected</literalValue>
        <name>Update Quote to Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Quote_to_Submitted</fullName>
        <field>Status</field>
        <literalValue>Submitted</literalValue>
        <name>Update Quote to Submitted</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_exchange_rate_field</fullName>
        <field>Exchange_Rate__c</field>
        <formula>CASE(Currency__c,
&quot;US Dollars&quot;,NULL,
&quot;UK Pounds&quot;,0.70,
&quot;Euros&quot;,0.85,
NULL)</formula>
        <name>Update exchange rate field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Alert Finance of Commercial Quote Creation</fullName>
        <actions>
            <name>New_Quote_Creation_Alert_Commerical</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>AND(
CONTAINS(Owner_Team_Group_Buckets__c,&quot;Velocity&quot;),
Total_Sales_Price__c&gt;= 75000)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Alert Finance of Quote Creation</fullName>
        <actions>
            <name>New_Quote_Creation_Alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>AND(
NOT(CONTAINS(Opportunity.Owner_Team_Group_Buckets__c,&quot;Velocity&quot;)),
Total_Sales_Price__c&gt;= 75000)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Quote Note Change</fullName>
        <actions>
            <name>Quote_Note_Change</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>PRIORVALUE(Notes__c)&lt;&gt;Notes__c</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Translate Deal Structure to maintenance terms</fullName>
        <actions>
            <name>AssignMaintenanceTerms</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>This WFR/FU will be used to populate the Maintenance terms given a particular deal structure and allows for editing.</description>
        <formula>(DATEVALUE(CreatedDate) &gt;= DATE (2018,08,01))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update exchange rate</fullName>
        <actions>
            <name>Update_exchange_rate_field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Updates exchange rate field when currency field is changed</description>
        <formula>ISCHANGED(Currency__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
