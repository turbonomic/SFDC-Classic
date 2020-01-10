<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Case_has_been_assigned_to_a_Queue_member</fullName>
        <description>Case has been assigned to a Queue member</description>
        <protected>false</protected>
        <recipients>
            <field>ContactId</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <recipient>charmian.mcintyre@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Case_Notifications/Case_Notification_of_Assignment_and_projected_completion</template>
    </alerts>
    <alerts>
        <fullName>Case_in_Review_Notification</fullName>
        <description>Case in Review Notification</description>
        <protected>false</protected>
        <recipients>
            <field>ContactId</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <recipient>charmian.mcintyre@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Case_Notifications/Case_Notification_of_Review_Status</template>
    </alerts>
    <alerts>
        <fullName>Case_solution_has_been_approved_by_the_Primary_Contact</fullName>
        <description>Case solution has been approved by the Primary Contact</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>charmian.mcintyre@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Case_Notifications/Case_Solution_Approved_by_Primary_contact</template>
    </alerts>
    <alerts>
        <fullName>New_User_has_been_provisioned</fullName>
        <ccEmails>newhire@vmturbo.com</ccEmails>
        <description>New User has been provisioned</description>
        <protected>false</protected>
        <recipients>
            <recipient>charmian.mcintyre@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Case_Notifications/Case_New_SF_User_Provisioned</template>
    </alerts>
    <alerts>
        <fullName>Salesforce_User_has_been_Deactivated</fullName>
        <ccEmails>terminations@vmturbo.com</ccEmails>
        <description>Salesforce User has been Deactivated</description>
        <protected>false</protected>
        <recipients>
            <recipient>charmian.mcintyre@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Case_Notifications/Case_SF_User_Removed</template>
    </alerts>
    <fieldUpdates>
        <fullName>Populate_Assigned_To</fullName>
        <description>if this is a New User case type then it should be assigned to Charmian</description>
        <field>Assigned_to__c</field>
        <lookupValue>charmian.mcintyre@vmturbo.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Populate Assigned To</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Populate_Delivery_Date</fullName>
        <description>Set the Delivery Date to the Start Date if the Case type is for a New User Setup - this information should reflect his value.</description>
        <field>Date_Delivered__c</field>
        <formula>New_User_Start_Date__c</formula>
        <name>Populate Delivery Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Populate_Go_Live_Date</fullName>
        <description>Clear out the Go-LiveDate if the Case type is for a New User Setup - this information is irrelevant for this case type.</description>
        <field>Go_Live_Date__c</field>
        <name>Populate Go-Live Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Populate_Review_Date</fullName>
        <description>Clear out the Review Date if the Case type is for a New User Setup - this information is irrelevant for this case type.</description>
        <field>Review_Date__c</field>
        <name>Populate Review Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Discover_Org_Count_Number</fullName>
        <field>Discover_Org_no__c</field>
        <formula>Discover_Org_Seats__c - 1</formula>
        <name>Update Discover Org Count Number</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status_to_Solution_Approved</fullName>
        <field>Status</field>
        <literalValue>Solution Approved</literalValue>
        <name>Update Status to &quot;Solution Approved&quot;</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Case Assignment and timline</fullName>
        <actions>
            <name>Case_has_been_assigned_to_a_Queue_member</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Assigned_to__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Case Field Populations</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.CaseNumber</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>A workflow to help auto populate case fields for the SF team</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Case In Review</fullName>
        <actions>
            <name>Case_in_Review_Notification</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>In Review</value>
        </criteriaItems>
        <description>A notification to be sent when the Case is updated to &quot;in Review&quot; status</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Case in %22Solution Approved%22</fullName>
        <actions>
            <name>Case_solution_has_been_approved_by_the_Primary_Contact</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_Status_to_Solution_Approved</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Solution_Approved__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Once the solution is approved the case will be moved into the Status of &quot;Solution Approved&quot; and the Case Owner will be notified.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Confirmation of User Provisioning</fullName>
        <actions>
            <name>New_User_has_been_provisioned</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Case_Type__c</field>
            <operation>equals</operation>
            <value>New User</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Provisioning_Complete__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>An Email is sent out to confirm that a new Turbo Employ has been set up in Sf et al</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>New User %2F Application Provisioning</fullName>
        <actions>
            <name>Populate_Assigned_To</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Populate_Delivery_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Populate_Go_Live_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Populate_Review_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>A_New_User_Name_Needs_Provisioning</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Provisioning_Complete__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>Closed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Type__c</field>
            <operation>equals</operation>
            <value>New User</value>
        </criteriaItems>
        <description>A WFR to generate a task to help maintain the list of active users in the third party apps</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Salesforce Role population</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.Case_Type__c</field>
            <operation>equals</operation>
            <value>New User</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>User Removed from Salesforce</fullName>
        <actions>
            <name>Salesforce_User_has_been_Deactivated</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Case_Type__c</field>
            <operation>equals</operation>
            <value>Termination</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Backlog</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Provisioning_Complete__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>An Email is sent out to confirm that a Turbo Employ has been removed from Sf et al</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>A_New_User_Name_Needs_Provisioning</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>-1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Case.New_User_Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>A New User Needs Provisioning</subject>
    </tasks>
</Workflow>
