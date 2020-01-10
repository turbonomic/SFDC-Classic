<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Alliance_Registration_Denial_Notification</fullName>
        <ccEmails>Charles_Geisler@bmc.com</ccEmails>
        <description>Alliance Registration Denial Notification</description>
        <protected>false</protected>
        <recipients>
            <field>Alliance_Partner_Rep_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Alliance_Reg_Status_Denied_Email</template>
    </alerts>
    <alerts>
        <fullName>Alliance_Registration_Next_Step_Update_Alert</fullName>
        <ccEmails>Charles_Geisler@bmc.com</ccEmails>
        <description>Alliance Registration Next Step Update Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Alliance_Partner_Rep_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Alliance_Reg_Next_Steps_Update</template>
    </alerts>
    <alerts>
        <fullName>Alliance_Registration_Status_Approved</fullName>
        <ccEmails>Charles_Geisler@bmc.com</ccEmails>
        <description>Alliance Registration Status Approved</description>
        <protected>false</protected>
        <recipients>
            <field>Alliance_Partner_Rep_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Alliance_Reg_Status_Approved_Email</template>
    </alerts>
    <alerts>
        <fullName>Alliance_Registration_Status_Change_Alert</fullName>
        <ccEmails>Charles_Geisler@bmc.com</ccEmails>
        <description>Alliance Registration Status Change Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Alliance_Partner_Rep_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Alliance_Reg_Status_Change_Email</template>
    </alerts>
    <alerts>
        <fullName>Alliance_Registration_Status_Closed_Email</fullName>
        <ccEmails>Charles_Geisler@bmc.com</ccEmails>
        <description>Alliance Registration Status Closed Email</description>
        <protected>false</protected>
        <recipients>
            <field>Alliance_Partner_Rep_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Alliance_Reg_Status_Closed_Email</template>
    </alerts>
    <alerts>
        <fullName>Alliance_Registration_Status_Pending_Email</fullName>
        <ccEmails>Charles_Geisler@bmc.com</ccEmails>
        <description>Alliance Registration Status Pending Email</description>
        <protected>false</protected>
        <recipients>
            <field>Alliance_Partner_Rep_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Alliance_Reg_Status_Pending_Email</template>
    </alerts>
    <alerts>
        <fullName>Alliance_Registration_Submission_Partner_Notification</fullName>
        <ccEmails>Charles_Geisler@bmc.com</ccEmails>
        <description>Alliance Registration Submission Partner Notification</description>
        <protected>false</protected>
        <recipients>
            <field>Alliance_Partner_Rep_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Alliance_Reg_Partner_Confirmation_Email_v2</template>
    </alerts>
    <alerts>
        <fullName>New_Alliance_Registration_Alert</fullName>
        <description>New Alliance Registration Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>allan.camhi@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>justin.kutticherry@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Alliance_Registration_Submit_v2</template>
    </alerts>
    <fieldUpdates>
        <fullName>Stamp_Approved_Date</fullName>
        <field>Approved_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Approved Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Approver</fullName>
        <field>Approved_By__c</field>
        <formula>$User.Full_Name__c</formula>
        <name>Stamp Approver</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Closed_Date</fullName>
        <field>Closed_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Closed Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Opp_Stage_at_Link</fullName>
        <field>Stage_of_Opportunity_when_Linked__c</field>
        <formula>TEXT(Opportunity__r.StageName)</formula>
        <name>Stamp Opp Stage at Link</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Alliance Reg Status Approved Email</fullName>
        <actions>
            <name>Alliance_Registration_Status_Approved</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>AND(
ISCHANGED(Registration_Status__c),
TEXT(Registration_Status__c)=&quot;Approved&quot;,
$User.Full_Name__c&lt;&gt;&quot;Gregory Dunn&quot;,
$UserRole.Name&lt;&gt;&quot;VMT SF admin&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Alliance Reg Status Change Email</fullName>
        <actions>
            <name>Alliance_Registration_Status_Change_Alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>AND(
ISCHANGED(Registration_Status__c),
TEXT(Registration_Status__c)&lt;&gt;&quot;Submitted&quot;,
TEXT(Registration_Status__c)&lt;&gt;&quot;Denied&quot;,
$User.Full_Name__c&lt;&gt;&quot;Gregory Dunn&quot;,
$UserRole.Name&lt;&gt;&quot;VMT SF admin&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Alliance Reg Status Closed Email</fullName>
        <actions>
            <name>Alliance_Registration_Status_Closed_Email</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>AND(
TEXT(Registration_Status__c)=&quot;Closed&quot;,
NOT(ISBLANK(Closed_Reason__c)))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Alliance Reg Status Denied Email</fullName>
        <actions>
            <name>Alliance_Registration_Denial_Notification</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>AND(
TEXT(Registration_Status__c)=&quot;Denied&quot;,
NOT(ISBLANK(Denial_Reason__c)))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Alliance Reg Status Pending Email</fullName>
        <actions>
            <name>Alliance_Registration_Status_Pending_Email</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>AND(
TEXT(Registration_Status__c)=&quot;Pending&quot;,
OR(
CreatedBy.Full_Name__c=&quot;Rest API User&quot;,
$UserRole.Name&lt;&gt;&quot;VMT SF admin&quot;
)
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>New Alliance Registration Alert</fullName>
        <actions>
            <name>Alliance_Registration_Submission_Partner_Notification</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>New_Alliance_Registration_Alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>OR(
CreatedBy.User_Role_Name__c&lt;&gt;&quot;VMT SF admin&quot;,
CreatedBy.Full_Name__c=&quot;Rest API User&quot;
)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Next Steps Updated Workflow</fullName>
        <actions>
            <name>Alliance_Registration_Next_Step_Update_Alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>AND(
ISCHANGED(Next_Steps__c),
$UserRole.Name&lt;&gt;&quot;VMT SF admin&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Approved Date</fullName>
        <actions>
            <name>Stamp_Approved_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Approver</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>TEXT(Registration_Status__c)=&quot;Incremental&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Closed Date</fullName>
        <actions>
            <name>Stamp_Closed_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
ISCHANGED(Registration_Status__c),
TEXT(Registration_Status__c)=&quot;Closed&quot;,
ISBLANK(Closed_Date__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Opp Stage at Link</fullName>
        <actions>
            <name>Stamp_Opp_Stage_at_Link</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Opportunity__r.Name&lt;&gt;&quot;Strategic Alliance Default Opportunity&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
