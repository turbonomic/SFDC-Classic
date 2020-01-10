<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Account_Marked_Outsourced</fullName>
        <ccEmails>GlobalAlliances@vmturbo.com</ccEmails>
        <description>Account Marked Outsourced</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Account_Marked_Outsourced</template>
    </alerts>
    <alerts>
        <fullName>Alert_Ops_of_Corporate_Account_Move_Flag</fullName>
        <description>Alert Ops of Corporate Account Move Flag</description>
        <protected>false</protected>
        <recipients>
            <recipient>stuart.horgan@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Corporate_Account_Move_Flag_Alert</template>
    </alerts>
    <alerts>
        <fullName>CX_Customer_Ownership_Change_Alert</fullName>
        <ccEmails>cxteam@vmturbo.com</ccEmails>
        <description>CX Customer Ownership Change Alert</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/CX_Customer_Change_Alert</template>
    </alerts>
    <alerts>
        <fullName>Email_Customer_Experience_with_Customer_Status_Alert</fullName>
        <ccEmails>cxteam@vmturbo.com</ccEmails>
        <description>Email Customer Experience with Customer Status Alert</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Customer_Status_Alert</template>
    </alerts>
    <alerts>
        <fullName>Exec_Customer_Churn_Risk_email_alert</fullName>
        <description>Exec Customer Churn Risk email alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>alex.hesterberg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>andrew.robinson@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ben.nye@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>chris.ward@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dan.germain@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dicken.chaplin@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jennifer.heard@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mark.thurmond@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mo.garad@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>shmuel.kliger@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tom.murphy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>AE_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Customer_Status_Alert</template>
    </alerts>
    <alerts>
        <fullName>Exec_Customer_Churn_Risk_email_alert_2</fullName>
        <description>Exec Customer Churn Risk email alert 2</description>
        <protected>false</protected>
        <recipients>
            <recipient>alex.hesterberg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ben.nye@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>chris.ward@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dan.germain@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dicken.chaplin@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jennifer.heard@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mark.thurmond@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mo.garad@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>shmuel.kliger@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tom.murphy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>AE_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Customer_Status_Alert</template>
    </alerts>
    <alerts>
        <fullName>Send_update_on_customer_status</fullName>
        <ccEmails>support-team@vmturbo.com</ccEmails>
        <description>Send update on customer status</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Change_in_customer_status</template>
    </alerts>
    <fieldUpdates>
        <fullName>Account_Management_Territory_stamp</fullName>
        <field>Account_Management_Territory__c</field>
        <formula>IF(OR(AND(BillingCountry&lt;&gt;&quot;United States&quot;,BillingCountry&lt;&gt;&quot;Canada&quot;),ISBLANK(BillingCountry)),
CASE(MOD(VALUE(Account_Auto_Number__c),3),
0,&quot;East&quot;,
1,&quot;West&quot;,
2,&quot;Central&quot;,
&quot;N/A&quot;),
CASE(UPPER(BillingState),
&quot;ALABAMA&quot;,&quot;Central&quot;,
&quot;ARKANSAS&quot;,&quot;Central&quot;,
&quot;DELAWARE&quot;,&quot;Central&quot;,
&quot;DISTRICT OF COLUMBIA&quot;,&quot;Central&quot;,
&quot;FLORIDA&quot;,&quot;Central&quot;,
&quot;GEORGIA&quot;,&quot;Central&quot;,
&quot;ILLINOIS&quot;,&quot;Central&quot;,
&quot;INDIANA&quot;,&quot;Central&quot;,
&quot;IOWA&quot;,&quot;Central&quot;,
&quot;KENTUCKY&quot;,&quot;Central&quot;,
&quot;LOUISIANA&quot;,&quot;Central&quot;,
&quot;MISSISSIPPI&quot;,&quot;Central&quot;,
&quot;MISSOURI&quot;,&quot;Central&quot;,
&quot;NORTH CAROLINA&quot;,&quot;Central&quot;,
&quot;OHIO&quot;,&quot;Central&quot;,
&quot;PUERTO RICO&quot;,&quot;Central&quot;,
&quot;SOUTH CAROLINA&quot;,&quot;Central&quot;,
&quot;TENNESSEE&quot;,&quot;Central&quot;,
&quot;VIRGINIA&quot;,&quot;Central&quot;,
&quot;WEST VIRGINIA&quot;,&quot;Central&quot;,
&quot;CONNECTICUT&quot;,&quot;East&quot;,
&quot;MAINE&quot;,&quot;East&quot;,
&quot;MARYLAND&quot;,&quot;East&quot;,
&quot;MASSACHUSETTS&quot;,&quot;East&quot;,
&quot;MICHIGAN&quot;,&quot;East&quot;,
&quot;MINNESOTA&quot;,&quot;East&quot;,
&quot;NEW BRUNSWICK&quot;,&quot;East&quot;,
&quot;NEW HAMPSHIRE&quot;,&quot;East&quot;,
&quot;NEW JERSEY&quot;,&quot;East&quot;,
&quot;NEW YORK&quot;,&quot;East&quot;,
&quot;NEWFOUNDLAND&quot;,&quot;East&quot;,
&quot;NOVA SCOTIA&quot;,&quot;East&quot;,
&quot;ONTARIO&quot;,&quot;East&quot;,
&quot;PENNSYLVANIA&quot;,&quot;East&quot;,
&quot;PRINCE EDWARD ISLAND&quot;,&quot;East&quot;,
&quot;QUEBEC&quot;,&quot;East&quot;,
&quot;RHODE ISLAND&quot;,&quot;East&quot;,
&quot;VERMONT&quot;,&quot;East&quot;,
&quot;WISCONSIN&quot;,&quot;East&quot;,
&quot;ALASKA&quot;,&quot;West&quot;,
&quot;ALBERTA&quot;,&quot;West&quot;,
&quot;ARIZONA&quot;,&quot;West&quot;,
&quot;BRITISH COLUMBIA&quot;,&quot;West&quot;,
&quot;CALIFORNIA&quot;,&quot;West&quot;,
&quot;COLORADO&quot;,&quot;West&quot;,
&quot;HAWAII&quot;,&quot;West&quot;,
&quot;IDAHO&quot;,&quot;West&quot;,
&quot;KANSAS&quot;,&quot;West&quot;,
&quot;MANITOBA&quot;,&quot;West&quot;,
&quot;MONTANA&quot;,&quot;West&quot;,
&quot;NEBRASKA&quot;,&quot;West&quot;,
&quot;NEVADA&quot;,&quot;West&quot;,
&quot;NEW MEXICO&quot;,&quot;West&quot;,
&quot;NORTH DAKOTA&quot;,&quot;West&quot;,
&quot;NORTHWEST TERRITORIES&quot;,&quot;West&quot;,
&quot;NUNAVUT&quot;,&quot;West&quot;,
&quot;OKLAHOMA&quot;,&quot;West&quot;,
&quot;OREGON&quot;,&quot;West&quot;,
&quot;SASKATCHEWAN&quot;,&quot;West&quot;,
&quot;SOUTH DAKOTA&quot;,&quot;West&quot;,
&quot;TEXAS&quot;,&quot;West&quot;,
&quot;UTAH&quot;,&quot;West&quot;,
&quot;WASHINGTON&quot;,&quot;West&quot;,
&quot;WYOMING&quot;,&quot;West&quot;,
&quot;YUKON TERRITORY&quot;,&quot;West&quot;,
&quot;AL&quot;,&quot;Central&quot;,
&quot;AR&quot;,&quot;Central&quot;,
&quot;DE&quot;,&quot;Central&quot;,
&quot;DC&quot;,&quot;Central&quot;,
&quot;FL&quot;,&quot;Central&quot;,
&quot;GA&quot;,&quot;Central&quot;,
&quot;IL&quot;,&quot;Central&quot;,
&quot;IN&quot;,&quot;Central&quot;,
&quot;IA&quot;,&quot;Central&quot;,
&quot;KY&quot;,&quot;Central&quot;,
&quot;LA&quot;,&quot;Central&quot;,
&quot;MS&quot;,&quot;Central&quot;,
&quot;MO&quot;,&quot;Central&quot;,
&quot;NC&quot;,&quot;Central&quot;,
&quot;OH&quot;,&quot;Central&quot;,
&quot;PR&quot;,&quot;Central&quot;,
&quot;SC&quot;,&quot;Central&quot;,
&quot;TN&quot;,&quot;Central&quot;,
&quot;VA&quot;,&quot;Central&quot;,
&quot;WV&quot;,&quot;Central&quot;,
&quot;CT&quot;,&quot;East&quot;,
&quot;ME&quot;,&quot;East&quot;,
&quot;MD&quot;,&quot;East&quot;,
&quot;MA&quot;,&quot;East&quot;,
&quot;MI&quot;,&quot;East&quot;,
&quot;MN&quot;,&quot;East&quot;,
&quot;NB&quot;,&quot;East&quot;,
&quot;NH&quot;,&quot;East&quot;,
&quot;NJ&quot;,&quot;East&quot;,
&quot;NY&quot;,&quot;East&quot;,
&quot;NF&quot;,&quot;East&quot;,
&quot;NS&quot;,&quot;East&quot;,
&quot;ON&quot;,&quot;East&quot;,
&quot;PA&quot;,&quot;East&quot;,
&quot;PE&quot;,&quot;East&quot;,
&quot;QC&quot;,&quot;East&quot;,
&quot;RI&quot;,&quot;East&quot;,
&quot;VT&quot;,&quot;East&quot;,
&quot;WI&quot;,&quot;East&quot;,
&quot;AK&quot;,&quot;West&quot;,
&quot;AB&quot;,&quot;West&quot;,
&quot;AZ&quot;,&quot;West&quot;,
&quot;BC&quot;,&quot;West&quot;,
&quot;CA&quot;,&quot;West&quot;,
&quot;CO&quot;,&quot;West&quot;,
&quot;HI&quot;,&quot;West&quot;,
&quot;ID&quot;,&quot;West&quot;,
&quot;KS&quot;,&quot;West&quot;,
&quot;MB&quot;,&quot;West&quot;,
&quot;MT&quot;,&quot;West&quot;,
&quot;NE&quot;,&quot;West&quot;,
&quot;NV&quot;,&quot;West&quot;,
&quot;NM&quot;,&quot;West&quot;,
&quot;ND&quot;,&quot;West&quot;,
&quot;NT&quot;,&quot;West&quot;,
&quot;NU&quot;,&quot;West&quot;,
&quot;OK&quot;,&quot;West&quot;,
&quot;OR&quot;,&quot;West&quot;,
&quot;SK&quot;,&quot;West&quot;,
&quot;SD&quot;,&quot;West&quot;,
&quot;TX&quot;,&quot;West&quot;,
&quot;UT&quot;,&quot;West&quot;,
&quot;WA&quot;,&quot;West&quot;,
&quot;WY&quot;,&quot;West&quot;,
&quot;YT&quot;,&quot;West&quot;,
&quot;&quot;))</formula>
        <name>Account Management Territory stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_phone_plus_sign</fullName>
        <field>Phone</field>
        <formula>&quot;+&quot;&amp;Phone</formula>
        <name>Account phone plus sign</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Billing_zip_code_leading_zeros</fullName>
        <field>BillingPostalCode</field>
        <formula>RIGHT(&quot;000000000&quot;&amp;BillingPostalCode,5)</formula>
        <name>Billing zip code leading zeros</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_billing_state_abbreviations</fullName>
        <field>BillingState</field>
        <formula>IF(OR(
ISBLANK(BillingCountry),
UPPER(BillingCountry)=&quot;UNITED STATES&quot;, 
UPPER(BillingCountry)=&quot;AMERICA&quot;, 
UPPER(BillingCountry)=&quot;U.S.A.&quot;, 
UPPER(BillingCountry)=&quot;U.S.A&quot;, 
UPPER(BillingCountry)=&quot;U.S.&quot;, 
UPPER(BillingCountry)=&quot;UNITED STAES&quot;, 
UPPER(BillingCountry)=&quot;UNITED STATES OF AMERICA&quot;, 
UPPER(BillingCountry)=&quot;UNITED STATES&quot;, 
UPPER(BillingCountry)=&quot;UNITED STATE&quot;, 
UPPER(BillingCountry)=&quot;UNITED STA&quot;, 
UPPER(BillingCountry)=&quot;UNITES STATES&quot;, 
UPPER(BillingCountry)=&quot;USA!&quot;, 
UPPER(BillingCountry)=&quot;USAA&quot;, 
UPPER(BillingCountry)=&quot;USA&quot;, 
UPPER(BillingCountry)=&quot;US&quot;, 
UPPER(BillingCountry)=&quot;CANADA&quot;, 
UPPER(BillingCountry)=&quot;CAN&quot;),
CASE(upper(BillingState), 
&quot;AL&quot;,&quot;Alabama&quot;, 
&quot;AK&quot;,&quot;Alaska&quot;, 
&quot;AZ&quot;,&quot;Arizona&quot;, 
&quot;AR&quot;,&quot;Arkansas&quot;, 
&quot;CA&quot;,&quot;California&quot;, 
&quot;CO&quot;,&quot;Colorado&quot;, 
&quot;CT&quot;,&quot;Connecticut&quot;, 
&quot;DE&quot;,&quot;Delaware&quot;, 
&quot;DC&quot;,&quot;District of Columbia&quot;, 
&quot;FL&quot;,&quot;Florida&quot;, 
&quot;GA&quot;,&quot;Georgia&quot;, 
&quot;HI&quot;,&quot;Hawaii&quot;, 
&quot;ID&quot;,&quot;Idaho&quot;, 
&quot;IL&quot;,&quot;Illinois&quot;, 
&quot;IN&quot;,&quot;Indiana&quot;, 
&quot;IA&quot;,&quot;Iowa&quot;, 
&quot;KS&quot;,&quot;Kansas&quot;, 
&quot;KY&quot;,&quot;Kentucky&quot;, 
&quot;LA&quot;,&quot;Louisiana&quot;, 
&quot;ME&quot;,&quot;Maine&quot;, 
&quot;MD&quot;,&quot;Maryland&quot;, 
&quot;MA&quot;,&quot;Massachusetts&quot;, 
&quot;MI&quot;,&quot;Michigan&quot;, 
&quot;MN&quot;,&quot;Minnesota&quot;, 
&quot;MS&quot;,&quot;Mississippi&quot;, 
&quot;MO&quot;,&quot;Missouri&quot;, 
&quot;MT&quot;,&quot;Montana&quot;, 
&quot;NE&quot;,&quot;Nebraska&quot;, 
&quot;NV&quot;,&quot;Nevada&quot;, 
&quot;NH&quot;,&quot;New Hampshire&quot;, 
&quot;NJ&quot;,&quot;New Jersey&quot;, 
&quot;NM&quot;,&quot;New Mexico&quot;, 
&quot;NY&quot;,&quot;New York&quot;, 
&quot;NC&quot;,&quot;North Carolina&quot;, 
&quot;ND&quot;,&quot;North Dakota&quot;, 
&quot;OH&quot;,&quot;Ohio&quot;, 
&quot;OK&quot;,&quot;Oklahoma&quot;, 
&quot;OR&quot;,&quot;Oregon&quot;, 
&quot;PA&quot;,&quot;Pennsylvania&quot;, 
&quot;RI&quot;,&quot;Rhode Island&quot;, 
&quot;SC&quot;,&quot;South Carolina&quot;, 
&quot;SD&quot;,&quot;South Dakota&quot;, 
&quot;TN&quot;,&quot;Tennessee&quot;, 
&quot;TX&quot;,&quot;Texas&quot;, 
&quot;UT&quot;,&quot;Utah&quot;, 
&quot;VT&quot;,&quot;Vermont&quot;, 
&quot;VA&quot;,&quot;Virginia&quot;, 
&quot;WA&quot;,&quot;Washington&quot;, 
&quot;WV&quot;,&quot;West Virginia&quot;, 
&quot;WI&quot;,&quot;Wisconsin&quot;, 
&quot;WY&quot;,&quot;Wyoming&quot;, 
&quot;AS&quot;,&quot;American Samoa&quot;, 
&quot;GU&quot;,&quot;Guam&quot;, 
&quot;MP&quot;,&quot;Mariana Islands&quot;, 
&quot;PR&quot;,&quot;Puerto Rico&quot;, 
&quot;VI&quot;,&quot;Virgin Islands&quot;, 
&quot;FM&quot;,&quot;Micronesia&quot;, 
&quot;MH&quot;,&quot;Marshall Islands&quot;, 
&quot;PW&quot;,&quot;Palau&quot;, 
&quot;CM&quot;,&quot;Mariana Islands&quot;, 
&quot;AB&quot;,&quot;Alberta&quot;, 
&quot;BC&quot;,&quot;British Columbia&quot;, 
&quot;MB&quot;,&quot;Manitoba&quot;, 
&quot;NB&quot;,&quot;New Brunswick&quot;, 
&quot;NL&quot;,&quot;Newfoundland&quot;, 
&quot;NT&quot;,&quot;Northwest Territorie&quot;, 
&quot;NS&quot;,&quot;Nova Scotia&quot;, 
&quot;NU&quot;,&quot;Nunavut&quot;, 
&quot;ON&quot;,&quot;Ontario&quot;, 
&quot;PE&quot;,&quot;Prince Edward Island&quot;, 
&quot;QC&quot;,&quot;Quebec&quot;, 
&quot;SK&quot;,&quot;Saskatchewan&quot;, 
&quot;YT&quot;,&quot;Yukon Territory&quot;, 
&quot;NA&quot;,&quot;&quot;,
&quot;N/A&quot;,&quot;&quot;,
&quot;NONE&quot;,&quot;&quot;,
&quot;-&quot;,&quot;&quot;,
BillingState),
IF(ISBLANK(BillingState),&quot;-&quot;,BillingState))</formula>
        <name>Change billing state abbreviations</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_shipping_state_abbreviations</fullName>
        <field>ShippingState</field>
        <formula>CASE(upper(ShippingState), 
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
ShippingState)</formula>
        <name>Change shipping state abbreviations</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Check_box_T_for_Consider_Deletion</fullName>
        <field>Consider_Deletion__c</field>
        <literalValue>1</literalValue>
        <name>Check box = T for Consider Deletion</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Chop_http_off_website</fullName>
        <field>Website</field>
        <formula>RIGHT(Website,LEN(Website)-7)</formula>
        <name>Chop http off website</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Website</fullName>
        <field>Website</field>
        <name>Clear Website</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Convert_Data_com_Annual_Revenue</fullName>
        <field>AnnualRevenue</field>
        <formula>Annual_Revenue_Data_com__c/1000000</formula>
        <name>Convert Data.com Annual Revenue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_Partner_Manager_Acct</fullName>
        <field>Partner_Manager__c</field>
        <formula>IF(OR(UPPER(BillingCountry)=&quot;UNITED KINGDOM&quot;,UPPER(BillingCountry)=&quot;IRELAND&quot;),&quot;Andy Ostrowski&quot;,
IF(OR(Region__c=&quot;ANZ&quot;,Region__c=&quot;Asia Pac&quot;),&quot;Andy Ostrowski&quot;,
IF(Region__c=&quot;LATAM&quot;,&quot;David Serna&quot;,
IF(AND(UPPER(BillingCountry)&lt;&gt;&quot;UNITED STATES&quot;,UPPER(BillingCountry)&lt;&gt;&quot;CANADA&quot;),&quot;Andy Ostrowski&quot;,
IF(CONTAINS(TEXT(Industry),&quot;Federal&quot;),&quot;Sonny King&quot;,
CASE(UPPER( BillingState ), 
&quot;ALABAMA&quot;,&quot;Wes Campbell&quot;,
&quot;ALASKA&quot;,&quot;Laura Nielson&quot;,
&quot;ARIZONA&quot;,&quot;Scott Masse&quot;,
&quot;ARKANSAS&quot;,&quot;Wes Campbell&quot;,
&quot;CALIFORNIA&quot;,&quot;Laura Nielson&quot;,
&quot;COLORADO&quot;,&quot;Scott Masse&quot;,
&quot;CONNECTICUT&quot;,&quot;Dan DiPalma&quot;,
&quot;DISTRICT OF COLUMBIA&quot;,&quot;Sonny King&quot;,
&quot;DELAWARE&quot;,&quot;Daniel Charland&quot;,
&quot;FLORIDA&quot;,&quot;Wes Campbell&quot;,
&quot;GEORGIA&quot;,&quot;Wes Campbell&quot;,
&quot;HAWAII&quot;,&quot;Laura Nielson&quot;,
&quot;IDAHO&quot;,&quot;Scott Masse&quot;,
&quot;ILLINOIS&quot;,&quot;Sonny King&quot;,
&quot;INDIANA&quot;,&quot;Sonny King&quot;,
&quot;IOWA&quot;,&quot;Scott Masse&quot;,
&quot;KANSAS&quot;,&quot;Scott Masse&quot;,
&quot;KENTUCKY&quot;,&quot;Sonny King&quot;,
&quot;LOUISIANA&quot;,&quot;Wes Campbell&quot;,
&quot;MAINE&quot;,&quot;Dan DiPalma&quot;,
&quot;MARYLAND&quot;,&quot;Daniel Charland&quot;,
&quot;MASSACHUSETTS&quot;,&quot;Dan DiPalma&quot;,
&quot;MICHIGAN&quot;,&quot;Daniel Charland&quot;,
&quot;MINNESOTA&quot;,&quot;Daniel Charland&quot;,
&quot;MISSISSIPPI&quot;,&quot;Wes Campbell&quot;,
&quot;MISSOURI&quot;,&quot;Scott Masse&quot;,
&quot;MONTANA&quot;,&quot;Scott Masse&quot;,
&quot;NEBRASKA&quot;,&quot;Scott Masse&quot;,
&quot;NEVADA&quot;,&quot;Scott Masse&quot;,
&quot;NEW HAMPSHIRE&quot;,&quot;Dan DiPalma&quot;,
&quot;NEW JERSEY&quot;,&quot;Ashley Hickey&quot;,
&quot;NEW MEXICO&quot;,&quot;Scott Masse&quot;,
&quot;NEW YORK&quot;,&quot;Ashley Hickey&quot;,
&quot;NORTH CAROLINA&quot;,&quot;Wes Campbell&quot;,
&quot;NORTH DAKOTA&quot;,&quot;Scott Masse&quot;,
&quot;OHIO&quot;,&quot;Sonny King&quot;,
&quot;OKLAHOMA&quot;,&quot;Scott Masse&quot;,
&quot;OREGON&quot;,&quot;Laura Nielson&quot;,
&quot;PENNSYLVANIA&quot;,&quot;Daniel Charland&quot;,
&quot;RHODE ISLAND&quot;,&quot;Dan DiPalma&quot;,
&quot;SOUTH CAROLINA&quot;,&quot;Wes Campbell&quot;,
&quot;SOUTH DAKOTA&quot;,&quot;Dan DiPalma&quot;,
&quot;TENNESSEE&quot;,&quot;Wes Campbell&quot;,
&quot;TEXAS&quot;,&quot;Scott Masse&quot;,
&quot;UTAH&quot;,&quot;Scott Masse&quot;,
&quot;VERMONT&quot;,&quot;Dan DiPalma&quot;,
&quot;VIRGINIA&quot;,&quot;Sonny King&quot;,
&quot;WASHINGTON&quot;,&quot;Laura Nielson&quot;,
&quot;WEST VIRGINIA&quot;,&quot;Sonny King&quot;,
&quot;WISCONSIN&quot;,&quot;Daniel Charland&quot;,
&quot;WYOMING&quot;,&quot;Scott Masse&quot;,
&quot;BRITISH COLUMBIA&quot;,&quot;Laura Nielson&quot;,
&quot;ALBERTA&quot;,&quot;Laura Nielson&quot;,
&quot;SASKATCHEWAN&quot;,&quot;Laura Nielson&quot;,
&quot;MANITOBA&quot;,&quot;Laura Nielson&quot;,
&quot;ONTARIO&quot;,&quot;Daniel Charland&quot;,
&quot;QUEBEC&quot;,&quot;Daniel Charland&quot;,
&quot;NEW BRUNSWICK&quot;,&quot;Daniel Charland&quot;,
&quot;NOVA SCOTIA&quot;,&quot;Daniel Charland&quot;,
&quot;NEWFOUNDLAND&quot;,&quot;Daniel Charland&quot;,
&quot;AL&quot;,&quot;Wes Campbell&quot;,
&quot;AK&quot;,&quot;Laura Nielson&quot;,
&quot;AZ&quot;,&quot;Scott Masse&quot;,
&quot;AR&quot;,&quot;Scott Masse&quot;,
&quot;CA&quot;,&quot;Laura Nielson&quot;,
&quot;CO&quot;,&quot;Scott Masse&quot;,
&quot;CT&quot;,&quot;Dan DiPalma&quot;,
&quot;DC&quot;,&quot;Sonny King&quot;,
&quot;DE&quot;,&quot;Daniel Charland&quot;,
&quot;FL&quot;,&quot;Wes Campbell&quot;,
&quot;GA&quot;,&quot;Wes Campbell&quot;,
&quot;HI&quot;,&quot;Laura Nielson&quot;,
&quot;ID&quot;,&quot;Scott Masse&quot;,
&quot;IL&quot;,&quot;Sonny King&quot;,
&quot;IN&quot;,&quot;Sonny King&quot;,
&quot;IA&quot;,&quot;Scott Masse&quot;,
&quot;KS&quot;,&quot;Scott Masse&quot;,
&quot;KY&quot;,&quot;Sonny King&quot;,
&quot;LA&quot;,&quot;Wes Campbell&quot;,
&quot;ME&quot;,&quot;Dan DiPalma&quot;,
&quot;MD&quot;,&quot;Daniel Charland&quot;,
&quot;MA&quot;,&quot;Dan DiPalma&quot;,
&quot;MI&quot;,&quot;Daniel Charland&quot;,
&quot;MN&quot;,&quot;Daniel Charland&quot;,
&quot;MS&quot;,&quot;Wes Campbell&quot;,
&quot;MO&quot;,&quot;Scott Masse&quot;,
&quot;MT&quot;,&quot;Scott Masse&quot;,
&quot;NE&quot;,&quot;Scott Masse&quot;,
&quot;NV&quot;,&quot;Scott Masse&quot;,
&quot;NH&quot;,&quot;Dan DiPalma&quot;,
&quot;NJ&quot;,&quot;Ashley Hickey&quot;,
&quot;NM&quot;,&quot;Scott Masse&quot;,
&quot;NY&quot;,&quot;Ashley Hickey&quot;,
&quot;NC&quot;,&quot;Wes Campbell&quot;,
&quot;ND&quot;,&quot;Scott Masse&quot;,
&quot;OH&quot;,&quot;Sonny King&quot;,
&quot;OK&quot;,&quot;Scott Masse&quot;,
&quot;OR&quot;,&quot;Laura Nielson&quot;,
&quot;PA&quot;,&quot;Daniel Charland&quot;,
&quot;RI&quot;,&quot;Dan DiPalma&quot;,
&quot;SC&quot;,&quot;Wes Campbell&quot;,
&quot;SD&quot;,&quot;Scott Masse&quot;,
&quot;TN&quot;,&quot;Wes Campbell&quot;,
&quot;TX&quot;,&quot;Scott Masse&quot;,
&quot;UT&quot;,&quot;Scott Masse&quot;,
&quot;VT&quot;,&quot;Dan DiPalma&quot;,
&quot;VA&quot;,&quot;Sonny King&quot;,
&quot;WA&quot;,&quot;Laura Nielson&quot;,
&quot;WV&quot;,&quot;Sonny King&quot;,
&quot;WI&quot;,&quot;Daniel Charland&quot;,
&quot;WY&quot;,&quot;Scott Masse&quot;,
&quot;BC&quot;,&quot;Laura Nielson&quot;,
&quot;AB&quot;,&quot;Laura Nielson&quot;,
&quot;SK&quot;,&quot;Laura Nielson&quot;,
&quot;MB&quot;,&quot;Laura Nielson&quot;,
&quot;ON&quot;,&quot;Daniel Charland&quot;,
&quot;QB&quot;,&quot;Daniel Charland&quot;,
&quot;NB&quot;,&quot;Daniel Charland&quot;,
&quot;NS&quot;,&quot;Daniel Charland&quot;,
&quot;NF&quot;,&quot;Daniel Charland&quot;,
&quot;&quot;))))))</formula>
        <name>Fill Partner Manager Acct</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_in_Country_if_State_is_Filled</fullName>
        <field>BillingCountry</field>
        <formula>CASE(UPPER( BillingState ), 
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
        <formula>CASE(Industry_clean__c,
&quot;Government/Utilities/Energy&quot;,&quot;Government:&quot;&amp;BR()&amp;&quot;NASA&quot;&amp;BR()&amp;&quot;Department of Defense&quot;&amp;BR()&amp;&quot;Social Security Administration&quot;&amp;BR()&amp;&quot;USDA&quot;&amp;BR()&amp;&quot;Energy and Utilities:&quot;&amp;BR()&amp;&quot;Transocean&quot;&amp;BR()&amp;&quot;Entergy&quot;&amp;BR()&amp;&quot;Cameco&quot;&amp;BR()&amp;&quot;Ambit Energy&quot;&amp;BR()&amp;&quot;Los Angeles Department of Water and Power&quot;&amp;BR()&amp;&quot;Nonprofit:&quot;&amp;BR()&amp;&quot;YMCA&quot;&amp;BR()&amp;&quot;SOCAN&quot;&amp;BR()&amp;&quot;Aerospace Corporation&quot;&amp;BR()&amp;&quot;Boys Town&quot;&amp;BR()&amp;&quot;Measured Progress&quot;,

&quot;Healthcare&quot;,&quot;Mayo Clinic&quot;&amp;BR()&amp;&quot;GE Healthcare&quot;&amp;BR()&amp;&quot;Scripps Health&quot;&amp;BR()&amp;&quot;Connecticut Children’s Hospital&quot;&amp;BR()&amp;&quot;Colorado Children’s Hospital&quot;&amp;BR()&amp;&quot;Moffit Cancer Center&quot;&amp;BR()&amp;&quot;Aspirus Hospital&quot;&amp;BR()&amp;&quot;Adventist Health&quot;&amp;BR()&amp;&quot;Summa Health System&quot;,

&quot;Education&quot;,&quot;Boston College&quot;&amp;BR()&amp;&quot;University of Kansas&quot;&amp;BR()&amp;&quot;Georgia University&quot;&amp;BR()&amp;&quot;Purdue University&quot;&amp;BR()&amp;&quot;Devry&quot;&amp;BR()&amp;&quot;Indiana University&quot;&amp;BR()&amp;&quot;Minnesota State&quot;&amp;BR()&amp;&quot;Iowa State&quot;&amp;BR()&amp;&quot;SUNY&quot;&amp;BR()&amp;&quot;Florida International University&quot;,

&quot;Construction &amp; Manufacturing&quot;,&quot;Lockheed Martin&quot;&amp;BR()&amp;&quot;Texas Industries&quot;&amp;BR()&amp;&quot;Volkswagen&quot;&amp;BR()&amp;&quot;Dow Chemical&quot;&amp;BR()&amp;&quot;International Paper&quot;,

&quot;Financial Services&quot;,&quot;JP Morgan&quot;&amp;BR()&amp;&quot;Royal Bank of Canada&quot;&amp;BR()&amp;&quot;UBS&quot;&amp;BR()&amp;&quot;BMO Financial&quot;&amp;BR()&amp;&quot;BBVA Compass&quot;&amp;BR()&amp;&quot;Aetna&quot;&amp;BR()&amp;&quot;Principal Financial Group&quot;&amp;BR()&amp;&quot;JG Wentworth&quot;&amp;BR()&amp;&quot;Swedbank&quot;&amp;BR()&amp;&quot;Societe General&quot;&amp;BR()&amp;&quot;Quicken Loans&quot;,

&quot;Legal&quot;,&quot;Clifford Chance&quot;&amp;BR()&amp;&quot;Bingham McCutchen&quot;&amp;BR()&amp;&quot;Goodwin Proctor&quot;&amp;BR()&amp;&quot;Kirkland &amp; Ellis&quot;&amp;BR()&amp;&quot;Sheppard Mullin&quot;,

&quot;Consumer Products&quot;,&quot;Coca-Cola&quot;&amp;BR()&amp;&quot;Facebook&quot;&amp;BR()&amp;&quot;Fruit of the Loom&quot;&amp;BR()&amp;&quot;Cannon USA&quot;&amp;BR()&amp;&quot;Bloomin Brands&quot;&amp;BR()&amp;&quot;Disney&quot;&amp;BR()&amp;&quot;BET 365&quot;,

&quot;Technology&quot;,&quot;Citrix Systems&quot;&amp;BR()&amp;&quot;Ingram Micro&quot;&amp;BR()&amp;&quot;Blackberry&quot;&amp;BR()&amp;&quot;SAIC&quot;&amp;BR()&amp;&quot;Kronos&quot;&amp;BR()&amp;&quot;Travelport&quot;&amp;BR()&amp;&quot;Denovo&quot;&amp;BR()&amp;&quot;Dimension Data&quot;&amp;BR()&amp;&quot;Toshiba&quot;,

&quot;Communications&quot;,&quot;CSC&quot;&amp;BR()&amp;&quot;Layered Tech&quot;&amp;BR()&amp;&quot;Fujitsu&quot;&amp;BR()&amp;&quot;Intermedia.net&quot;&amp;BR()&amp;&quot;Peak 10&quot;&amp;BR()&amp;&quot;Swisscom&quot;&amp;BR()&amp;&quot;British Telecom&quot;&amp;BR()&amp;&quot;KPN IT Services&quot;&amp;BR()&amp;&quot;Accenture&quot;&amp;BR()&amp;&quot;Cosentry&quot;&amp;BR()&amp;&quot;Tribune Company&quot;,

&quot;Facebook&quot;&amp;BR()&amp;&quot;Expedia&quot;&amp;BR()&amp;&quot;Disney&quot;&amp;BR()&amp;&quot;Coca-Cola&quot;&amp;BR()&amp;&quot;ADP&quot;&amp;BR()&amp;&quot;Carfax&quot;&amp;BR()&amp;&quot;Aon Corporation&quot;&amp;BR()&amp;&quot;Reed Elsevier&quot;&amp;BR()&amp;&quot;NASA&quot;&amp;BR()&amp;&quot;Cleveland Indians&quot;)</formula>
        <name>Fill in Customer References</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_in_DiscoverOrg_Link</fullName>
        <field>DiscoverOrg_Link__c</field>
        <formula>&quot;https://go.discoverydb.com/eui/#/company/&quot; + TEXT(DiscoverOrg_ID_VMT__c)</formula>
        <name>Fill in DiscoverOrg Link</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_in_Use_Cases</fullName>
        <field>Use_Cases_Customers__c</field>
        <formula>CASE(Industry_for_Use_Cases__c, 
&quot;Government/Utilities/Public&quot;,&quot;US Department of the Navy (Gov’t)&quot;&amp;BR()&amp; 
&quot;Problem: Production infrastructure 80% virtualized, desire increase utilization | Inconsistent QoS | Unreliable capacity planning&quot;&amp;BR()&amp; 
&quot;Result: Increased utilization by 30% | Dramatic QoS increase&quot;&amp;BR()&amp;BR()&amp; 
&quot;Lockheed Martin (Aerospace Defense)&quot;&amp;BR()&amp; 
&quot;Problem: Production infrastructure 50% virtualized, desire increase utilization| QoS struggles&quot;&amp;BR()&amp; 
&quot;Result: Increased utilization by 50% | QoS improved dramatically | Increased IT staff productivity by 20%&quot;&amp;BR()&amp;BR()&amp; 
&quot;Ambit Energy (Utilities)&quot;&amp;BR()&amp; 
&quot;Problem: Underutilized infrastructure | Slow virtualization ROI&quot;&amp;BR()&amp; 
&quot;Result: Increased utilization by 50%&quot;, 

&quot;Healthcare&quot;,&quot;Connecticut Children’s Hospital&quot;&amp;BR()&amp; 
&quot;Problem: An inconsistent Quality of Service (QoS) for/or disruption of virtualized workloads&quot;&amp;BR()&amp; 
&quot;Result: resource utilization went up 40-60% - Increase IT Staff Productivity by 30%&quot;, 

&quot;Construction &amp; Manufacturing&quot;,&quot;Pittsburgh Glass Works&quot;&amp;BR()&amp; 
&quot;Problem: Difficulty completing labor intensive operational tasks&quot;&amp;BR()&amp; 
&quot;Result: Decreased their user-reported tickets/incidents by 10% to 19%| Increased resource utilization 50%&quot;&amp;BR()&amp;BR()&amp; 
&quot;JMC Steel Group&quot;&amp;BR()&amp; 
&quot;Problem: underutilized infrastructure&quot;&amp;BR()&amp; 
&quot;Result: resource utilization went up 40-60%&quot;, 

&quot;Financial Services&quot;,&quot;JP Morgan Chase&quot;&amp;BR()&amp; 
&quot;Problem: Pressure to increase utilization and performance simultaneously | 44,000 VMs | VMware‘s largest customer&quot;&amp;BR()&amp; 
&quot;Result: Increased densities by 40% | Reclaimed 18% storage capacity | VMTurbo inducted into JPMC Hall of Innovation&quot;&amp;BR()&amp;BR()&amp; 
&quot;Aetna&quot;&amp;BR()&amp; 
&quot;Problem: Required 20-30% VDI hub capacity increase, else VDI would be outsourced&quot;&amp;BR()&amp; 
&quot;Result: Enabled 40% increase in existing VDI density | Savings enabled investment for 260% increase in VDI environment (7,500 seats to 27,000 seats) | ROI under 6 months&quot;, 

&quot;Consumer Products&quot;,&quot;Coca Cola, Inc&quot;&amp;BR()&amp; 
&quot;Problem: Underutilized infrastructure| Slow virtualization ROI | Unreliable capacity planning&quot;&amp;BR()&amp; 
&quot;Result: Increased utilization by 30% | Increased IT staff productivity by 30%&quot;&amp;BR()&amp;BR()&amp; 
&quot;H&amp;M&quot;&amp;BR()&amp; 
&quot;Problem: Difficulty completing labor-intensive operational tasks - An inability to plan for the future&quot;&amp;BR()&amp; 
&quot;Result: IT staff increased productivity by 20% - Resource utilization: 20% to 39%&quot;, 

&quot;Legal&quot;,&quot;Bingham McCutchen LLP&quot;&amp;BR()&amp; 
&quot;Problem: Difficulty completing labor-intensive operational tasks - Underutilized infrastructure - Slow realization of value from virtualization initiatives&quot;&amp;BR()&amp; 
&quot;Result: IT staff productivity 30% - resource utilization increased by 40%&quot;, 

&quot;Communications&quot;,&quot;US Cellular&quot;&amp;BR()&amp; 
&quot;Problem: Seeking hardware purchase deferment | vC Ops failed to reliably scale with 600% infrastructure growth&quot;&amp;BR()&amp; 
&quot;Result: Deferred hardware purchase | ROI in &lt; 3 months | Realized savings of $3M+ over 36 months via HW deferments&quot;, 

&quot;Technology&quot;,&quot;Fujitsu&quot;&amp;BR()&amp; 
&quot;Problem: Underutilized infrastructure - An inability to plan for the future – difficulty completing labor intensive operational task - An inconsistent Quality of Service (QoS) for/or disruption of virtualized workloads&quot;&amp;BR()&amp; 
&quot;Result: Increased utilization by 40% | QoS improved dramatically | Increased IT staff productivity by 20%&quot;, 

&quot;Education&quot;,&quot;Boston College&quot;&amp;BR()&amp; 
&quot;Problem: Underutilized infrastructure| Slow virtualization ROI | Unreliable capacity planning&quot;&amp;BR()&amp; 
&quot;Result: Increased utilization by 50% | Increased IT staff productivity by 30%&quot;, 

&quot;ADP&quot;&amp;BR()&amp; 
&quot;Problem: An inconsistent Quality of Service (QoS) for/or disruption of virtualized workloads - An inability to plan for the future&quot;&amp;BR()&amp; 
&quot;Result: Increased utilization by 40% | QoS improved dramatically | Increased IT staff productivity by 20%&quot; 
)</formula>
        <name>Fill in Use Cases</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Industry_clean_1_field_update</fullName>
        <field>Industry_clean_1__c</field>
        <formula>IF(TEXT(Industry)=&quot;&quot;,&quot;&quot;,
IF(TEXT(Industry)=&quot;Biotech &amp; Pharma&quot;,&quot;Biotech &amp; Pharma&quot;,
IF(TEXT(Industry)=&quot;Construction &amp; Engineering&quot;,&quot;Construction &amp; Engineering&quot;,
IF(TEXT(Industry)=&quot;Education&quot;,&quot;Education&quot;,
IF(TEXT(Industry)=&quot;Energy &amp; Utilities&quot;,&quot;Energy &amp; Utilities&quot;,
IF(TEXT(Industry)=&quot;Financial Services&quot;,&quot;Financial Services&quot;,
IF(TEXT(Industry)=&quot;Food &amp; Beverage&quot;,&quot;Food &amp; Beverage&quot;,
IF(TEXT(Industry)=&quot;Government&quot;,&quot;Government&quot;,
IF(TEXT(Industry)=&quot;Healthcare&quot;,&quot;Healthcare&quot;,
IF(TEXT(Industry)=&quot;Insurance&quot;,&quot;Insurance&quot;,
IF(TEXT(Industry)=&quot;Manufacturing &amp; Industrials&quot;,&quot;Manufacturing &amp; Industrials&quot;,
IF(TEXT(Industry)=&quot;Nonprofit&quot;,&quot;Nonprofit&quot;,
IF(TEXT(Industry)=&quot;Professional Services: Legal&quot;,&quot;Professional Services: Legal&quot;,
IF(TEXT(Industry)=&quot;Professional Services: Other&quot;,&quot;Professional Services: Other&quot;,
IF(TEXT(Industry)=&quot;Retail &amp; Consumer Products&quot;,&quot;Retail &amp; Consumer Products&quot;,
IF(TEXT(Industry)=&quot;Service Providers&quot;,&quot;Service Providers&quot;,
IF(TEXT(Industry)=&quot;Tech: Internet&quot;,&quot;Tech: Internet&quot;,
IF(TEXT(Industry)=&quot;Tech: All Other&quot;,&quot;Tech: All Other&quot;,
IF(TEXT(Industry)=&quot;Telecom &amp; Media&quot;,&quot;Telecom &amp; Media&quot;,
IF(TEXT(Industry)=&quot;Transportation &amp; Logistics&quot;,&quot;Transportation &amp; Logistics&quot;,
IF(TEXT(Industry)=&quot;Travel &amp; Leisure&quot;,&quot;Travel &amp; Leisure&quot;,
IF(TEXT(Industry)=&quot;Wholesale&quot;,&quot;Wholesale&quot;,
IF(TEXT(Industry)=&quot;Other&quot;,&quot;Other&quot;,
IF(FIND(&quot;MSP&quot;,TEXT(Industry))&gt;0,&quot;Service Providers&quot;,
IF(FIND(&quot;MANAGED SERVICE PROVIDER&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Service Providers&quot;,
IF(FIND(&quot;SUPPORT OUTSOURCING&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Service Providers&quot;,
IF(FIND(&quot;CLOUD&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Service Providers&quot;,
IF(FIND(&quot;HOSTING&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Service Providers&quot;,
IF(FIND(&quot;INTEGRATOR&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Service Providers&quot;,
IF(FIND(&quot;INTERNET&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Tech: Internet&quot;,
IF(FIND(&quot;WEB&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Tech: Internet&quot;,
IF(FIND(&quot;ECOMMERCE&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Tech: Internet&quot;,
IF(FIND(&quot;E-COMMERCE&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Tech: Internet&quot;,
IF(FIND(&quot;FINANC&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Financial Services&quot;,
IF(FIND(&quot;BANK&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Financial Services&quot;,
IF(FIND(&quot;FUND&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Financial Services&quot;,
IF(FIND(&quot;MORTGAGE&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Financial Services&quot;,
IF(FIND(&quot;INVESTMENT&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Financial Services&quot;,
IF(FIND(&quot;CREDIT&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Financial Services&quot;,
IF(FIND(&quot;ACCOUNTING&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Financial Services&quot;,
IF(FIND(&quot;ACCOUNTANT&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Financial Services&quot;,
IF(FIND(&quot;PENSION&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Financial Services&quot;,
IF(FIND(&quot;SECURITIES&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Financial Services&quot;,
&quot;Other&quot;)))))))))))))))))))))))))))))))))))))))))))</formula>
        <name>Industry (clean) 1 field update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Industry_clean_2_field_update</fullName>
        <field>Industry_clean_2__c</field>
        <formula>IF(TEXT(Industry)=&quot;Exchanges&quot;,&quot;Financial Services&quot;,
IF(FIND(&quot;CAPITAL MARK&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Financial Services&quot;,
IF(FIND(&quot;INSURANCE&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Insurance&quot;,
IF(FIND(&quot;COLLEGE&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Education&quot;,
IF(FIND(&quot;UNIVERSIT&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Education&quot;,
IF(FIND(&quot;EDUCAT&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Education&quot;,
IF(FIND(&quot;SCHOOL&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Education&quot;,
IF(FIND(&quot;HOSPITALITY&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Travel &amp; Leisure&quot;,
IF(FIND(&quot;HEALTH&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Healthcare&quot;,
IF(FIND(&quot;HOSPITAL&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Healthcare&quot;,
IF(FIND(&quot;PATIENT CARE&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Healthcare&quot;,
IF(FIND(&quot;NURS&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Healthcare&quot;,
IF(FIND(&quot;MEDICAL&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Healthcare&quot;,
IF(FIND(&quot;REHABIL&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Healthcare&quot;,
IF(FIND(&quot;AMBULATOR&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Healthcare&quot;,
IF(FIND(&quot;OUTPATIENT&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Healthcare&quot;,
IF(FIND(&quot;DENTIST&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Healthcare&quot;,
IF(FIND(&quot;DENTAL&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Healthcare&quot;,
IF(FIND(&quot;BIOTECH&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Biotech &amp; Pharma&quot;,
IF(FIND(&quot;BIO-TECH&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Biotech &amp; Pharma&quot;,
IF(FIND(&quot;PHARMA&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Biotech &amp; Pharma&quot;,
IF(FIND(&quot;CONSTRUCTION&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Construction &amp; Engineering&quot;,
IF(FIND(&quot;ENGINEER&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Construction &amp; Engineering&quot;,
IF(FIND(&quot;BUILDING&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Construction &amp; Engineering&quot;,
IF(FIND(&quot;MANUFACT&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Manufacturing &amp; Industrials&quot;,
IF(FIND(&quot;CHEMICALS&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Manufacturing &amp; Industrials&quot;,
IF(FIND(&quot;INDUSTRIAL&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Manufacturing &amp; Industrials&quot;,
IF(FIND(&quot;MACHINERY&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Manufacturing &amp; Industrials&quot;,
IF(FIND(&quot;MANU&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Manufacturing &amp; Industrials&quot;,
IF(FIND(&quot;NONPROFIT&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Nonprofit&quot;,
IF(FIND(&quot;NON-PROFIT&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Nonprofit&quot;,
IF(FIND(&quot;NON PROFIT&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Nonprofit&quot;,
IF(FIND(&quot;NOT FOR PROFIT&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Nonprofit&quot;,
IF(FIND(&quot;NOT-FOR-PROFIT&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Nonprofit&quot;,
IF(FIND(&quot;CHARIT&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Nonprofit&quot;,
IF(FIND(&quot;TRANSPORTATION&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Transportation &amp; Logistics&quot;,
IF(FIND(&quot;LOGISTICS&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Transportation &amp; Logistics&quot;,
IF(FIND(&quot;SHIPPING&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Transportation &amp; Logistics&quot;,
IF(FIND(&quot;AVIATION&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Aerospace &amp; Defense&quot;,
IF(FIND(&quot;TRUCKING&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Transportation &amp; Logistics&quot;,
IF(FIND(&quot;AIRLINE&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Transportation &amp; Logistics&quot;,
IF(FIND(&quot;HIGHWAY&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Transportation &amp; Logistics&quot;,
IF(FIND(&quot;RAIL&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Transportation &amp; Logistics&quot;,
&quot;Other&quot;)))))))))))))))))))))))))))))))))))))))))))</formula>
        <name>Industry (clean) 2 field update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Industry_clean_3_field_update</fullName>
        <field>Industry_clean_3__c</field>
        <formula>IF(FIND(&quot;TRANSIT&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Transportation &amp; Logistics&quot;,
IF(FIND(&quot;RETAIL&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Retail &amp; Consumer Products&quot;,
IF(FIND(&quot;STORES&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Retail &amp; Consumer Products&quot;,
IF(FIND(&quot;CONSUMER PRODUCTS&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Retail &amp; Consumer Products&quot;,
IF(FIND(&quot;CONSUMER GOODS&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Retail &amp; Consumer Products&quot;,
IF(FIND(&quot;CONSUMER PACKA&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Retail &amp; Consumer Products&quot;,
IF(FIND(&quot;APPAREL&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Retail &amp; Consumer Products&quot;,
IF(FIND(&quot;PERSONAL PRODUCTS&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Retail &amp; Consumer Products&quot;,
IF(FIND(&quot;HOUSEHOLD PRODUCTS&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Retail &amp; Consumer Products&quot;,
IF(FIND(&quot;LAW &quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Professional Services: Legal&quot;,
IF(FIND(&quot;LEGAL&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Professional Services: Legal&quot;,
IF(FIND(&quot;PROFESSIONAL SERVICES&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Professional Services: Other&quot;,
IF(FIND(&quot;CONSULT&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Professional Services: Other&quot;,
IF(FIND(&quot;BUSINESS SERVICES&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Professional Services: Other&quot;,
IF(FIND(&quot;BUSINESS SUPPORT&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Professional Services: Other&quot;,
IF(TEXT(Industry)=&quot;Services&quot;,&quot;Professional Services: Other&quot;,
IF(FIND(&quot;BUSINESS PRODUCTS &amp; SERVICES&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Professional Services: Other&quot;,
IF(FIND(&quot;HUMAN RESOURCES&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Professional Services: Other&quot;,
IF(FIND(&quot;ADVERTIS&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Professional Services: Other&quot;,
IF(FIND(&quot;TELECOM&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Telecom &amp; Media&quot;,
IF(FIND(&quot;TELCO&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Telecom &amp; Media&quot;,
IF(FIND(&quot;MEDIA&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Telecom &amp; Media&quot;,
IF(FIND(&quot;COMMUNICATIONS&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Telecom &amp; Media&quot;,
IF(FIND(&quot;BROADCAST&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Telecom &amp; Media&quot;,
IF(FIND(&quot;CABLE&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Telecom &amp; Media&quot;,
IF(FIND(&quot;TELEPHONE&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Telecom &amp; Media&quot;,
IF(FIND(&quot;TRAVEL&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Travel &amp; Leisure&quot;,
IF(FIND(&quot;LEISURE&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Travel &amp; Leisure&quot;,
IF(FIND(&quot;RECREATION&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Travel &amp; Leisure&quot;,
IF(FIND(&quot;SPORT&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Travel &amp; Leisure&quot;,
IF(FIND(&quot;HOTEL&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Travel &amp; Leisure&quot;,
IF(FIND(&quot;MOTEL&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Travel &amp; Leisure&quot;,
IF(FIND(&quot;ACCOMMODATION&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Travel &amp; Leisure&quot;,
IF(FIND(&quot;GAMBLING&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Travel &amp; Leisure&quot;,
IF(FIND(&quot;CASINO&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Travel &amp; Leisure&quot;,
IF(FIND(&quot;GOLF&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Travel &amp; Leisure&quot;,
IF(FIND(&quot;COUNTRY CLUB&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Travel &amp; Leisure&quot;,
IF(FIND(&quot;MOVIE&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Travel &amp; Leisure&quot;,
IF(FIND(&quot;MUSIC&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Travel &amp; Leisure&quot;,
IF(FIND(&quot;MUSEUM&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Travel &amp; Leisure&quot;,
IF(FIND(&quot;PERFORMING ART&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Travel &amp; Leisure&quot;,
IF(FIND(&quot;PARKS&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Travel &amp; Leisure&quot;,
IF(FIND(&quot;MOTION PIC&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Travel &amp; Leisure&quot;,
&quot;Other&quot;)))))))))))))))))))))))))))))))))))))))))))</formula>
        <name>Industry (clean) 3 field update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Industry_clean_4_field_update</fullName>
        <field>Industry_clean_4__c</field>
        <formula>IF(FIND(&quot;SOFTWARE&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Tech: Software&quot;,
IF(FIND(&quot;SAAS&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Tech: Software&quot;,
IF(FIND(&quot;ELECTRONIC&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Tech: All Other&quot;,
IF(FIND(&quot;ELECTRICAL&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Tech: All Other&quot;,
IF(FIND(&quot;SEMICOND&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Tech: All Other&quot;,
IF(FIND(&quot;RESELLER&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Tech: All Other&quot;,
IF(FIND(&quot;DIRECT MARKET RESELLER&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Tech: All Other&quot;,
IF(FIND(&quot;TECH&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Tech: All Other&quot;,
IF(FIND(&quot;DATA PROCESSING&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Tech: All Other&quot;,
IF(FIND(&quot;HIGH TECH&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Tech: All Other&quot;,
IF(FIND(&quot;HIGH-TECH&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Tech: All Other&quot;,
IF(FIND(&quot;HITECH&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Tech: All Other&quot;,
IF(FIND(&quot;IT &quot;,TEXT(Industry))&gt;0,&quot;Tech: All Other&quot;,
IF(FIND(&quot; IT&quot;,TEXT(Industry))&gt;0,&quot;Tech: All Other&quot;,
IF(TEXT(Industry)=&quot;IT&quot;,&quot;Tech: All Other&quot;,
IF(FIND(&quot;COMPUTER&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Tech: All Other&quot;,
IF(FIND(&quot;PROGRAMMING&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Tech: Software&quot;,
IF(FIND(&quot;VAR&quot;,TEXT(Industry))&gt;0,&quot;Tech: All Other&quot;,
IF(FIND(&quot;DMR&quot;,TEXT(Industry))&gt;0,&quot;Tech: All Other&quot;,
IF(FIND(&quot;REAL ESTATE&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Other&quot;,
IF(FIND(&quot;GOVERNMEN&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Government&quot;,
IF(FIND(&quot;STATE&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Government&quot;,
IF(FIND(&quot;PUBLIC&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Government&quot;,
IF(FIND(&quot;FEDERAL&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Government&quot;,
IF(FIND(&quot;LOCAL&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Government&quot;,
IF(FIND(&quot;LEGISLAT&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Government&quot;,
IF(FIND(&quot;COURT&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Government&quot;,
IF(FIND(&quot;JUSTICE&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Government&quot;,
IF(FIND(&quot;PARLIAMENT&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Government&quot;,
IF(FIND(&quot;ENERGY&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Energy &amp; Utilities&quot;,
IF(FIND(&quot;GAS&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Energy &amp; Utilities&quot;,
IF(FIND(&quot;COAL&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Energy &amp; Utilities&quot;,
IF(FIND(&quot;OIL&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Energy &amp; Utilities&quot;,
IF(FIND(&quot;UTILIT&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Energy &amp; Utilities&quot;,
IF(FIND(&quot;MINING&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Energy &amp; Utilities&quot;,
IF(FIND(&quot;ELECTRICITY&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Energy &amp; Utilities&quot;,
IF(FIND(&quot;RESTAUR&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Food &amp; Beverage&quot;,
IF(FIND(&quot;FOOD&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Food &amp; Beverage&quot;,
IF(FIND(&quot;BEVERAGE&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Food &amp; Beverage&quot;,
IF(FIND(&quot;WHOLESAL&quot;,UPPER(TEXT(Industry)))&gt;0,&quot;Wholesale&quot;,
&quot;Other&quot;))))))))))))))))))))))))))))))))))))))))</formula>
        <name>Industry (clean) 4 field update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>MALatitude_c_Purge</fullName>
        <field>MALatitude__c</field>
        <name>Account.MALatitude_c_Purge</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>MALatitudec_Purge</fullName>
        <description>Purge the MALatitude__c field on the Account if selected address fields change; created by the Metadata API</description>
        <field>MALatitude__c</field>
        <name>MA MALatitude__c Purge</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>MALongitude_c_Purge</fullName>
        <field>MALongitude__c</field>
        <name>Account.MALongitude_c_Purge</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>MALongitudec_Purge</fullName>
        <description>Purge the MALongitude__c field on the Account if selected address fields change; created by the Metadata API</description>
        <field>MALongitude__c</field>
        <name>MA MALongitude__c Purge</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Make_type_field_equal_tech_partner</fullName>
        <field>Type</field>
        <literalValue>Technology Partner</literalValue>
        <name>Make type field equal tech partner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>New_Account_Workflow</fullName>
        <field>Ready_To_Assign_Territory_Owner__c</field>
        <literalValue>1</literalValue>
        <name>New Account Workflow</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Rating_equals_Cold</fullName>
        <field>Rating</field>
        <literalValue>Cold</literalValue>
        <name>Rating equals Cold</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Region_country_1_update</fullName>
        <field>Region_country_1__c</field>
        <formula>CASE(UPPER(BillingCountry),
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
        <name>Region (country 1) update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Region_country_2_update</fullName>
        <field>Region_country_2__c</field>
        <formula>CASE(UPPER(BillingCountry),
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
&quot;US VIRGIN ISLANDS&quot;, &quot;Caribbean Islands&quot;,
&quot;BERMUDA&quot;, &quot;Caribbean Islands&quot;,
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
        <name>Region (country 2) update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Region_state_update</fullName>
        <field>Region_state__c</field>
        <formula>CASE(UPPER(BillingState),
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
        <name>Region (state) update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Remove_http</fullName>
        <field>Website</field>
        <formula>RIGHT(Website,7)</formula>
        <name>Remove http://</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_Rating</fullName>
        <field>Rating</field>
        <literalValue>Cold</literalValue>
        <name>Reset Rating</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_Revisit_Date</fullName>
        <field>Revisit_Date__c</field>
        <name>Reset Revisit Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Sector_Stamp</fullName>
        <field>Sector__c</field>
        <formula>CASE(Industry_clean__c,
 &quot;Energy &amp; Utilities&quot;, &quot;Communications&quot;,
 &quot;Service Providers&quot;, &quot;Communications&quot;,
 &quot;Tech: All Other&quot;, &quot;Communications&quot;,
 &quot;Tech: Internet&quot;, &quot;Communications&quot;,
 &quot;Tech: Software&quot;, &quot;Communications&quot;,
 &quot;Telecom &amp; Media&quot;, &quot;Communications&quot;,
 &quot;Biotech &amp; Pharma&quot;, &quot;Communications&quot;,
 &quot;Construction &amp; Engineering&quot;,&quot;Distribution&quot;,
 &quot;Food &amp; Beverage&quot;,&quot;Distribution&quot;,
 &quot;Retail &amp; Consumer Products&quot;,&quot;Distribution&quot;,
 &quot;Transportation &amp; Logistics&quot;,&quot;Distribution&quot;,
 &quot;Travel &amp; Leisure&quot;,&quot;Distribution&quot;,
 &quot;Wholesale&quot;,&quot;Distribution&quot;,
 &quot;Financial Services&quot;, &quot;Financial Services&quot;,
 &quot;Insurance&quot;, &quot;Financial Services&quot;,
 &quot;Manufacturing &amp; Industrials&quot;, &quot;Industrial Products&quot;,
 &quot;Professional Services: Legal&quot;, &quot;Professional Services&quot;,
 &quot;Professional Services: Other&quot;, &quot;Professional Services&quot;,
 &quot;Aerospace &amp; Defense&quot;,&quot;Public&quot;,
 &quot;Education&quot;,&quot;Public&quot;,
 &quot;Government&quot;,&quot;Public&quot;,
 &quot;Healthcare&quot;,&quot;Public&quot;,
 &quot;Nonprofit&quot;,&quot;Public&quot;,
  &quot;Other&quot;)</formula>
        <name>Sector Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_IT_Budget_Mil</fullName>
        <field>IT_Budget_Mil__c</field>
        <formula>DSCORGPKG__IT_Budget__c/1000000</formula>
        <name>Set IT Budget (Mil)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_3_Year_Employee_Growth</fullName>
        <field>X3_Year_Employee_Growth__c</field>
        <formula>VALUE(DSCORGPKG__DO_3yr_Employees_Growth__c)</formula>
        <name>Stamp 3 Year Employee Growth %</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_3_Year_Sales_Growth</fullName>
        <field>X3_Year_Sales_Growth__c</field>
        <formula>VALUE(DSCORGPKG__DO_3yr_Sales_Growth__c)</formula>
        <name>Stamp 3 Year Sales Growth %</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Account_Last_Reviewed</fullName>
        <field>Account_Last_Reviewed__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Account Last Reviewed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_BDR_Focus_Date</fullName>
        <field>BDR_Focus_Account_Date_Stamp__c</field>
        <formula>TODAY()</formula>
        <name>Stamp BDR Focus Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Core_Count_Change_Date</fullName>
        <field>Last_Core_Count_Update_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Core Count Change Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Customer_Experience_Owner</fullName>
        <field>Customer_Experience_Owner2__c</field>
        <formula>IF(TEXT(Manual_Customer_Experience_Owner__c)&lt;&gt;&quot;&quot;,TEXT(Manual_Customer_Experience_Owner__c), 
IF(OR(TEXT(Customer_LTV_Tier__c)=&quot;Tier 1 (1M+)&quot;,TEXT(Customer_LTV_Tier__c)=&quot;Tier 2 (500K+)&quot;), 
IF(Account_Management_Territory__c=&quot;East&quot;,&quot;Andy Robinson&quot;, 
IF(Account_Management_Territory__c=&quot;Central&quot;,&quot;Ryan Stone&quot;, 
IF(Account_Management_Territory__c=&quot;West&quot;,&quot;Lizzy Leahy&quot;,&quot;&quot;))), 
IF(TEXT(Customer_LTV_Tier__c)=&quot;Tier 3 (100K+)&quot;, 
IF(OR(Territory_Owner_Team__c=&quot;Ganas iOS&quot;),&quot;Robert Young&quot;, 
IF(Account_Management_Territory__c=&quot;East&quot;,&quot;Michael Scott&quot;, 
IF(Account_Management_Territory__c=&quot;Central&quot;,&quot;Ryan Stone&quot;, 
IF(Account_Management_Territory__c=&quot;West&quot;,&quot;Chris Ward&quot;,&quot;&quot;)))), 
IF(OR(Territory_Owner_Team__c=&quot;Ganas iOS&quot;),&quot;Robert Young&quot;, 
IF(Account_Management_Territory__c=&quot;East&quot;,&quot;Michael Scott&quot;, 
IF(Account_Management_Territory__c=&quot;West&quot;,&quot;Neil Vaid&quot;, 
IF(Account_Management_Territory__c=&quot;Central&quot;,&quot;Neil Vaid&quot;,&quot;&quot; 
)))))))</formula>
        <name>Stamp Customer Experience Owner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Customer_Experience_Owner_Lookup</fullName>
        <field>Customer_Experience_Owner3__c</field>
        <lookupValue>chris.ward@vmturbo.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Stamp Customer Experience Owner (Lookup)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Customer_Experience_Owner_Region</fullName>
        <field>Customer_Experience_Owner_Region__c</field>
        <formula>Case(Customer_Experience_Owner2__c,
&quot;Andy Robinson&quot;,&quot;East&quot;,
&quot;Michael Scott&quot;,&quot;East&quot;,
&quot;Robert Young&quot;,&quot;East&quot;,
&quot;Hong Yi&quot;,&quot;East&quot;,
&quot;Ryan Stone&quot;,&quot;West&quot;,
&quot;Lizzy Leahy&quot;,&quot;West&quot;,
&quot;Kyle Murphy&quot;,&quot;West&quot;,
&quot;Andrew Cataldo&quot;,&quot;West&quot;,
&quot;Neil Vaid&quot;,&quot;West&quot;,
&quot;&quot;)</formula>
        <name>Stamp Customer Experience Owner Region</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Customer_Status_Update</fullName>
        <field>Customer_Status_Last_Updated__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Customer Status Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_DiscoverOrg_ID</fullName>
        <field>DiscoverOrg_ID_VMT__c</field>
        <formula>VALUE(DSCORGPKG__DiscoverOrg_ID__c)</formula>
        <name>Stamp DiscoverOrg ID</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_IT_Budget</fullName>
        <field>IT_Budget_Mil__c</field>
        <formula>DSCORGPKG__IT_Budget__c/1000000</formula>
        <name>Stamp IT Budget</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_IT_Employees</fullName>
        <field>IT_Employees__c</field>
        <formula>DSCORGPKG__IT_Employees__c</formula>
        <name>Stamp IT Employees</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Industry_clean_text_field</fullName>
        <field>Industry_clean_text__c</field>
        <formula>Industry_clean__c</formula>
        <name>Stamp Industry (clean - text) field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Intended_Sales_Engineer</fullName>
        <field>Intended_Sales_Engineer__c</field>
        <formula>CASE(Territory_Owner_Team__c,
&quot;SEC&quot;,&quot;Kevin Lamb, Ryan Strehlke, Paul Zychowicz, Bobby Coppersmith&quot;,
&quot;Closers Club&quot;,&quot;Kevin Lamb, Ryan Strehlke, Paul Zychowicz, Bobby Coppersmith&quot;,
&quot;The Hunchbacks&quot;,&quot;Will Searle,Jeremy Levinson, Stephen Wagner&quot;,
&quot;The Wild West&quot;,&quot;Will Searle,Jeremy Levinson, Stephen Wagner&quot;,
&quot;Enterprise East&quot;,&quot;Don McKeith, Matt Vetter, Jacob Ben-David, Hillel Adler, James Dyckowski, Ron Whitling&quot;,
&quot;Enterprise East 1&quot;,&quot;Don McKeith, Matt Vetter, Jacob Ben-David, Hillel Adler, James Dyckowski, Ron Whitling&quot;,
&quot;Enterprise East 2&quot;,&quot;Don McKeith, Matt Vetter, Jacob Ben-David, Hillel Adler, James Dyckowski, Ron Whitling&quot;,
&quot;Enterprise East 3&quot;,&quot;Don McKeith, Matt Vetter, Jacob Ben-David, Hillel Adler, James Dyckowski, Ron Whitling&quot;,
&quot;Enterprise Central&quot;,&quot;Matt Ray, Dan Butzer, Ryan DeWaele, Charles Russell, Mike Seville, Jason Huff, Al Vasek, Paul Mallick, Tom Becchetti&quot;,
&quot;Enterprise Central 1&quot;,&quot;Matt Ray, Dan Butzer, Ryan DeWaele, Charles Russell, Mike Seville, Jason Huff, Al Vasek, Paul Mallick, Tom Becchetti&quot;,
&quot;Enterprise Central 2&quot;,&quot;Matt Ray, Dan Butzer, Ryan DeWaele, Charles Russell, Mike Seville, Jason Huff, Al Vasek, Paul Mallick, Tom Becchetti&quot;,
&quot;Enterprise Central 3&quot;,&quot;Matt Ray, Dan Butzer, Ryan DeWaele, Charles Russell, Mike Seville, Jason Huff, Al Vasek, Paul Mallick, Tom Becchetti&quot;,
&quot;Enterprise West Oved&quot;,&quot;Eric Bannon, Darren Boyd, Jimmy Herbert&quot;,
&quot;Enterprise West 1&quot;,&quot;Eric Bannon, Darren Boyd, Jimmy Herbert&quot;,
&quot;Enterprise West 2&quot;,&quot;Eric Bannon, Darren Boyd, Jimmy Herbert&quot;,
&quot;Ganas iOS&quot;,&quot;Anson McCook, Matthew Harcourt&quot;,
&quot;EMEA Enterprise&quot;,&quot;Alec Kemp, Barry Howard, Michael Nagar, Aseem Anwar&quot;,
&quot;APAC Enterprise&quot;,&quot;Ben Archer&quot;,
&quot;&quot;)</formula>
        <name>Stamp Intended Sales Engineer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Last_Update_of_Socket_Count_Date</fullName>
        <field>Last_Socket_Count_Update_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Last Update of Socket Count Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Prior_Customer_Status</fullName>
        <field>Prior_Customer_Status__c</field>
        <formula>TEXT(PRIORVALUE(Customer_Status__c))</formula>
        <name>Stamp Prior Customer Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Turbo_Version_Upgrade_Date</fullName>
        <field>Turbo_Version_Upgrade_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Turbo Version Upgrade Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Update_MSA_Flag</fullName>
        <field>MSA_Update_Flag__c</field>
        <literalValue>1</literalValue>
        <name>Stamp Update MSA Flag</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Velocity_Territory_Owner_Team</fullName>
        <field>Territory_Team__c</field>
        <formula>IF(NOT(ISBLANK(AE_Rep__c)),TEXT(AE_Rep__r.Team__c), 
CASE(UPPER( BillingState ), 
&quot;CONNECTICUT&quot;,&quot;Closers Club&quot;, 
&quot;MAINE&quot;,&quot;Closers Club&quot;, 
&quot;MARYLAND&quot;,&quot;Closers Club&quot;,
&quot;MASSACHUSETTS&quot;,&quot;Closers Club&quot;, 
&quot;NEW BRUNSWICK&quot;,&quot;Closers Club&quot;, 
&quot;NEW HAMPSHIRE&quot;,&quot;Closers Club&quot;, 
&quot;NEW JERSEY&quot;,&quot;Closers Club&quot;,
&quot;NEW YORK&quot;,&quot;Closers Club&quot;, 
&quot;NEWFOUNDLAND&quot;,&quot;Closers Club&quot;, 
&quot;NOVA SCOTIA&quot;,&quot;Closers Club&quot;, 
&quot;ONTARIO&quot;,&quot;Closers Club&quot;, 
&quot;PENNSYLVANIA&quot;,&quot;Closers Club&quot;, 
&quot;PRINCE EDWARD ISLAND&quot;,&quot;Closers Club&quot;, 
&quot;QUEBEC&quot;,&quot;Closers Club&quot;, 
&quot;RHODE ISLAND&quot;,&quot;Closers Club&quot;, 
&quot;VERMONT&quot;,&quot;Closers Club&quot;, 
&quot;ALABAMA&quot;,&quot;SEC&quot;, 
&quot;ARKANSAS&quot;,&quot;SEC&quot;, 
&quot;DELAWARE&quot;,&quot;SEC&quot;, 
&quot;DISTRICT OF COLUMBIA&quot;,&quot;SEC&quot;, 
&quot;FLORIDA&quot;,&quot;SEC&quot;, 
&quot;GEORGIA&quot;,&quot;SEC&quot;, 
&quot;KENTUCKY&quot;,&quot;SEC&quot;,
&quot;MISSISSIPPI&quot;,&quot;SEC&quot;, 
&quot;MISSOURI&quot;,&quot;SEC&quot;, 
&quot;NORTH CAROLINA&quot;,&quot;SEC&quot;, 
&quot;OHIO&quot;,&quot;SEC&quot;, 
&quot;PUERTO RICO&quot;,&quot;SEC&quot;, 
&quot;SOUTH CAROLINA&quot;,&quot;SEC&quot;, 
&quot;TENNESSEE&quot;,&quot;SEC&quot;,
&quot;VIRGINIA&quot;,&quot;SEC&quot;, 
&quot;WEST VIRGINIA&quot;,&quot;SEC&quot;,
&quot;ALASKA&quot;,&quot;The Hunchbacks&quot;, 
&quot;ARIZONA&quot;,&quot;The Hunchbacks&quot;,
&quot;BRITISH COLUMBIA&quot;,&quot;The Hunchbacks&quot;, 
&quot;CALIFORNIA&quot;,&quot;The Hunchbacks&quot;, 
&quot;COLORADO&quot;,&quot;The Hunchbacks&quot;, 
&quot;HAWAII&quot;,&quot;The Hunchbacks&quot;,
&quot;NEVADA&quot;,&quot;The Hunchbacks&quot;,
&quot;OREGON&quot;,&quot;The Hunchbacks&quot;, 
&quot;UTAH&quot;,&quot;The Hunchbacks&quot;, 
&quot;WASHINGTON&quot;,&quot;The Hunchbacks&quot;, 
&quot;ALBERTA&quot;,&quot;The Wild West&quot;, 
&quot;IDAHO&quot;,&quot;The Wild West&quot;, 
&quot;ILLINOIS&quot;,&quot;The Wild West&quot;,
&quot;INDIANA&quot;,&quot;The Wild West&quot;,
&quot;IOWA&quot;,&quot;The Wild West&quot;,
&quot;KANSAS&quot;,&quot;The Wild West&quot;,  
&quot;LOUISIANA&quot;,&quot;The Wild West&quot;,
&quot;MANITOBA&quot;,&quot;The Wild West&quot;,  
&quot;MICHIGAN&quot;,&quot;The Wild West&quot;, 
&quot;MINNESOTA&quot;,&quot;The Wild West&quot;, 
&quot;MONTANA&quot;,&quot;The Wild West&quot;, 
&quot;NEBRASKA&quot;,&quot;The Wild West&quot;, 
&quot;NEW MEXICO&quot;,&quot;The Wild West&quot;, 
&quot;NORTH DAKOTA&quot;,&quot;The Wild West&quot;, 
&quot;NORTHWEST TERRITORIES&quot;,&quot;The Wild West&quot;, 
&quot;NUNAVUT&quot;,&quot;The Wild West&quot;, 
&quot;OKLAHOMA&quot;,&quot;The Wild West&quot;, 
&quot;SASKATCHEWAN&quot;,&quot;The Wild West&quot;,  
&quot;SOUTH DAKOTA&quot;,&quot;The Wild West&quot;, 
&quot;TEXAS&quot;,&quot;The Wild West&quot;, 
&quot;WISCONSIN&quot;,&quot;The Wild West&quot;, 
&quot;WYOMING&quot;,&quot;The Wild West&quot;,
&quot;YUKON TERRITORY&quot;,&quot;The Wild West&quot;, 
&quot;NY&quot;,&quot;Closers Club&quot;, 
&quot;CT&quot;,&quot;Closers Club&quot;, 
&quot;PA&quot;,&quot;Closers Club&quot;, 
&quot;MA&quot;,&quot;Closers Club&quot;, 
&quot;NH&quot;,&quot;Closers Club&quot;, 
&quot;RI&quot;,&quot;Closers Club&quot;, 
&quot;ME&quot;,&quot;Closers Club&quot;, 
&quot;VT&quot;,&quot;Closers Club&quot;, 
&quot;NB&quot;,&quot;Closers Club&quot;, 
&quot;NS&quot;,&quot;Closers Club&quot;, 
&quot;NF&quot;,&quot;Closers Club&quot;, 
&quot;PE&quot;,&quot;Closers Club&quot;, 
&quot;NJ&quot;,&quot;Closers Club&quot;, 
&quot;QC&quot;,&quot;Closers Club&quot;,
&quot;QE&quot;,&quot;Closers Club&quot;,
&quot;ON&quot;,&quot;Closers Club&quot;, 
&quot;MD&quot;,&quot;Closers Club&quot;, 
&quot;OH&quot;,&quot;SEC&quot;, 
&quot;MO&quot;,&quot;SEC&quot;, 
&quot;VA&quot;,&quot;SEC&quot;, 
&quot;NC&quot;,&quot;SEC&quot;, 
&quot;FL&quot;,&quot;SEC&quot;, 
&quot;AL&quot;,&quot;SEC&quot;, 
&quot;TN&quot;,&quot;SEC&quot;, 
&quot;KY&quot;,&quot;SEC&quot;, 
&quot;AR&quot;,&quot;SEC&quot;, 
&quot;MS&quot;,&quot;SEC&quot;, 
&quot;GA&quot;,&quot;SEC&quot;, 
&quot;SC&quot;,&quot;SEC&quot;, 
&quot;PR&quot;,&quot;SEC&quot;, 
&quot;DC&quot;,&quot;SEC&quot;, 
&quot;DE&quot;,&quot;SEC&quot;, 
&quot;WV&quot;,&quot;SEC&quot;, 
&quot;CA&quot;,&quot;The Hunchbacks&quot;, 
&quot;CO&quot;,&quot;The Hunchbacks&quot;, 
&quot;AZ&quot;,&quot;The Hunchbacks&quot;, 
&quot;UT&quot;,&quot;The Hunchbacks&quot;, 
&quot;NV&quot;,&quot;The Hunchbacks&quot;, 
&quot;WA&quot;,&quot;The Hunchbacks&quot;, 
&quot;OR&quot;,&quot;The Hunchbacks&quot;, 
&quot;BC&quot;,&quot;The Hunchbacks&quot;,
&quot;HI&quot;,&quot;The Hunchbacks&quot;, 
&quot;AK&quot;,&quot;The Hunchbacks&quot;,
&quot;WY&quot;,&quot;The Hunchbacks&quot;, 
&quot;IL&quot;,&quot;The Wild West&quot;, 
&quot;IN&quot;,&quot;The Wild West&quot;, 
&quot;MI&quot;,&quot;The Wild West&quot;, 
&quot;MN&quot;,&quot;The Wild West&quot;, 
&quot;WI&quot;,&quot;The Wild West&quot;, 
&quot;KS&quot;,&quot;The Wild West&quot;, 
&quot;IA&quot;,&quot;The Wild West&quot;, 
&quot;OK&quot;,&quot;The Wild West&quot;, 
&quot;NE&quot;,&quot;The Wild West&quot;, 
&quot;MB&quot;,&quot;The Wild West&quot;, 
&quot;ND&quot;,&quot;The Wild West&quot;, 
&quot;SD&quot;,&quot;The Wild West&quot;, 
&quot;LA&quot;,&quot;The Wild West&quot;, 
&quot;TX&quot;,&quot;The Wild West&quot;, 
&quot;NM&quot;,&quot;The Wild West&quot;,  
&quot;AB&quot;,&quot;The Wild West&quot;, 
&quot;ID&quot;,&quot;The Wild West&quot;, 
&quot;MT&quot;,&quot;The Wild West&quot;, 
&quot;SK&quot;,&quot;The Wild West&quot;, 
&quot;NU&quot;,&quot;The Wild West&quot;, 
&quot;YT&quot;,&quot;The Wild West&quot;, 
&quot;NT&quot;,&quot;The Wild West&quot;, 
&quot;&quot;))</formula>
        <name>Stamp Velocity Territory Owner Team</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_product_usage_survey_date</fullName>
        <field>Product_Usage_Updated_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp product usage survey date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TEST_account_field_update</fullName>
        <field>Description</field>
        <formula>PRIORVALUE(Partner_Section_Notes__c)</formula>
        <name>TEST account field update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Take_off_end_of_website</fullName>
        <field>Website</field>
        <formula>LEFT(Website,LEN(Website)-1)</formula>
        <name>Take &quot;/&quot; off end of website</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Time_zone_update_account</fullName>
        <field>Time_Zone__c</field>
        <formula>CASE(UPPER(BillingState), 
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
&quot;&quot;)</formula>
        <name>Time zone update (account)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Focus_Account_Field</fullName>
        <field>Focus_Account_Date_Stamp__c</field>
        <formula>TODAY()</formula>
        <name>Update Focus Account Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Industry_clean_text_1</fullName>
        <field>Industry_clean_text__c</field>
        <formula>Industry_clean_1__c</formula>
        <name>Update Industry (clean - text) 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Industry_clean_text_2</fullName>
        <field>Industry_clean_text__c</field>
        <formula>Industry_clean_2__c</formula>
        <name>Update Industry (clean - text) 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Industry_clean_text_3</fullName>
        <field>Industry_clean_text__c</field>
        <formula>Industry_clean_3__c</formula>
        <name>Update Industry (clean - text) 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Industry_clean_text_4</fullName>
        <field>Industry_clean_text__c</field>
        <formula>Industry_clean_4__c</formula>
        <name>Update Industry (clean - text) 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Industry_for_Use_Cases</fullName>
        <field>Industry_for_Use_Cases__c</field>
        <formula>CASE(Industry_clean__c,
&quot;Aerospace &amp; Defense&quot;,&quot;Government/Utilities/Public&quot;,
&quot;Biotech &amp; Pharma&quot;,&quot;Healthcare&quot;,
&quot;Construction &amp; Engineering&quot;,&quot;Construction &amp; Manufacturing&quot;,
&quot;Education&quot;,&quot;Education&quot;,
&quot;Energy &amp; Utilities&quot;,&quot;Government/Utilities/Public&quot;,
&quot;Financial Services&quot;,&quot;Financial Services&quot;,
&quot;Food &amp; Beverage&quot;,&quot;Consumer Products&quot;,
&quot;Government&quot;,&quot;Government/Utilities/Public&quot;,
&quot;Healthcare&quot;,&quot;Healthcare&quot;,
&quot;Insurance&quot;,&quot;Financial Services&quot;,
&quot;Manufacturing &amp; Industrials&quot;,&quot;Construction &amp; Manufacturing&quot;,
&quot;Nonprofit&quot;,&quot;Government/Utilities/Public&quot;,
&quot;Other&quot;,&quot;Other&quot;,
&quot;Professional Services: Legal&quot;,&quot;Legal&quot;,
&quot;Professional Services: Other&quot;,&quot;Other&quot;,
&quot;Retail &amp; Consumer Products&quot;,&quot;Consumer Products&quot;,
&quot;Service Providers&quot;,&quot;Communications&quot;,
&quot;Tech: All Other&quot;,&quot;Technology&quot;,
&quot;Tech: Software&quot;,&quot;Technology&quot;,
&quot;Tech: Internet&quot;,&quot;Technology&quot;,
&quot;Telecom &amp; Media&quot;,&quot;Communications&quot;,
&quot;Transportation &amp; Logistics&quot;,&quot;Other&quot;,
&quot;Travel &amp; Leisure&quot;,&quot;Consumer Products&quot;,
&quot;Wholesale&quot;,&quot;Consumer Products&quot;,&quot;Other&quot;
)</formula>
        <name>Update Industry for Use Cases</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Partner_Manager</fullName>
        <description>If the text field Partner Manager is blank then pull the WI lookup value for the Partner Manager into this field to populate, otherwise leave the text field value.</description>
        <field>Partner_Manager__c</field>
        <formula>IF(
  (ISBLANK( Partner_Manager__c)),
   PartnerManager__r.Full_Name__c,
   Partner_Manager__c 
   )</formula>
        <name>Update Partner Manager</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_VM_Count_Update_Date</fullName>
        <field>Last_VM_Count_Update_Date__c</field>
        <formula>TODAY()</formula>
        <name>Update VM Count Update Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_billing_country</fullName>
        <field>BillingCountry</field>
        <formula>case(upper(BillingCountry),
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
&quot;UAE&quot;, &quot;United Arab Emirates&quot;,
BillingCountry)</formula>
        <name>Update billing country</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_shipping_country</fullName>
        <field>ShippingCountry</field>
        <formula>case(upper(ShippingCountry),
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
&quot;UAE&quot;, &quot;United Arab Emirates&quot;,
ShippingCountry)</formula>
        <name>Update shipping country</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Account Marked Outsourced</fullName>
        <actions>
            <name>Account_Marked_Outsourced</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>OR(
TEXT(Rating)=&quot;Outsourced&quot;,
CONTAINS(Reason_for_Flag__c,&quot;Outsourc&quot;),
CONTAINS(Unqualified_Revisit_Reason__c,&quot;Outsourc&quot;),
CONTAINS(Next_Steps__c,&quot;Outsourc&quot;))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Account_BillingCity_Field_Changed</fullName>
        <actions>
            <name>MALatitudec_Purge</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MALongitudec_Purge</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Purge the MapAnything Lat/Long fields on the Account if this field changes; created by the Metadata API</description>
        <formula>ISCHANGED(BillingCity)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Account_BillingCountry_Field_Changed</fullName>
        <actions>
            <name>MALatitudec_Purge</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MALongitudec_Purge</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Purge the MapAnything Lat/Long fields on the Account if this field changes; created by the Metadata API</description>
        <formula>ISCHANGED(BillingCountry)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Account_BillingPostalCode_Field_Changed</fullName>
        <actions>
            <name>MALatitudec_Purge</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MALongitudec_Purge</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Purge the MapAnything Lat/Long fields on the Account if this field changes; created by the Metadata API</description>
        <formula>ISCHANGED(BillingPostalCode)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Account_BillingState_Field_Changed</fullName>
        <actions>
            <name>MALatitudec_Purge</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MALongitudec_Purge</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Purge the MapAnything Lat/Long fields on the Account if this field changes; created by the Metadata API</description>
        <formula>ISCHANGED(BillingState)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Account_BillingStreet_Field_Changed</fullName>
        <actions>
            <name>MALatitudec_Purge</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MALongitudec_Purge</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Purge the MapAnything Lat/Long fields on the Account if this field changes; created by the Metadata API</description>
        <formula>ISCHANGED(BillingStreet)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Add leading zeros to billing zip code</fullName>
        <actions>
            <name>Billing_zip_code_leading_zeros</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(

CASE(UPPER(BillingCountry), 
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
&quot;Other&quot;)=&quot;United States&quot;,

ISNUMBER(BillingPostalCode),LEN(BillingPostalCode)&lt;5)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Add plus sign to international phone</fullName>
        <actions>
            <name>Account_phone_plus_sign</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(NOT(ISBLANK(Phone)),LEFT(Phone,1)&lt;&gt;&quot;+&quot;, 
OR(BillingCountry=&quot;Belgium&quot;, 
BillingCountry=&quot;Denmark&quot;, 
BillingCountry=&quot;Finland&quot;, 
BillingCountry=&quot;France&quot;, 
BillingCountry=&quot;Iceland&quot;, 
BillingCountry=&quot;Ireland&quot;, 
BillingCountry=&quot;Luxembourg&quot;, 
BillingCountry=&quot;Netherlands&quot;, 
BillingCountry=&quot;Norway&quot;, 
BillingCountry=&quot;South Africa&quot;, 
BillingCountry=&quot;Sweden&quot;, 
BillingCountry=&quot;Turkey&quot;, 
BillingCountry=&quot;United Kingdom&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Alert CX of Customer Changes</fullName>
        <actions>
            <name>CX_Customer_Ownership_Change_Alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>AND(
OR(ISCHANGED(AE_Rep__c),
ISCHANGED(Manual_Customer_Experience_Owner__c),
ISCHANGED(BillingState),
ISCHANGED(BillingCountry),
ISCHANGED(Customer_Experience_Owner3__c)),
CONTAINS(Status__c,&quot;Customer&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Alert Ops of Corporate Account Move Flag</fullName>
        <actions>
            <name>Alert_Ops_of_Corporate_Account_Move_Flag</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>NOT(ISPICKVAL(Corporate_Account_Move_Flag__c,&quot;&quot;))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CExp Customer Churn Risk update</fullName>
        <actions>
            <name>Email_Customer_Experience_with_Customer_Status_Alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>ISCHANGED(Customer_Status__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Carry Over DiscoverOrg fields to VMT fields</fullName>
        <actions>
            <name>Stamp_3_Year_Employee_Growth</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_3_Year_Sales_Growth</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_DiscoverOrg_ID</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_IT_Budget</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_IT_Employees</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>OR(
AND(ISCHANGED(DSCORGPKG__DO_3yr_Employees_Growth__c),DSCORGPKG__DO_3yr_Employees_Growth__c&lt;&gt;&quot;&quot;),
AND(ISCHANGED(DSCORGPKG__DO_3yr_Sales_Growth__c),DSCORGPKG__DO_3yr_Sales_Growth__c&lt;&gt;&quot;&quot;),
AND(ISCHANGED(DSCORGPKG__DiscoverOrg_ID__c),NOT(ISBLANK(DSCORGPKG__DiscoverOrg_ID__c))),
AND(ISCHANGED(DSCORGPKG__IT_Budget__c),NOT(ISBLANK(DSCORGPKG__IT_Budget__c))),
AND(ISCHANGED(DSCORGPKG__IT_Employees__c),NOT(ISBLANK(DSCORGPKG__IT_Employees__c)))
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Change Untouched to Cold</fullName>
        <actions>
            <name>Rating_equals_Cold</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.Last_Dial_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Rating</field>
            <operation>equals</operation>
            <value>Untouched</value>
        </criteriaItems>
        <description>Update the rating if the account has been called</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Clean billing%2Fshipping country</fullName>
        <actions>
            <name>Update_billing_country</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_shipping_country</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>User.IsActive</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Clean certain country entries to make them consistent</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Clean billing%2Fshipping state</fullName>
        <actions>
            <name>Change_billing_state_abbreviations</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_shipping_state_abbreviations</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>User.IsActive</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Change state abbreviations to long state names</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Clean website</fullName>
        <actions>
            <name>Take_off_end_of_website</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>RIGHT(Website,1)=&quot;/&quot;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Convert Data%2Ecom Annual Revenue</fullName>
        <actions>
            <name>Convert_Data_com_Annual_Revenue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
NOT(ISBLANK(Annual_Revenue_Data_com__c)),
ISCHANGED(Annual_Revenue_Data_com__c)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Convert DiscoverOrg IT Budget</fullName>
        <actions>
            <name>Set_IT_Budget_Mil</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(
NOT(ISBLANK(DSCORGPKG__IT_Budget__c)),
ISCHANGED(DSCORGPKG__IT_Budget__c)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Customer Status Change</fullName>
        <actions>
            <name>Email_Customer_Experience_with_Customer_Status_Alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Stamp_Customer_Status_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Prior_Customer_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(Customer_Status__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Delete Useless Websites</fullName>
        <actions>
            <name>Clear_Website</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.Website</field>
            <operation>equals</operation>
            <value>mailinator.com,outlook.com,inbox.com,sharklasers.com,ymail.com,hotmail.com</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Email Account Owner Change</fullName>
        <active>false</active>
        <formula>AND(ISCHANGED(OwnerId),CONTAINS($UserRole.Name,&quot;Account Executive&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Exec Customer Churn Risk update</fullName>
        <actions>
            <name>Exec_Customer_Churn_Risk_email_alert_2</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>AND(
ISCHANGED(Customer_Status__c),
PRIORVALUE(Customer_Status__c)&lt;&gt;&quot;&quot;,
OR(CONTAINS(TEXT(Customer_LTV_Tier__c),&quot;Tier 1&quot;),
CONTAINS(TEXT(Customer_LTV_Tier__c),&quot;Tier 2&quot;)),
$User.Full_Name__c &lt;&gt; &quot;Robert Young&quot;,
$User.Full_Name__c &lt;&gt;&quot;Michael Scott&quot;,
$User.Full_Name__c &lt;&gt;&quot;Andy Robinson&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Exec Customer Churn Risk update Andy</fullName>
        <actions>
            <name>Exec_Customer_Churn_Risk_email_alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>AND(
ISCHANGED(Customer_Status__c),
PRIORVALUE(Customer_Status__c)&lt;&gt;&quot;&quot;,
OR(CONTAINS(TEXT(Customer_LTV_Tier__c),&quot;Tier 1&quot;),
CONTAINS(TEXT(Customer_LTV_Tier__c),&quot;Tier 2&quot;)),
OR($User.Full_Name__c = &quot;Robert Young&quot;,
$User.Full_Name__c=&quot;Michael Scott&quot;,
$User.Full_Name__c=&quot;Andy Robinson&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Fill in Country if State is Filled</fullName>
        <actions>
            <name>Fill_in_Country_if_State_is_Filled</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(ISBLANK(BillingCountry),NOT(ISBLANK(BillingState)))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Fill in Customer References</fullName>
        <actions>
            <name>Fill_in_Customer_References</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>TRUE</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Fill in Customer References2</fullName>
        <active>false</active>
        <description>For Geographical customers</description>
        <formula>True</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Fill in DiscoverOrg Link</fullName>
        <actions>
            <name>Fill_in_DiscoverOrg_Link</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(In_DiscoverOrg__c=&quot;Yes&quot;,OR(RIGHT(DiscoverOrg_Link__c,1)=&quot;=&quot;,ISBLANK(DiscoverOrg_Link__c)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Fill in Partner Manager</fullName>
        <actions>
            <name>Fill_Partner_Manager_Acct</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(
ISNEW(),
ISCHANGED(BillingCountry),
ISCHANGED(BillingState),
ISCHANGED(Trigger_workflow_rules__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Fill in Use Cases</fullName>
        <actions>
            <name>Fill_in_Use_Cases</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Gives Use Cases and top customers for filled in industry of account.</description>
        <formula>True</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Fill in Use Cases 2</fullName>
        <active>false</active>
        <formula>TRUE</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Intended Sales Engineer</fullName>
        <actions>
            <name>Stamp_Intended_Sales_Engineer</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>OR(ISCHANGED(BillingState),ISCHANGED(BillingCountry))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Mark Bernie%27s accounts as partners</fullName>
        <actions>
            <name>Make_type_field_equal_tech_partner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(ISCHANGED(OwnerId),OwnerId=&quot;005D0000001x4u0&quot;,
NOT(ISPICKVAL(Type,&quot;Reseller&quot;)),NOT(ISPICKVAL(Type,&quot;Technology Partner&quot;)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>New Account Workflow</fullName>
        <actions>
            <name>New_Account_Workflow</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Notify EMEA Marketing of New Customers</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Account.First_Close_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Territory_Owner_Team_Group_Buckets__c</field>
            <operation>contains</operation>
            <value>EMEA</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Remove http from website</fullName>
        <actions>
            <name>Chop_http_off_website</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>LOWER(LEFT(Website,7))=&quot;http://&quot;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Remove http%3A%2F%2F</fullName>
        <actions>
            <name>Remove_http</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Remove http:// from</description>
        <formula>LEFT(Website,7) = &quot;http://&quot;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Revisit Account Overdue</fullName>
        <actions>
            <name>Reset_Rating</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Reset_Revisit_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Revisit_Account</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <formula>AND( TODAY()&gt;Revisit_Date__c, NOT(ISBLANK(Revisit_Date__c)))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Send update when customer status changes</fullName>
        <actions>
            <name>Send_update_on_customer_status</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Send an email to Finance and Support when customer status changes</description>
        <formula>OR(

AND(
ISBLANK(PRIORVALUE(Maintenance_Subscription_Cancelled_Date__c)),
NOT(ISBLANK(Maintenance_Subscription_Cancelled_Date__c))),

AND(
NOT(ISBLANK(PRIORVALUE(Maintenance_Subscription_Cancelled_Date__c))),
ISBLANK(Maintenance_Subscription_Cancelled_Date__c)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Account Last Reviewed</fullName>
        <actions>
            <name>Stamp_Account_Last_Reviewed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Account_Reviewed__c</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Account Management Territory field</fullName>
        <actions>
            <name>Account_Management_Territory_stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>TRUE</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp BDR Focus Date</fullName>
        <actions>
            <name>Stamp_BDR_Focus_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.BDR_Focus_Account__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.BDR_Focus_Account_Date_Stamp__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Stamps BDR focus account date</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Customer Experience Owner</fullName>
        <actions>
            <name>Stamp_Customer_Experience_Owner_Lookup</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>OR( ISNEW(), ISCHANGED(Manual_Customer_Experience_Owner__c), ISCHANGED(Account_Management_Territory__c), ISCHANGED(Customer_LTV_Tier__c), ISCHANGED(Territory_Owner_Team__c) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Customer Experience Owner Region</fullName>
        <actions>
            <name>Stamp_Customer_Experience_Owner_Region</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Works in Conjunction with the Stamp Customer Experience Owner Workflow rule to stamp the CX Owner Region</description>
        <formula>AND( NOT(ISBLANK(Customer_Experience_Owner2__c)), OR( ISNEW(), ISCHANGED(Customer_Experience_Owner2__c) ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Focus Date</fullName>
        <actions>
            <name>Update_Focus_Account_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Focus_Account__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Focus_Account_Date_Stamp__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Stamps focus account date</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Industry %28clean - text%29 1</fullName>
        <actions>
            <name>Update_Industry_clean_text_1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>For lead/contact scoring (Industry clean formula makes scoring formula too big)</description>
        <formula>AND(ISCHANGED(Industry_clean_1__c),Industry_clean_1__c&lt;&gt;&quot;Other&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Industry %28clean - text%29 2</fullName>
        <actions>
            <name>Update_Industry_clean_text_2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>For lead/contact scoring (Industry clean formula makes scoring formula too big)</description>
        <formula>AND(ISCHANGED(Industry_clean_2__c),Industry_clean_2__c&lt;&gt;&quot;Other&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Industry %28clean - text%29 3</fullName>
        <actions>
            <name>Update_Industry_clean_text_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>For lead/contact scoring (Industry clean formula makes scoring formula too big)</description>
        <formula>AND(ISCHANGED(Industry_clean_3__c),Industry_clean_3__c&lt;&gt;&quot;Other&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Industry %28clean - text%29 4</fullName>
        <actions>
            <name>Update_Industry_clean_text_4</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>For lead/contact scoring (Industry clean formula makes scoring formula too big)</description>
        <formula>AND(ISCHANGED(Industry_clean_4__c),Industry_clean_4__c&lt;&gt;&quot;Other&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Industry For Use Cases</fullName>
        <actions>
            <name>Update_Industry_for_Use_Cases</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>NOT(ISBLANK(Industry_clean__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Sector</fullName>
        <actions>
            <name>Sector_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Industry</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Territory Team</fullName>
        <actions>
            <name>Stamp_Velocity_Territory_Owner_Team</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Stamp Territory team from billing state</description>
        <formula>true</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Turbo Version Upgrade Date</fullName>
        <actions>
            <name>Stamp_Turbo_Version_Upgrade_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Fills in the date of data change on this field</description>
        <formula>ISCHANGED(VMTurbo_Version__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp clean industry fields</fullName>
        <actions>
            <name>Industry_clean_1_field_update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Industry_clean_2_field_update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Industry_clean_3_field_update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Industry_clean_4_field_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Stamp the industry grouping</description>
        <formula>Name&lt;&gt;&quot;&quot;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp territory and region fields 1</fullName>
        <actions>
            <name>Region_country_1_update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Region_country_2_update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Region_state_update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Time_zone_update_account</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>User.IsActive</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Stamp territories and regions for state and country to feed into the territory and region formulas</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>TEST Account rule</fullName>
        <actions>
            <name>TEST_account_field_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>Name=&quot;Rotondi Masonry&quot;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update MSA Account Flag</fullName>
        <actions>
            <name>Stamp_Update_MSA_Flag</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Checks MSA Account Flag if the Billing Country or Billing Zip Code are updated.</description>
        <formula>OR( 
ISCHANGED(BillingCountry), 
ISCHANGED(BillingPostalCode) 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Manual Core Count Changes</fullName>
        <actions>
            <name>Stamp_Core_Count_Change_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(
Core_Count__c&lt;&gt;PRIORVALUE(Core_Count__c),
Last_Core_Count_Update_Date__c=PRIORVALUE(Last_Core_Count_Update_Date__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Manual Socket Count Changes</fullName>
        <actions>
            <name>Stamp_Last_Update_of_Socket_Count_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(
Socket_Count__c&lt;&gt;PRIORVALUE(Socket_Count__c),
Last_Socket_Count_Update_Date__c=PRIORVALUE(Last_Socket_Count_Update_Date__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Manual VM Count Changes</fullName>
        <actions>
            <name>Update_VM_Count_Update_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(
VM_Count__c&lt;&gt;PRIORVALUE(VM_Count__c),
Last_VM_Count_Update_Date__c=PRIORVALUE(Last_VM_Count_Update_Date__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Owner Aligned to Team Area</fullName>
        <active>false</active>
        <description>To make Owner Team formula fit</description>
        <formula>OR(ISNEW(),ISCHANGED(OwnerId))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update WI Partner Manager</fullName>
        <actions>
            <name>Update_Partner_Manager</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>A field update to bring the new (WI) Partner Manager field into the previous Partner Manager Text field</description>
        <formula>true</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update industry %28clean - text%29</fullName>
        <actions>
            <name>Stamp_Industry_clean_text_field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>Industry_clean__c&lt;&gt;Industry_clean_text__c</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update product usage date surveyed</fullName>
        <actions>
            <name>Stamp_product_usage_survey_date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(
OR(ISCHANGED(Product_Usage__c),
ISCHANGED(Type_s_of_Automation_Utilized__c)),
$UserRole.Name&lt;&gt;&quot;VMT SF admin&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>a2T57000002VnvtEAC_Purge</fullName>
        <actions>
            <name>MALatitude_c_Purge</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MALongitude_c_Purge</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Account.a2T57000002VnvtEAC_Purge</description>
        <formula>OR(ISCHANGED(BillingStreet),ISCHANGED(BillingCity),ISCHANGED(BillingState),ISCHANGED(BillingPostalCode),ISCHANGED(BillingCountry))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <tasks>
        <fullName>Revisit_Account</fullName>
        <assignedToType>owner</assignedToType>
        <description>Follow-up on Revisit Account</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Revisit Account</subject>
    </tasks>
</Workflow>
