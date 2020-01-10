<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Change_Created_By_Role_Static</fullName>
        <field>Role_Created_By_Static__c</field>
        <formula>&quot;Enterprise Rep&quot;</formula>
        <name>Change Created By Role Static Ent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Created_By_Team_Static_Ent</fullName>
        <field>Team_Created_By_Static__c</field>
        <formula>TEXT(Owner:User.Team__c)</formula>
        <name>Change Created By Team Static Ent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Type_to_Internal_Task</fullName>
        <field>Type</field>
        <literalValue>Internal Task</literalValue>
        <name>Change Type to Internal Task</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Created_by_role_static_update</fullName>
        <field>Role_Created_By_Static__c</field>
        <formula>IF(AND(CONTAINS(LOWER(CreatedBy.UserRole.Name),&quot;business development rep&quot;),CONTAINS(LOWER(CreatedBy.UserRole.Name),&quot;key account&quot;)),&quot;Business Development Rep (Key Accounts)&quot;,
IF(AND(CONTAINS(LOWER(CreatedBy.UserRole.Name),&quot;business development rep&quot;),CONTAINS(LOWER(CreatedBy.UserRole.Name),&quot;channel&quot;)),&quot;Business Development Rep (Channel)&quot;,
IF(AND(CONTAINS(LOWER(CreatedBy.UserRole.Name),&quot;business development rep&quot;),CONTAINS(LOWER(CreatedBy.UserRole.Name),&quot;inbound&quot;)),&quot;Business Development Rep (Inbound)&quot;,
IF(CONTAINS(LOWER(CreatedBy.UserRole.Name),&quot;business development rep&quot;),&quot;Business Development Rep&quot;,
IF(AND(CONTAINS(LOWER(CreatedBy.UserRole.Name),&quot;sales development&quot;),CONTAINS(LOWER(CreatedBy.UserRole.Name),&quot;enterprise&quot;)),&quot;Sales Development Rep (Enterprise)&quot;,
IF(AND(CONTAINS(LOWER(CreatedBy.UserRole.Name),&quot;sales development&quot;),CONTAINS(LOWER(CreatedBy.UserRole.Name),&quot;global&quot;)),&quot;Sales Development Rep (Globals)&quot;,
IF(AND(CONTAINS(LOWER(CreatedBy.UserRole.Name),&quot;sales development rep&quot;),CONTAINS(LOWER(CreatedBy.UserRole.Name),&quot;commercial&quot;)),&quot;Commercial Sales Development Rep&quot;,
IF(AND(CONTAINS(LOWER(CreatedBy.UserRole.Name),&quot;sales development rep&quot;),CONTAINS(LOWER(CreatedBy.UserRole.Name),&quot;corporate&quot;)),&quot;Corporate Sales Development Rep&quot;,
IF(CONTAINS(LOWER(CreatedBy.UserRole.Name),&quot;sales development rep&quot;),&quot;Sales Development Rep&quot;,
IF(AND(CONTAINS(LOWER(CreatedBy.UserRole.Name),&quot;account executive&quot;),CONTAINS(LOWER(CreatedBy.UserRole.Name),&quot;corporate&quot;)),&quot;Corporate Account Executive&quot;,
IF(AND(CONTAINS(LOWER(CreatedBy.UserRole.Name),&quot;account executive&quot;),CONTAINS(LOWER(CreatedBy.UserRole.Name),&quot;commercial&quot;)),&quot;Commercial Account Executive&quot;,
IF(CONTAINS(LOWER(CreatedBy.UserRole.Name),&quot;account executive&quot;),&quot;Account Executive&quot;,
IF(CONTAINS(LOWER(CreatedBy.UserRole.Name),&quot;inside sales rep - enterprise&quot;),&quot;Sales Development Rep (Enterprise)&quot;,
IF(CONTAINS(LOWER(CreatedBy.UserRole.Name),&quot;inside sales rep&quot;),&quot;Inside Sales Rep (Commercial)&quot;,
IF(CONTAINS(LOWER(CreatedBy.UserRole.Name),&quot;bus driver&quot;),&quot;Bus Driver&quot;,
IF(CONTAINS(LOWER(CreatedBy.UserRole.Name),&quot;sales engineer&quot;),&quot;Sales Engineer&quot;,
IF(CONTAINS(LOWER(CreatedBy.UserRole.Name),&quot;enterprise rep&quot;),&quot;Enterprise Rep&quot;,
IF(CONTAINS(LOWER(CreatedBy.UserRole.Name),&quot;team lead&quot;),&quot;Team Lead&quot;,
CreatedBy.UserRole.Name))))))))))))))))))</formula>
        <name>Created by role (static) update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_Outcomes_with_Comments</fullName>
        <field>Outcomes__c</field>
        <formula>LEFT(Description,250)</formula>
        <name>Fill Outcomes with Comments</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Marketo_task_type</fullName>
        <field>Type</field>
        <literalValue>Marketo</literalValue>
        <name>Marketo task type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_comments_summary_field</fullName>
        <field>Outcomes__c</field>
        <formula>LEFT(Description,255)</formula>
        <name>Stamp comments summary field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
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
    <fieldUpdates>
        <fullName>Update_activity_type</fullName>
        <field>Activity_type_workflow__c</field>
        <formula>TEXT(Type)</formula>
        <name>Update activity type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Change Marketo task type</fullName>
        <actions>
            <name>Marketo_task_type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Task.OwnerId</field>
            <operation>equals</operation>
            <value>Marketo</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.CreatedById</field>
            <operation>equals</operation>
            <value>Marketo</value>
        </criteriaItems>
        <description>Change Marketo task type from default &quot;Call&quot;</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Change pre-demo task type</fullName>
        <actions>
            <name>Change_Type_to_Internal_Task</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Task.Subject</field>
            <operation>contains</operation>
            <value>Pre-demo,Post-demo</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Type</field>
            <operation>notEqual</operation>
            <value>Internal Task</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Create post-demo task</fullName>
        <actions>
            <name>Post_demo_activities</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <formula>AND(
OR(
ISPICKVAL(Type,&quot;Initial Demo&quot;),
ISPICKVAL(Type,&quot;Subsequent Demo&quot;)),
ISPICKVAL(Status,&quot;Completed&quot;),
$UserRole.Name&lt;&gt;&quot;VMT SF admin&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Create pre-demo task</fullName>
        <actions>
            <name>Pre_demo_activities</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <formula>AND(
OR(ISPICKVAL(Type,&quot;Initial Demo&quot;),
ISPICKVAL(Type,&quot;Subsequent Demo&quot;)),
$UserRole.Name&lt;&gt;&quot;VMT SF admin&quot;)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Fill Created Tasks</fullName>
        <actions>
            <name>Change_Created_By_Role_Static</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_Created_By_Team_Static_Ent</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(
OR(CONTAINS(Assigned_Team__c,&quot;Global&quot;),CONTAINS(Assigned_Team__c,&quot;Enterprise&quot;)),
CreatedBy.Full_Name__c=&quot;Justin Chang&quot;,
Role_Created_By_Static__c=&quot;VMT SF admin&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Fill in Activity Date%2FTime</fullName>
        <active>false</active>
        <formula>TRUE</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Email Comment Summary</fullName>
        <actions>
            <name>Stamp_comments_summary_field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>NOT(OR(ISPICKVAL(Type,&quot;EMAIL&quot;),ISPICKVAL(Type,&quot;Marketo&quot;)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp activity type</fullName>
        <actions>
            <name>Update_activity_type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Task.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Stamps activity type in the &quot;Activity type (workflow)&quot; field</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update created by role %28static%29</fullName>
        <actions>
            <name>Created_by_role_static_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>User.IsActive</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Update created by role at creation of task record</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update team %28assigned%29</fullName>
        <actions>
            <name>Team_assigned_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Update team task is assigned to until it is closed</description>
        <formula>OR( 
ISCHANGED(OwnerId), 
IsClosed=FALSE, 
AND(ISCHANGED(IsClosed),IsClosed=TRUE), 
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
        <description>Update team at creation of task record</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <tasks>
        <fullName>Post_demo_activities</fullName>
        <assignedToType>owner</assignedToType>
        <description>- Deliver case study/one-pager to reinforce key takeaways
- Summarize environment details &amp; deliver POV proposal revolving around key Value Driver uncovered &amp; validated by customer
- Document action items in an email and gain written confirmation</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Post-demo activities</subject>
    </tasks>
    <tasks>
        <fullName>Pre_demo_activities</fullName>
        <assignedToType>owner</assignedToType>
        <description>- Send summary email to attendees with agenda and goals (include VMT-related article)
- Prepare an industry- &amp; goal- related presentation that shows we have done our research (include customer example)</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Task.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Pre-demo activities</subject>
    </tasks>
</Workflow>
