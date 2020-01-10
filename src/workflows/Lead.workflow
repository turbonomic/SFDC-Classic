<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>LeadApprovedNotification</fullName>
        <ccEmails>PartnerDealRegistration@turbonomic.com</ccEmails>
        <description>LeadApprovedNotification</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Channel_Email_Templates/Deal_Registration_Approval</template>
    </alerts>
    <alerts>
        <fullName>LeadRejectionNotification</fullName>
        <ccEmails>PartnerDealRegistration@turbonomic.com</ccEmails>
        <description>LeadRejectionNotification</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>chris.gallamore@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>chris.williamson@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>daniel.charland@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>francois.guillaume@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>howard.masters@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jennifer.clark@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>melissa.lyons@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nick.saunders@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>patrick.mccreight@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>rick.razaq@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>suky.bains@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tracy.paugh@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>veronica.sera@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Channel_Email_Templates/Deal_Registration_Rejected</template>
    </alerts>
    <alerts>
        <fullName>New_Partner_Lead_Creation_Alert</fullName>
        <ccEmails>GlobalChannelsTeamInternal@turbonomic.com</ccEmails>
        <description>New Partner Lead Creation Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>Director_of_Channels</recipient>
            <type>roleSubordinatesInternal</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>unfiled$public/Channel_Lead_Creation_Alert</template>
    </alerts>
    <alerts>
        <fullName>Notification_for_Lead_Escalation</fullName>
        <description>Notification for Lead Escalation</description>
        <protected>false</protected>
        <recipients>
            <field>Lead_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>charmian.mcintyre@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>melissa.lyons@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Territory_Owner_Lead__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Channel_Email_Templates/RD_Approval</template>
    </alerts>
    <alerts>
        <fullName>Notification_for_Lead_Escalation_LATAM</fullName>
        <description>Notification for Lead Escalation_ LATAM</description>
        <protected>false</protected>
        <recipients>
            <field>Lead_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>melissa.lyons@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Territory_Owner_Lead__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Channel_Email_Templates/RD_Approval</template>
    </alerts>
    <alerts>
        <fullName>Notification_to_Queue_Partner_Desk_Lead</fullName>
        <description>Notification to Queue Partner Desk Lead</description>
        <protected>false</protected>
        <recipients>
            <recipient>melissa.lyons@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nadine.tardiff@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>steva.shea@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Channel_Email_Templates/Partner_Approval</template>
    </alerts>
    <alerts>
        <fullName>Notify_me_of_when_this_change_occurs</fullName>
        <description>Notify me of when this change occurs</description>
        <protected>false</protected>
        <recipients>
            <recipient>charmian.mcintyre@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>MarketoEmailTemplates/MKTO571</template>
    </alerts>
    <alerts>
        <fullName>Ops_Queue_Approval</fullName>
        <description>Ops Queue Approval</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dicken.chaplin@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>melissa.lyons@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nasser.bumpus@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>stuart.horgan@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tom.vieth@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Channel_Email_Templates/Ops_Partner_Queue</template>
    </alerts>
    <alerts>
        <fullName>Send_email_to_owner</fullName>
        <ccEmails>marketing@vmturbo.com</ccEmails>
        <description>Send email to account owner when new lead is created</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_Lead_Notification_3rd_Party_Downloader</template>
    </alerts>
    <fieldUpdates>
        <fullName>CFCR_Lead_Status_Last_Set_Now</fullName>
        <description>Set Status Last Set to NOW()</description>
        <field>CFCR_Status_Last_Set__c</field>
        <formula>NOW()</formula>
        <name>Lead Status Last Set = Now</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Capture_Lead_Score_Change_Date_Time</fullName>
        <field>Lead_Score_Modified__c</field>
        <formula>NOW()</formula>
        <name>Capture Lead Score Change Date/Time</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_lead_status_to_Prospect</fullName>
        <field>Status</field>
        <literalValue>Prospect</literalValue>
        <name>Change lead status to Prospect</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_state_abbreviations</fullName>
        <field>State</field>
        <formula>CASE(Upper(State),
&quot;AL&quot;, &quot;Alabama&quot;,
&quot;AK&quot;, &quot;Alaska&quot;,
&quot;AZ&quot;, &quot;Arizona&quot;,
&quot;AR&quot;, &quot;Arkansas&quot;,
&quot;CA&quot;, &quot;California&quot;,
&quot;CO&quot;, &quot;Colorado&quot;,
&quot;CT&quot;, &quot;Connecticut&quot;,
&quot;DE&quot;, &quot;Delaware&quot;,
&quot;DC&quot;, &quot;District of Columbia&quot;,
&quot;FL&quot;, &quot;Florida&quot;,
&quot;GA&quot;, &quot;Georgia&quot;,
&quot;HI&quot;, &quot;Hawaii&quot;,
&quot;ID&quot;, &quot;Idaho&quot;,
&quot;IL&quot;, &quot;Illinois&quot;,
&quot;IN&quot;, &quot;Indiana&quot;,
&quot;IA&quot;, &quot;Iowa&quot;,
&quot;KS&quot;, &quot;Kansas&quot;,
&quot;KY&quot;, &quot;Kentucky&quot;,
&quot;LA&quot;, &quot;Louisiana&quot;,
&quot;ME&quot;, &quot;Maine&quot;,
&quot;MD&quot;, &quot;Maryland&quot;,
&quot;MA&quot;, &quot;Massachusetts&quot;,
&quot;MI&quot;, &quot;Michigan&quot;,
&quot;MN&quot;, &quot;Minnesota&quot;,
&quot;MS&quot;, &quot;Mississippi&quot;,
&quot;MO&quot;, &quot;Missouri&quot;,
&quot;MT&quot;, &quot;Montana&quot;,
&quot;NE&quot;, &quot;Nebraska&quot;,
&quot;NV&quot;, &quot;Nevada&quot;,
&quot;NH&quot;, &quot;New Hampshire&quot;,
&quot;NJ&quot;, &quot;New Jersey&quot;,
&quot;NM&quot;, &quot;New Mexico&quot;,
&quot;NY&quot;, &quot;New York&quot;,
&quot;NC&quot;, &quot;North Carolina&quot;,
&quot;ND&quot;, &quot;North Dakota&quot;,
&quot;OH&quot;, &quot;Ohio&quot;,
&quot;OK&quot;, &quot;Oklahoma&quot;,
&quot;OR&quot;, &quot;Oregon&quot;,
&quot;PA&quot;, &quot;Pennsylvania&quot;,
&quot;RI&quot;, &quot;Rhode Island&quot;,
&quot;SC&quot;, &quot;South Carolina&quot;,
&quot;SD&quot;, &quot;South Dakota&quot;,
&quot;TN&quot;, &quot;Tennessee&quot;,
&quot;TX&quot;, &quot;Texas&quot;,
&quot;UT&quot;, &quot;Utah&quot;,
&quot;VT&quot;, &quot;Vermont&quot;,
&quot;VA&quot;, &quot;Virginia&quot;,
&quot;WA&quot;, &quot;Washington&quot;,
&quot;WV&quot;, &quot;West Virginia&quot;,
&quot;WI&quot;, &quot;Wisconsin&quot;,
&quot;WY&quot;, &quot;Wyoming&quot;,
&quot;AS&quot;, &quot;American Samoa&quot;,
&quot;GU&quot;, &quot;Guam&quot;,
&quot;MP&quot;, &quot;Mariana Islands&quot;,
&quot;PR&quot;, &quot;Puerto Rico&quot;,
&quot;VI&quot;, &quot;Virgin Islands&quot;,
&quot;FM&quot;, &quot;Micronesia&quot;,
&quot;MH&quot;, &quot;Marshall Islands&quot;,
&quot;PW&quot;, &quot;Palau&quot;,
&quot;CM&quot;, &quot;Mariana Islands&quot;,
&quot;AB&quot;, &quot;Alberta&quot;,
&quot;BC&quot;, &quot;British Columbia&quot;,
&quot;MB&quot;, &quot;Manitoba&quot;,
&quot;NB&quot;, &quot;New Brunswick&quot;,
&quot;NL&quot;, &quot;Newfoundland&quot;,
&quot;NT&quot;, &quot;Northwest Territorie&quot;,
&quot;NS&quot;, &quot;Nova Scotia&quot;,
&quot;NU&quot;, &quot;Nunavut&quot;,
&quot;ON&quot;, &quot;Ontario&quot;,
&quot;PE&quot;, &quot;Prince Edward Island&quot;,
&quot;QC&quot;, &quot;Quebec&quot;,
&quot;SK&quot;, &quot;Saskatchewan&quot;,
&quot;YT&quot;, &quot;Yukon Territory&quot;,
&quot;NA&quot;,&quot;&quot;,
&quot;N/A&quot;,&quot;&quot;,
&quot;NONE&quot;,&quot;&quot;,
State)</formula>
        <name>Change state abbreviations</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CheckReadyToLinkToAccount</fullName>
        <field>Ready_to_Link_to_Account__c</field>
        <literalValue>1</literalValue>
        <name>CheckReadyToLinkToAccount</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Prospect_Status_Date_field</fullName>
        <field>Prospect_Status_Date_for_aging__c</field>
        <formula>NULL</formula>
        <name>Clear Prospect Status Date field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Recent_Download_field</fullName>
        <field>Recent_Download__c</field>
        <name>Clear Recent Download field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Deal_Reg_Approval_Date</fullName>
        <description>This Field Update will update the Deal Reg Approval Date Field on Lead.</description>
        <field>Deal_reg_approval_date__c</field>
        <formula>DATEVALUE(NOW())</formula>
        <name>Deal Reg Approval Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Deal_Reg_Rejection_date</fullName>
        <description>The date that the registration was rejected by the team</description>
        <field>Deal_Reg_Rejection_date__c</field>
        <formula>DATEVALUE(NOW())</formula>
        <name>Deal Reg Rejection date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Deal_Reg_Start_Date</fullName>
        <description>Stamp of the Start date of the Deal Reg process to be used for escalation rules</description>
        <field>Deal_reg_start_date__c</field>
        <formula>DATEVALUE(NOW())</formula>
        <name>Deal Reg Start Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Deal_Type</fullName>
        <field>Deal_Type__c</field>
        <literalValue>Incremental</literalValue>
        <name>Deal Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Do_Not_Call_True</fullName>
        <field>DoNotCall</field>
        <literalValue>1</literalValue>
        <name>Do Not Call = True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Field_Update_for_TimeTrigger</fullName>
        <description>This Field is only used to trigger time based WF after initial submission for AE/SDR, to get RD approval if not approved in 24 hrs.</description>
        <field>LeadApprovalCheck__c</field>
        <literalValue>1</literalValue>
        <name>Field Update for TimeTrigger</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_in_Account_Phone</fullName>
        <description>Fill in Account Phone Number</description>
        <field>Account_Phone__c</field>
        <formula>Account__r.Phone</formula>
        <name>Fill in Account Phone</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_in_Country_if_State_is_Filled</fullName>
        <field>Country</field>
        <formula>CASE(UPPER( State ), 
&quot;OHIO&quot;,&quot;United States&quot;,
&quot;ONTARIO&quot;,&quot;United States&quot;,
&quot;ILLINOIS&quot;,&quot;United States&quot;,
&quot;INDIANA&quot;,&quot;United States&quot;,
&quot;MICHIGAN&quot;,&quot;United States&quot;,
&quot;MINNESOTA&quot;,&quot;United States&quot;,
&quot;WISCONSIN&quot;,&quot;United States&quot;,
&quot;MISSOURI&quot;,&quot;United States&quot;,
&quot;KANSAS&quot;,&quot;United States&quot;,
&quot;IOWA&quot;,&quot;United States&quot;,
&quot;OKLAHOMA&quot;,&quot;United States&quot;,
&quot;NEBRASKA&quot;,&quot;United States&quot;,
&quot;MANITOBA&quot;,&quot;Canada&quot;,
&quot;NORTH DAKOTA&quot;,&quot;United States&quot;,
&quot;SOUTH DAKOTA&quot;,&quot;United States&quot;,
&quot;NEW YORK&quot;,&quot;United States&quot;,
&quot;CONNECTICUT&quot;,&quot;United States&quot;,
&quot;PENNSYLVANIA&quot;,&quot;United States&quot;,
&quot;MASSACHUSETTS&quot;,&quot;United States&quot;,
&quot;NEW HAMPSHIRE&quot;,&quot;United States&quot;,
&quot;RHODE ISLAND&quot;,&quot;United States&quot;,
&quot;MAINE&quot;,&quot;United States&quot;,
&quot;VERMONT&quot;,&quot;United States&quot;,
&quot;NEW BRUNSWICK&quot;,&quot;Canada&quot;,
&quot;NOVA SCOTIA&quot;,&quot;Canada&quot;,
&quot;NEWFOUNDLAND&quot;,&quot;Canada&quot;,
&quot;PRINCE EDWARD ISLAND&quot;,&quot;Canada&quot;,
&quot;NEW JERSEY&quot;,&quot;United States&quot;,
&quot;QUEBEC&quot;,&quot;Canada&quot;,
&quot;VIRGINIA&quot;,&quot;United States&quot;,
&quot;NORTH CAROLINA&quot;,&quot;United States&quot;,
&quot;FLORIDA&quot;,&quot;United States&quot;,
&quot;ALABAMA&quot;,&quot;United States&quot;,
&quot;TENNESSEE&quot;,&quot;United States&quot;,
&quot;KENTUCKY&quot;,&quot;United States&quot;,
&quot;LOUISIANA&quot;,&quot;United States&quot;,
&quot;ARKANSAS&quot;,&quot;United States&quot;,
&quot;MISSISSIPPI&quot;,&quot;United States&quot;,
&quot;GEORGIA&quot;,&quot;United States&quot;,
&quot;SOUTH CAROLINA&quot;,&quot;United States&quot;,
&quot;PUERTO RICO&quot;,&quot;United States&quot;,
&quot;MARYLAND&quot;,&quot;United States&quot;,
&quot;DISTRICT OF COLUMBIA&quot;,&quot;United States&quot;,
&quot;DELAWARE&quot;,&quot;United States&quot;,
&quot;WEST VIRGINIA&quot;,&quot;United States&quot;,
&quot;TEXAS&quot;,&quot;United States&quot;,
&quot;COLORADO&quot;,&quot;United States&quot;,
&quot;ARIZONA&quot;,&quot;United States&quot;,
&quot;UTAH&quot;,&quot;United States&quot;,
&quot;NEVADA&quot;,&quot;United States&quot;,
&quot;NEW MEXICO&quot;,&quot;United States&quot;,
&quot;WASHINGTON&quot;,&quot;United States&quot;,
&quot;OREGON&quot;,&quot;United States&quot;,
&quot;BRITISH COLUMBIA&quot;,&quot;Canada&quot;,
&quot;ALBERTA&quot;,&quot;Canada&quot;,
&quot;HAWAII&quot;,&quot;United States&quot;,
&quot;IDAHO&quot;,&quot;United States&quot;,
&quot;MONTANA&quot;,&quot;United States&quot;,
&quot;ALASKA&quot;,&quot;United States&quot;,
&quot;SASKATCHEWAN&quot;,&quot;Canada&quot;,
&quot;WYOMING&quot;,&quot;United States&quot;,
&quot;NUNAVUT&quot;,&quot;Canada&quot;,
&quot;YUKON TERRITORY&quot;,&quot;Canada&quot;,
&quot;NORTHWEST TERRITORIES&quot;,&quot;Canada&quot;,
&quot;CALIFORNIA&quot;,&quot;United States&quot;,
&quot;OH&quot;,&quot;United States&quot;,
&quot;ON&quot;,&quot;Canada&quot;,
&quot;IL&quot;,&quot;United States&quot;,
&quot;IN&quot;,&quot;United States&quot;,
&quot;MI&quot;,&quot;United States&quot;,
&quot;MN&quot;,&quot;United States&quot;,
&quot;WI&quot;,&quot;United States&quot;,
&quot;MO&quot;,&quot;United States&quot;,
&quot;KS&quot;,&quot;United States&quot;,
&quot;IA&quot;,&quot;United States&quot;,
&quot;OK&quot;,&quot;United States&quot;,
&quot;NE&quot;,&quot;Jackie Mehrmann&quot;,
&quot;MB&quot;,&quot;Devin Cassinelli&quot;,
&quot;ND&quot;,&quot;Devin Cassinelli&quot;,
&quot;SD&quot;,&quot;Devin Cassinelli&quot;,
&quot;NY&quot;,&quot;United States&quot;,
&quot;CT&quot;,&quot;United States&quot;,
&quot;PA&quot;,&quot;United States&quot;,
&quot;MA&quot;,&quot;United States&quot;,
&quot;NH&quot;,&quot;United States&quot;,
&quot;RI&quot;,&quot;United States&quot;,
&quot;ME&quot;,&quot;United States&quot;,
&quot;VT&quot;,&quot;United States&quot;,
&quot;NB&quot;,&quot;Canada&quot;,
&quot;NS&quot;,&quot;Canada&quot;,
&quot;NF&quot;,&quot;Canada&quot;,
&quot;PE&quot;,&quot;Canada&quot;,
&quot;NJ&quot;,&quot;United States&quot;,
&quot;QC&quot;,&quot;Canada&quot;,
&quot;VA&quot;,&quot;United States&quot;,
&quot;NC&quot;,&quot;United States&quot;,
&quot;FL&quot;,&quot;United States&quot;,
&quot;AL&quot;,&quot;United States&quot;,
&quot;TN&quot;,&quot;United States&quot;,
&quot;KY&quot;,&quot;United States&quot;,
&quot;LA&quot;,&quot;United States&quot;,
&quot;AR&quot;,&quot;United States&quot;,
&quot;MS&quot;,&quot;United States&quot;,
&quot;GA&quot;,&quot;United States&quot;,
&quot;SC&quot;,&quot;United States&quot;,
&quot;PR&quot;,&quot;United States&quot;,
&quot;MD&quot;,&quot;United States&quot;,
&quot;DC&quot;,&quot;United States&quot;,
&quot;DE&quot;,&quot;United States&quot;,
&quot;WV&quot;,&quot;United States&quot;,
&quot;TX&quot;,&quot;United States&quot;,
&quot;CO&quot;,&quot;United States&quot;,
&quot;AZ&quot;,&quot;United States&quot;,
&quot;UT&quot;,&quot;United States&quot;,
&quot;NV&quot;,&quot;United States&quot;,
&quot;NM&quot;,&quot;United States&quot;,
&quot;WA&quot;,&quot;United States&quot;,
&quot;OR&quot;,&quot;United States&quot;,
&quot;BC&quot;,&quot;Canada&quot;,
&quot;AB&quot;,&quot;Canada&quot;,
&quot;HI&quot;,&quot;United States&quot;,
&quot;ID&quot;,&quot;United States&quot;,
&quot;MT&quot;,&quot;United States&quot;,
&quot;AK&quot;,&quot;United States&quot;,
&quot;SK&quot;,&quot;Canada&quot;,
&quot;WY&quot;,&quot;United States&quot;,
&quot;NU&quot;,&quot;Canada&quot;,
&quot;YT&quot;,&quot;Canada&quot;,
&quot;NT&quot;,&quot;Canada&quot;,
&quot;CA&quot;,&quot;United States&quot;,
&quot;&quot;)</formula>
        <name>Fill in Country if State is Filled</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_in_Customer_References</fullName>
        <field>Customer_References__c</field>
        <formula>Account__r.Customer_References__c</formula>
        <name>Fill in Customer References</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_in_Original_Lead_Owner</fullName>
        <field>Original_Lead_Owner__c</field>
        <formula>IF(CreatedBy.Full_Name__c&lt;&gt;&quot;Marketo&quot;,CreatedBy.Full_Name__c,
Owner:User.Full_Name__c)</formula>
        <name>Fill in Original Lead Owner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_in_Phone</fullName>
        <field>Phone</field>
        <formula>RF_Site_Phone__c</formula>
        <name>Fill in Phone</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_in_Use_Cases</fullName>
        <field>Use_Cases__c</field>
        <formula>Account__r.Use_Cases_Customers__c</formula>
        <name>Fill in Use Cases</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LATAM_Queue_Assignment</fullName>
        <description>Up[dates the lead owner to the LATAM Queue</description>
        <field>OwnerId</field>
        <lookupValue>LATAM_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>LATAM Queue Assignment</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LWFF_date_update</fullName>
        <field>Latest_Web_Form_Fill_Date__c</field>
        <formula>NOW()</formula>
        <name>LWFF date update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LWFF_update</fullName>
        <field>Latest_Web_Form_Fill__c</field>
        <formula>LEFT(Latest_Web_Form_Fill_Stamp__c,FIND(&quot;^&quot;,Latest_Web_Form_Fill_Stamp__c)-1)</formula>
        <name>LWFF update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LeadApprovalCheck</fullName>
        <field>LeadApprovalCheck__c</field>
        <literalValue>0</literalValue>
        <name>LeadApprovalCheck</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LeadRejectionCheck</fullName>
        <field>LeadApprovalCheck__c</field>
        <literalValue>0</literalValue>
        <name>LeadRejectionCheck</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_LWFF_stamp_date_time_append</fullName>
        <field>Latest_Web_Form_Fill_Stamp__c</field>
        <formula>Latest_Web_Form_Fill_Stamp__c&amp;&quot;^&quot;&amp;TEXT(NOW())</formula>
        <name>Lead LWFF stamp date/time append</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Owner</fullName>
        <field>OwnerId</field>
        <lookupValue>Ops_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Lead Owner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Owner_Static_Update</fullName>
        <field>Lead_Owner_static__c</field>
        <formula>Lead_Owner_static__c</formula>
        <name>Lead Owner Static Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Owner_to_AE</fullName>
        <field>OwnerId</field>
        <lookupValue>AE_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Lead Owner to AE</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Owner_to_Partner_Desk</fullName>
        <description>owner should be change back to partner desk</description>
        <field>OwnerId</field>
        <lookupValue>Partner_Desk</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Lead Owner to Partner Desk</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Region_Country_1_Update</fullName>
        <field>Lead_Region_Country_1__c</field>
        <formula>CASE(UPPER(Country_for_Assignment_Rules__c), 
&quot;CANADA&quot;, &quot;Canada&quot;, 
&quot;AUSTRALIA&quot;, &quot;ANZ&quot;, 
&quot;NEW ZEALAND&quot;, &quot;ANZ&quot;, 
&quot;CHINA&quot;, &quot;Asia Pac&quot;, 
&quot;INDIA&quot;, &quot;Asia Pac&quot;, 
&quot;INDONESIA&quot;, &quot;Asia Pac&quot;, 
&quot;JAPAN&quot;, &quot;Asia Pac&quot;, 
&quot;SOUTH KOREA&quot;, &quot;Asia Pac&quot;, 
&quot;NORTH KOREA&quot;, &quot;Asia Pac&quot;, 
&quot;PHILIPPINES&quot;, &quot;Asia Pac&quot;, 
&quot;SINGAPORE&quot;, &quot;Asia Pac&quot;, 
&quot;TAIWAN&quot;, &quot;Asia Pac&quot;, 
&quot;THAILAND&quot;, &quot;Asia Pac&quot;, 
&quot;VIETNAM&quot;, &quot;Asia Pac&quot;, 
&quot;BELGIUM&quot;, &quot;Benelux&quot;, 
&quot;LIECHTENSTEIN&quot;, &quot;DACH&quot;, 
&quot;LUXEMBOURG&quot;, &quot;Benelux&quot;, 
&quot;NETHERLANDS&quot;, &quot;Benelux&quot;, 
&quot;AUSTRIA&quot;, &quot;DACH&quot;, 
&quot;GERMANY&quot;, &quot;DACH&quot;, 
&quot;SWITZERLAND&quot;, &quot;DACH&quot;, 
&quot;ALBANIA&quot;, &quot;Eastern Europe&quot;, 
&quot;ARMENIA&quot;, &quot;Eastern Europe&quot;, 
&quot;BOSNIA HERZEGOVINA&quot;, &quot;Eastern Europe&quot;, 
&quot;BULGARIA&quot;, &quot;Eastern Europe&quot;, 
&quot;CROATIA&quot;, &quot;Eastern Europe&quot;, 
&quot;CZECH REPUBLIC&quot;, &quot;Eastern Europe&quot;, 
&quot;ESTONIA&quot;, &quot;Eastern Europe&quot;, 
&quot;GEORGIA&quot;, &quot;Eastern Europe&quot;, 
&quot;HUNGARY&quot;, &quot;Eastern Europe&quot;, 
&quot;LATVIA&quot;, &quot;Eastern Europe&quot;, 
&quot;LITHUANIA&quot;, &quot;Eastern Europe&quot;, 
&quot;MACEDONIA&quot;, &quot;Eastern Europe&quot;, 
&quot;MONTENEGRO&quot;, &quot;Eastern Europe&quot;, 
&quot;POLAND&quot;, &quot;Eastern Europe&quot;, 
&quot;ROMANIA&quot;, &quot;Eastern Europe&quot;, 
&quot;SERBIA&quot;, &quot;Eastern Europe&quot;, 
&quot;SLOVAKIA&quot;, &quot;Eastern Europe&quot;, 
&quot;SLOVENIA&quot;, &quot;Eastern Europe&quot;, 
&quot;FRANCE&quot;, &quot;France&quot;, 
&quot;ISRAEL&quot;, &quot;Israel&quot;, 
&quot;ARGENTINA&quot;, &quot;LATAM&quot;, 
&quot;BELIZE&quot;, &quot;LATAM&quot;, 
&quot;BOLIVIA&quot;, &quot;LATAM&quot;, 
&quot;BRAZIL&quot;, &quot;LATAM&quot;, 
&quot;CHILE&quot;, &quot;LATAM&quot;, 
&quot;COLOMBIA&quot;, &quot;LATAM&quot;, 
&quot;COSTA RICA&quot;, &quot;LATAM&quot;, 
&quot;CUBA&quot;, &quot;LATAM&quot;, 
&quot;DOMINICA&quot;, &quot;LATAM&quot;, 
&quot;DOMINICAN REPUBLIC&quot;, &quot;LATAM&quot;, 
&quot;ECUADOR&quot;, &quot;LATAM&quot;, 
&quot;EL SALVADOR&quot;, &quot;LATAM&quot;, 
&quot;GUATEMALA&quot;, &quot;LATAM&quot;, 
&quot;GUYANA&quot;, &quot;LATAM&quot;, 
&quot;HAITI&quot;, &quot;LATAM&quot;, 
&quot;HONDURAS&quot;, &quot;LATAM&quot;, 
&quot;JAMAICA&quot;, &quot;LATAM&quot;, 
&quot;MEXICO&quot;, &quot;LATAM&quot;, 
&quot;NICARAGUA&quot;, &quot;LATAM&quot;, 
&quot;PANAMA&quot;, &quot;LATAM&quot;, 
&quot;PARAGUAY&quot;, &quot;LATAM&quot;, 
&quot;PERU&quot;, &quot;LATAM&quot;, 
&quot;SURINAME&quot;, &quot;LATAM&quot;, 
&quot;URUGUAY&quot;, &quot;LATAM&quot;, 
&quot;VENEZUELA&quot;, &quot;LATAM&quot;, 
&quot;LESOTHO&quot;, &quot;Middle East/Africa&quot;, 
&quot;DENMARK&quot;, &quot;Nordics&quot;, 
&quot;FINLAND&quot;, &quot;Nordics&quot;, 
&quot;ICELAND&quot;, &quot;Nordics&quot;, 
&quot;NORWAY&quot;, &quot;Nordics&quot;, 
&quot;SWEDEN&quot;, &quot;Nordics&quot;, 
&quot;BELARUS&quot;, &quot;Russia &amp; CIS&quot;, 
&quot;KAZAKHSTAN&quot;, &quot;Russia &amp; CIS&quot;, 
&quot;MOLDOVA&quot;, &quot;Russia &amp; CIS&quot;, 
&quot;RUSSIA&quot;, &quot;Russia &amp; CIS&quot;, 
&quot;UKRAINE&quot;, &quot;Russia &amp; CIS&quot;, 
&quot;UZBEKISTAN&quot;, &quot;Russia &amp; CIS&quot;, 
&quot;SOUTH AFRICA&quot;, &quot;South Africa&quot;, 
&quot;ANDORRA&quot;, &quot;Southern Europe&quot;, 
&quot;CYPRUS&quot;, &quot;Southern Europe&quot;, 
&quot;GREECE&quot;, &quot;Southern Europe&quot;, 
&quot;ITALY&quot;, &quot;Southern Europe&quot;, 
&quot;KOSOVO&quot;, &quot;Southern Europe&quot;, 
&quot;MALTA&quot;, &quot;Southern Europe&quot;, 
&quot;MONACO&quot;, &quot;Southern Europe&quot;, 
&quot;PORTUGAL&quot;, &quot;Southern Europe&quot;, 
&quot;SAN MARINO&quot;, &quot;Southern Europe&quot;, 
&quot;SPAIN&quot;, &quot;Southern Europe&quot;, 
&quot;TURKEY&quot;, &quot;Southern Europe&quot;, 
&quot;VATICAN CITY&quot;, &quot;Southern Europe&quot;, 
&quot;UNITED KINGDOM&quot;, &quot;UK &amp; Ireland&quot;, 
&quot;UK&quot;, &quot;UK &amp; Ireland&quot;, 
&quot;IRELAND&quot;, &quot;UK &amp; Ireland&quot;, 
&quot;BANGLADESH&quot;, &quot;Asia Pac&quot;, 
&quot;BHUTAN&quot;, &quot;Asia Pac&quot;, 
&quot;BRUNEI&quot;, &quot;Asia Pac&quot;, 
&quot;CAMBODIA&quot;, &quot;Asia Pac&quot;, 
&quot;&quot;)</formula>
        <name>Lead Region (Country 1) Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Region_Country_2_Update</fullName>
        <field>Lead_Region_Country_2__c</field>
        <formula>CASE(UPPER(Country_for_Assignment_Rules__c), 
&quot;EAST TIMOR&quot;, &quot;Asia Pac&quot;, 
&quot;FIJI&quot;, &quot;Asia Pac&quot;, 
&quot;HONG KONG&quot;, &quot;Asia Pac&quot;, 
&quot;KIRIBATI&quot;, &quot;Asia Pac&quot;, 
&quot;KYRGYZSTAN&quot;, &quot;Asia Pac&quot;, 
&quot;LAOS&quot;, &quot;Asia Pac&quot;, 
&quot;MALAYSIA&quot;, &quot;Asia Pac&quot;, 
&quot;MALDIVES&quot;, &quot;Asia Pac&quot;, 
&quot;MARSHALL ISLANDS&quot;, &quot;Asia Pac&quot;, 
&quot;MICRONESIA&quot;, &quot;Asia Pac&quot;, 
&quot;MONGOLIA&quot;, &quot;Asia Pac&quot;, 
&quot;MYANMAR&quot;, &quot;Asia Pac&quot;, 
&quot;NAURU&quot;, &quot;Asia Pac&quot;, 
&quot;NEPAL&quot;, &quot;Asia Pac&quot;, 
&quot;PALAU&quot;, &quot;Asia Pac&quot;, 
&quot;PAPUA NEW GUINEA&quot;, &quot;Asia Pac&quot;, 
&quot;SAMOA&quot;, &quot;Asia Pac&quot;, 
&quot;SOLOMON ISLANDS&quot;, &quot;Asia Pac&quot;, 
&quot;SRI LANKA&quot;, &quot;Asia Pac&quot;, 
&quot;TAJIKISTAN&quot;, &quot;Asia Pac&quot;, 
&quot;TONGA&quot;, &quot;Asia Pac&quot;, 
&quot;TURKMENISTAN&quot;, &quot;Asia Pac&quot;, 
&quot;TUVALU&quot;, &quot;Asia Pac&quot;, 
&quot;VANUATU&quot;, &quot;Asia Pac&quot;, 
&quot;ANTIGUA&quot;, &quot;Caribbean Islands&quot;, 
&quot;BAHAMAS&quot;, &quot;Caribbean Islands&quot;, 
&quot;BARBADOS&quot;, &quot;Caribbean Islands&quot;, 
&quot;GRENADA&quot;, &quot;Caribbean Islands&quot;, 
&quot;ST KITTS &amp; NEVIS&quot;, &quot;Caribbean Islands&quot;, 
&quot;ST LUCIA&quot;, &quot;Caribbean Islands&quot;, 
&quot;SAINT VINCENT &amp; THE GRENADINES&quot;, &quot;Caribbean Islands&quot;, 
&quot;TRINIDAD &amp; TOBAGO&quot;, &quot;Caribbean Islands&quot;, 
&quot;VIRGIN ISLANDS&quot;, &quot;Caribbean Islands&quot;, 
&quot;AFGHANISTAN&quot;, &quot;Middle East/Africa&quot;, 
&quot;ALGERIA&quot;, &quot;Middle East/Africa&quot;, 
&quot;ANGOLA&quot;, &quot;Middle East/Africa&quot;, 
&quot;AZERBAIJAN&quot;, &quot;Middle East/Africa&quot;, 
&quot;BAHRAIN&quot;, &quot;Middle East/Africa&quot;, 
&quot;BENIN&quot;, &quot;Middle East/Africa&quot;, 
&quot;BOTSWANA&quot;, &quot;Middle East/Africa&quot;, 
&quot;BURKINA&quot;, &quot;Middle East/Africa&quot;, 
&quot;BURUNDI&quot;, &quot;Middle East/Africa&quot;, 
&quot;CAMEROON&quot;, &quot;Middle East/Africa&quot;, 
&quot;CAPE VERDE&quot;, &quot;Middle East/Africa&quot;, 
&quot;CENTRAL AFRICAN REP&quot;, &quot;Middle East/Africa&quot;, 
&quot;CHAD&quot;, &quot;Middle East/Africa&quot;, 
&quot;COMOROS&quot;, &quot;Middle East/Africa&quot;, 
&quot;CONGO&quot;, &quot;Middle East/Africa&quot;, 
&quot;DJIBOUTI&quot;, &quot;Middle East/Africa&quot;, 
&quot;EGYPT&quot;, &quot;Middle East/Africa&quot;, 
&quot;ERITREA&quot;, &quot;Middle East/Africa&quot;, 
&quot;ETHIOPIA&quot;, &quot;Middle East/Africa&quot;, 
&quot;GABON&quot;, &quot;Middle East/Africa&quot;, 
&quot;GAMBIA&quot;, &quot;Middle East/Africa&quot;, 
&quot;GHANA&quot;, &quot;Middle East/Africa&quot;, 
&quot;GUINEA&quot;, &quot;Middle East/Africa&quot;, 
&quot;IRAN&quot;, &quot;Middle East/Africa&quot;, 
&quot;IRAQ&quot;, &quot;Middle East/Africa&quot;, 
&quot;IVORY COAST&quot;, &quot;Middle East/Africa&quot;, 
&quot;JORDAN&quot;, &quot;Middle East/Africa&quot;, 
&quot;KENYA&quot;, &quot;Middle East/Africa&quot;, 
&quot;KUWAIT&quot;, &quot;Middle East/Africa&quot;, 
&quot;LEBANON&quot;, &quot;Middle East/Africa&quot;, 
&quot;LIBERIA&quot;, &quot;Middle East/Africa&quot;, 
&quot;LIBYA&quot;, &quot;Middle East/Africa&quot;, 
&quot;MADAGASCAR&quot;, &quot;Middle East/Africa&quot;, 
&quot;MALAWI&quot;, &quot;Middle East/Africa&quot;, 
&quot;MALI&quot;, &quot;Middle East/Africa&quot;, 
&quot;MAURITANIA&quot;, &quot;Middle East/Africa&quot;, 
&quot;MAURITIUS&quot;, &quot;Middle East/Africa&quot;, 
&quot;MOROCCO&quot;, &quot;Middle East/Africa&quot;, 
&quot;MOZAMBIQUE&quot;, &quot;Middle East/Africa&quot;, 
&quot;NAMIBIA&quot;, &quot;Middle East/Africa&quot;, 
&quot;NIGERIA&quot;, &quot;Middle East/Africa&quot;, 
&quot;OMAN&quot;, &quot;Middle East/Africa&quot;, 
&quot;PAKISTAN&quot;, &quot;Middle East/Africa&quot;, 
&quot;QATAR&quot;, &quot;Middle East/Africa&quot;, 
&quot;RWANDA&quot;, &quot;Middle East/Africa&quot;, 
&quot;SAO TOME &amp; PRINCIPE&quot;, &quot;Middle East/Africa&quot;, 
&quot;SAUDI ARABIA&quot;, &quot;Middle East/Africa&quot;, 
&quot;SENEGAL&quot;, &quot;Middle East/Africa&quot;, 
&quot;SEYCHELLES&quot;, &quot;Middle East/Africa&quot;, 
&quot;SIERRA LEONE&quot;, &quot;Middle East/Africa&quot;, 
&quot;SOMALIA&quot;, &quot;Middle East/Africa&quot;, 
&quot;SUDAN&quot;, &quot;Middle East/Africa&quot;, 
&quot;SWAZILAND&quot;, &quot;Middle East/Africa&quot;, 
&quot;SYRIA&quot;, &quot;Middle East/Africa&quot;, 
&quot;TANZANIA&quot;, &quot;Middle East/Africa&quot;, 
&quot;TOGO&quot;, &quot;Middle East/Africa&quot;, 
&quot;TUNISIA&quot;, &quot;Middle East/Africa&quot;, 
&quot;UGANDA&quot;, &quot;Middle East/Africa&quot;, 
&quot;UNITED ARAB EMIRATES&quot;, &quot;Middle East/Africa&quot;, 
&quot;YEMEN&quot;, &quot;Middle East/Africa&quot;, 
&quot;ZAMBIA&quot;, &quot;Middle East/Africa&quot;, 
&quot;ZIMBABWE&quot;, &quot;Middle East/Africa&quot;, 
&quot;&quot;)</formula>
        <name>Lead Region (Country 2) Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Region_State_Update</fullName>
        <field>Lead_Region_State__c</field>
        <formula>CASE(UPPER(State_For_Assignment_Rules__c), 
&quot;ALABAMA&quot;,&quot;Central/Mountain&quot;, 
&quot;ARIZONA&quot;,&quot;Central/Mountain&quot;, 
&quot;ARKANSAS&quot;,&quot;Central/Mountain&quot;, 
&quot;COLORADO&quot;,&quot;Central/Mountain&quot;, 
&quot;IDAHO&quot;,&quot;Central/Mountain&quot;, 
&quot;ILLINOIS&quot;,&quot;Central/Mountain&quot;, 
&quot;IOWA&quot;,&quot;Central/Mountain&quot;, 
&quot;KANSAS&quot;,&quot;Central/Mountain&quot;, 
&quot;LOUISIANA&quot;,&quot;Central/Mountain&quot;, 
&quot;MINNESOTA&quot;,&quot;Central/Mountain&quot;, 
&quot;MISSISSIPPI&quot;,&quot;Central/Mountain&quot;, 
&quot;MISSOURI&quot;,&quot;Central/Mountain&quot;, 
&quot;MONTANA&quot;,&quot;Central/Mountain&quot;, 
&quot;NEBRASKA&quot;,&quot;Central/Mountain&quot;, 
&quot;NEW MEXICO&quot;,&quot;Central/Mountain&quot;, 
&quot;NORTH DAKOTA&quot;,&quot;Central/Mountain&quot;, 
&quot;OKLAHOMA&quot;,&quot;Central/Mountain&quot;, 
&quot;SOUTH DAKOTA&quot;,&quot;Central/Mountain&quot;, 
&quot;TENNESSEE&quot;,&quot;Central/Mountain&quot;, 
&quot;TEXAS&quot;,&quot;Central/Mountain&quot;, 
&quot;UTAH&quot;,&quot;Central/Mountain&quot;, 
&quot;WISCONSIN&quot;,&quot;Central/Mountain&quot;, 
&quot;WYOMING&quot;,&quot;Central/Mountain&quot;, 
&quot;CONNECTICUT&quot;,&quot;Eastern&quot;, 
&quot;DELAWARE&quot;,&quot;Eastern&quot;, 
&quot;DISTRICT OF COLUMBIA&quot;,&quot;Eastern&quot;, 
&quot;FLORIDA&quot;,&quot;Eastern&quot;, 
&quot;GEORGIA&quot;,&quot;Eastern&quot;, 
&quot;INDIANA&quot;,&quot;Eastern&quot;, 
&quot;KENTUCKY&quot;,&quot;Eastern&quot;, 
&quot;MAINE&quot;,&quot;Eastern&quot;, 
&quot;MARYLAND&quot;,&quot;Eastern&quot;, 
&quot;MASSACHUSETTS&quot;,&quot;Eastern&quot;, 
&quot;MICHIGAN&quot;,&quot;Eastern&quot;, 
&quot;NEW HAMPSHIRE&quot;,&quot;Eastern&quot;, 
&quot;NEW JERSEY&quot;,&quot;Eastern&quot;, 
&quot;NEW YORK&quot;,&quot;Eastern&quot;, 
&quot;NORTH CAROLINA&quot;,&quot;Eastern&quot;, 
&quot;OHIO&quot;,&quot;Eastern&quot;, 
&quot;PENNSYLVANIA&quot;,&quot;Eastern&quot;, 
&quot;PUERTO RICO&quot;,&quot;Eastern&quot;, 
&quot;RHODE ISLAND&quot;,&quot;Eastern&quot;, 
&quot;SOUTH CAROLINA&quot;,&quot;Eastern&quot;, 
&quot;VERMONT&quot;,&quot;Eastern&quot;, 
&quot;VIRGINIA&quot;,&quot;Eastern&quot;, 
&quot;WEST VIRGINIA&quot;,&quot;Eastern&quot;, 
&quot;ALASKA&quot;,&quot;Pacific&quot;, 
&quot;CALIFORNIA&quot;,&quot;Pacific&quot;, 
&quot;HAWAII&quot;,&quot;Pacific&quot;, 
&quot;NEVADA&quot;,&quot;Pacific&quot;, 
&quot;OREGON&quot;,&quot;Pacific&quot;, 
&quot;WASHINGTON&quot;,&quot;Pacific&quot;, 
&quot;AL&quot;,&quot;Central/Mountain&quot;, 
&quot;AZ&quot;,&quot;Central/Mountain&quot;, 
&quot;AR&quot;,&quot;Central/Mountain&quot;, 
&quot;CO&quot;,&quot;Central/Mountain&quot;, 
&quot;ID&quot;,&quot;Central/Mountain&quot;, 
&quot;IL&quot;,&quot;Central/Mountain&quot;, 
&quot;IA&quot;,&quot;Central/Mountain&quot;, 
&quot;KS&quot;,&quot;Central/Mountain&quot;, 
&quot;LA&quot;,&quot;Central/Mountain&quot;, 
&quot;MN&quot;,&quot;Central/Mountain&quot;, 
&quot;MS&quot;,&quot;Central/Mountain&quot;, 
&quot;MO&quot;,&quot;Central/Mountain&quot;, 
&quot;MT&quot;,&quot;Central/Mountain&quot;, 
&quot;NE&quot;,&quot;Central/Mountain&quot;, 
&quot;NM&quot;,&quot;Central/Mountain&quot;, 
&quot;ND&quot;,&quot;Central/Mountain&quot;, 
&quot;OK&quot;,&quot;Central/Mountain&quot;, 
&quot;SD&quot;,&quot;Central/Mountain&quot;, 
&quot;TN&quot;,&quot;Central/Mountain&quot;, 
&quot;TX&quot;,&quot;Central/Mountain&quot;, 
&quot;UT&quot;,&quot;Central/Mountain&quot;, 
&quot;WI&quot;,&quot;Central/Mountain&quot;, 
&quot;WY&quot;,&quot;Central/Mountain&quot;, 
&quot;CT&quot;,&quot;Eastern&quot;, 
&quot;DE&quot;,&quot;Eastern&quot;, 
&quot;DC&quot;,&quot;Eastern&quot;, 
&quot;FL&quot;,&quot;Eastern&quot;, 
&quot;GA&quot;,&quot;Eastern&quot;, 
&quot;IN&quot;,&quot;Eastern&quot;, 
&quot;KY&quot;,&quot;Eastern&quot;, 
&quot;ME&quot;,&quot;Eastern&quot;, 
&quot;MD&quot;,&quot;Eastern&quot;, 
&quot;MA&quot;,&quot;Eastern&quot;, 
&quot;MI&quot;,&quot;Eastern&quot;, 
&quot;NH&quot;,&quot;Eastern&quot;, 
&quot;NJ&quot;,&quot;Eastern&quot;, 
&quot;NY&quot;,&quot;Eastern&quot;, 
&quot;NC&quot;,&quot;Eastern&quot;, 
&quot;OH&quot;,&quot;Eastern&quot;, 
&quot;PA&quot;,&quot;Eastern&quot;, 
&quot;PR&quot;,&quot;Eastern&quot;, 
&quot;RI&quot;,&quot;Eastern&quot;, 
&quot;SC&quot;,&quot;Eastern&quot;, 
&quot;VT&quot;,&quot;Eastern&quot;, 
&quot;VA&quot;,&quot;Eastern&quot;, 
&quot;WV&quot;,&quot;Eastern&quot;, 
&quot;AK&quot;,&quot;Pacific&quot;, 
&quot;CA&quot;,&quot;Pacific&quot;, 
&quot;HI&quot;,&quot;Pacific&quot;, 
&quot;NV&quot;,&quot;Pacific&quot;, 
&quot;OR&quot;,&quot;Pacific&quot;, 
&quot;WA&quot;,&quot;Pacific&quot;, 
&quot;&quot;)</formula>
        <name>Lead Region (State) Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_VisitTrack_Stamp_First_Campaign</fullName>
        <field>VisitTrack_First_Campaign__c</field>
        <formula>LEFT(
MID(Visit_Track_Original_Visit__c, 
MAX(FIND(&quot;&lt;tslp_campaign&gt;&quot;, Visit_Track_Original_Visit__c) + LEN(&quot;&lt;tslp_campaign&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/tslp_campaign&gt;&quot;, Visit_Track_Original_Visit__c) - FIND(&quot;&lt;tslp_campaign&gt;&quot;, Visit_Track_Original_Visit__c) -LEN(&quot;&lt;tslp_campaign&gt;&quot;),0) ), 80)</formula>
        <name>Lead - VisitTrack - Stamp First Campaign</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_VisitTrack_Stamp_First_LP</fullName>
        <field>VisitTrack_First_Landing_Page__c</field>
        <formula>LEFT(MID(Visit_Track_Original_Visit__c, 
MAX(FIND(&quot;&lt;tslp&gt;&quot;, Visit_Track_Original_Visit__c) + LEN(&quot;&lt;tslp&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/tslp&gt;&quot;, Visit_Track_Original_Visit__c) - FIND(&quot;&lt;tslp&gt;&quot;, Visit_Track_Original_Visit__c) -LEN(&quot;&lt;tslp&gt;&quot;),0) ),200)</formula>
        <name>Lead - VisitTrack - Stamp First LP</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_VisitTrack_Stamp_First_Medium</fullName>
        <field>VisitTrack_First_Medium__c</field>
        <formula>LEFT(MID(Visit_Track_Original_Visit__c, 
MAX(FIND(&quot;&lt;tslp_medium&gt;&quot;, Visit_Track_Original_Visit__c) + LEN(&quot;&lt;tslp_medium&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/tslp_medium&gt;&quot;, Visit_Track_Original_Visit__c) - FIND(&quot;&lt;tslp_medium&gt;&quot;, Visit_Track_Original_Visit__c) -LEN(&quot;&lt;tslp_medium&gt;&quot;),0) ), 80)</formula>
        <name>Lead - VisitTrack - Stamp First Medium</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_VisitTrack_Stamp_First_Referrer</fullName>
        <field>VisitTrack_First_Referrer__c</field>
        <formula>LEFT(MID(Visit_Track_Original_Visit__c, 
MAX(FIND(&quot;&lt;tsr&gt;&quot;, Visit_Track_Original_Visit__c) + LEN(&quot;&lt;tsr&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/tsr&gt;&quot;, Visit_Track_Original_Visit__c) - FIND(&quot;&lt;tsr&gt;&quot;, Visit_Track_Original_Visit__c) -LEN(&quot;&lt;tsr&gt;&quot;),0) ), 200)</formula>
        <name>Lead - VisitTrack - Stamp First Referrer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_VisitTrack_Stamp_First_Source</fullName>
        <field>VisitTrack_First_Source__c</field>
        <formula>LEFT(MID(Visit_Track_Original_Visit__c, 
MAX(FIND(&quot;&lt;tslp_source&gt;&quot;, Visit_Track_Original_Visit__c) + LEN(&quot;&lt;tslp_source&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/tslp_source&gt;&quot;, Visit_Track_Original_Visit__c) - FIND(&quot;&lt;tslp_source&gt;&quot;, Visit_Track_Original_Visit__c) -LEN(&quot;&lt;tslp_source&gt;&quot;),0) ),80)</formula>
        <name>Lead - VisitTrack - Stamp First Source</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_VisitTrack_Stamp_First_Term</fullName>
        <field>VisitTrack_First_Term__c</field>
        <formula>LEFT(MID(Visit_Track_Most_Recent_Visit__c, 
MAX(FIND(&quot;&lt;tslp_term&gt;&quot;, Visit_Track_Most_Recent_Visit__c) + LEN(&quot;&lt;tslp_term&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/tslp_term&gt;&quot;, Visit_Track_Most_Recent_Visit__c) - FIND(&quot;&lt;tslp_term&gt;&quot;, Visit_Track_Most_Recent_Visit__c) -LEN(&quot;&lt;tslp_term&gt;&quot;),0) ),80)</formula>
        <name>Lead - VisitTrack - Stamp First Term</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_VisitTrack_Stamp_MR_Campaign</fullName>
        <field>VisitTrack_Most_Recent_Campaign__c</field>
        <formula>LEFT(MID(Visit_Track_Most_Recent_Visit__c,
MAX(FIND(&quot;&lt;tslp_campaign&gt;&quot;, Visit_Track_Most_Recent_Visit__c) + LEN(&quot;&lt;tslp_campaign&gt;&quot;),1),
MAX(FIND(&quot;&lt;/tslp_campaign&gt;&quot;, Visit_Track_Most_Recent_Visit__c) - FIND(&quot;&lt;tslp_campaign&gt;&quot;, Visit_Track_Most_Recent_Visit__c) -LEN(&quot;&lt;tslp_campaign&gt;&quot;),0) ),80)</formula>
        <name>Lead - VisitTrack - Stamp MR Campaign</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_VisitTrack_Stamp_MR_LP</fullName>
        <field>VisitTrack_Most_Recent_Landing_Page__c</field>
        <formula>LEFT(MID(Visit_Track_Most_Recent_Visit__c, 
MAX(FIND(&quot;&lt;tslp&gt;&quot;, Visit_Track_Most_Recent_Visit__c) + LEN(&quot;&lt;tslp&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/tslp&gt;&quot;, Visit_Track_Most_Recent_Visit__c) - FIND(&quot;&lt;tslp&gt;&quot;, Visit_Track_Most_Recent_Visit__c) -LEN(&quot;&lt;tslp&gt;&quot;),0) ), 200)</formula>
        <name>Lead - VisitTrack - Stamp MR LP</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_VisitTrack_Stamp_MR_Medium</fullName>
        <field>VisitTrack_Most_Recent_Medium__c</field>
        <formula>LEFT(MID(Visit_Track_Most_Recent_Visit__c, 
MAX(FIND(&quot;&lt;tslp_medium&gt;&quot;, Visit_Track_Most_Recent_Visit__c) + LEN(&quot;&lt;tslp_medium&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/tslp_medium&gt;&quot;, Visit_Track_Most_Recent_Visit__c) - FIND(&quot;&lt;tslp_medium&gt;&quot;, Visit_Track_Most_Recent_Visit__c) -LEN(&quot;&lt;tslp_medium&gt;&quot;),0) ),80)</formula>
        <name>Lead - VisitTrack - Stamp MR Medium</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_VisitTrack_Stamp_MR_Referrer</fullName>
        <field>VisitTrack_Most_Recent_Referrer__c</field>
        <formula>LEFT(MID(Visit_Track_Most_Recent_Visit__c, 
MAX(FIND(&quot;&lt;tsr&gt;&quot;, Visit_Track_Most_Recent_Visit__c) + LEN(&quot;&lt;tsr&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/tsr&gt;&quot;, Visit_Track_Most_Recent_Visit__c) - FIND(&quot;&lt;tsr&gt;&quot;, Visit_Track_Most_Recent_Visit__c) -LEN(&quot;&lt;tsr&gt;&quot;),0) ),200)</formula>
        <name>Lead - VisitTrack - Stamp MR Referrer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_VisitTrack_Stamp_MR_Source</fullName>
        <field>VisitTrack_Most_Recent_Source__c</field>
        <formula>LEFT(MID(Visit_Track_Most_Recent_Visit__c, 
MAX(FIND(&quot;&lt;tslp_source&gt;&quot;, Visit_Track_Most_Recent_Visit__c) + LEN(&quot;&lt;tslp_source&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/tslp_source&gt;&quot;, Visit_Track_Most_Recent_Visit__c) - FIND(&quot;&lt;tslp_source&gt;&quot;, Visit_Track_Most_Recent_Visit__c) -LEN(&quot;&lt;tslp_source&gt;&quot;),0) ), 80)</formula>
        <name>Lead - VisitTrack - Stamp MR Source</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_VisitTrack_Stamp_MR_Term</fullName>
        <field>VisitTrack_Most_Recent_Term__c</field>
        <formula>LEFT(MID(Visit_Track_Most_Recent_Visit__c, 
MAX(FIND(&quot;&lt;tslp_term&gt;&quot;, Visit_Track_Most_Recent_Visit__c) + LEN(&quot;&lt;tslp_term&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/tslp_term&gt;&quot;, Visit_Track_Most_Recent_Visit__c) - FIND(&quot;&lt;tslp_term&gt;&quot;, Visit_Track_Most_Recent_Visit__c) -LEN(&quot;&lt;tslp_term&gt;&quot;),0) ), 80)</formula>
        <name>Lead - VisitTrack - Stamp MR Term</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_VisitTrack_Stamp_Orig_Campaign</fullName>
        <field>VisitTrack_Original_Campaign__c</field>
        <formula>LEFT(MID(Visit_Track_Most_Recent_Visit__c, 
MAX(FIND(&quot;&lt;oslp_campaign&gt;&quot;, Visit_Track_Most_Recent_Visit__c) + LEN(&quot;&lt;oslp_campaign&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/oslp_campaign&gt;&quot;, Visit_Track_Most_Recent_Visit__c) - FIND(&quot;&lt;oslp_campaign&gt;&quot;, Visit_Track_Most_Recent_Visit__c) -LEN(&quot;&lt;oslp_campaign&gt;&quot;),0) ), 80)</formula>
        <name>Lead - VisitTrack - Stamp Orig Campaign</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_VisitTrack_Stamp_Orig_LP</fullName>
        <field>VisitTrack_Original_Landing_Page__c</field>
        <formula>LEFT(MID(Visit_Track_Most_Recent_Visit__c, 
MAX(FIND(&quot;&lt;oslp&gt;&quot;, Visit_Track_Most_Recent_Visit__c) + LEN(&quot;&lt;oslp&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/oslp&gt;&quot;, Visit_Track_Most_Recent_Visit__c) - FIND(&quot;&lt;oslp&gt;&quot;, Visit_Track_Most_Recent_Visit__c) -LEN(&quot;&lt;oslp&gt;&quot;),0) ), 200)</formula>
        <name>Lead - VisitTrack - Stamp Orig LP</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_VisitTrack_Stamp_Orig_Medium</fullName>
        <field>VisitTrack_Original_Medium__c</field>
        <formula>LEFT(MID(Visit_Track_Most_Recent_Visit__c, 
MAX(FIND(&quot;&lt;oslp_medium&gt;&quot;, Visit_Track_Most_Recent_Visit__c) + LEN(&quot;&lt;oslp_medium&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/oslp_medium&gt;&quot;, Visit_Track_Most_Recent_Visit__c) - FIND(&quot;&lt;oslp_medium&gt;&quot;, Visit_Track_Most_Recent_Visit__c) -LEN(&quot;&lt;oslp_medium&gt;&quot;),0) ),80)</formula>
        <name>Lead - VisitTrack - Stamp Orig Medium</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_VisitTrack_Stamp_Orig_Referrer</fullName>
        <field>VisitTrack_Original_Referrer__c</field>
        <formula>LEFT(MID(Visit_Track_Most_Recent_Visit__c, 
MAX(FIND(&quot;&lt;osr&gt;&quot;, Visit_Track_Most_Recent_Visit__c) + LEN(&quot;&lt;osr&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/osr&gt;&quot;, Visit_Track_Most_Recent_Visit__c) - FIND(&quot;&lt;osr&gt;&quot;, Visit_Track_Most_Recent_Visit__c) -LEN(&quot;&lt;osr&gt;&quot;),0) ), 200)</formula>
        <name>Lead - VisitTrack - Stamp Orig Referrer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_VisitTrack_Stamp_Orig_Source</fullName>
        <field>VisitTrack_Original_Source__c</field>
        <formula>LEFT(MID(Visit_Track_Most_Recent_Visit__c, 
MAX(FIND(&quot;&lt;oslp_source&gt;&quot;, Visit_Track_Most_Recent_Visit__c) + LEN(&quot;&lt;oslp_source&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/oslp_source&gt;&quot;, Visit_Track_Most_Recent_Visit__c) - FIND(&quot;&lt;oslp_source&gt;&quot;, Visit_Track_Most_Recent_Visit__c) -LEN(&quot;&lt;oslp_source&gt;&quot;),0) ), 80)</formula>
        <name>Lead - VisitTrack - Stamp Orig Source</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_VisitTrack_Stamp_Orig_Term</fullName>
        <field>VisitTrack_Original_Term__c</field>
        <formula>LEFT(MID(Visit_Track_Most_Recent_Visit__c, 
MAX(FIND(&quot;&lt;oslp_term&gt;&quot;, Visit_Track_Most_Recent_Visit__c) + LEN(&quot;&lt;oslp_term&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/oslp_term&gt;&quot;, Visit_Track_Most_Recent_Visit__c) - FIND(&quot;&lt;oslp_term&gt;&quot;, Visit_Track_Most_Recent_Visit__c) -LEN(&quot;&lt;oslp_term&gt;&quot;),0) ), 80)</formula>
        <name>Lead - VisitTrack - Stamp Orig Term</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_VisitTrack_Stamp_Original_Visit</fullName>
        <description>Stamps Visit Track - Original Visit with correct information.</description>
        <field>Visit_Track_Original_Visit__c</field>
        <formula>Visit_Track_Most_Recent_Visit__c</formula>
        <name>Lead - VisitTrack - Stamp Original Visit</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_mobile_plus_sign</fullName>
        <field>MobilePhone</field>
        <formula>&quot;+&quot;&amp;MobilePhone</formula>
        <name>Lead mobile plus sign</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_phone_plus_sign</fullName>
        <field>Phone</field>
        <formula>&quot;+&quot;&amp;Phone</formula>
        <name>Lead phone plus sign</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_stamp_first_form_fill_date</fullName>
        <field>First_Web_Form_Fill_Date__c</field>
        <formula>NOW()</formula>
        <name>Lead stamp first form fill date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_stamp_first_free_activation_date</fullName>
        <field>First_Free_Version_Activation_Date__c</field>
        <formula>NOW()</formula>
        <name>Lead stamp first free activation date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_stamp_first_free_download_date</fullName>
        <field>First_Free_Version_Download_Date__c</field>
        <formula>NOW()</formula>
        <name>Lead stamp first free download date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_stamp_first_full_activation_date</fullName>
        <field>First_Full_Version_Activation_Date__c</field>
        <formula>NOW()</formula>
        <name>Lead stamp first full activation date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_stamp_first_full_download_date</fullName>
        <field>First_Full_Version_Download_Date__c</field>
        <formula>NOW()</formula>
        <name>Lead stamp first full download date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_stamp_latest_form_fill</fullName>
        <field>Latest_Web_Form_Fill__c</field>
        <formula>TEXT(Recent_Download__c)</formula>
        <name>Lead stamp latest form fill</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_stamp_latest_form_fill_date</fullName>
        <field>Latest_Web_Form_Fill_Date__c</field>
        <formula>Now()</formula>
        <name>Lead stamp latest form fill date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>MALatitude_c_Purge</fullName>
        <field>MALatitude__c</field>
        <name>Lead.MALatitude_c_Purge</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>MALatitudec_Purge</fullName>
        <description>Purge the MALatitude__c field on the Lead if selected address fields change; created by the Metadata API</description>
        <field>MALatitude__c</field>
        <name>MA MALatitude__c Purge</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>MALongitude_c_Purge</fullName>
        <field>MALongitude__c</field>
        <name>Lead.MALongitude_c_Purge</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>MALongitudec_Purge</fullName>
        <description>Purge the MALongitude__c field on the Lead if selected address fields change; created by the Metadata API</description>
        <field>MALongitude__c</field>
        <name>MA MALongitude__c Purge</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Make_Leadsource_RainKing</fullName>
        <field>LeadSource</field>
        <literalValue>Prospecting - RainKing</literalValue>
        <name>Make Leadsource RainKing</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Manager_Field_Update</fullName>
        <description>This Field Update is used to populate Territory owner&apos;s manager email address</description>
        <field>Lead_Manager_Email__c</field>
        <formula>Account__r.AE_Rep__r.Manager.Email /*Territory_Owner_Lead__r.Manager.Email*/</formula>
        <name>Manager Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Mark_No_Interest_Non_Responsive_Yes</fullName>
        <field>Marked_Non_Responsive_No_Interest__c</field>
        <formula>&quot;Yes&quot;</formula>
        <name>Mark No Interest/Non-Responsive Yes</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Original_Source_Info_Summary</fullName>
        <field>Original_Source_Info_Summary__c</field>
        <formula>LEFT(mkto71_Original_Source_Info__c,255)</formula>
        <name>Original Source Info Summary</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Partner_Assgn</fullName>
        <field>OwnerId</field>
        <lookupValue>Partner_Desk</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Partner Assgn</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Partner_Status_Rejected</fullName>
        <field>Partner_Status__c</field>
        <literalValue>Rejected</literalValue>
        <name>Partner Status Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Pull_phone_from_account</fullName>
        <field>Phone</field>
        <formula>Account__r.Phone</formula>
        <name>Pull phone from account</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>RD_Queue_Assignment</fullName>
        <field>OwnerId</field>
        <lookupValue>RD_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>RD Queue Assignment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Re_sync_to_Marketo</fullName>
        <field>Sync_To_Marketo__c</field>
        <literalValue>1</literalValue>
        <name>Re-sync to Marketo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Recycle_to_Prospect</fullName>
        <field>Status</field>
        <literalValue>Prospect</literalValue>
        <name>Recycle to Prospect</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Remove_Flags_from_Dispositioned_Leads</fullName>
        <field>Flag__c</field>
        <literalValue>0</literalValue>
        <name>Remove Flags from Dispositioned Leads</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Retrigger_Assignment_Rules</fullName>
        <field>Retrigger_Assignment_Rules__c</field>
        <literalValue>1</literalValue>
        <name>Retrigger Assignment Rules</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Country_to_Inferred_Country</fullName>
        <description>Updates Country to be the Inferred Country.</description>
        <field>Country</field>
        <formula>mkto71_Inferred_Country__c</formula>
        <name>Set Country to Inferred Country</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Email_Entered_to_FALSE</fullName>
        <field>Email_Has_Been_Entered__c</field>
        <literalValue>0</literalValue>
        <name>Set Email Entered to FALSE</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Email_Entered_to_TRUE</fullName>
        <field>Email_Has_Been_Entered__c</field>
        <literalValue>1</literalValue>
        <name>Set Email Entered to TRUE</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_State_to_Inferred_State</fullName>
        <description>Updates State to be the Inferred State / Region.</description>
        <field>State</field>
        <formula>mkto71_Inferred_State_Region__c</formula>
        <name>Set State to Inferred State</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Was_Prospect_to_True</fullName>
        <field>Was_Prospect__c</field>
        <literalValue>1</literalValue>
        <name>Set Was Prospect to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Setting1_to_Setting2</fullName>
        <field>Daily_Workflow_Picklist__c</field>
        <literalValue>Setting2</literalValue>
        <name>Setting1 to Setting2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Setting2_to_Setting1</fullName>
        <field>Daily_Workflow_Picklist__c</field>
        <literalValue>Setting1</literalValue>
        <name>Setting2 to Setting1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Source_equals_PRO_DiscoverOrg</fullName>
        <field>LeadSource</field>
        <literalValue>Prospecting - DiscoverOrg</literalValue>
        <name>Source equals &quot;PRO: DiscoverOrg&quot;</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Source_equals_PRO_RainKing</fullName>
        <field>LeadSource</field>
        <literalValue>PRO: RainKing</literalValue>
        <name>Source equals &quot;PRO: RainKing&quot;</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Source_equals_Prospecting_LinkedIn</fullName>
        <field>LeadSource</field>
        <literalValue>Prospecting - LinkedIn</literalValue>
        <name>Source equals &quot;Prospecting - LinkedIn&quot;</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Account_Safe_ID</fullName>
        <field>Stamped_Account_Safe_ID__c</field>
        <formula>Account__r.Account_Safe_ID__c</formula>
        <name>Stamp Account Safe ID</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Diamond_Add_Date</fullName>
        <field>Diamond_Add_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Diamond Add Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_DiscoverOrg_Company_Id</fullName>
        <field>DiscoverOrg_Company_ID_VMT__c</field>
        <formula>VALUE(DSCORGPKG__DiscoverOrg_Company_ID__c)</formula>
        <name>Stamp DiscoverOrg Company Id</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_DiscoverOrg_Employee_Id</fullName>
        <field>DiscoverOrg_Employee_ID_VMT__c</field>
        <formula>VALUE(DSCORGPKG__DiscoverOrg_ID__c)</formula>
        <name>Stamp DiscoverOrg Employee Id</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Inbound_Qualified_By</fullName>
        <field>Inbound_Qualified_By__c</field>
        <formula>$User.Full_Name__c</formula>
        <name>Stamp Inbound Qualified By</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Inbound_Qualified_Date</fullName>
        <field>Inbound_Qualified_Date_Stamp__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Inbound Qualified Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_MQL_date_time_leads</fullName>
        <field>MQL_Date_Time__c</field>
        <formula>NOW()</formula>
        <name>Stamp MQL date/time leads</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Original_Lead_Owner_Team</fullName>
        <field>Original_Inbound_Lead_Owner_Team_Static__c</field>
        <formula>TEXT(Original_Inbound_Lead_Owner__r.Team__c)</formula>
        <name>Stamp Original Lead Owner Team</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Sales_Region_of_Lead</fullName>
        <field>Sales_Region_for_lead__c</field>
        <formula>CASE(UPPER( State ), 
&quot;OHIO&quot;,&quot;Central&quot;, 
&quot;ONTARIO&quot;,&quot;East&quot;, 
&quot;ILLINOIS&quot;,&quot;Central&quot;, 
&quot;INDIANA&quot;,&quot;Central&quot;, 
&quot;MICHIGAN&quot;,&quot;East&quot;, 
&quot;MINNESOTA&quot;,&quot;East&quot;, 
&quot;WISCONSIN&quot;,&quot;East&quot;, 
&quot;MISSOURI&quot;,&quot;Central&quot;, 
&quot;KANSAS&quot;,&quot;West&quot;, 
&quot;IOWA&quot;,&quot;Central&quot;, 
&quot;OKLAHOMA&quot;,&quot;West&quot;, 
&quot;NEBRASKA&quot;,&quot;West&quot;, 
&quot;MANITOBA&quot;,&quot;West&quot;, 
&quot;NORTH DAKOTA&quot;,&quot;West&quot;, 
&quot;SOUTH DAKOTA&quot;,&quot;West&quot;, 
&quot;NEW YORK&quot;,&quot;East&quot;, 
&quot;CONNECTICUT&quot;,&quot;East&quot;, 
&quot;PENNSYLVANIA&quot;,&quot;East&quot;, 
&quot;MASSACHUSETTS&quot;,&quot;East&quot;, 
&quot;NEW HAMPSHIRE&quot;,&quot;East&quot;, 
&quot;RHODE ISLAND&quot;,&quot;East&quot;, 
&quot;MAINE&quot;,&quot;East&quot;, 
&quot;VERMONT&quot;,&quot;East&quot;, 
&quot;NEW BRUNSWICK&quot;,&quot;East&quot;, 
&quot;NOVA SCOTIA&quot;,&quot;East&quot;, 
&quot;NEWFOUNDLAND&quot;,&quot;East&quot;, 
&quot;PRINCE EDWARD ISLAND&quot;,&quot;East&quot;, 
&quot;NEW JERSEY&quot;,&quot;East&quot;, 
&quot;QUEBEC&quot;,&quot;East&quot;, 
&quot;VIRGINIA&quot;,&quot;Central&quot;, 
&quot;NORTH CAROLINA&quot;,&quot;Central&quot;, 
&quot;FLORIDA&quot;,&quot;Central&quot;, 
&quot;ALABAMA&quot;,&quot;Central&quot;, 
&quot;TENNESSEE&quot;,&quot;Central&quot;, 
&quot;KENTUCKY&quot;,&quot;Central&quot;, 
&quot;LOUISIANA&quot;,&quot;Central&quot;, 
&quot;ARKANSAS&quot;,&quot;Central&quot;, 
&quot;MISSISSIPPI&quot;,&quot;Central&quot;, 
&quot;GEORGIA&quot;,&quot;Central&quot;, 
&quot;SOUTH CAROLINA&quot;,&quot;Central&quot;, 
&quot;PUERTO RICO&quot;,&quot;Central&quot;, 
&quot;MARYLAND&quot;,&quot;East&quot;, 
&quot;DISTRICT OF COLUMBIA&quot;,&quot;Central&quot;, 
&quot;DELAWARE&quot;,&quot;Central&quot;, 
&quot;WEST VIRGINIA&quot;,&quot;Central&quot;, 
&quot;TEXAS&quot;,&quot;West&quot;, 
&quot;COLORADO&quot;,&quot;West&quot;, 
&quot;ARIZONA&quot;,&quot;West&quot;, 
&quot;UTAH&quot;,&quot;West&quot;, 
&quot;NEVADA&quot;,&quot;West&quot;, 
&quot;NEW MEXICO&quot;,&quot;West&quot;, 
&quot;WASHINGTON&quot;,&quot;West&quot;, 
&quot;OREGON&quot;,&quot;West&quot;, 
&quot;BRITISH COLUMBIA&quot;,&quot;West&quot;, 
&quot;ALBERTA&quot;,&quot;West&quot;, 
&quot;HAWAII&quot;,&quot;West&quot;, 
&quot;IDAHO&quot;,&quot;West&quot;, 
&quot;MONTANA&quot;,&quot;West&quot;, 
&quot;ALASKA&quot;,&quot;West&quot;, 
&quot;SASKATCHEWAN&quot;,&quot;West&quot;, 
&quot;WYOMING&quot;,&quot;West&quot;, 
&quot;NUNAVUT&quot;,&quot;West&quot;, 
&quot;YUKON TERRITORY&quot;,&quot;West&quot;, 
&quot;NORTHWEST TERRITORIES&quot;,&quot;West&quot;, 
&quot;CALIFORNIA&quot;,&quot;West&quot;, 
&quot;OH&quot;,&quot;Central&quot;, 
&quot;ON&quot;,&quot;East&quot;, 
&quot;IL&quot;,&quot;Central&quot;, 
&quot;IN&quot;,&quot;Central&quot;, 
&quot;MI&quot;,&quot;East&quot;, 
&quot;MN&quot;,&quot;East&quot;, 
&quot;WI&quot;,&quot;East&quot;, 
&quot;MO&quot;,&quot;Central&quot;, 
&quot;KS&quot;,&quot;West&quot;, 
&quot;IA&quot;,&quot;Central&quot;, 
&quot;OK&quot;,&quot;West&quot;, 
&quot;NE&quot;,&quot;West&quot;, 
&quot;MB&quot;,&quot;West&quot;, 
&quot;ND&quot;,&quot;West&quot;, 
&quot;SD&quot;,&quot;West&quot;, 
&quot;NY&quot;,&quot;East&quot;, 
&quot;CT&quot;,&quot;East&quot;, 
&quot;PA&quot;,&quot;East&quot;, 
&quot;MA&quot;,&quot;East&quot;, 
&quot;NH&quot;,&quot;East&quot;, 
&quot;RI&quot;,&quot;East&quot;, 
&quot;ME&quot;,&quot;East&quot;, 
&quot;VT&quot;,&quot;East&quot;, 
&quot;NB&quot;,&quot;East&quot;, 
&quot;NS&quot;,&quot;East&quot;, 
&quot;NF&quot;,&quot;East&quot;, 
&quot;PE&quot;,&quot;East&quot;, 
&quot;NJ&quot;,&quot;East&quot;, 
&quot;QC&quot;,&quot;East&quot;, 
&quot;VA&quot;,&quot;Central&quot;, 
&quot;NC&quot;,&quot;Central&quot;, 
&quot;FL&quot;,&quot;Central&quot;, 
&quot;AL&quot;,&quot;Central&quot;, 
&quot;TN&quot;,&quot;Central&quot;, 
&quot;KY&quot;,&quot;Central&quot;, 
&quot;LA&quot;,&quot;Central&quot;, 
&quot;AR&quot;,&quot;Central&quot;, 
&quot;MS&quot;,&quot;Central&quot;, 
&quot;GA&quot;,&quot;Central&quot;, 
&quot;SC&quot;,&quot;Central&quot;, 
&quot;PR&quot;,&quot;Central&quot;, 
&quot;MD&quot;,&quot;East&quot;, 
&quot;DC&quot;,&quot;Central&quot;, 
&quot;DE&quot;,&quot;Central&quot;, 
&quot;WV&quot;,&quot;Central&quot;, 
&quot;TX&quot;,&quot;West&quot;, 
&quot;CO&quot;,&quot;West&quot;, 
&quot;AZ&quot;,&quot;West&quot;, 
&quot;UT&quot;,&quot;West&quot;, 
&quot;NV&quot;,&quot;West&quot;, 
&quot;NM&quot;,&quot;West&quot;, 
&quot;WA&quot;,&quot;West&quot;, 
&quot;OR&quot;,&quot;West&quot;, 
&quot;BC&quot;,&quot;West&quot;, 
&quot;AB&quot;,&quot;West&quot;, 
&quot;HI&quot;,&quot;West&quot;, 
&quot;ID&quot;,&quot;West&quot;, 
&quot;MT&quot;,&quot;West&quot;, 
&quot;AK&quot;,&quot;West&quot;, 
&quot;SK&quot;,&quot;West&quot;, 
&quot;WY&quot;,&quot;West&quot;, 
&quot;NU&quot;,&quot;West&quot;, 
&quot;YT&quot;,&quot;West&quot;, 
&quot;NT&quot;,&quot;West&quot;, 
&quot;CA&quot;,&quot;West&quot;, 
&quot;&quot;)</formula>
        <name>Stamp Sales Region of Lead</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_prior_status</fullName>
        <field>Prior_Status__c</field>
        <formula>TEXT(PRIORVALUE(Status))</formula>
        <name>Stamp prior status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_rejuvenated_date_time_leads</fullName>
        <field>Rejuvenated_Date_Time__c</field>
        <formula>NOW()</formula>
        <name>Stamp rejuvenated date/time leads</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_status_change_date</fullName>
        <field>Status_Change_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp status change date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_Reason_Bad_Data</fullName>
        <field>CFCR_Status_Reason__c</field>
        <literalValue>Bad Data</literalValue>
        <name>Status Reason = Bad Data</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_Reason_Blank</fullName>
        <field>CFCR_Status_Reason__c</field>
        <name>Status Reason = Blank</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_equals_Bad_Data</fullName>
        <field>Status</field>
        <literalValue>Closed</literalValue>
        <name>Status equals Closed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Sync_Value_to_false</fullName>
        <field>Sync__c</field>
        <literalValue>0</literalValue>
        <name>Sync Value to false</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Sync_value_to_true</fullName>
        <field>Sync__c</field>
        <literalValue>1</literalValue>
        <name>Sync value to true</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Take_off_flag_lead</fullName>
        <field>Flag__c</field>
        <literalValue>0</literalValue>
        <name>Take off flag (lead)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Time_zone_update_lead</fullName>
        <field>Time_Zone__c</field>
        <formula>CASE(UPPER(State), 
&quot;ALASKA&quot;,&quot;Alaska&quot;, 
&quot;NEW BRUNSWICK&quot;,&quot;Atlantic&quot;, 
&quot;NEWFOUNDLAND&quot;,&quot;Atlantic&quot;, 
&quot;NOVA SCOTIA&quot;,&quot;Atlantic&quot;, 
&quot;PRINCE EDWARD ISLAND&quot;,&quot;Atlantic&quot;, 
&quot;ALABAMA&quot;,&quot;Central&quot;, 
&quot;ARKANSAS&quot;,&quot;Central&quot;, 
&quot;ILLINOIS&quot;,&quot;Central&quot;, 
&quot;IOWA&quot;,&quot;Central&quot;, 
&quot;KANSAS&quot;,&quot;Central&quot;, 
&quot;LOUISIANA&quot;,&quot;Central&quot;, 
&quot;MANITOBA&quot;,&quot;Central&quot;, 
&quot;MINNESOTA&quot;,&quot;Central&quot;, 
&quot;MISSISSIPPI&quot;,&quot;Central&quot;, 
&quot;MISSOURI&quot;,&quot;Central&quot;, 
&quot;NEBRASKA&quot;,&quot;Central&quot;, 
&quot;NORTH DAKOTA&quot;,&quot;Central&quot;, 
&quot;NUNAVUT&quot;,&quot;Central&quot;, 
&quot;OKLAHOMA&quot;,&quot;Central&quot;, 
&quot;SOUTH DAKOTA&quot;,&quot;Central&quot;, 
&quot;TENNESSEE&quot;,&quot;Central&quot;, 
&quot;TEXAS&quot;,&quot;Central&quot;, 
&quot;WISCONSIN&quot;,&quot;Central&quot;, 
&quot;CONNECTICUT&quot;,&quot;Eastern&quot;, 
&quot;DELAWARE&quot;,&quot;Eastern&quot;, 
&quot;DISTRICT OF COLUMBIA&quot;,&quot;Eastern&quot;, 
&quot;FLORIDA&quot;,&quot;Eastern&quot;, 
&quot;GEORGIA&quot;,&quot;Eastern&quot;, 
&quot;INDIANA&quot;,&quot;Eastern&quot;, 
&quot;KENTUCKY&quot;,&quot;Eastern&quot;, 
&quot;MAINE&quot;,&quot;Eastern&quot;, 
&quot;MARYLAND&quot;,&quot;Eastern&quot;, 
&quot;MASSACHUSETTS&quot;,&quot;Eastern&quot;, 
&quot;MICHIGAN&quot;,&quot;Eastern&quot;, 
&quot;NEW HAMPSHIRE&quot;,&quot;Eastern&quot;, 
&quot;NEW JERSEY&quot;,&quot;Eastern&quot;, 
&quot;NEW YORK&quot;,&quot;Eastern&quot;, 
&quot;NORTH CAROLINA&quot;,&quot;Eastern&quot;, 
&quot;OHIO&quot;,&quot;Eastern&quot;, 
&quot;ONTARIO&quot;,&quot;Eastern&quot;, 
&quot;PENNSYLVANIA&quot;,&quot;Eastern&quot;, 
&quot;PUERTO RICO&quot;,&quot;Eastern&quot;, 
&quot;QUEBEC&quot;,&quot;Eastern&quot;, 
&quot;RHODE ISLAND&quot;,&quot;Eastern&quot;, 
&quot;SOUTH CAROLINA&quot;,&quot;Eastern&quot;, 
&quot;VERMONT&quot;,&quot;Eastern&quot;, 
&quot;VIRGINIA&quot;,&quot;Eastern&quot;, 
&quot;WEST VIRGINIA&quot;,&quot;Eastern&quot;, 
&quot;HAWAII&quot;,&quot;Hawaii&quot;, 
&quot;ALBERTA&quot;,&quot;Mountain&quot;, 
&quot;ARIZONA&quot;,&quot;Mountain&quot;, 
&quot;COLORADO&quot;,&quot;Mountain&quot;, 
&quot;IDAHO&quot;,&quot;Mountain&quot;, 
&quot;MONTANA&quot;,&quot;Mountain&quot;, 
&quot;NEW MEXICO&quot;,&quot;Mountain&quot;, 
&quot;NORTHWEST TERRITORIE&quot;,&quot;Mountain&quot;, 
&quot;SASKATCHEWAN&quot;,&quot;Mountain&quot;, 
&quot;UTAH&quot;,&quot;Mountain&quot;, 
&quot;WYOMING&quot;,&quot;Mountain&quot;, 
&quot;BRITISH COLUMBIA&quot;,&quot;Pacific&quot;, 
&quot;CALIFORNIA&quot;,&quot;Pacific&quot;, 
&quot;NEVADA&quot;,&quot;Pacific&quot;, 
&quot;OREGON&quot;,&quot;Pacific&quot;, 
&quot;WASHINGTON&quot;,&quot;Pacific&quot;, 
&quot;YUKON TERRITORY&quot;,&quot;Pacific&quot;, 
&quot;AK&quot;,&quot;Alaska&quot;, 
&quot;NB&quot;,&quot;Atlantic&quot;, 
&quot;NF&quot;,&quot;Atlantic&quot;, 
&quot;NS&quot;,&quot;Atlantic&quot;, 
&quot;PE&quot;,&quot;Atlantic&quot;, 
&quot;AL&quot;,&quot;Central&quot;, 
&quot;AR&quot;,&quot;Central&quot;, 
&quot;IL&quot;,&quot;Central&quot;, 
&quot;IA&quot;,&quot;Central&quot;, 
&quot;KS&quot;,&quot;Central&quot;, 
&quot;LA&quot;,&quot;Central&quot;, 
&quot;MB&quot;,&quot;Central&quot;, 
&quot;MN&quot;,&quot;Central&quot;, 
&quot;MS&quot;,&quot;Central&quot;, 
&quot;MO&quot;,&quot;Central&quot;, 
&quot;NE&quot;,&quot;Central&quot;, 
&quot;ND&quot;,&quot;Central&quot;, 
&quot;NU&quot;,&quot;Central&quot;, 
&quot;OK&quot;,&quot;Central&quot;, 
&quot;SD&quot;,&quot;Central&quot;, 
&quot;TN&quot;,&quot;Central&quot;, 
&quot;TX&quot;,&quot;Central&quot;, 
&quot;WI&quot;,&quot;Central&quot;, 
&quot;CT&quot;,&quot;Eastern&quot;, 
&quot;DE&quot;,&quot;Eastern&quot;, 
&quot;DC&quot;,&quot;Eastern&quot;, 
&quot;FL&quot;,&quot;Eastern&quot;, 
&quot;GA&quot;,&quot;Eastern&quot;, 
&quot;IN&quot;,&quot;Eastern&quot;, 
&quot;KY&quot;,&quot;Eastern&quot;, 
&quot;ME&quot;,&quot;Eastern&quot;, 
&quot;MD&quot;,&quot;Eastern&quot;, 
&quot;MA&quot;,&quot;Eastern&quot;, 
&quot;MI&quot;,&quot;Eastern&quot;, 
&quot;NH&quot;,&quot;Eastern&quot;, 
&quot;NJ&quot;,&quot;Eastern&quot;, 
&quot;NY&quot;,&quot;Eastern&quot;, 
&quot;NC&quot;,&quot;Eastern&quot;, 
&quot;OH&quot;,&quot;Eastern&quot;, 
&quot;ON&quot;,&quot;Eastern&quot;, 
&quot;PA&quot;,&quot;Eastern&quot;, 
&quot;PR&quot;,&quot;Eastern&quot;, 
&quot;QC&quot;,&quot;Eastern&quot;, 
&quot;RI&quot;,&quot;Eastern&quot;, 
&quot;SC&quot;,&quot;Eastern&quot;, 
&quot;VT&quot;,&quot;Eastern&quot;, 
&quot;VA&quot;,&quot;Eastern&quot;, 
&quot;WV&quot;,&quot;Eastern&quot;, 
&quot;HI&quot;,&quot;Hawaii&quot;, 
&quot;AB&quot;,&quot;Mountain&quot;, 
&quot;AZ&quot;,&quot;Mountain&quot;, 
&quot;CO&quot;,&quot;Mountain&quot;, 
&quot;ID&quot;,&quot;Mountain&quot;, 
&quot;MT&quot;,&quot;Mountain&quot;, 
&quot;NM&quot;,&quot;Mountain&quot;, 
&quot;NT&quot;,&quot;Mountain&quot;, 
&quot;SK&quot;,&quot;Mountain&quot;, 
&quot;UT&quot;,&quot;Mountain&quot;, 
&quot;WY&quot;,&quot;Mountain&quot;, 
&quot;BC&quot;,&quot;Pacific&quot;, 
&quot;CA&quot;,&quot;Pacific&quot;, 
&quot;NV&quot;,&quot;Pacific&quot;, 
&quot;OR&quot;,&quot;Pacific&quot;, 
&quot;WA&quot;,&quot;Pacific&quot;, 
&quot;YT&quot;,&quot;Pacific&quot;, 
Account__r.Time_Zone__c)</formula>
        <name>Time zone update (lead)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Title_Score_update</fullName>
        <description>MAKE SURE YOU UPDATE THE CONTACT TITLE SCORE FIELD UPDATE TOO</description>
        <field>Title_Score__c</field>
        <formula>min(
max(
if(find(&quot;MANAGER&quot;,upper(Title))&gt;0,2,0) +
if(find(&quot;DIRECTOR&quot;,upper(Title))&gt;0,2,0) +
if(or(find(&quot;CIO&quot;,upper(Title))&gt;0,find(&quot;CHIEF INFORMATION OFFICER&quot;,upper(Title))&gt;0),2,0) +
if(or(find(&quot;VP&quot;,upper(Title))&gt;0,find(&quot;VICE PRESIDENT&quot;,upper(Title))&gt;0),2,0) +
if(find(&quot;ARCHITECT&quot;,upper(Title))&gt;0,2,0) +
if(find(&quot;ENGINEER&quot;,upper(Title))&gt;0,2,0) +
if(find(&quot;MIS&quot;,upper(Title))&gt;0,2,0) +
if(find(&quot;ADMIN&quot;,upper(Title))&gt;0,1,0) +
if(or(find(&quot;OPS&quot;,upper(Title))&gt;0,find(&quot;OPERATIONS&quot;,upper(Title))&gt;0),2,0) +
if(find(&quot;SERVER&quot;,upper(Title))&gt;0,2,0) +
if(find(&quot;NETWORK&quot;,upper(Title))&gt;0,2,0) +
if(find(&quot;INFRASTRUCTURE&quot;,upper(Title))&gt;0,2,0) +
if(find(&quot;VIRTUAL&quot;,upper(Title))&gt;0,10,0) +
if(find(&quot;VMWARE&quot;,upper(Title))&gt;0,10,0) +
if(find(&quot;APP&quot;,upper(Title))&gt;0,-10,0) +
if(find(&quot;SECURITY&quot;,upper(Title))&gt;0,-10,0) +
if(find(&quot;HELP DESK&quot;,upper(Title))&gt;0,-10,0) +
if(find(&quot;SUPPORT&quot;,upper(Title))&gt;0,-10,0) +
if(find(&quot;TELECOM&quot;,upper(Title))&gt;0,-10,0),
-10),
12)</formula>
        <name>Title Score update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Unsync_from_Marketo</fullName>
        <field>Sync_To_Marketo__c</field>
        <literalValue>0</literalValue>
        <name>Unsync from Marketo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_EULA_Acceptance_Date</fullName>
        <field>EULA_Acceptance_Date__c</field>
        <formula>NOW()</formula>
        <name>Update EULA Acceptance Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Email_Bounce_When_Email_Changed</fullName>
        <field>Email_Bounce__c</field>
        <literalValue>No</literalValue>
        <name>Update Email Bounce When Email Changed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Partner_Approval_Trigger_Date</fullName>
        <description>Updating the Partner Approval Trigger date to allow this rule to run daily until criteria is no longer met</description>
        <field>Partner_Approval_Trigger_Date__c</field>
        <formula>TODAY ()</formula>
        <name>Update Partner Approval Trigger Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Prospect_Status_Date_field</fullName>
        <field>Prospect_Status_Date_for_aging__c</field>
        <formula>TODAY()</formula>
        <name>Update Prospect Status Date field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_company_with_account_name</fullName>
        <field>Company</field>
        <formula>Account__r.Name</formula>
        <name>Update company with account name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_country</fullName>
        <field>Country</field>
        <formula>case(upper(Country),
&quot;AMERICA&quot;, &quot;United States&quot;,
&quot;U.S.A.&quot;, &quot;United States&quot;,
&quot;U.S.A&quot;, &quot;United States&quot;,
&quot;U.S.&quot;, &quot;United States&quot;,
&quot;UNITED STAES&quot;, &quot;United States&quot;,
&quot;UNITED STATES OF AMERICA&quot;, &quot;United States&quot;,
&quot;UNITED STATES&quot;, &quot;United States&quot;,
&quot;UNITED STATE&quot;, &quot;United States&quot;,
&quot;UNITED STA&quot;, &quot;United States&quot;,
&quot;UNITES STATES&quot;, &quot;United States&quot;,
&quot;USA!&quot;, &quot;United States&quot;,
&quot;USAA&quot;, &quot;United States&quot;,
&quot;USA&quot;, &quot;United States&quot;,
&quot;US&quot;, &quot;United States&quot;,
&quot;ENGLAND&quot;, &quot;United Kingdom&quot;,
&quot;GREAT BRITAIN (UK)&quot;, &quot;United Kingdom&quot;,
&quot;HEMEL HEMPSTEAD, UNITED KINGDOM&quot;, &quot;United Kingdom&quot;,
&quot;UK&quot;, &quot;United Kingdom&quot;,
&quot;UNITED KINGDOM&quot;, &quot;United Kingdom&quot;,
&quot;WALES&quot;, &quot;United Kingdom&quot;,
&quot;GBR&quot;, &quot;United Kingdom&quot;,
&quot;LONDON&quot;, &quot;United Kingdom&quot;,
&quot;CA&quot;,&quot;Canada&quot;,
Country)</formula>
        <name>Update country</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Velocity_Area_Domestic_Update</fullName>
        <field>Velocity_Area_Domestic__c</field>
        <formula>CASE(UPPER( State_For_Assignment_Rules__c ), 
&quot;OHIO&quot;,&quot;Central (Vel)&quot;, 
&quot;ONTARIO&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;ILLINOIS&quot;,&quot;Central (Vel)&quot;, 
&quot;INDIANA&quot;,&quot;Central (Vel)&quot;, 
&quot;MICHIGAN&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;MINNESOTA&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;WISCONSIN&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;MISSOURI&quot;,&quot;Central (Vel)&quot;, 
&quot;KANSAS&quot;,&quot;West 1 (Vel)&quot;, 
&quot;IOWA&quot;,&quot;Central (Vel)&quot;, 
&quot;OKLAHOMA&quot;,&quot;West 1 (Vel)&quot;, 
&quot;NEBRASKA&quot;,&quot;West 1 (Vel)&quot;, 
&quot;MANITOBA&quot;,&quot;West 2 (Vel)&quot;, 
&quot;NORTH DAKOTA&quot;,&quot;West 2 (Vel)&quot;, 
&quot;SOUTH DAKOTA&quot;,&quot;West 2 (Vel)&quot;, 
&quot;NEW YORK&quot;,&quot;North East 1 (Vel)&quot;, 
&quot;CONNECTICUT&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;PENNSYLVANIA&quot;,&quot;North East 1 (Vel)&quot;, 
&quot;MASSACHUSETTS&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;NEW HAMPSHIRE&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;RHODE ISLAND&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;MAINE&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;VERMONT&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;NEW BRUNSWICK&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;NOVA SCOTIA&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;NEWFOUNDLAND&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;PRINCE EDWARD ISLAND&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;NEW JERSEY&quot;,&quot;North East 1 (Vel)&quot;, 
&quot;QUEBEC&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;VIRGINIA&quot;,&quot;South East (Vel)&quot;, 
&quot;NORTH CAROLINA&quot;,&quot;Central (Vel)&quot;, 
&quot;FLORIDA&quot;,&quot;South East (Vel)&quot;, 
&quot;ALABAMA&quot;,&quot;South East (Vel)&quot;, 
&quot;TENNESSEE&quot;,&quot;Central (Vel)&quot;, 
&quot;KENTUCKY&quot;,&quot;South East (Vel)&quot;, 
&quot;LOUISIANA&quot;,&quot;South East (Vel)&quot;, 
&quot;ARKANSAS&quot;,&quot;South East (Vel)&quot;, 
&quot;MISSISSIPPI&quot;,&quot;South East (Vel)&quot;, 
&quot;GEORGIA&quot;,&quot;South East (Vel)&quot;, 
&quot;SOUTH CAROLINA&quot;,&quot;South East (Vel)&quot;, 
&quot;PUERTO RICO&quot;,&quot;South East (Vel)&quot;, 
&quot;MARYLAND&quot;,&quot;North East 1 (Vel)&quot;, 
&quot;DISTRICT OF COLUMBIA&quot;,&quot;South East (Vel)&quot;, 
&quot;DELAWARE&quot;,&quot;South East (Vel)&quot;, 
&quot;WEST VIRGINIA&quot;,&quot;South East (Vel)&quot;, 
&quot;TEXAS&quot;,&quot;West 1 (Vel)&quot;, 
&quot;COLORADO&quot;,&quot;West 1 (Vel)&quot;, 
&quot;ARIZONA&quot;,&quot;West 1 (Vel)&quot;, 
&quot;UTAH&quot;,&quot;West 1 (Vel)&quot;, 
&quot;NEVADA&quot;,&quot;West 1 (Vel)&quot;, 
&quot;NEW MEXICO&quot;,&quot;West 1 (Vel)&quot;, 
&quot;WASHINGTON&quot;,&quot;West 2 (Vel)&quot;, 
&quot;OREGON&quot;,&quot;West 2 (Vel)&quot;, 
&quot;BRITISH COLUMBIA&quot;,&quot;West 2 (Vel)&quot;, 
&quot;ALBERTA&quot;,&quot;West 2 (Vel)&quot;, 
&quot;HAWAII&quot;,&quot;West 2 (Vel)&quot;, 
&quot;IDAHO&quot;,&quot;West 1 (Vel)&quot;, 
&quot;MONTANA&quot;,&quot;West 1 (Vel)&quot;, 
&quot;ALASKA&quot;,&quot;West 2 (Vel)&quot;, 
&quot;SASKATCHEWAN&quot;,&quot;West 2 (Vel)&quot;, 
&quot;WYOMING&quot;,&quot;West 1 (Vel)&quot;, 
&quot;NUNAVUT&quot;,&quot;West 2 (Vel)&quot;, 
&quot;YUKON TERRITORY&quot;,&quot;West 2 (Vel)&quot;, 
&quot;NORTHWEST TERRITORIES&quot;,&quot;West 2 (Vel)&quot;, 
&quot;CALIFORNIA&quot;,&quot;West 2 (Vel)&quot;, 
&quot;OH&quot;,&quot;Central (Vel)&quot;, 
&quot;ON&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;IL&quot;,&quot;Central (Vel)&quot;, 
&quot;IN&quot;,&quot;Central (Vel)&quot;, 
&quot;MI&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;MN&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;WI&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;MO&quot;,&quot;Central (Vel)&quot;, 
&quot;KS&quot;,&quot;West 1 (Vel)&quot;, 
&quot;IA&quot;,&quot;Central (Vel)&quot;, 
&quot;OK&quot;,&quot;West 1 (Vel)&quot;, 
&quot;NE&quot;,&quot;West 1 (Vel)&quot;, 
&quot;MB&quot;,&quot;West 2 (Vel)&quot;, 
&quot;ND&quot;,&quot;West 2 (Vel)&quot;, 
&quot;SD&quot;,&quot;West 2 (Vel)&quot;, 
&quot;NY&quot;,&quot;North East 1 (Vel)&quot;, 
&quot;CT&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;PA&quot;,&quot;North East 1 (Vel)&quot;, 
&quot;MA&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;NH&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;RI&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;ME&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;VT&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;NB&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;NS&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;NF&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;PE&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;NJ&quot;,&quot;North East 1 (Vel)&quot;, 
&quot;QC&quot;,&quot;North East 2 (Vel)&quot;, 
&quot;VA&quot;,&quot;South East (Vel)&quot;, 
&quot;NC&quot;,&quot;Central (Vel)&quot;, 
&quot;FL&quot;,&quot;South East (Vel)&quot;, 
&quot;AL&quot;,&quot;South East (Vel)&quot;, 
&quot;TN&quot;,&quot;Central (Vel)&quot;, 
&quot;KY&quot;,&quot;South East (Vel)&quot;, 
&quot;LA&quot;,&quot;South East (Vel)&quot;, 
&quot;AR&quot;,&quot;South East (Vel)&quot;, 
&quot;MS&quot;,&quot;South East (Vel)&quot;, 
&quot;GA&quot;,&quot;South East (Vel)&quot;, 
&quot;SC&quot;,&quot;South East (Vel)&quot;, 
&quot;PR&quot;,&quot;South East (Vel)&quot;, 
&quot;MD&quot;,&quot;North East 1 (Vel)&quot;, 
&quot;DC&quot;,&quot;South East (Vel)&quot;, 
&quot;DE&quot;,&quot;South East (Vel)&quot;, 
&quot;WV&quot;,&quot;South East (Vel)&quot;, 
&quot;TX&quot;,&quot;West 1 (Vel)&quot;, 
&quot;CO&quot;,&quot;West 1 (Vel)&quot;, 
&quot;AZ&quot;,&quot;West 1 (Vel)&quot;, 
&quot;UT&quot;,&quot;West 1 (Vel)&quot;, 
&quot;NV&quot;,&quot;West 1 (Vel)&quot;, 
&quot;NM&quot;,&quot;West 1 (Vel)&quot;, 
&quot;WA&quot;,&quot;West 2 (Vel)&quot;, 
&quot;OR&quot;,&quot;West 2 (Vel)&quot;, 
&quot;BC&quot;,&quot;West 2 (Vel)&quot;, 
&quot;AB&quot;,&quot;West 2 (Vel)&quot;, 
&quot;HI&quot;,&quot;West 2 (Vel)&quot;, 
&quot;ID&quot;,&quot;West 1 (Vel)&quot;, 
&quot;MT&quot;,&quot;West 1 (Vel)&quot;, 
&quot;AK&quot;,&quot;West 2 (Vel)&quot;, 
&quot;SK&quot;,&quot;West 2 (Vel)&quot;, 
&quot;WY&quot;,&quot;West 1 (Vel)&quot;, 
&quot;NU&quot;,&quot;West 2 (Vel)&quot;, 
&quot;YT&quot;,&quot;West 2 (Vel)&quot;, 
&quot;NT&quot;,&quot;West 2 (Vel)&quot;, 
&quot;CA&quot;,&quot;West 2 (Vel)&quot;, 
&quot;&quot;)</formula>
        <name>Velocity Area (Domestic) Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Velocity_Area_International_Update</fullName>
        <field>Velocity_Area_International__c</field>
        <formula>CASE(UPPER( State_For_Assignment_Rules__c ), 
&quot;BELGIUM&quot;,&quot;Target International (Vel)&quot;, 
&quot;LUXEMBOURG&quot;,&quot;Target International (Vel)&quot;, 
&quot;NETHERLANDS&quot;,&quot;Target International (Vel)&quot;, 
&quot;FRANCE&quot;,&quot;Target International (Vel)&quot;, 
&quot;DENMARK&quot;,&quot;Target International (Vel)&quot;, 
&quot;FINLAND&quot;,&quot;Target International (Vel)&quot;, 
&quot;ICELAND&quot;,&quot;Target International (Vel)&quot;, 
&quot;NORWAY&quot;,&quot;Target International (Vel)&quot;, 
&quot;SWEDEN&quot;,&quot;Target International (Vel)&quot;, 
&quot;SOUTH AFRICA&quot;,&quot;Target International (Vel)&quot;, 
&quot;TURKEY&quot;,&quot;Target International (Vel)&quot;, 
&quot;UNITED KINGDOM&quot;,&quot;Target International (Vel)&quot;, 
&quot;UK&quot;,&quot;Target International (Vel)&quot;, 
&quot;IRELAND&quot;,&quot;Target International (Vel)&quot;, 
&quot;BERMUDA&quot;,&quot;Target International (Vel)&quot;, 
&quot;AUSTRALIA&quot;,&quot;Target International (Vel)&quot;, 
&quot;NEW ZEALAND&quot;,&quot;Target International (Vel)&quot;, 
&quot;LIECHTENSTEIN&quot;,&quot;Target International (Vel)&quot;, 
&quot;AUSTRIA&quot;,&quot;Target International (Vel)&quot;, 
&quot;GERMANY&quot;,&quot;Target International (Vel)&quot;, 
&quot;SWITZERLAND&quot;,&quot;Target International (Vel)&quot;, 
&quot;ARGENTINA&quot;,&quot;Other Americas (Vel)&quot;, 
&quot;BELIZE&quot;,&quot;Other Americas (Vel)&quot;, 
&quot;BOLIVIA&quot;,&quot;Other Americas (Vel)&quot;, 
&quot;BRAZIL&quot;,&quot;Other Americas (Vel)&quot;, 
&quot;CHILE&quot;,&quot;Other Americas (Vel)&quot;, 
&quot;COLOMBIA&quot;,&quot;Other Americas (Vel)&quot;, 
&quot;COSTA RICA&quot;,&quot;Other Americas (Vel)&quot;, 
&quot;CUBA&quot;,&quot;Other Americas (Vel)&quot;, 
&quot;DOMINICA&quot;,&quot;Other Americas (Vel)&quot;, 
&quot;DOMINICAN REPUBLIC&quot;,&quot;Other Americas (Vel)&quot;, 
&quot;ECUADOR&quot;,&quot;Other Americas (Vel)&quot;, 
&quot;EL SALVADOR&quot;,&quot;Other Americas (Vel)&quot;, 
&quot;GUATEMALA&quot;,&quot;Other Americas (Vel)&quot;, 
&quot;GUYANA&quot;,&quot;Other Americas (Vel)&quot;, 
&quot;HAITI&quot;,&quot;Other Americas (Vel)&quot;, 
&quot;HONDURAS&quot;,&quot;Other Americas (Vel)&quot;, 
&quot;JAMAICA&quot;,&quot;Other Americas (Vel)&quot;, 
&quot;MEXICO&quot;,&quot;Other Americas (Vel)&quot;, 
&quot;NICARAGUA&quot;,&quot;Other Americas (Vel)&quot;, 
&quot;PANAMA&quot;,&quot;Other Americas (Vel)&quot;, 
&quot;PARAGUAY&quot;,&quot;Other Americas (Vel)&quot;, 
&quot;PERU&quot;,&quot;Other Americas (Vel)&quot;, 
&quot;SURINAME&quot;,&quot;Other Americas (Vel)&quot;, 
&quot;URUGUAY&quot;,&quot;Other Americas (Vel)&quot;, 
&quot;VENEZUELA&quot;,&quot;Other Americas (Vel)&quot;, 
&quot;&quot;)</formula>
        <name>Velocity Area (International) Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>set_prospect_lead_status</fullName>
        <field>Status</field>
        <literalValue>Prospect</literalValue>
        <name>set_prospect_lead_status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Add plus sign to international mobile</fullName>
        <actions>
            <name>Lead_mobile_plus_sign</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(NOT(ISBLANK(MobilePhone)),LEFT(MobilePhone,1)&lt;&gt;&quot;+&quot;,
OR(Country=&quot;Belgium&quot;,
Country=&quot;Denmark&quot;,
Country=&quot;Finland&quot;,
Country=&quot;France&quot;,
Country=&quot;Iceland&quot;,
Country=&quot;Ireland&quot;,
Country=&quot;Luxembourg&quot;,
Country=&quot;Netherlands&quot;,
Country=&quot;Norway&quot;,
Country=&quot;South Africa&quot;,
Country=&quot;Sweden&quot;,
Country=&quot;Turkey&quot;,
Country=&quot;United Kingdom&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Add plus sign to international phone</fullName>
        <actions>
            <name>Lead_phone_plus_sign</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(NOT(ISBLANK(Phone)),LEFT(Phone,1)&lt;&gt;&quot;+&quot;,
OR(Country=&quot;Belgium&quot;,
Country=&quot;Denmark&quot;,
Country=&quot;Finland&quot;,
Country=&quot;France&quot;,
Country=&quot;Iceland&quot;,
Country=&quot;Ireland&quot;,
Country=&quot;Luxembourg&quot;,
Country=&quot;Netherlands&quot;,
Country=&quot;Norway&quot;,
Country=&quot;South Africa&quot;,
Country=&quot;Sweden&quot;,
Country=&quot;Turkey&quot;,
Country=&quot;United Kingdom&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Append BOUNCED to Bad Email</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Email_Bounce__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Append date%2Ftime to LWFF stamp</fullName>
        <actions>
            <name>Lead_LWFF_stamp_date_time_append</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(OR(ISNEW(),ISCHANGED(Latest_Web_Form_Fill_Stamp__c)),NOT(ISBLANK(Latest_Web_Form_Fill_Stamp__c)),RIGHT(Latest_Web_Form_Fill_Stamp__c,1)&lt;&gt;&quot;Z&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>CHannel Lead Alert</fullName>
        <actions>
            <name>New_Partner_Lead_Creation_Alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.wi__Share_to_WI__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Alert CHannel Directors upon channel lead creation</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Capture the %27Last Modified%27 date of Lead Score</fullName>
        <actions>
            <name>Notify_me_of_when_this_change_occurs</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Capture_Lead_Score_Change_Date_Time</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>ISCHANGED(mkto71_Lead_Score__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Change status to Bad Data</fullName>
        <actions>
            <name>Status_Reason_Bad_Data</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Status_equals_Bad_Data</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>set status to closed and status reason to bad data</description>
        <formula>AND( Account__c =&quot;001D000000v5q5N&quot;,      NOT(ISPICKVAL(Status,&quot;Closed&quot;)),      NOT(ISPICKVAL( CFCR_Status_Reason__c ,&quot;Bad Data&quot;)) )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Clean country</fullName>
        <actions>
            <name>Update_country</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>User.IsActive</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Clean United States, Canada, and United Kingdom country entries to make them consistent</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Clean state</fullName>
        <actions>
            <name>Change_state_abbreviations</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Change state abbreviations to long state names</description>
        <formula>LEN(State)=2</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Clear Prospect status start date</fullName>
        <actions>
            <name>Clear_Prospect_Status_Date_field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>notEqual</operation>
            <value>Prospect</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Prospect_Status_Date_for_aging__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Clear Status Reason</fullName>
        <actions>
            <name>Status_Reason_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>notEqual</operation>
            <value>Closed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.CFCR_Status_Reason__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>When Lead status is not &apos;Closed&apos; and Status Reason is not blank - set Status Reason to blank.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Copy account phone number</fullName>
        <actions>
            <name>Pull_phone_from_account</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(ISBLANK(Phone),NOT(ISBLANK(Account__r.Phone)))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Email Bounce Update</fullName>
        <actions>
            <name>Update_Email_Bounce_When_Email_Changed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>and(  ISPICKVAL(Email_Bounce__c, &quot;Yes&quot;) , ISCHANGED(  Email ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Email entered equals FALSE</fullName>
        <actions>
            <name>Set_Email_Entered_to_FALSE</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Email</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Deactivated because we don&apos;t want leads to disappear from Marketo&apos;s view if the email address is deleted (see sharing rules)</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Email entered equals TRUE</fullName>
        <actions>
            <name>Set_Email_Entered_to_TRUE</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Email</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Fill in Account Phone</fullName>
        <actions>
            <name>Fill_in_Account_Phone</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Give Account phone in the event there is no number for the lead</description>
        <formula>true</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Fill in Country if State is Filled</fullName>
        <actions>
            <name>Fill_in_Country_if_State_is_Filled</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(ISBLANK(Country),NOT(ISBLANK(State)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Fill in Customer References</fullName>
        <actions>
            <name>Fill_in_Customer_References</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>True</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Fill in Diamond Add Date</fullName>
        <actions>
            <name>Stamp_Diamond_Add_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(ISCHANGED(Diamond__c),Diamond__c=TRUE)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Fill in Lead Owner</fullName>
        <actions>
            <name>Fill_in_Original_Lead_Owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>ISBLANK(Original_Lead_Owner__c)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Fill in Site Phone</fullName>
        <actions>
            <name>Fill_in_Phone</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(
ISBLANK(Phone),
OR(RF_Site_Phone__c&lt;&gt;&quot;none&quot;,NOT(ISBLANK(RF_Site_Phone__c))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Fill in Use Cases</fullName>
        <actions>
            <name>Fill_in_Use_Cases</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>TRUE</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Geographical Customer References</fullName>
        <active>false</active>
        <formula>True</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Lead Status change updates</fullName>
        <actions>
            <name>Stamp_prior_status</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_status_change_date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>ISCHANGED(Status)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>LeadAppEscalationRule</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Lead.LeadApprovalCheck__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Partner_Status__c</field>
            <operation>equals</operation>
            <value>Approved</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.wi__Share_to_WI__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Deal_reg_approval_date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>WI / Deal Reg reminder to determine if the Deal should be approved</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Notification_for_Lead_Escalation</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>RD_Queue_Assignment</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>LeadAppEscalationRule_LATAM</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Lead.LeadApprovalCheck__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Partner_Status__c</field>
            <operation>equals</operation>
            <value>Approved</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.wi__Share_to_WI__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Deal_reg_approval_date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Territory_Label__c</field>
            <operation>equals</operation>
            <value>LATAM</value>
        </criteriaItems>
        <description>The same rule as with all other leads but this is specific to the LATAM Accounts</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Notification_for_Lead_Escalation_LATAM</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>LATAM_Queue_Assignment</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Lead_City_Field_Changed</fullName>
        <actions>
            <name>MALatitudec_Purge</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MALongitudec_Purge</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Purge the MapAnything Lat/Long fields on the Lead if this field changes; created by the Metadata API</description>
        <formula>ISCHANGED(City)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Lead_Country_Field_Changed</fullName>
        <actions>
            <name>MALatitudec_Purge</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MALongitudec_Purge</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Purge the MapAnything Lat/Long fields on the Lead if this field changes; created by the Metadata API</description>
        <formula>ISCHANGED(Country)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Lead_PostalCode_Field_Changed</fullName>
        <actions>
            <name>MALatitudec_Purge</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MALongitudec_Purge</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Purge the MapAnything Lat/Long fields on the Lead if this field changes; created by the Metadata API</description>
        <formula>ISCHANGED(PostalCode)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Lead_State_Field_Changed</fullName>
        <actions>
            <name>MALatitudec_Purge</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MALongitudec_Purge</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Purge the MapAnything Lat/Long fields on the Lead if this field changes; created by the Metadata API</description>
        <formula>ISCHANGED(State)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Lead_Street_Field_Changed</fullName>
        <actions>
            <name>MALatitudec_Purge</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MALongitudec_Purge</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Purge the MapAnything Lat/Long fields on the Lead if this field changes; created by the Metadata API</description>
        <formula>ISCHANGED(Street)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Make company match account name</fullName>
        <actions>
            <name>Update_company_with_account_name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(Company&lt;&gt;Account__r.Name,Account__r.Name&lt;&gt;&quot;&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Manager Field Update Rule</fullName>
        <actions>
            <name>Manager_Field_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Territory_Owner__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Mark Lead Was Prospect</fullName>
        <actions>
            <name>Set_Was_Prospect_to_True</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>ISPICKVAL(Status,&quot;New&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Mark No Interest%2FNon-Responsive</fullName>
        <actions>
            <name>Mark_No_Interest_Non_Responsive_Yes</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>OR(ISPICKVAL(Status,&quot;Non-Responsive&quot;),ISPICKVAL(Status,&quot;No Interest&quot;))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>New Lead Workflow</fullName>
        <actions>
            <name>CheckReadyToLinkToAccount</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_Owner_Static_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Any time a new Lead is created, check the &quot;Ready to Link to Account&quot; box so that the LeadLinkToAccount trigger will run.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Ops Queue Assignment</fullName>
        <actions>
            <name>Ops_Queue_Approval</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Deal_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_Owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3</booleanFilter>
        <criteriaItems>
            <field>Lead.Account_ID__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Company</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.wi__Share_to_WI__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>WI / Deal Reg process - if account has not been created?</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Partner Deal Reg to RD Approval part 1</fullName>
        <actions>
            <name>Update_Partner_Approval_Trigger_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>The First of a two-part WFR: 
This part adds a date (today) to the Partner Approval Trigger date to be used in Part two and enables a daily email notification to the RD</description>
        <formula>AND(LeadApprovalCheck__c = True,
    wi__Share_to_WI__c = True,
    ISPICKVAL(Partner_Status__c, &quot;Approved&quot;),
  OR(ISBLANK(Deal_reg_approval_date__c),
     ISBLANK(Deal_Reg_Expired_date__c )
     )
    )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Partner Deal Reg to RD Approval part 2</fullName>
        <actions>
            <name>Notification_for_Lead_Escalation</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>RD_Queue_Assignment</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>The Second part of a two-part WFR.
This rule will update the Partner Approval Trigger Date field to today&apos;s date, send out an email, change the lead owner to the RD and wait 24 to run again.</description>
        <formula>AND(
    Partner_Approval_Trigger_Date__c = TODAY(),
    LeadApprovalCheck__c = True,
    wi__Share_to_WI__c = True,
    ISPICKVAL(Partner_Status__c, &quot;Approved&quot;),
  OR(ISBLANK(Deal_reg_approval_date__c),
     ISBLANK(Deal_Reg_Expired_date__c )
     )
    )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Update_Partner_Approval_Trigger_Date</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Partner queue Assignment</fullName>
        <actions>
            <name>Notification_to_Queue_Partner_Desk_Lead</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3</booleanFilter>
        <criteriaItems>
            <field>Lead.CreatedById</field>
            <operation>contains</operation>
            <value>Web Infinity</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.wi__Share_to_WI__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Account_ID__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>New WI received - Lead Partner queue notification</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Process third party leads</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Lead.LeadSource</field>
            <operation>startsWith</operation>
            <value>3PT</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>equals</operation>
            <value>New,Suspect</value>
        </criteriaItems>
        <description>Process third party leads when they are created, including notifying owner.</description>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Send_email_to_owner</name>
                <type>Alert</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Reactivated Leads Sync to Marketo</fullName>
        <actions>
            <name>Re_sync_to_Marketo</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(Active_Lookup__c&lt;&gt;&quot;&quot;,!Sync_To_Marketo__c)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Remove Flags from Dispositioned Leads</fullName>
        <actions>
            <name>Remove_Flags_from_Dispositioned_Leads</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(
  OR(
    IF(ISPICKVAL(PRIORVALUE(Status),&quot;Prospect&quot;),TRUE,FALSE),
    IF(ISPICKVAL(PRIORVALUE(Status),&quot;Suspect&quot;),TRUE,FALSE)
  ),
  OR(
    IF(ISPICKVAL(Status,&quot;Not a stakeholder&quot;),TRUE,FALSE),
    IF(ISPICKVAL(Status,&quot;No Fit with VMT&quot;),TRUE,FALSE),
    IF(ISPICKVAL(Status,&quot;Do Not Call&quot;),TRUE,FALSE),
    IF(ISPICKVAL(Status,&quot;Bad Data&quot;),TRUE,FALSE),
    IF(ISPICKVAL(Status,&quot;Language Barrier&quot;),TRUE,FALSE)
  ),  
  Flag__c=TRUE
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Remove flag</fullName>
        <actions>
            <name>Take_off_flag_lead</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>JC added improved version</description>
        <formula>AND(ISCHANGED(Status),
NOT(ISPICKVAL(Status,&quot;Prospect&quot;)),
NOT(ISPICKVAL(Status,&quot;Suspect&quot;)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Remove from Marketo Sync</fullName>
        <actions>
            <name>Unsync_from_Marketo</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Remove_from_Marketo__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Retrigger Assignment Rules</fullName>
        <actions>
            <name>Retrigger_Assignment_Rules</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND( 
Lead_Owner_text2__c=&quot;Charles Wu&quot;, 
OR(Personal_Email__c=false,NOT(ISBLANK(Phone)),Phone&lt;&gt;&quot;&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Do Not Call</fullName>
        <actions>
            <name>Do_Not_Call_True</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.CFCR_Status_Reason__c</field>
            <operation>equals</operation>
            <value>Do Not Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.DoNotCall</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>when a leads status reason is Do Not Call - set Do Not Call checkbox</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Prospect status start date</fullName>
        <actions>
            <name>Update_Prospect_Status_Date_field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Prospect_Status_Date_for_aging__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set new INB status to Prospect</fullName>
        <actions>
            <name>set_prospect_lead_status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.LeadSource</field>
            <operation>equals</operation>
            <value>INB: Website</value>
        </criteriaItems>
        <description>Status = Prospect upon INB: Website for lead source</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Account Safe ID</fullName>
        <actions>
            <name>Stamp_Account_Safe_ID</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>NOT(ISBLANK(Account__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp DiscoverOrg Company Id</fullName>
        <actions>
            <name>Stamp_DiscoverOrg_Company_Id</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(
ISBLANK(DiscoverOrg_Company_ID_VMT__c) &amp;&amp; NOT(ISBLANK(DSCORGPKG__DiscoverOrg_Company_ID__c)),
DiscoverOrg_Company_ID_VMT__c&lt;&gt;VALUE(DSCORGPKG__DiscoverOrg_Company_ID__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp DiscoverOrg Employee Id</fullName>
        <actions>
            <name>Stamp_DiscoverOrg_Employee_Id</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(
ISBLANK(DiscoverOrg_Employee_ID_VMT__c) &amp;&amp; NOT(ISBLANK(DSCORGPKG__DiscoverOrg_ID__c)),
DiscoverOrg_Employee_ID_VMT__c&lt;&gt;VALUE(DSCORGPKG__DiscoverOrg_ID__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp DisoverOrg Id</fullName>
        <active>false</active>
        <formula>ISBLANK(DiscoverOrg_Company_ID_VMT__c) &amp;&amp; NOT(ISBLANK(DSCORGPKG__DiscoverOrg_Company_ID__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Inbound Qualified Fields</fullName>
        <actions>
            <name>Stamp_Inbound_Qualified_By</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Inbound_Qualified_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Inbound_Qualified__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp LWFF and date</fullName>
        <actions>
            <name>LWFF_date_update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>LWFF_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(OR(ISNEW(),ISCHANGED(Latest_Web_Form_Fill_Stamp__c)),RIGHT(Latest_Web_Form_Fill_Stamp__c,1)=&quot;Z&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp LWFF and date %28update status to Prospect%29</fullName>
        <actions>
            <name>Change_lead_status_to_Prospect</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>deactivated 10.3.2015 - do not update status to prospect</description>
        <formula>AND(OR(ISNEW(),ISCHANGED(Latest_Web_Form_Fill_Stamp__c)),
RIGHT(Latest_Web_Form_Fill_Stamp__c,1)=&quot;Z&quot;,
NOT(ISPICKVAL(Status,&quot;Language Barrier&quot;)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp MQL date%2Ftime</fullName>
        <actions>
            <name>Stamp_MQL_date_time_leads</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(ISBLANK(MQL_Date_Time__c),mkto71_Lead_Score__c&gt;225)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp New Lead EULA Agreement Date</fullName>
        <actions>
            <name>Update_EULA_Acceptance_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>If an incoming lead accepts the EULA, they are given a generic 1/1/1900 date for the EULA date. This workflow rule corrects it and gives today&apos;s date.</description>
        <formula>AND(YEAR(DATEVALUE(EULA_Acceptance_Date__c))&lt;2000,NOT(ISBLANK(EULA_Acceptance_Date__c)))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Original Lead Owner Static Team</fullName>
        <actions>
            <name>Stamp_Original_Lead_Owner_Team</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
NOT(ISBLANK(Original_Inbound_Lead_Owner__c)),
Original_Inbound_Lead_Owner__r.Full_Name__c&lt;&gt;&quot;Justin Chang&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Original VisitTrack Info 2</fullName>
        <actions>
            <name>Lead_VisitTrack_Stamp_Orig_Campaign</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_VisitTrack_Stamp_Orig_LP</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_VisitTrack_Stamp_Orig_Medium</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_VisitTrack_Stamp_Orig_Referrer</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_VisitTrack_Stamp_Orig_Source</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_VisitTrack_Stamp_Orig_Term</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Visit_Track_Original_Visit__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.VisitTrack_Original_Landing_Page__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Stamps source of original visit and source of first form fill visit.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Region Fields</fullName>
        <actions>
            <name>Lead_Region_Country_1_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_Region_Country_2_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_Region_State_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>User.IsActive</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Sales Region of Lead</fullName>
        <actions>
            <name>Stamp_Sales_Region_of_Lead</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>TRUE</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Territory for Leads</fullName>
        <actions>
            <name>Velocity_Area_Domestic_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Velocity_Area_International_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>User.IsActive</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp VisitTrack First Info</fullName>
        <actions>
            <name>Lead_VisitTrack_Stamp_First_Campaign</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_VisitTrack_Stamp_First_LP</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_VisitTrack_Stamp_First_Medium</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_VisitTrack_Stamp_First_Referrer</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_VisitTrack_Stamp_First_Source</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_VisitTrack_Stamp_First_Term</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Visit_Track_Original_Visit__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.VisitTrack_First_Landing_Page__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Stamps source of first form fill visit.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp VisitTrack Most Recent Info</fullName>
        <actions>
            <name>Lead_VisitTrack_Stamp_MR_Campaign</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_VisitTrack_Stamp_MR_LP</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_VisitTrack_Stamp_MR_Medium</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_VisitTrack_Stamp_MR_Referrer</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_VisitTrack_Stamp_MR_Source</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_VisitTrack_Stamp_MR_Term</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Visit_Track_Most_Recent_Visit__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Stamps source of most recent form fill visit.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp VisitTrack Original Info</fullName>
        <actions>
            <name>Lead_VisitTrack_Stamp_Orig_Campaign</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_VisitTrack_Stamp_Orig_LP</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_VisitTrack_Stamp_Orig_Medium</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_VisitTrack_Stamp_Orig_Referrer</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_VisitTrack_Stamp_Orig_Source</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_VisitTrack_Stamp_Orig_Term</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_VisitTrack_Stamp_Original_Visit</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Visit_Track_Most_Recent_Visit__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Visit_Track_Original_Visit__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Stamps source of original visit.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp first form fill date</fullName>
        <actions>
            <name>Lead_stamp_first_form_fill_date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.First_Web_Form_Fill__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.First_Web_Form_Fill_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp free version activation date</fullName>
        <actions>
            <name>Lead_stamp_first_free_activation_date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Stamps the first activation date of the free version</description>
        <formula>AND(NOT(ISBLANK(First_Free_Version_Activation_Date__c)), $User.FirstName&amp;&quot; &quot;&amp;$User.LastName&lt;&gt;&quot;Tim Daniels&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp free version download date</fullName>
        <actions>
            <name>Lead_stamp_first_free_download_date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Stamps the first download date of the free version</description>
        <formula>AND(NOT(ISBLANK(First_Free_Version_Download_Date__c)), $User.FirstName&amp;&quot; &quot;&amp;$User.LastName&lt;&gt;&quot;Tim Daniels&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp full version activation date</fullName>
        <actions>
            <name>Lead_stamp_first_full_activation_date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Stamps the first activation date of the full version</description>
        <formula>AND(NOT(ISBLANK(First_Full_Version_Activation_Date__c)), $User.FirstName&amp;&quot; &quot;&amp;$User.LastName&lt;&gt;&quot;Tim Daniels&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp full version download date</fullName>
        <actions>
            <name>Lead_stamp_first_full_download_date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Stamps the first download date of the full version</description>
        <formula>AND(NOT(ISBLANK(First_Full_Version_Download_Date__c)), $User.FirstName&amp;&quot; &quot;&amp;$User.LastName&lt;&gt;&quot;Tim Daniels&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp latest form fill and date</fullName>
        <actions>
            <name>Change_lead_status_to_Prospect</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_stamp_latest_form_fill</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_stamp_latest_form_fill_date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Recent_Download__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Clear_Recent_Download_field</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Stamp original source info summary</fullName>
        <actions>
            <name>Original_Source_Info_Summary</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>NOT(ISBLANK(mkto71_Original_Source_Info__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp rejuvenated date%2Ftime</fullName>
        <actions>
            <name>Stamp_rejuvenated_date_time_leads</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(NOT(ISBLANK(MQL_Date_Time__c)),
IF(NOT(ISBLANK(Rejuvenated_Date_Time__c)),
MIN(NOW()-Rejuvenated_Date_Time__c,NOW()-MQL_Date_Time__c)&gt;180,
NOW()-MQL_Date_Time__c&gt;180),
ISCHANGED(mkto71_Lead_Score__c),
PRIORVALUE(mkto71_Lead_Score__c)&lt;=15,
mkto71_Lead_Score__c&gt;15)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Status Last Set %3D Now</fullName>
        <actions>
            <name>CFCR_Lead_Status_Last_Set_Now</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Set Status Last Set to NOW() when record is created or lead status is changed</description>
        <formula>OR( ISNEW(), ISCHANGED(Status))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Temp Marketo Email Alert</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>equals</operation>
            <value>Justin Chang,Marketo</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Test Partner Deal Reg to RD Approval part 2</fullName>
        <active>false</active>
        <description>Created by Prerak for changing Time Trigger. The Second part of a two-part WFR.
This rule will update the Partner Approval Trigger Date field to today&apos;s date, send out an email, change the lead owner to the RD and wait 24 to run again.</description>
        <formula>AND(
    Partner_Approval_Trigger_Date__c = TODAY(),
    LeadApprovalCheck__c = True,
    wi__Share_to_WI__c = True,
    ISPICKVAL(Partner_Status__c, &quot;Approved&quot;),
  OR(ISBLANK(Deal_reg_approval_date__c),
     ISBLANK(Deal_Reg_Expired_date__c )
     )
    )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>UK Created Leads</fullName>
        <actions>
            <name>Make_Leadsource_RainKing</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(ISPICKVAL(LeadSource,&quot;&quot;),OR(
CONTAINS(CreatedBy.UserRole.Name,&quot;International&quot;),
CONTAINS(CreatedBy.UserRole.Name,&quot;EMEA&quot;)),
CreatedBy.UserRole.Name&lt;&gt;&quot;VMT SF admin&quot;)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update RainKing lead source</fullName>
        <actions>
            <name>Source_equals_PRO_RainKing</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>ISPICKVAL(LeadSource,&quot;RainKing&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update discoverorg lead source</fullName>
        <actions>
            <name>Source_equals_PRO_DiscoverOrg</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>OR(ISPICKVAL(LeadSource,&quot;discoverorg&quot;),ISPICKVAL(LeadSource,&quot;DiscoverOrg&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update linkedin lead source</fullName>
        <actions>
            <name>Source_equals_Prospecting_LinkedIn</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>UPPER(TEXT(LeadSource))=&quot;LINKEDIN&quot;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update time zone</fullName>
        <actions>
            <name>Time_zone_update_lead</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>User.IsActive</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update title score</fullName>
        <actions>
            <name>Title_Score_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>User.IsActive</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Updates the title score for lead scoring</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Use Inferred Country as Country</fullName>
        <actions>
            <name>Set_Country_to_Inferred_Country</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>If lead is created with blank country, fill country field with the inferred country.</description>
        <formula>ISBLANK(Country)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Use Inferred State as State</fullName>
        <actions>
            <name>Set_State_to_Inferred_State</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>If lead is created with a blank state field, fills the state field with the inferred state/region.</description>
        <formula>ISBLANK(State)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>a2T57000002VnvvEAC_Purge</fullName>
        <actions>
            <name>MALatitude_c_Purge</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MALongitude_c_Purge</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Lead.a2T57000002VnvvEAC_Purge</description>
        <formula>OR(ISCHANGED(Street),ISCHANGED(City),ISCHANGED(State),ISCHANGED(PostalCode),ISCHANGED(Country))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <tasks>
        <fullName>Follow_Up</fullName>
        <assignedToType>role</assignedToType>
        <description>This will automate a &quot;follow up&quot; task 10 days after the initial call with a lead.</description>
        <dueDateOffset>10</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Lead.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Follow Up</subject>
    </tasks>
    <tasks>
        <fullName>Free_Suite_Download</fullName>
        <assignedTo>charmian.mcintyre@vmturbo.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Lead.Latest_Web_Form_Fill_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Free Suite Download</subject>
    </tasks>
    <tasks>
        <fullName>Full_Suite_Download</fullName>
        <assignedTo>charmian.mcintyre@vmturbo.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Lead.Latest_Web_Form_Fill_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Full Suite Download</subject>
    </tasks>
    <tasks>
        <fullName>Website_form_fill_follow_up</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Website form fill follow-up</subject>
    </tasks>
</Workflow>
