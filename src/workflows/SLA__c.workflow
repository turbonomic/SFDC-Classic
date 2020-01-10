<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>MQL_Email</fullName>
        <description>MQL Email</description>
        <protected>false</protected>
        <recipients>
            <field>Lead_Contact_Owner_EMail__c</field>
            <type>email</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>MarketoEmailTemplates/MQL_Template</template>
    </alerts>
    <fieldUpdates>
        <fullName>Close_Dispositioned_SLA</fullName>
        <field>SLA_Status__c</field>
        <literalValue>Closed (Manually Dispositioned)</literalValue>
        <name>Close Dispositioned SLA</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Determine_EMEA_Territory</fullName>
        <field>EMEA_Territory__c</field>
        <literalValue>1</literalValue>
        <name>Determine EMEA Territory</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Determine_Hunchbacks_Territory</fullName>
        <field>Hunchbacks_Territory__c</field>
        <literalValue>1</literalValue>
        <name>Determine Hunchbacks Territory</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Determine_Wild_West_Territory</fullName>
        <field>Wild_West_Territory__c</field>
        <literalValue>1</literalValue>
        <name>Determine Wild West Territory</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_SLA_Disposition_Date2</fullName>
        <field>Close_Date__c</field>
        <formula>NOW()</formula>
        <name>Stamp SLA Disposition Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Unassigned_Closers_Club_Territory</fullName>
        <field>Closers_Club_Territory__c</field>
        <literalValue>1</literalValue>
        <name>Stamp Unassigned Closers Club Territory</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Unassigned_SEC_Territory</fullName>
        <field>SEC_Territory__c</field>
        <literalValue>1</literalValue>
        <name>Stamp Unassigned SEC Territory</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_WP_Download_Asset_Name</fullName>
        <description>Stamps the Latest WP Download Asset Name from the contact or lead when an SLA is created</description>
        <field>WP_Download_Asset_Name__c</field>
        <formula>IF(
NOT(ISBLANK(Contact__c)),
Contact__r.Latest_WP_Download_Asset_Name__c,
IF(
NOT(ISBLANK(Lead__c)),
Lead__r.Latest_WP_Download_Asset_Name__c,
&quot;&quot;
))</formula>
        <name>Stamp WP Download Asset Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Lead_Score_Delayed_Stamp</fullName>
        <description>Update Lead Score (Delayed Stamp) on the SLA</description>
        <field>Lead_Score_Delayed_Stamp__c</field>
        <formula>IF(NOT(ISBLANK(Contact__c)), 
      Contact__r.mkto_si__Mkto_Lead_Score__c , 
    IF(NOT(ISBLANK(Lead__c)),
      Lead__r.mkto71_Lead_Score__c ,
     Null)
)</formula>
        <name>Update Lead Score (Delayed Stamp)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Determine Closers Club Territory</fullName>
        <actions>
            <name>Stamp_Unassigned_Closers_Club_Territory</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(
Ops_IT_Budget__c&gt;=14,
Current_Lead_Contact_Owner__c=&quot;Stuart Horgan&quot;,
CASE(LOWER(Account_Billing_State__c),
&quot;connecticut&quot;,1,
&quot;massachusetts&quot;,1,
&quot;maryland&quot;,1,
&quot;maine&quot;,1,
&quot;michigan&quot;,1,
&quot;minnesota&quot;,1,
&quot;new hampshire&quot;,1,
&quot;new jersey&quot;,1,
&quot;new york&quot;,1,
&quot;ontario&quot;,1,
&quot;pennsylvania&quot;,1,
&quot;rhode island&quot;,1,
&quot;vermont&quot;,1,
&quot;wisconsin&quot;,1,
&quot;nova scotia&quot;,1,
&quot;quebec&quot;,1,
&quot;prince edward island&quot;,1,
&quot;new brunswick&quot;,1,
&quot;newfoundland&quot;,1,
0
)=1)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Determine EMEA Territory</fullName>
        <actions>
            <name>Determine_EMEA_Territory</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND( 
Ops_IT_Budget__c&gt;=14, 
Current_Lead_Contact_Owner__c=&quot;Ben Waller&quot;, 
CASE(LOWER(Account_Billing_Country__c), 
&quot;united kingdom&quot;,1, 
&quot;france&quot;,1, 
&quot;belgium&quot;,1, 
&quot;luxembourg&quot;,1, 
&quot;netherlands&quot;,1, 
&quot;the netherlands&quot;,1, 
&quot;nederlands&quot;,1, 
&quot;germany&quot;,1,
&quot;austria&quot;,1,
&quot;finland&quot;,1,
&quot;iceland&quot;,1,
&quot;switzerland&quot;,1,
&quot;sweden&quot;,1,
0 
)=1)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Determine Hunchbacks Territory</fullName>
        <actions>
            <name>Determine_Hunchbacks_Territory</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(
Ops_IT_Budget__c&gt;=14,
Current_Lead_Contact_Owner__c=&quot;Stuart Horgan&quot;,
CASE(LOWER(Account_Billing_State__c),
&quot;california&quot;,1,
&quot;alaska&quot;,1,
&quot;colorado&quot;,1,
&quot;hawaii&quot;,1,
&quot;nevada&quot;,1,
&quot;utah&quot;,1,
&quot;arizona&quot;,1,
0
)=1)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Determine SEC Territory</fullName>
        <actions>
            <name>Stamp_Unassigned_SEC_Territory</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(
Ops_IT_Budget__c&gt;=14,
Current_Lead_Contact_Owner__c=&quot;Stuart Horgan&quot;,
CASE(LOWER(Account_Billing_State__c),
&quot;alabama&quot;,1,
&quot;arkansas&quot;,1,
&quot;district of columbia&quot;,1,
&quot;delaware&quot;,1,
&quot;florida&quot;,1,
&quot;georgia&quot;,1,
&quot;kentucky&quot;,1,
&quot;missouri&quot;,1,
&quot;mississippi&quot;,1,
&quot;north carolina&quot;,1,
&quot;ohio&quot;,1,
&quot;puerto rico&quot;,1,
&quot;south carolina&quot;,1,
&quot;tennessee&quot;,1,
&quot;virginia&quot;,1,
&quot;west virginia&quot;,1,
0
)=1)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Determine Wild West Territory</fullName>
        <actions>
            <name>Determine_Wild_West_Territory</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(
Ops_IT_Budget__c&gt;=14,
Current_Lead_Contact_Owner__c=&quot;Stuart Horgan&quot;,
CASE(LOWER(Account_Billing_State__c),
&quot;illinois&quot;,1,
&quot;indiana&quot;,1,
&quot;iowa&quot;,1,
&quot;louisiana&quot;,1,
&quot;oklahoma&quot;,1,
&quot;oregon&quot;,1,
&quot;texas&quot;,1,
&quot;washington&quot;,1,
&quot;british columbia&quot;,1,
&quot;idaho&quot;,1,
&quot;manitoba&quot;,1,
&quot;nunuvut&quot;,1,
&quot;saskatchewan&quot;,1,
&quot;yukon territory&quot;,1,
&quot;northwest territories&quot;,1,
&quot;alberta&quot;,1,
&quot;wyoming&quot;,1,
&quot;kansas&quot;,1,
&quot;montana&quot;,1,
&quot;nebraska&quot;,1,
&quot;new mexico&quot;,1,
&quot;north dakota&quot;,1,
&quot;south dakota&quot;,1,
0
)=1)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>MQL Delayed Stamp on SLA Obj</fullName>
        <actions>
            <name>Update_Lead_Score_Delayed_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>MQL Delayed Stamp on SLA - 1 day after record creation</description>
        <formula>AND (
    ISBLANK(Lead_Score_Delayed_Stamp__c), 
    NOW() &gt;= CreatedDate + (24/24)
   )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>MQL Notification to Lead%2FContact Owner</fullName>
        <actions>
            <name>MQL_Email</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>SLA__c.Lead_Score_Stamped__c</field>
            <operation>greaterOrEqual</operation>
            <value>225</value>
        </criteriaItems>
        <criteriaItems>
            <field>SLA__c.Account_Territory_Owner__c</field>
            <operation>notEqual</operation>
            <value>NULL,Stuart Horgan,Tom Vieth,Charmian McIntyre,Eddie Genao,Dicken Chaplin</value>
        </criteriaItems>
        <description>Update Lead COntact Owner for new SLAs</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Manually Dispositioned SLA</fullName>
        <actions>
            <name>Close_Dispositioned_SLA</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_SLA_Disposition_Date2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Stamp Date/Time and close out SLA when an SLA is manually dispositioned</description>
        <formula>OR(
AND(
ISNEW(),
NOT(ISPICKVAL(Disposition_Reason_Manual__c,&quot;&quot;))),
ISCHANGED(Disposition_Reason_Manual__c)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp WP Download Asset Name</fullName>
        <actions>
            <name>Stamp_WP_Download_Asset_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Stamps the Latest WP Download Asset Name from the lead/contact upon SLA Creation</description>
        <formula>OR(
Web_Form_Fill__c=&quot;Inbound Whitepaper / e-Book&quot;,
Web_Form_Fill__c=&quot;WP&quot;
)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
