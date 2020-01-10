<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Alert_Alliances_of_Cisco_Engagement</fullName>
        <description>Alert Alliances of Cisco Engagement</description>
        <protected>false</protected>
        <recipients>
            <recipient>adam.merkt@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>brad.scyrkels@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>chris.gorecki@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>eric.blonda@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jack.butler@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_Cisco_Opportunity_Flagged</template>
    </alerts>
    <alerts>
        <fullName>Alert_Alliances_of_Cloud_Co_Sell_Opportunity</fullName>
        <description>Alert Alliances of Cloud Co-Sell Opportunity</description>
        <protected>false</protected>
        <recipients>
            <recipient>jennifer.heard@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>murphy.vandervelde@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>susan.turzinski@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_Cloud_Co_Sell_Opportunity_Submitted</template>
    </alerts>
    <alerts>
        <fullName>Alert_CX_Team_of_Closed_Won</fullName>
        <description>Alert CX Team of Closed Won</description>
        <protected>false</protected>
        <recipients>
            <recipient>Customer_Account_Manager</recipient>
            <type>roleSubordinatesInternal</type>
        </recipients>
        <recipients>
            <recipient>james.dahlgard@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/CX_Team_Deal_Followup_Alert</template>
    </alerts>
    <alerts>
        <fullName>Alert_CX_Team_of_PO_Received</fullName>
        <ccEmails>cxteam@vmturbo.com</ccEmails>
        <description>Alert CX Team of PO Received</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/PO_Received_CX_Team_Alert</template>
    </alerts>
    <alerts>
        <fullName>Alert_Email_MSFT_Deals</fullName>
        <description>Alert Email MSFT Deals</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dan.pessin@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jennifer.heard@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jennifer.murphy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>melissa.lyons@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>murphy.vandervelde@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Channel_Email_Templates/MSFT_Oppty_Creation</template>
    </alerts>
    <alerts>
        <fullName>Alert_Finance_of_Renewal_entering_PO_Received</fullName>
        <description>Alert Finance of Renewal entering PO Received</description>
        <protected>false</protected>
        <recipients>
            <recipient>angela.bodozian@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ben.pooler@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Renewal_to_PO_Received</template>
    </alerts>
    <alerts>
        <fullName>Alert_Sales_of_Cisco_Engagement</fullName>
        <description>Alert Sales of Cisco Engagement</description>
        <protected>false</protected>
        <recipients>
            <field>Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>Regional Director (Bus Driver)</recipient>
            <type>opportunityTeam</type>
        </recipients>
        <recipients>
            <recipient>Regional VP</recipient>
            <type>opportunityTeam</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>adam.merkt@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>eric.blonda@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>fj.gould@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jennifer.heard@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_Cisco_Opportunity_Approved</template>
    </alerts>
    <alerts>
        <fullName>Approval_Request_Receipt_to_Oppty_Owner</fullName>
        <description>Approval Request Receipt to Oppty Owner</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Approval_Request_Templates/Approval_Request_Receipt_of_Submission</template>
    </alerts>
    <alerts>
        <fullName>Auto_Opp_Unqualified_Alert</fullName>
        <description>Auto Opp Unqualified Alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opp_Unqualified_Alert</template>
    </alerts>
    <alerts>
        <fullName>Automated_MCS_Alert_Close_Closers_Club</fullName>
        <description>Automated MCS Alert (Close) - Closers Club</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MCS_Alert_Close</template>
    </alerts>
    <alerts>
        <fullName>Automated_MCS_Alert_Close_SEC</fullName>
        <description>Automated MCS Alert (Close) - SEC</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tami.pearlstein@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MCS_Alert_Close</template>
    </alerts>
    <alerts>
        <fullName>Automated_MCS_Alert_Close_The_Hunchbacks</fullName>
        <description>Automated MCS Alert (Close) - The Hunchbacks</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MCS_Alert_Close</template>
    </alerts>
    <alerts>
        <fullName>Automated_MCS_Alert_Close_The_Wild_West</fullName>
        <description>Automated MCS Alert (Close) - The Wild West</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tami.pearlstein@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MCS_Alert_Close</template>
    </alerts>
    <alerts>
        <fullName>Automated_MCS_Alert_Strong_Upside_Closers_Club</fullName>
        <description>Automated MCS Alert (Strong Upside) - Closers Club</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MCS_Alert_Strong_Upside</template>
    </alerts>
    <alerts>
        <fullName>Automated_MCS_Alert_Strong_Upside_SEC</fullName>
        <description>Automated MCS Alert (Strong Upside) - SEC</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>maria.rodriguez@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tami.pearlstein@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MCS_Alert_Strong_Upside</template>
    </alerts>
    <alerts>
        <fullName>Automated_MCS_Alert_Strong_Upside_The_Hunchbacks</fullName>
        <description>Automated MCS Alert (Strong Upside) - The Hunchbacks</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MCS_Alert_Strong_Upside</template>
    </alerts>
    <alerts>
        <fullName>Automated_MCS_Alert_Strong_Upside_The_Wild_West</fullName>
        <description>Automated MCS Alert (Strong Upside) - The Wild West</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tami.pearlstein@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MCS_Alert_Strong_Upside</template>
    </alerts>
    <alerts>
        <fullName>Automated_MCS_Alert_Upside_Closers_Club</fullName>
        <description>Automated MCS Alert (Upside) - Closers Club</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MCS_Alert_Upside</template>
    </alerts>
    <alerts>
        <fullName>Automated_MCS_Alert_Upside_SEC</fullName>
        <description>Automated MCS Alert (Upside) - SEC</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>maria.rodriguez@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tami.pearlstein@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MCS_Alert_Upside</template>
    </alerts>
    <alerts>
        <fullName>Automated_MCS_Alert_Upside_The_Hunchbacks</fullName>
        <description>Automated MCS Alert (Upside) - The Hunchbacks</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>murphy.vandervelde@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MCS_Alert_Upside</template>
    </alerts>
    <alerts>
        <fullName>Automated_MCS_Alert_Upside_The_Wild_West</fullName>
        <description>Automated MCS Alert (Upside) - The Wild West</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tami.pearlstein@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MCS_Alert_Upside</template>
    </alerts>
    <alerts>
        <fullName>Big_SMB_Opp_Alert</fullName>
        <description>Big SMB Opp Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>dicken.chaplin@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>eddie.genao@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>justin.chang@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Big_SMB_Opp_Alert</template>
    </alerts>
    <alerts>
        <fullName>Customer_Referral_CX_Alert</fullName>
        <ccEmails>cxteam@vmturbo.com, chris.ward@turbonomic.com, maria.rodriguez@turbonomic.com, eddie.genao@turbonomic.com</ccEmails>
        <description>Customer Referral CX Alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Customer_Referral_Requested</template>
    </alerts>
    <alerts>
        <fullName>Customer_Services_Coordination_Email_Alert_EMEA</fullName>
        <description>Customer Services Coordination Email Alert EMEA</description>
        <protected>false</protected>
        <recipients>
            <field>Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>simon.ravenscroft@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Customer_Services_Engagement_Template</template>
    </alerts>
    <alerts>
        <fullName>Customer_Services_Coordination_Email_Alert_LATAM</fullName>
        <description>Customer Services Coordination Email Alert LATAM</description>
        <protected>false</protected>
        <recipients>
            <field>Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>luis.dasilva@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Customer_Services_Engagement_Template</template>
    </alerts>
    <alerts>
        <fullName>Customer_Services_Coordination_Email_Alert_US</fullName>
        <description>Customer Services Coordination Email Alert US</description>
        <protected>false</protected>
        <recipients>
            <field>Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>francis.cordon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Customer_Services_Engagement_Template</template>
    </alerts>
    <alerts>
        <fullName>Customer_Status_Change_Alert</fullName>
        <ccEmails>cxteam@vmturbo.com</ccEmails>
        <description>Customer Status Change Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>dan.germain@vmturbo.com</recipient>
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
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Customer_Status_Alert</template>
    </alerts>
    <alerts>
        <fullName>Expiration_reminder_email</fullName>
        <ccEmails>bernie.hannon@vmturbo.com, andrea.meyer@vmturbo.com</ccEmails>
        <description>Expiration reminder email</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/opp_expiration_email</template>
    </alerts>
    <alerts>
        <fullName>Forecast_Opportunity_Change_Email</fullName>
        <description>Forecast Opportunity Change Email</description>
        <protected>false</protected>
        <recipients>
            <recipient>stuart.horgan@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Forecast_Opportunity_Changes</template>
    </alerts>
    <alerts>
        <fullName>MCS_Automated_Alert_Pipeline_Closers_Club</fullName>
        <description>MCS Automated Alert (Pipeline) - Closers Club</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>maria.rodriguez@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MCS_Alert_Pipeline</template>
    </alerts>
    <alerts>
        <fullName>MCS_Automated_Alert_Pipeline_SEC</fullName>
        <description>MCS Automated Alert (Pipeline) - SEC</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>maria.rodriguez@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tami.pearlstein@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MCS_Alert_Pipeline</template>
    </alerts>
    <alerts>
        <fullName>MCS_Automated_Alert_Pipeline_The_Hunchbacks</fullName>
        <description>MCS Automated Alert (Pipeline) - The Hunchbacks</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>murphy.vandervelde@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MCS_Alert_Pipeline</template>
    </alerts>
    <alerts>
        <fullName>MCS_Automated_Alert_Pipeline_The_Wild_West</fullName>
        <description>MCS Automated Alert (Pipeline) - The Wild West</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tami.pearlstein@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MCS_Alert_Pipeline</template>
    </alerts>
    <alerts>
        <fullName>MSFT_Oppty_Activity_Alert</fullName>
        <description>MSFT Oppty Activity Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>charmian.mcintyre@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dan.pessin@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jennifer.heard@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jennifer.murphy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>melissa.lyons@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>murphy.vandervelde@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Channel_Email_Templates/MSFT_Oppty_Activity_Alert</template>
    </alerts>
    <alerts>
        <fullName>MTO_Pipeline_Requested_Alert</fullName>
        <description>MTO Pipeline Requested Alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>asena.woodward@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ben.yemini@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>chris.graham@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>grace.murphy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>yoni.friedman@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MTO_Alert_Pipeline</template>
    </alerts>
    <alerts>
        <fullName>MTO_Pipeline_Requested_Alert_Closers_Club</fullName>
        <description>MTO Pipeline Requested Alert - Closers Club</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>maria.rodriguez@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MTO_Alert_Pipeline</template>
    </alerts>
    <alerts>
        <fullName>MTO_Pipeline_Requested_Alert_Enterprise_Central</fullName>
        <description>MTO Pipeline Requested Alert - Enterprise Central</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tami.pearlstein@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MTO_Alert_Pipeline</template>
    </alerts>
    <alerts>
        <fullName>MTO_Pipeline_Requested_Alert_Enterprise_East</fullName>
        <description>MTO Pipeline Requested Alert - Enterprise East</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>maria.rodriguez@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MTO_Alert_Pipeline</template>
    </alerts>
    <alerts>
        <fullName>MTO_Pipeline_Requested_Alert_Enterprise_West</fullName>
        <description>MTO Pipeline Requested Alert - Enterprise West</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>murphy.vandervelde@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MTO_Alert_Pipeline</template>
    </alerts>
    <alerts>
        <fullName>MTO_Pipeline_Requested_Alert_SEC</fullName>
        <description>MTO Pipeline Requested Alert - SEC</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>maria.rodriguez@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tami.pearlstein@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MTO_Alert_Pipeline</template>
    </alerts>
    <alerts>
        <fullName>MTO_Pipeline_Requested_Alert_The_Hunchbacks</fullName>
        <description>MTO Pipeline Requested Alert - The Hunchbacks</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>murphy.vandervelde@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MTO_Alert_Pipeline</template>
    </alerts>
    <alerts>
        <fullName>MTO_Pipeline_Requested_Alert_The_Wild_West</fullName>
        <description>MTO Pipeline Requested Alert - The Wild West</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tami.pearlstein@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MTO_Alert_Pipeline</template>
    </alerts>
    <alerts>
        <fullName>MTO_Pipeline_Requested_Alert_US_Velocity</fullName>
        <description>MTO Pipeline Requested Alert - US Velocity</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>chris.graham@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MTO_Alert_Pipeline</template>
    </alerts>
    <alerts>
        <fullName>MTO_Strong_Upside_Email_Alert</fullName>
        <ccEmails>Nick.Chu@turbonomic.com</ccEmails>
        <description>MTO Strong Upside Email Alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>chris.graham@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>grace.murphy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>maria.rodriguez@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MTO_Alert_Strong_Upside</template>
    </alerts>
    <alerts>
        <fullName>MTO_Strong_Upside_Email_Alert_Closers_Club</fullName>
        <ccEmails>Nick.Chu@turbonomic.com</ccEmails>
        <description>MTO Strong Upside Email Alert - Closers Club</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>maria.rodriguez@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MTO_Alert_Strong_Upside</template>
    </alerts>
    <alerts>
        <fullName>MTO_Strong_Upside_Email_Alert_Enterprise_Central</fullName>
        <ccEmails>Nick.Chu@turbonomic.com</ccEmails>
        <description>MTO Strong Upside Email Alert - Enterprise Central</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tami.pearlstein@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MTO_Alert_Strong_Upside</template>
    </alerts>
    <alerts>
        <fullName>MTO_Strong_Upside_Email_Alert_Enterprise_East</fullName>
        <ccEmails>Nick.Chu@turbonomic.com</ccEmails>
        <description>MTO Strong Upside Email Alert - Enterprise East</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>maria.rodriguez@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MTO_Alert_Strong_Upside</template>
    </alerts>
    <alerts>
        <fullName>MTO_Strong_Upside_Email_Alert_Enterprise_West</fullName>
        <ccEmails>Nick.Chu@turbonomic.com</ccEmails>
        <description>MTO Strong Upside Email Alert - Enterprise West</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>murphy.vandervelde@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MTO_Alert_Strong_Upside</template>
    </alerts>
    <alerts>
        <fullName>MTO_Strong_Upside_Email_Alert_SEC</fullName>
        <ccEmails>Nick.Chu@turbonomic.com</ccEmails>
        <description>MTO Strong Upside Email Alert - SEC</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>maria.rodriguez@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tami.pearlstein@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MTO_Alert_Strong_Upside</template>
    </alerts>
    <alerts>
        <fullName>MTO_Strong_Upside_Email_Alert_The_Hunchbacks</fullName>
        <ccEmails>Nick.Chu@turbonomic.com</ccEmails>
        <description>MTO Strong Upside Email Alert - The Hunchbacks</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>murphy.vandervelde@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MTO_Alert_Strong_Upside</template>
    </alerts>
    <alerts>
        <fullName>MTO_Strong_Upside_Email_Alert_The_Wild_West</fullName>
        <ccEmails>Nick.Chu@turbonomic.com</ccEmails>
        <description>MTO Strong Upside Email Alert - The Wild West</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tami.pearlstein@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MTO_Alert_Strong_Upside</template>
    </alerts>
    <alerts>
        <fullName>MTO_Strong_Upside_Email_Alert_US_Velocity</fullName>
        <ccEmails>Nick.Chu@turbonomic.com</ccEmails>
        <description>MTO Strong Upside Email Alert - US Velocity</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>chris.graham@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MTO_Alert_Strong_Upside</template>
    </alerts>
    <alerts>
        <fullName>MTO_Upside_Requested_Alert</fullName>
        <ccEmails>nick.chu@turbonomic.com</ccEmails>
        <description>MTO Upside Requested Alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>chris.graham@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>grace.murphy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>justin.graci@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>maria.rodriguez@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MTO_Alert_Upside</template>
    </alerts>
    <alerts>
        <fullName>MTO_Upside_Requested_Alert_Closers_Club</fullName>
        <ccEmails>nick.chu@turbonomic.com</ccEmails>
        <description>MTO Upside Requested Alert - Closers Club</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>maria.rodriguez@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MTO_Alert_Upside</template>
    </alerts>
    <alerts>
        <fullName>MTO_Upside_Requested_Alert_Enterprise_Central</fullName>
        <ccEmails>nick.chu@turbonomic.com</ccEmails>
        <description>MTO Upside Requested Alert - Enterprise Central</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tami.pearlstein@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MTO_Alert_Upside</template>
    </alerts>
    <alerts>
        <fullName>MTO_Upside_Requested_Alert_Enterprise_East</fullName>
        <ccEmails>nick.chu@turbonomic.com</ccEmails>
        <description>MTO Upside Requested Alert - Enterprise East</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>maria.rodriguez@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MTO_Alert_Upside</template>
    </alerts>
    <alerts>
        <fullName>MTO_Upside_Requested_Alert_Enterprise_West</fullName>
        <ccEmails>nick.chu@turbonomic.com</ccEmails>
        <description>MTO Upside Requested Alert - Enterprise West</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>murphy.vandervelde@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MTO_Alert_Upside</template>
    </alerts>
    <alerts>
        <fullName>MTO_Upside_Requested_Alert_SEC</fullName>
        <ccEmails>nick.chu@turbonomic.com</ccEmails>
        <description>MTO Upside Requested Alert - SEC</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>maria.rodriguez@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tami.pearlstein@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MTO_Alert_Upside</template>
    </alerts>
    <alerts>
        <fullName>MTO_Upside_Requested_Alert_The_Hunchbacks</fullName>
        <ccEmails>nick.chu@turbonomic.com</ccEmails>
        <description>MTO Upside Requested Alert - The Hunchbacks</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>murphy.vandervelde@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MTO_Alert_Upside</template>
    </alerts>
    <alerts>
        <fullName>MTO_Upside_Requested_Alert_The_Wild_West</fullName>
        <ccEmails>nick.chu@turbonomic.com</ccEmails>
        <description>MTO Upside Requested Alert - The Wild West</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tami.pearlstein@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MTO_Alert_Upside</template>
    </alerts>
    <alerts>
        <fullName>MTO_Upside_Requested_Alert_US_Velocity</fullName>
        <ccEmails>nick.chu@turbonomic.com</ccEmails>
        <description>MTO Upside Requested Alert - US Velocity</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>chris.graham@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.gay@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Automated_MTO_Alert_Upside</template>
    </alerts>
    <alerts>
        <fullName>Opp_Closed_Lost</fullName>
        <ccEmails>partners@vmturbo.com</ccEmails>
        <description>Opp Closed Lost</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Changes</template>
    </alerts>
    <alerts>
        <fullName>Opp_ID_Central_SDM</fullName>
        <description>Opp ID Central SDM</description>
        <protected>false</protected>
        <recipients>
            <recipient>charmian.mcintyre@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opp_IDed_update</template>
    </alerts>
    <alerts>
        <fullName>Opp_ID_East_SDM</fullName>
        <description>Opp ID East SDM</description>
        <protected>false</protected>
        <recipients>
            <recipient>charmian.mcintyre@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opp_IDed_update</template>
    </alerts>
    <alerts>
        <fullName>Opp_ID_Enterprise_SDM</fullName>
        <description>Opp ID Enterprise SDM</description>
        <protected>false</protected>
        <recipients>
            <recipient>Enterprise_SDR_Manager</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>eddie.genao@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opp_IDed_update</template>
    </alerts>
    <alerts>
        <fullName>Opp_ID_West_SDM</fullName>
        <description>Opp ID West SDM</description>
        <protected>false</protected>
        <recipients>
            <recipient>Manager_BDR_Bus_West</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opp_IDed_update</template>
    </alerts>
    <alerts>
        <fullName>Opp_Submission_for_Approval</fullName>
        <description>Opp Submission for Approval</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>sean.finnegan@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/opp_registration_email</template>
    </alerts>
    <alerts>
        <fullName>Opp_marked_PO_received_alert</fullName>
        <ccEmails>partners@vmturbo.com</ccEmails>
        <description>Opp wfr/ea 1.1 - Opp marked PO received alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>andrew.robinson@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>angela.bodozian@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ben.pooler@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>catherine.kellogg@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>chris.ward@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>garth.reed@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kerry.bridges@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>orna.kliger@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ryan.faria@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sandeep.parmar@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>steve.rajcula@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tim.schaefer@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Changes</template>
    </alerts>
    <alerts>
        <fullName>Opp_stage_change_alert_APAC_Enterprise</fullName>
        <ccEmails>cxteam@vmturbo.com</ccEmails>
        <description>Opp wfr/ea 1.1 - Opp stage change alert APAC Enterprise</description>
        <protected>false</protected>
        <recipients>
            <recipient>alec.kemp@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>greg.beale@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Changes</template>
    </alerts>
    <alerts>
        <fullName>Opp_stage_change_alert_Cisco_Team</fullName>
        <description>Opp wfr/ea 1.1 - Opp stage change alert Cisco Team from PB Cisco Deal Stage Change</description>
        <protected>false</protected>
        <recipients>
            <recipient>adam.merkt@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>eric.blonda@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Changes</template>
    </alerts>
    <alerts>
        <fullName>Opp_stage_change_alert_EMEA_Enterprise</fullName>
        <ccEmails>emeamanagement@turbonomic.com</ccEmails>
        <ccEmails>emeasales@turbonomic.com</ccEmails>
        <ccEmails>EMEASEs@turbonomic.com</ccEmails>
        <description>Opp wfr/ea 1.1 - Opp stage change alert EMEA Enterprise</description>
        <protected>false</protected>
        <recipients>
            <recipient>dicken.chaplin@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tom.vieth@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Changes</template>
    </alerts>
    <alerts>
        <fullName>Opp_stage_change_alert_East_Enterprise</fullName>
        <ccEmails>cxteam@vmturbo.com</ccEmails>
        <description>Opp wfr/ea 1.1 - Opp stage change alert East Enterprise</description>
        <protected>false</protected>
        <recipients>
            <recipient>dave.kranowitz@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dicken.chaplin@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>newton.davis@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>stuart.horgan@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Changes</template>
    </alerts>
    <alerts>
        <fullName>Opp_stage_change_alert_Enterprise_East</fullName>
        <description>Opp wfr/ea 1.1 - Opp stage change alert Enterprise East 1</description>
        <protected>false</protected>
        <recipients>
            <recipient>dave.kranowitz@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dicken.chaplin@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jr.butler@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Changes</template>
    </alerts>
    <alerts>
        <fullName>Opp_stage_change_alert_Enterprise_East_3</fullName>
        <description>Opp wfr/ea 1.1 - Opp stage change alert Enterprise East 3</description>
        <protected>false</protected>
        <recipients>
            <recipient>dave.kranowitz@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dicken.chaplin@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>joseph.murray@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Changes</template>
    </alerts>
    <alerts>
        <fullName>Opp_stage_change_alert_Enterprise_PacNW</fullName>
        <description>Opp wfr/ea 1.1 - Opp stage change alert Enterprise West 1</description>
        <protected>false</protected>
        <recipients>
            <recipient>dave.kranowitz@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dicken.chaplin@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>judi.feeley@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>randy.bartlewski@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Changes</template>
    </alerts>
    <alerts>
        <fullName>Opp_stage_change_alert_Enterprise_Southwest</fullName>
        <description>Opp wfr/ea 1.1 - Opp stage change alert Enterprise West 2</description>
        <protected>false</protected>
        <recipients>
            <recipient>dave.kranowitz@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dicken.chaplin@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>judi.feeley@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Changes</template>
    </alerts>
    <alerts>
        <fullName>Opp_stage_change_alert_Finance</fullName>
        <description>Opp wfr/ea 1.1 - Opp stage change alert Finance</description>
        <protected>false</protected>
        <recipients>
            <recipient>Customer_Experience</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>charmian.mcintyre@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Changes</template>
    </alerts>
    <alerts>
        <fullName>Opp_stage_change_alert_Maintenance_Renewal</fullName>
        <description>Opp wfr/ea 1.1 - Opp stage change alert Maintenance Renewal</description>
        <protected>false</protected>
        <recipients>
            <recipient>andrew.robinson@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>chris.ward@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ryan.stone@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Changes</template>
    </alerts>
    <alerts>
        <fullName>Opp_stage_change_alert_Oved_Corporate</fullName>
        <ccEmails>cxteam@vmturbo.com</ccEmails>
        <description>Opp wfr/ea 1.1 - Opp stage change alert Oved Corporate</description>
        <protected>false</protected>
        <recipients>
            <recipient>dicken.chaplin@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>newton.davis@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>oved.lourie@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Changes</template>
    </alerts>
    <alerts>
        <fullName>Opp_stage_change_alert_Tri_State</fullName>
        <description>Opp wfr/ea 1.1 - Opp stage change alert Enterprise East 2</description>
        <protected>false</protected>
        <recipients>
            <recipient>dave.kranowitz@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dicken.chaplin@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jr.butler@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Changes</template>
    </alerts>
    <alerts>
        <fullName>Opp_stage_change_alert_US_Enterprise_2</fullName>
        <description>Opp wfr/ea 1.1 - Opp stage change alert US Enterprise</description>
        <protected>false</protected>
        <recipients>
            <recipient>bob.wambach@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dave.kranowitz@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dicken.chaplin@vmturbo.com</recipient>
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
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Changes</template>
    </alerts>
    <alerts>
        <fullName>Opp_stage_change_alert_Velocity</fullName>
        <description>Opp wfr/ea 1.1 - Opp stage change alert Velocity</description>
        <protected>false</protected>
        <recipients>
            <recipient>alex.osterman@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>bob.wambach@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dicken.chaplin@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>gerry.sengendo@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>graham.turner@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>idrina.potts@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jeff.irvin@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>steve.corndell@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>stuart.horgan@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>susie.custer@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tom.vieth@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Changes</template>
    </alerts>
    <alerts>
        <fullName>Opp_stage_change_alert_for_Exec_Team</fullName>
        <description>Opp wfr/ea 1.1 - Opp stage change alert for Exec Team</description>
        <protected>false</protected>
        <recipients>
            <recipient>ben.nye@vmturbo.com</recipient>
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
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Changes</template>
    </alerts>
    <alerts>
        <fullName>Opp_stage_changes_alert_Ops_Team</fullName>
        <description>Opp wfr/ea 1.1 - Opp stage changes alert Ops Team</description>
        <protected>false</protected>
        <recipients>
            <recipient>charmian.mcintyre@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Changes</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_Approval_Submission_Approval_Rep_Email</fullName>
        <description>Opportunity Approval Submission Approval - Rep Email</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Creation_Approved_Alert</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_Approval_Submission_Confirmation_Rep_Email</fullName>
        <description>Opportunity Approval Submission Confirmation - Rep Email</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>unfiled$public/Opportunity_Submitted_for_Approval_Rep_Email</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_Approval_Submission_Rejection_Rep_Email</fullName>
        <description>Opportunity Approval Submission Rejection - Rep Email</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Creation_Denied_Alert</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_Approved</fullName>
        <description>Opportunity Approved</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/opp_approval_email</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_Won_excluding_Paige</fullName>
        <ccEmails>support-team@vmturbo.com</ccEmails>
        <description>Opportunity Won (excluding Paige)</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/opp_won_email</template>
    </alerts>
    <alerts>
        <fullName>Pipeline_Add_for_Central</fullName>
        <description>Pipeline Add for Central</description>
        <protected>false</protected>
        <recipients>
            <recipient>charmian.mcintyre@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opp_IDed_update</template>
    </alerts>
    <alerts>
        <fullName>Pipeline_Add_for_West</fullName>
        <description>Pipeline Add for West</description>
        <protected>false</protected>
        <recipients>
            <recipient>Manager_BDR_Bus_West</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opp_IDed_update</template>
    </alerts>
    <alerts>
        <fullName>Registration_Denied</fullName>
        <description>Registration Denied</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/opp_rejection_email</template>
    </alerts>
    <alerts>
        <fullName>Renewal_opp_lost</fullName>
        <ccEmails>support-team@vmturbo.com</ccEmails>
        <ccEmails>cxteam@vmturbo.com</ccEmails>
        <description>Renewal opp lost</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Changes</template>
    </alerts>
    <alerts>
        <fullName>Send_Approval_Notice_to_Owner</fullName>
        <ccEmails>charmian.mcintyre@turbonomic.com</ccEmails>
        <description>Send Approval Notice to Owner</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Approval_Request_Templates/Enterprise_East_Identify_to_Pipeline_Approval</template>
    </alerts>
    <alerts>
        <fullName>Send_Approval_Notice_to_Owner_Pipe_Upside</fullName>
        <ccEmails>charmian.mcintyre@turbonomic.com</ccEmails>
        <description>Send Approval Notice to Owner Pipe_Upside</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Approval_Request_Templates/Enterprise_East_Pipeline_to_Upside_Approval</template>
    </alerts>
    <alerts>
        <fullName>Send_Denial_Notice_to_Owner_Pipe_Upside</fullName>
        <ccEmails>charmian.mcintyre@turbonomic.com</ccEmails>
        <description>Send Denial Notice to Owner Pipe_Upside</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Approval_Request_Templates/Enterprise_East_Pipeline_to_Upside_Denial</template>
    </alerts>
    <alerts>
        <fullName>Send_Notice_of_Denial_to_Owner</fullName>
        <ccEmails>charmian.mcintyre@turbonomic.com</ccEmails>
        <description>Send Notice of Denial to Owner</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Approval_Request_Templates/Enterprise_East_Identify_to_Pipeline_Denial</template>
    </alerts>
    <alerts>
        <fullName>Send_Submission_Receipt_to_Oppy_Owner</fullName>
        <ccEmails>charmian.mcintyre@turbonomic.com</ccEmails>
        <description>Send Submission Receipt to Oppy Owner</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Approval_Request_Templates/Approval_Request_Receipt_of_Submission</template>
    </alerts>
    <alerts>
        <fullName>Velo_Opp_Pipe_Alert_for_AVP_with_VP_Visibility</fullName>
        <description>Velo Opp Pipe Alert for AVP with VP Visibility</description>
        <protected>false</protected>
        <recipients>
            <recipient>aj.ferrera@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>cody.carlson@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dan.dipalma@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>emilio.siman@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>graham.turner@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>grant.hornung@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jacob.deluise@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jr.butler@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kevin.frechette@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>michael.iannotti@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>neil.creahan@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tom.strachan@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Velo_Opp_Pipe_Alert_for_AVP</template>
    </alerts>
    <alerts>
        <fullName>Velo_Opportunity_Approved_To_Pipe</fullName>
        <description>Velo Opportunity Approved To Pipe</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Velo_Opportunity_Pipe_Approved</template>
    </alerts>
    <alerts>
        <fullName>Velo_Opportunity_Denied_to_Lost</fullName>
        <description>Velo Opportunity Denied to Lost</description>
        <protected>false</protected>
        <recipients>
            <recipient>Commercial_Bus_Driver_Gulf_Coast</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>Commercial_Bus_Driver_NYC_New_England</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>Commercial_Bus_Driver_Other_West_Territories</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>Commercial_Bus_Driver_Pacific_Coast</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Velo_Opportunity_Lost_Denied</template>
    </alerts>
    <alerts>
        <fullName>Velo_Opportunity_Denied_to_Pipe</fullName>
        <description>Velo Opportunity Denied to Pipe</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Velo_Opportunity_Pipeline_Denied</template>
    </alerts>
    <alerts>
        <fullName>Velo_opportunity_Approved_to_Lost</fullName>
        <description>Velo opportunity Approved to Lost</description>
        <protected>false</protected>
        <recipients>
            <recipient>Commercial_Bus_Driver_Gulf_Coast</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>Commercial_Bus_Driver_NYC_New_England</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>Commercial_Bus_Driver_Other_West_Territories</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>Commercial_Bus_Driver_Pacific_Coast</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Velo_Opportunity_Lost_Approved</template>
    </alerts>
    <fieldUpdates>
        <fullName>AVP_Approved</fullName>
        <field>AVP_Approved__c</field>
        <literalValue>1</literalValue>
        <name>AVP Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>AVP_Closed_Approved</fullName>
        <field>AVP_Closed_Approved__c</field>
        <literalValue>1</literalValue>
        <name>AVP Closed Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
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
        <fullName>Add_Z_s_to_Prior_StageOLD</fullName>
        <field>Prior_Stage_Stamp__c</field>
        <formula>Prior_Stage_Stamp__c&amp;&quot;ZZZ&quot;</formula>
        <name>Add Z&apos;s to Prior StageOLD</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Status_Pending</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Pending</literalValue>
        <name>Approval Status Pending</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Status_to_Denied</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Denied</literalValue>
        <name>Approval Status to Denied</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Status_to_Upside_Approved</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Upside Approved</literalValue>
        <name>Approval Status to Upside Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_status_to_Pipeline_Approved</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Pipeline_Approved</literalValue>
        <name>Approval status to Pipeline Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Deal_Type</fullName>
        <field>Deal_Type__c</field>
        <name>Clear Deal Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Forecast_Opportunity</fullName>
        <field>Forecast_Opportunity_2__c</field>
        <name>Clear Forecast Opportunity</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_In_Q_VP_Forecast</fullName>
        <field>In_Quarter_VP_Forecast__c</field>
        <name>Clear In-Q VP Forecast</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Max_Deal_Amount</fullName>
        <field>Max_Deal_Amount__c</field>
        <formula>0</formula>
        <name>Clear Max Deal Amount</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Opportunity_ID_Date</fullName>
        <field>Opportunity_ID_Date__c</field>
        <name>Clear Opportunity ID Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Delete_PO_received_date_time</fullName>
        <field>PO_Received_Date_Time__c</field>
        <name>Delete PO received date/time</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Email_Update_Stamp_update</fullName>
        <field>Email_Update_Stamp__c</field>
        <formula>IF(ISNEW(),&quot;[new record]&quot;,
IF(AND( 
ISCHANGED(Amount), 
ISCHANGED(CloseDate), 
ISCHANGED(StageName)), 
TEXT(PRIORVALUE(Amount))&amp;&quot;&lt;&quot;&amp; 
TEXT(PRIORVALUE(CloseDate))&amp;&quot;&gt;&quot;&amp; 
TEXT(PRIORVALUE(StageName)), 
IF(AND( 
ISCHANGED(Amount), 
ISCHANGED(CloseDate), 
NOT(ISCHANGED(StageName))), 
TEXT(PRIORVALUE(Amount))&amp;&quot;&lt;&quot;&amp; 
TEXT(PRIORVALUE(CloseDate))&amp;&quot;&gt;&quot;&amp; 
&quot;(no stage change)&quot;, 
IF(AND( 
ISCHANGED(Amount), 
NOT(ISCHANGED(CloseDate)), 
ISCHANGED(StageName)), 
TEXT(PRIORVALUE(Amount))&amp;&quot;&lt;&quot;&amp; 
&quot;(no close date change)&quot;&amp;&quot;&gt;&quot;&amp; 
TEXT(PRIORVALUE(StageName)), 
IF(AND( 
NOT(ISCHANGED(Amount)), 
ISCHANGED(CloseDate), 
ISCHANGED(StageName)), 
&quot;(no amount change)&quot;&amp;&quot;&lt;&quot;&amp; 
TEXT(PRIORVALUE(CloseDate))&amp;&quot;&gt;&quot;&amp; 
TEXT(PRIORVALUE(StageName)), 
IF(AND( 
ISCHANGED(Amount), 
NOT(ISCHANGED(CloseDate)), 
NOT(ISCHANGED(StageName))), 
TEXT(PRIORVALUE(Amount))&amp;&quot;&lt;&quot;&amp; 
&quot;(no close date change)&quot;&amp;&quot;&gt;&quot;&amp; 
&quot;(no stage change)&quot;, 
IF(AND( 
NOT(ISCHANGED(Amount)), 
ISCHANGED(CloseDate), 
NOT(ISCHANGED(StageName))), 
&quot;(no amount change)&quot;&amp;&quot;&lt;&quot;&amp; 
TEXT(PRIORVALUE(CloseDate))&amp;&quot;&gt;&quot;&amp; 
&quot;(no stage change)&quot;, 
IF(AND( 
NOT(ISCHANGED(Amount)), 
NOT(ISCHANGED(CloseDate)), 
ISCHANGED(StageName)), 
&quot;(no amount change)&quot;&amp;&quot;&lt;&quot;&amp; 
&quot;(no close date change)&quot;&amp;&quot;&gt;&quot;&amp; 
TEXT(PRIORVALUE(StageName)), 
IF(AND( 
NOT(ISCHANGED(Amount)), 
NOT(ISCHANGED(CloseDate)), 
NOT(ISCHANGED(StageName))), 
&quot;(no amount change)&quot;&amp;&quot;&lt;&quot;&amp; 
&quot;(no close date change)&quot;&amp;&quot;&gt;&quot;&amp; 
&quot;(no stage change)&quot;,&quot;N/A&quot;)))))))))</formula>
        <name>Email Update Stamp update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Exclude_from_Auto_Unqualify</fullName>
        <field>Exclude_from_Auto_Unqualify__c</field>
        <literalValue>1</literalValue>
        <name>Exclude from Auto-Unqualify</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_LeadSource_with_Bus_Dev</fullName>
        <field>LeadSource</field>
        <literalValue>Business Development</literalValue>
        <name>Fill LeadSource with Bus Dev</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_LeadSource_with_Channel</fullName>
        <field>LeadSource</field>
        <literalValue>Channel</literalValue>
        <name>Fill LeadSource with Channel</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_LeadSource_with_Cold_Call_List</fullName>
        <field>LeadSource</field>
        <literalValue>Cold Call List</literalValue>
        <name>Fill LeadSource with Cold Call List</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_LeadSource_with_Inbound_Other</fullName>
        <field>LeadSource</field>
        <literalValue>Inbound - Other</literalValue>
        <name>Fill LeadSource with Inbound Other</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_LeadSource_with_Inbound_Webinar</fullName>
        <field>LeadSource</field>
        <literalValue>Inbound - Webinar</literalValue>
        <name>Fill LeadSource with Inbound Webinar</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_LeadSource_with_Inbound_Website</fullName>
        <field>LeadSource</field>
        <literalValue>Inbound - Website</literalValue>
        <name>Fill LeadSource with Inbound Website</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_LeadSource_with_Prosp_LinkedIn</fullName>
        <field>LeadSource</field>
        <literalValue>Prospecting - LinkedIn</literalValue>
        <name>Fill LeadSource with Prosp LinkedIn</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_LeadSource_with_Prosp_RainKing</fullName>
        <field>LeadSource</field>
        <literalValue>Prospecting - RainKing</literalValue>
        <name>Fill LeadSource with Prosp RainKing</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_LeadSource_with_Prospecting_DOrg</fullName>
        <field>LeadSource</field>
        <literalValue>Prospecting - DiscoverOrg</literalValue>
        <name>Fill LeadSource with Prospecting DOrg</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_LeadSource_with_Prospecting_Other</fullName>
        <field>LeadSource</field>
        <literalValue>Prospecting - Other</literalValue>
        <name>Fill LeadSource with Prospecting Other</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_LeadSource_with_Third_Party</fullName>
        <field>LeadSource</field>
        <literalValue>Third Party</literalValue>
        <name>Fill LeadSource with Third Party</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_LeadSource_with_TradeShow</fullName>
        <field>LeadSource</field>
        <literalValue>Tradeshow</literalValue>
        <name>Fill LeadSource with TradeShow</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_Undiscounted_Renewal_Amount</fullName>
        <field>Undiscounted_Renewal_Amount__c</field>
        <formula>Amount</formula>
        <name>Fill Undiscounted Renewal Amount</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_of_Licensed_Cores_if_New_Deal</fullName>
        <field>Total_Licensed_Cores__c</field>
        <formula>IF(Text(Type)=&quot;New&quot;,of_CPU_Sockets__c,NULL)</formula>
        <name>Fill # of Licensed Cores if New Deal</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_of_Licensed_Sockets_if_New_Deal</fullName>
        <field>Total_Licensed_Sockets__c</field>
        <formula>IF(TEXT(Type)=&quot;New&quot;,of_CPU_Sockets__c,NULL)</formula>
        <name>Fill # of Licensed Sockets if New Deal</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Flag_Exec_Email_Alert</fullName>
        <field>Exec_Email_Alert_Flag__c</field>
        <literalValue>1</literalValue>
        <name>Flag Exec Email Alert</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Make_Close_Date_Finance_match_Close_Da</fullName>
        <field>Booking_Date__c</field>
        <formula>CloseDate</formula>
        <name>Make Close Date (Finance) match Close Da</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Move_Oppty_to_Pipeline_Stage</fullName>
        <field>StageName</field>
        <literalValue>Pipeline</literalValue>
        <name>Move Oppty to &apos;Pipeline&apos; Stage</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Move_Oppty_to_Upside_Stage_b</fullName>
        <field>StageName</field>
        <literalValue>Upside</literalValue>
        <name>Move Oppty to &apos;Upside&apos; Stage</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opp_Registration_Part_2</fullName>
        <field>Registration_Status_Stamp__c</field>
        <literalValue>Approved</literalValue>
        <name>Opp Registration Part 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opp_lost_unqual_date_update</fullName>
        <field>Lost_Unqual_Date__c</field>
        <formula>TODAY()</formula>
        <name>Opp lost/unqual date update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opp_start_date_update</fullName>
        <field>Opportunity_ID_Date__c</field>
        <formula>IF(AND(
OR(ISNEW(),ISBLANK(Opportunity_ID_Date__c)),
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;)), 
TEXT(Type)&lt;&gt;&quot;Quota&quot;,
TEXT(Type)&lt;&gt;&quot;Maintenance Renewal&quot;),TODAY(),
IF(AND(ISNEW(),NOT(ISBLANK(Opportunity_ID_Date__c))),NULL,
Opportunity_ID_Date__c))</formula>
        <name>Opp start date update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reg_Expiration</fullName>
        <field>Registration_Expiration__c</field>
        <formula>today()+90</formula>
        <name>Reg Expiration</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reg_status_stamp_Approved</fullName>
        <field>Registration_Status_Stamp__c</field>
        <literalValue>Approved</literalValue>
        <name>Reg status stamp=Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reg_status_stamp_Denied</fullName>
        <field>Registration_Status_Stamp__c</field>
        <literalValue>Denied</literalValue>
        <name>Reg status stamp=Denied</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reg_status_stamp_Submitted_for_Approval</fullName>
        <field>Registration_Status_Stamp__c</field>
        <literalValue>Submitted for Approval</literalValue>
        <name>Reg status stamp=Submitted for Approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Registration_Expiration</fullName>
        <field>Registration_Status_Stamp__c</field>
        <literalValue>Needs Review</literalValue>
        <name>Registration Expiration</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Registration_Expiration_Extension</fullName>
        <field>Registration_Expiration__c</field>
        <formula>TODAY()+90</formula>
        <name>Registration Expiration Extension</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Registration_field_update</fullName>
        <field>Registration_Status_Stamp__c</field>
        <literalValue>Expired</literalValue>
        <name>Registration field update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Risk_Projection_50_EFJ_Field_Update</fullName>
        <field>Risk_Projection_50_EFJ__c</field>
        <formula>CASE(StageName, 
&quot;PO Received&quot;,Forecasted_Bookings_Editable__c + Anchor_Realization_EJF__c, 
&quot;Commit&quot;,Forecasted_Bookings_Editable__c + Anchor_Realization_EJF__c, 
&quot;Strong Upside&quot;,Forecasted_Bookings_Editable__c + Anchor_Realization_EJF__c,
&quot;Upside&quot;, Anchor_Realization_EJF__c* 0.50 + Forecasted_Bookings_Editable__c ,Forecasted_Bookings_Editable__c )</formula>
        <name>Risk Projection &gt;50% (EFJ) Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Risk_Projection_75_EFJ_Field_Update</fullName>
        <field>Risk_Projection_75_EFJ__c</field>
        <formula>CASE(StageName,
&quot;PO Received&quot;,Forecasted_Bookings_Editable__c + Anchor_Realization_EJF__c,
&quot;Commit&quot;,Forecasted_Bookings_Editable__c + Anchor_Realization_EJF__c,
&quot;Strong Upside&quot;,Forecasted_Bookings_Editable__c + Anchor_Realization_EJF__c,
Forecasted_Bookings_Editable__c )</formula>
        <name>Risk Projection &gt;75% (EFJ) Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Risk_Projection_90_EFJ_Field_Update</fullName>
        <field>Risk_Projection_90_EFJ__c</field>
        <formula>CASE(StageName,
&quot;PO Received&quot;,Forecasted_Bookings_Editable__c + Anchor_Realization_EJF__c,
&quot;Commit&quot;,Forecasted_Bookings_Editable__c + Anchor_Realization_EJF__c,
Forecasted_Bookings_Editable__c )</formula>
        <name>Risk Projection &gt;90% (EFJ) Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Default_Cisco_Royalty_Status</fullName>
        <field>Cisco_Royalty_Status__c</field>
        <literalValue>Not Received</literalValue>
        <name>Set Default Cisco Royalty Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Reg_Expiration_Date</fullName>
        <field>Registration_Expiration__c</field>
        <formula>Today()+90</formula>
        <name>Set Reg Expiration Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Reg_Expiration_Date_Null</fullName>
        <field>Registration_Expiration__c</field>
        <name>Set Reg Expiration Date Null</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Sales_Stage_to_Agreement</fullName>
        <field>Sales_Stage__c</field>
        <literalValue>Agreement</literalValue>
        <name>Set Sales Stage to Agreement</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Sales_Stage_to_Business_Need</fullName>
        <field>Sales_Stage__c</field>
        <literalValue>Business Need</literalValue>
        <name>Set Sales Stage to Business Need</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Sales_Stage_to_Close</fullName>
        <field>Sales_Stage__c</field>
        <literalValue>Close</literalValue>
        <name>Set Sales Stage to Close</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Sales_Stage_to_Closed_Lost</fullName>
        <field>Sales_Stage__c</field>
        <literalValue>Closed Lost</literalValue>
        <name>Set Sales Stage to Closed Lost</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Sales_Stage_to_Closed_Won</fullName>
        <field>Sales_Stage__c</field>
        <literalValue>Closed Won</literalValue>
        <name>Set Sales Stage to Closed Won</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Sales_Stage_to_Proof_of_Value</fullName>
        <field>Sales_Stage__c</field>
        <literalValue>Proof of Value</literalValue>
        <name>Set Sales Stage to Proof of Value</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Sales_Stage_to_The_Pact</fullName>
        <field>Sales_Stage__c</field>
        <literalValue>The Pact</literalValue>
        <name>Set Sales Stage to The Pact</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Sales_Stage_to_Unqualified</fullName>
        <field>Sales_Stage__c</field>
        <literalValue>Unqualified</literalValue>
        <name>Set Sales Stage to Unqualified</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_booking_date_equal_to_close_date</fullName>
        <field>Booking_Date__c</field>
        <formula>IF(ISBLANK(Booking_Date__c),CloseDate,Booking_Date__c)</formula>
        <name>Set booking date equal to close date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stage_change_date</fullName>
        <field>Stage_Change_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stage change date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Advocates_and_Blockers_last_update</fullName>
        <field>Advocates_and_Blockers_Last_Updated__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Advocates and Blockers last update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Agreement_on_Contract_Terms_Clos</fullName>
        <field>Agreement_on_Contract_Close_Last_Updated__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Agreement on Contract Terms &amp; Clos</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_BIP_Completed</fullName>
        <field>BIP_Completed__c</field>
        <literalValue>1</literalValue>
        <name>Stamp BIP Completed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_BIP_Completed_Last_Updated</fullName>
        <field>BIP_Completed_Last_Updated__c</field>
        <formula>TODAY()</formula>
        <name>Stamp BIP Completed Last Updated</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Began_Eval</fullName>
        <field>Began_Eval__c</field>
        <literalValue>1</literalValue>
        <name>Stamp Began Eval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Began_Eval_Last_Updated</fullName>
        <field>Began_Eval_Last_Updated__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Began Eval Last Updated</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_CX_CoE_Introduced_Last_Updated</fullName>
        <field>CX_CoE_Introduced_Last_Updated__c</field>
        <formula>TODAY()</formula>
        <name>Stamp CX/CoE Introduced Last Updated</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Close_Date_Finance</fullName>
        <field>Booking_Date__c</field>
        <formula>CloseDate</formula>
        <name>Stamp Close Date Finance</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Cloud_Partner_Influencer_Date</fullName>
        <field>Cloud_Partner_Influencer_Date_Stamp__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Cloud Partner Influencer Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Compelling_Reason_To_Buy_Now_Date</fullName>
        <field>Compelling_Reason_to_Buy_Last_Updated__c</field>
        <name>Stamp Compelling Reason To Buy Now Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Completion_Date_MSFT_Status</fullName>
        <description>Captures the date that the MSFT Status is moved to &quot;Completed&quot;</description>
        <field>Date_moved_to_Complete_MSFT__c</field>
        <formula>TODAY ()</formula>
        <name>Stamp Completion Date (MSFT Status)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Core_Change_Date</fullName>
        <field>Core_Update_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Core Change Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_DQ_Alternatives_Status_Quo_Date</fullName>
        <field>DQ_Alternatives_Status_Quo_Last_Updated__c</field>
        <formula>TODAY()</formula>
        <name>Stamp DQ Alternatives &amp; Status Quo Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Date_of_MSFT_Approval</fullName>
        <description>Stamp Date of MSFT Approval</description>
        <field>Date_Submitted_for_MSFT_Approval_MSFT__c</field>
        <formula>TODAY ()</formula>
        <name>Stamp Date of MSFT Approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Date_of_MSFT_Customer_Approval</fullName>
        <description>Stamp Date of MSFT Customer Approval Submission</description>
        <field>Date_Submitted_for_Customer_Approval__c</field>
        <formula>TODAY ()</formula>
        <name>Stamp Date of MSFT Customer Approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Deal_Type_Last_Modified_By</fullName>
        <field>Deal_Type_Last_Modified_By__c</field>
        <formula>$User.Full_Name__c</formula>
        <name>Stamp Deal Type Last Modified By</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Deal_Type_Last_Modified_Date</fullName>
        <field>Deal_Type_Last_Modified_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Deal Type Last Modified Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Deployed_in_Customer_Environment</fullName>
        <field>Deployed_in_Customer_Environment_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Deployed in Customer Environment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Engaged_with_Cisco_Rep_Date</fullName>
        <field>Engaged_with_Cisco_Rep_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Engaged with Cisco Rep Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Eval_Completion_Date</fullName>
        <field>Eval_Completion_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Eval Completion Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Eval_Criteria_Last_Documented</fullName>
        <field>Eval_Criteria_Documented_Last_Updated__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Eval Criteria Last Documented</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Eval_Period_Concluded</fullName>
        <field>Eval_Period_Concluded__c</field>
        <literalValue>1</literalValue>
        <name>Stamp Eval Period Concluded</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Eval_Period_Concluded_Last_Updated</fullName>
        <field>Eval_Period_Concluded_Last_Updated__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Eval Period Concluded Last Updated</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Eval_Start_Date</fullName>
        <field>Eval_Start_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Eval Start Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Exec_Buy_In_On_BIP_Last_Updated</fullName>
        <field>Exec_Buy_In_on_BIP_Last_Updated__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Exec Buy In On BIP Last Updated</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Exec_Sponsor_Need_Timing</fullName>
        <field>Exec_Sponsor_Need_Timing__c</field>
        <literalValue>1</literalValue>
        <name>Stamp Exec Sponsor Need &amp; Timing</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Exec_Sponsor_Need_Timing_Update</fullName>
        <field>Exec_Sponsor_Need_Timing_Last_Updated__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Exec Sponsor Need &amp; Timing Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Funding_Approved_Last_Updated</fullName>
        <field>Funding_Approved_Last_Updated__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Funding Approved Last Updated</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Joint_Post_Sales_Call_Completed_Da</fullName>
        <field>Joint_Post_Sales_Call_Completed_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Joint Post-Sales Call Completed Da</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Last_Highest_Level_Engaged</fullName>
        <field>Last_Highest_Level_Engaged_Updated__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Last Highest Level Engaged</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Manager_s_Email</fullName>
        <field>Manager_Email__c</field>
        <formula>Owner.Manager_Email__c</formula>
        <name>Stamp Manager&apos;s Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Max_Deal_Amount_on_Maintenance_Win</fullName>
        <field>Max_Deal_Amount__c</field>
        <formula>Amount</formula>
        <name>Stamp Max Deal Amount on Maintenance Win</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Most_Recent_Outcome_Change_Modifie</fullName>
        <field>Most_Recent_Outcome_Change_Modified__c</field>
        <formula>NOW()</formula>
        <name>Stamp Most Recent Outcome/Change Modifie</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Move_to_Strong_Upside_Date</fullName>
        <field>Move_to_Strong_Upside_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Move to Strong Upside Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Move_to_Upside</fullName>
        <field>Move_to_Upside_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Move to Upside Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_PBOs_Metrics_Last_Updated</fullName>
        <field>Last_Expected_PBOs_Metrics_Update__c</field>
        <formula>TODAY()</formula>
        <name>Stamp PBOs &amp; Metrics Last Updated</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_POV_Planning_Date</fullName>
        <field>POV_Planning_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp POV Planning Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Partner_Committed_Date</fullName>
        <field>Partner_Committed_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Partner Committed Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Quote_Contract_Date</fullName>
        <field>Quote_Contract_Vehicle_Last_Updated__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Quote &amp; Contract Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Reason_For_Change_Last_Modified</fullName>
        <field>Reason_for_Change_Last_Modified__c</field>
        <formula>NOW()</formula>
        <name>Stamp Reason For Change Last Modified</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Renewal_Due_Amount</fullName>
        <field>Renewal_Due_Amount__c</field>
        <formula>Amount</formula>
        <name>Stamp Renewal Due Amount</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Socket_Update_Date</fullName>
        <field>CPU_Socket_Update_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Socket Update Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Stage_Close_Date_Change_Date</fullName>
        <field>Stage_Close_Date_Change_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Stage/Close Date Change Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Steps_to_Close_Last_Updated</fullName>
        <field>Steps_to_Close_Last_Updated__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Steps to Close Last Updated</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Tech_Need_for_Perf_Cap_Mgmt_SW_Las</fullName>
        <field>Tech_Need_for_Perf_Cap_Mgmt_Last_Updated__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Tech Need for Perf/Cap Mgmt SW Las</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Tech_Win_Established_Last_Updated</fullName>
        <field>Tech_Win_Established_Last_Updated__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Tech Win Established Last Updated</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_VMT_score_change_date</fullName>
        <field>Last_VMT_Score_Change_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp VMT score change date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Warm_Account</fullName>
        <field>Warm_Account_Stamp__c</field>
        <literalValue>1</literalValue>
        <name>Stamp Warm Account</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_cancelled_date</fullName>
        <field>Maintenance_Subscription_Cancelled_Date__c</field>
        <formula>Booking_Date__c</formula>
        <name>Stamp cancelled date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_customer_deal_structure_as_Channel</fullName>
        <field>Customer_Deal_Structure__c</field>
        <literalValue>Channel</literalValue>
        <name>Stamp customer deal structure as Channel</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_customer_deal_structure_as_Direct</fullName>
        <field>Customer_Deal_Structure__c</field>
        <literalValue>Direct</literalValue>
        <name>Stamp customer deal structure as Direct</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Unqualify_Denied_Opportunity</fullName>
        <field>StageName</field>
        <literalValue>Unqualified</literalValue>
        <name>Unqualify Denied Opportunity</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_First_Close_Date_on_Account</fullName>
        <field>First_Close_Date__c</field>
        <formula>CloseDate</formula>
        <name>Update First Close Date on Account</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Identified_By_Role</fullName>
        <field>Identified_By_Role_Static__c</field>
        <formula>IF(ISBLANK(Identified_By__c),NULL,
IF(AND(CONTAINS(LOWER(Identified_By__r.UserRole.Name),&quot;business development rep&quot;),CONTAINS(LOWER(Identified_By__r.UserRole.Name),&quot;key account&quot;)),&quot;Business Development Rep (Key Accounts)&quot;, 
IF(AND(CONTAINS(LOWER(Identified_By__r.UserRole.Name),&quot;business development rep&quot;),CONTAINS(LOWER(Identified_By__r.UserRole.Name),&quot;channel&quot;)),&quot;Business Development Rep (Channel)&quot;,
IF(CONTAINS(LOWER(Identified_By__r.UserRole.Name),&quot;business development rep&quot;),&quot;Business Development Rep&quot;,
IF(AND(CONTAINS(Identified_By__r.UserRole.Name,&quot;Account Executive&quot;),CONTAINS(LOWER(Identified_By__r.UserRole.Name),&quot;corporate&quot;)),&quot;Corporate Account Executive&quot;,
IF(AND(CONTAINS(Identified_By__r.UserRole.Name,&quot;Account Executive&quot;),CONTAINS(LOWER(Identified_By__r.UserRole.Name),&quot;commercial&quot;)),&quot;Commercial Account Executive&quot;,
IF(CONTAINS(Identified_By__r.UserRole.Name,&quot;Account Executive&quot;),&quot;Account Executive&quot;,
IF(CONTAINS(LOWER(Identified_By__r.UserRole.Name),&quot;inside sales rep - enterprise&quot;),&quot;Sales Development Rep (Enterprise)&quot;,
IF(CONTAINS(LOWER(Identified_By__r.UserRole.Name),&quot;inside sales rep&quot;),&quot;Inside Sales Rep (Commercial)&quot;,
IF(AND(CONTAINS(LOWER(Identified_By__r.UserRole.Name),&quot;sales development rep&quot;),CONTAINS(LOWER(Identified_By__r.UserRole.Name),&quot;enterprise&quot;)),&quot;Sales Development Rep (Enterprise)&quot;,
IF(AND(CONTAINS(LOWER(Identified_By__r.UserRole.Name),&quot;sales development rep&quot;),CONTAINS(LOWER(Identified_By__r.UserRole.Name),&quot;global&quot;)),&quot;Sales Development Rep (Globals)&quot;,
IF(AND(CONTAINS(LOWER(Identified_By__r.UserRole.Name),&quot;sales development rep&quot;),CONTAINS(LOWER(Identified_By__r.UserRole.Name),&quot;corporate&quot;)),&quot;Corporate Sales Development Rep&quot;,
IF(AND(CONTAINS(LOWER(Identified_By__r.UserRole.Name),&quot;sales development rep&quot;),CONTAINS(LOWER(Identified_By__r.UserRole.Name),&quot;commercial&quot;)),&quot;Commercial Sales Development Rep&quot;, 
IF(CONTAINS(Identified_By__r.UserRole.Name,&quot;Sales Development Rep&quot;),&quot;Sales Development Rep&quot;,
IF(CONTAINS(Identified_By__r.UserRole.Name,&quot;Bus Driver&quot;),&quot;Bus Driver&quot;,
IF(CONTAINS(Identified_By__r.UserRole.Name,&quot;Enterprise Rep&quot;),&quot;Enterprise Rep&quot;,
IF(CONTAINS(Identified_By__r.UserRole.Name,&quot;Team Lead&quot;),&quot;Team Lead&quot;,
Identified_By__r.UserRole.Name)))))))))))))))))</formula>
        <name>Update Identified By Role</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Identified_By_Team</fullName>
        <field>Identified_By_Team_Static__c</field>
        <formula>IF(ISBLANK(Identified_By__c),NULL, 
TEXT(Identified_By__r.Team__c))</formula>
        <name>Update Identified By Team</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_In_Quarter_VP_Forecast</fullName>
        <field>In_Quarter_VP_Forecast__c</field>
        <literalValue>Upside</literalValue>
        <name>Update In Quarter VP Forecast</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_In_Quarter_VP_Forecast_Closed_W</fullName>
        <field>In_Quarter_VP_Forecast__c</field>
        <literalValue>Closed Won</literalValue>
        <name>Update In Quarter VP Forecast - Closed W</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_LELVUD</fullName>
        <field>Last_Expected_License_Value_Update_Date__c</field>
        <formula>TODAY()</formula>
        <name>Update LELVUD</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Marketing_Attribution</fullName>
        <field>Marketing_Campaign_Influence__c</field>
        <literalValue>VDI Campaign FY2017Q4</literalValue>
        <name>Update Marketing Attribution</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Next_Steps_Last_Updated</fullName>
        <field>Next_Steps_Last_Updated__c</field>
        <formula>TODAY()</formula>
        <name>Update Next Steps Last Updated</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_PO_received_date_tim</fullName>
        <field>PO_Received_Date_Time__c</field>
        <formula>NOW()</formula>
        <name>Update PO received date/tim</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Prior_Stage_StampOLD</fullName>
        <field>Prior_Stage_Stamp__c</field>
        <formula>IF(ISCHANGED(StageName),TEXT(PRIORVALUE(StageName)),&quot;(no stage change)&quot;)</formula>
        <name>Update Prior Stage StampOLD</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Stage_to_Pipeline</fullName>
        <field>StageName</field>
        <literalValue>Pipeline</literalValue>
        <name>Update Stage to Pipeline</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_VP_Approved_Box</fullName>
        <field>VP_Approved__c</field>
        <literalValue>1</literalValue>
        <name>Update VP Approved Box</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_highest_stage_reached</fullName>
        <field>Highest_Stage_Reached__c</field>
        <formula>IF(OR(ISNEW(),ISBLANK(Highest_Stage_Reached__c)),TEXT(StageName),
IF(CASE(TEXT(StageName),
&quot;Identify&quot;, 1,
&quot;Pipeline&quot;, 2,
&quot;Upside&quot;, 3,
&quot;Strong Upside&quot;, 4,
&quot;Commit&quot;, 5,
&quot;PO received&quot;, 6,
&quot;Closed Won&quot;, 7,
0)&gt;
CASE(Highest_Stage_Reached__c,
&quot;Identify&quot;, 1,
&quot;Pipeline&quot;, 2,
&quot;Upside&quot;, 3,
&quot;Strong Upside&quot;, 4,
&quot;Commit&quot;, 5,
&quot;PO received&quot;, 6,
&quot;Closed Won&quot;, 7,
0),TEXT(StageName),Highest_Stage_Reached__c))</formula>
        <name>Update highest stage reached</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_stage_at_opp_creation</fullName>
        <description>Updates the opportunity stage at creation</description>
        <field>Stage_at_Creation__c</field>
        <formula>TEXT(StageName)</formula>
        <name>Update stage at opp creation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>VM_Update_Date</fullName>
        <field>VM_Update_Date__c</field>
        <formula>TODAY()</formula>
        <name>VM Update Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>set_expiration_status</fullName>
        <field>Registration_Status_Stamp__c</field>
        <literalValue>Expired</literalValue>
        <name>set expiration status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>set_expiration_status_2</fullName>
        <field>Registration_Status_Stamp__c</field>
        <literalValue>Expired</literalValue>
        <name>set expiration status_2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Add Close Date Finance to maint renewals</fullName>
        <actions>
            <name>Stamp_Close_Date_Finance</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(TEXT(Type)=&quot;Maintenance Renewal&quot;,
ISBLANK(Booking_Date__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Alert Alliances of Cisco Engagement</fullName>
        <actions>
            <name>Alert_Alliances_of_Cisco_Engagement</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Email Alert to Alliances team when a Rep marks a deal as being cisco engaged</description>
        <formula>AND(
ISCHANGED(Notify_Alliances_of_Cisco_Engagement__c),
Notify_Alliances_of_Cisco_Engagement__c= TRUE
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Alert Alliances of Cloud Co-Sell Submission</fullName>
        <actions>
            <name>Alert_Alliances_of_Cloud_Co_Sell_Opportunity</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Email Alert to Alliances team when a Rep submits a deal as being a Cloud Co-Sell Opportunity</description>
        <formula>AND(
ISCHANGED(Cloud_Co_Sell_Submission__c),
NOT(ISPICKVAL(Cloud_Co_Sell_Submission__c,&quot;&quot;))
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Alert Customer Success on Big Deal</fullName>
        <actions>
            <name>Add_Z_s_to_Email_Update_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(ISCHANGED(StageName),ISPICKVAL(StageName, &quot;Closed Won&quot;),RIGHT(Email_Update_Stamp__c,3)&lt;&gt;&quot;ZZZ&quot;, OR(ISPICKVAL(Type,&quot;New&quot;),ISPICKVAL(Type,&quot;Upsell&quot;)),Amount&gt;74999,$UserRole.Name&lt;&gt;&quot;VMT SF admin&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Alert Finance of Renewal Entering PO Received</fullName>
        <actions>
            <name>Alert_Finance_of_Renewal_entering_PO_Received</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>AND(TEXT(StageName)=&quot;PO Received&quot;,TEXT(Type)=&quot;Renewal&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Alert Sales of Cisco Engagement</fullName>
        <actions>
            <name>Alert_Sales_of_Cisco_Engagement</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Email Alert to Opportunity Owner and Alliances team when a deal identified as being cisco engaged</description>
        <formula>AND(
OR(
ISNEW(),
ISCHANGED(Cisco_Opportunity__c)
),
Cisco_Opportunity__c= TRUE
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>BIP Completed Workflow</fullName>
        <actions>
            <name>Stamp_BIP_Completed</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Exec_Sponsor_Need_Timing</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>Exec_Buy_In_on_BIP__c &amp;&amp; ISCHANGED(Exec_Buy_In_on_BIP__c) &amp;&amp; (!BIP_Completed__c || !Exec_Sponsor_Need_Timing__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Clear Opportunity ID Date</fullName>
        <actions>
            <name>Clear_Opportunity_ID_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Clear the opportunity id date when an opportunity moves back to identify from pipeline.</description>
        <formula>AND(
NOT(ISBLANK(Opportunity_ID_Date__c)),
ISPICKVAL(StageName,&quot;Identify&quot;),
ISPICKVAL(PRIORVALUE(StageName),&quot;Pipeline&quot;),
TEXT(Type)&lt;&gt;&quot;Quota&quot;,
TEXT(Type)&lt;&gt;&quot;Maintenance Renewal&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Clear PO received date and time</fullName>
        <actions>
            <name>Delete_PO_received_date_time</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>To allow for accurate customer counts</description>
        <formula>AND(NOT(ISBLANK(PO_Received_Date_Time__c)),ISCHANGED(StageName), NOT(ISPICKVAL(StageName,&quot;PO received&quot;)),NOT(ISPICKVAL(StageName,&quot;Closed Won&quot;)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Cloned Opp Clear Deal Type</fullName>
        <actions>
            <name>Clear_Deal_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
ISCLONE(),
ISNEW(),
TEXT(Type)&lt;&gt;&quot;New&quot;,
TEXT(StageName)&lt;&gt;&quot;Pipeline&quot;,
TEXT(StageName)&lt;&gt;&quot;Upside&quot;,
TEXT(StageName)&lt;&gt;&quot;Strong Upside&quot;,
TEXT(StageName)&lt;&gt;&quot;Commit&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Cloned Opp Clear Forecast Fields</fullName>
        <actions>
            <name>Clear_Forecast_Opportunity</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear_In_Q_VP_Forecast</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
ISCLONE(),
ISNEW())</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Create task on Closed Lost</fullName>
        <actions>
            <name>Follow_up_on_Closed_Lost_opportunity</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <formula>AND(ISPICKVAL(StageName,&quot;Closed Lost&quot;),Owner_Active__c=TRUE)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Customer Referral Requested Alert</fullName>
        <actions>
            <name>Customer_Referral_CX_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Alert CX team when a customer referral has been requested by Sales</description>
        <formula>AND(
ISCHANGED(Request_Customer_Referral__c ),
Request_Customer_Referral__c = true
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Email CX at PO received</fullName>
        <actions>
            <name>Alert_CX_Team_of_PO_Received</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Send a notification email to Ward when a deal is marked PO received</description>
        <formula>AND(ISPICKVAL(StageName,&quot;PO received&quot;),
TEXT(Type)=&quot;New&quot;,
Account.Name&lt;&gt;&quot;Rotondi Masonry&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Email Finance at PO received</fullName>
        <actions>
            <name>Alert_CX_Team_of_PO_Received</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Opp_marked_PO_received_alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Send a notification email to Finance when a deal is marked PO received</description>
        <formula>AND(
OR(ISPICKVAL(StageName,&quot;PO received&quot;),
ISPICKVAL(StageName,&quot;Closed Won&quot;)),
Account.Name&lt;&gt;&quot;Rotondi Masonry&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Eval Concluded Workflow</fullName>
        <actions>
            <name>Stamp_Began_Eval</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>Eval_Period_Concluded__c &amp;&amp; ISCHANGED(Eval_Period_Concluded__c) &amp;&amp; !Began_Eval__c</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Exclude EMEA Enterprise from Auto-Unqualify</fullName>
        <actions>
            <name>Exclude_from_Auto_Unqualify</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Owner_Team__c</field>
            <operation>equals</operation>
            <value>EMEA Enterprise</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Exec Sponsor Workflow</fullName>
        <actions>
            <name>Stamp_Exec_Sponsor_Need_Timing</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>Exec_Sponsors_Eval_Criteria_Documented__c &amp;&amp; ISCHANGED(Exec_Sponsors_Eval_Criteria_Documented__c) &amp;&amp; !Exec_Sponsor_Need_Timing__c</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Fill Undiscounted Renewal Amount</fullName>
        <actions>
            <name>Fill_Undiscounted_Renewal_Amount</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(ISBLANK(Undiscounted_Renewal_Amount__c),
NOT(ISBLANK(Amount)),
TEXT(Type)=&quot;Maintenance Renewal&quot;,
OR(TEXT(StageName)=&quot;Closed Won&quot;,TEXT(StageName)=&quot;Closed Lost&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Fill maint%2Fsubscr cancelled date</fullName>
        <actions>
            <name>Stamp_cancelled_date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(
TEXT(Type)=&quot;Maintenance Renewal&quot;,
ISBLANK(Account.Maintenance_Subscription_Cancelled_Date__c),
ISCHANGED(StageName),
TEXT(StageName)=&quot;Closed Lost&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Flag Exec Email Alert</fullName>
        <actions>
            <name>Flag_Exec_Email_Alert</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>OR(
  AND(ISNEW(),Probability&gt;=0.25),
  AND(ISNEW(),TEXT(StageName)=&quot;Closed Lost&quot;),
  AND(TEXT(StageName)=&quot;Identify&quot;,
    OR(TEXT(PRIORVALUE(StageName))=&quot;Pipeline&quot;,PRIORVALUE(Probability)&gt;0)),
  AND(OR(Probability&gt;0.25,TEXT(StageName)=&quot;Closed Lost&quot;),
    OR(ISCHANGED(Amount),ISCHANGED(CloseDate),ISCHANGED(StageName))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Forecast opp changes US Enterprise</fullName>
        <actions>
            <name>Forecast_Opportunity_Change_Email</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Send notification email when forecast opportunity field is modified</description>
        <formula>AND( 
Account.Name&lt;&gt;&quot;Rotondi Masonry&quot;,
Owner_Team_Group_Buckets__c==&quot;US Enterprise&quot;,
NOT(ISPICKVAL(Type,&quot;Maintenance Renewal&quot;)),
ISCHANGED(Forecast_Opportunity_2__c)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>MSFT %26 AWS Oppty Activity Alert</fullName>
        <actions>
            <name>MSFT_Oppty_Activity_Alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Stamp_Completion_Date_MSFT_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 OR (2 AND 3) OR 4 OR (5 AND 7) OR 6</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Status_MSFT__c</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Cloud_Partner_Influencer__c</field>
            <operation>equals</operation>
            <value>Microsoft Azure</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>PO received</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Cloud_Co_Sell_Submission__c</field>
            <operation>equals</operation>
            <value>Microsoft</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Cloud_Partner_Influencer__c</field>
            <operation>equals</operation>
            <value>AWS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Cloud_Co_Sell_Submission__c</field>
            <operation>equals</operation>
            <value>Amazon</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>PO received</value>
        </criteriaItems>
        <description>Activity alerts for select fields on MSFT &amp; AWS oppties</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>MSFT New Deal opp</fullName>
        <actions>
            <name>Alert_Email_MSFT_Deals</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <booleanFilter>(1 AND 2) OR (1 AND 3)</booleanFilter>
        <criteriaItems>
            <field>Opportunity.CreatedDate</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.MSFT_type__c</field>
            <operation>equals</operation>
            <value>Assessment,Optimization,Assessment &amp; Optimization</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Cloud_Partner_Influencer__c</field>
            <operation>equals</operation>
            <value>Microsoft Azure</value>
        </criteriaItems>
        <description>MSFT - created deal - email alert sent</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Make close dates match for quotas</fullName>
        <actions>
            <name>Make_Close_Date_Finance_match_Close_Da</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(TEXT(Type)=&quot;Quota&quot;,
CloseDate&lt;&gt;Booking_Date__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opp Unqualified Alert</fullName>
        <actions>
            <name>Auto_Opp_Unqualified_Alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>AND(
TEXT(StageName)=&quot;Unqualified&quot;,
TEXT(Type)&lt;&gt;&quot;Quota&quot;,
$UserRole.Name=&quot;VMT SF admin&quot;
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opp changes Oved Corporate</fullName>
        <actions>
            <name>Opp_stage_change_alert_Oved_Corporate</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_Z_s_to_Email_Update_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Send notification email when opportunity is modified</description>
        <formula>AND(
ISPICKVAL(Owner_Team__c,&quot;Oved Corporate&quot;),
Account.Name&lt;&gt;&quot;Rotondi Masonry&quot;,
RIGHT(Email_Update_Stamp__c,3)&lt;&gt;&quot;ZZZ&quot;,

OR(
AND( 
ISNEW(), 
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;), 
ISPICKVAL(StageName,&quot;Closed Lost&quot;))), 
AND(
ISCHANGED(StageName),
ISPICKVAL(StageName,&quot;Identify&quot;),
OR(ISPICKVAL(PRIORVALUE(StageName),&quot;Pipeline&quot;),
ISPICKVAL(PRIORVALUE(StageName),&quot;Upside&quot;),
ISPICKVAL(PRIORVALUE(StageName),&quot;Strong Upside&quot;),
ISPICKVAL(PRIORVALUE(StageName),&quot;Commit&quot;),
ISPICKVAL(PRIORVALUE(StageName),&quot;PO received&quot;),
ISPICKVAL(PRIORVALUE(StageName),&quot;Closed Won&quot;))),
AND(
OR(ISCHANGED(StageName),
ISCHANGED(Probability),
ISCHANGED(Amount),
ISCHANGED(CloseDate)),
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;),
ISPICKVAL(StageName,&quot;Upside&quot;),
ISPICKVAL(StageName,&quot;Strong Upside&quot;),
ISPICKVAL(StageName,&quot;Commit&quot;),
ISPICKVAL(StageName,&quot;PO received&quot;),
ISPICKVAL(StageName,&quot;Closed Won&quot;),
ISPICKVAL(StageName,&quot;Closed Lost&quot;)))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opp closed lost Partner notification</fullName>
        <actions>
            <name>Opp_Closed_Lost</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>AND(
TEXT(StageName)=&quot;Closed Lost&quot;,
OR(
TEXT(Type)=&quot;New&quot;,
TEXT(Type)=&quot;Upsell&quot;,
TEXT(Type)=&quot;Subscription Renewal&quot;))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opp stage at creation</fullName>
        <actions>
            <name>Update_stage_at_opp_creation</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Records the opportunity stage at the time the opportunity record is created</description>
        <formula>$User.IsActive</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Opp wfr%2Fea 1%2E1%2Ea - Opp changes EMEA</fullName>
        <actions>
            <name>Opp_stage_changes_alert_Ops_Team</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_Z_s_to_Email_Update_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Send notification email when opportunity is modified</description>
        <formula>AND( 
Account.Name&lt;&gt;&quot;Rotondi Masonry&quot;, 
Owner_Team_Group_Buckets__c&lt;&gt;&quot;US Enterprise&quot;,
Owner_Team_Group_Buckets__c&lt;&gt;&quot;US Velocity&quot;,
NOT(ISPICKVAL(Type,&quot;Maintenance Renewal&quot;)),
RIGHT(Email_Update_Stamp__c,3)&lt;&gt;&quot;ZZZ&quot;, 

OR( 
AND( 
ISNEW(), 
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;), 
ISPICKVAL(StageName,&quot;Closed Lost&quot;))), 
AND( 
ISCHANGED(StageName), 
ISPICKVAL(StageName,&quot;Identify&quot;), 
OR(ISPICKVAL(PRIORVALUE(StageName),&quot;Pipeline&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Upside&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Strong Upside&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Commit&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;PO received&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Closed Won&quot;))), 
AND( 
OR(ISCHANGED(StageName), 
ISCHANGED(Probability), 
ISCHANGED(Amount), 
ISCHANGED(CloseDate)), 
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;), 
ISPICKVAL(StageName,&quot;Closed Lost&quot;)))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opp wfr%2Fea 1%2E1%2Eb - Opp changes EMEA Enterprise</fullName>
        <actions>
            <name>Opp_stage_change_alert_EMEA_Enterprise</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_Z_s_to_Email_Update_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Send notification email when opportunity is modified</description>
        <formula>AND( 
   OR(ISPICKVAL(Owner_Team__c,&quot;Global Accounts International&quot;),
      ISPICKVAL(Owner_Team__c,&quot;EMEA Commercial France&quot;),
      ISPICKVAL(Owner_Team__c,&quot;EMEA Commercial UK&quot;),
      ISPICKVAL(Owner_Team__c,&quot;EMEA Enterprise France&quot;),
      ISPICKVAL(Owner_Team__c,&quot;EMEA Enterprise UK&quot;),
      ISPICKVAL(Owner_Team__c,&quot;EMEA Enterprise&quot;), 
      ISPICKVAL(Owner_Team__c,&quot;EMEA Enterprise SDR&quot;)),
   Account.Name&lt;&gt;&quot;Rotondi Masonry&quot;, 
   RIGHT(Email_Update_Stamp__c,3)&lt;&gt;&quot;ZZZ&quot;, 

OR( 
AND( 
ISNEW(), 
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;), 
ISPICKVAL(StageName,&quot;Closed Lost&quot;))), 
AND( 
ISCHANGED(StageName), 
ISPICKVAL(StageName,&quot;Identify&quot;), 
OR(ISPICKVAL(PRIORVALUE(StageName),&quot;Pipeline&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Upside&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Strong Upside&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Commit&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;PO received&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Closed Won&quot;))), 
AND( 
OR(ISCHANGED(StageName), 
ISCHANGED(Probability), 
ISCHANGED(Amount), 
ISCHANGED(CloseDate)), 
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;), 
ISPICKVAL(StageName,&quot;Closed Lost&quot;)))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opp wfr%2Fea 1%2E1%2Ec - Opp changes US Enterprise</fullName>
        <actions>
            <name>Opp_stage_change_alert_US_Enterprise_2</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_Z_s_to_Email_Update_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Send notification email when opportunity is modified</description>
        <formula>AND( 
Account.Name&lt;&gt;&quot;Rotondi Masonry&quot;,
Owner_Team_Group_Buckets__c=&quot;US Enterprise&quot;,
/*NOT(CONTAINS($UserRole.Name,&quot;Enterprise East&quot;)),*/
/*NOT(CONTAINS($UserRole.Name,&quot;Enterprise West&quot;)),*/
NOT(ISPICKVAL(Type,&quot;Maintenance Renewal&quot;)),
RIGHT(Email_Update_Stamp__c,3)&lt;&gt;&quot;ZZZ&quot;, 

OR( 
AND( 
ISNEW(), 
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;), 
ISPICKVAL(StageName,&quot;Closed Lost&quot;))), 
AND( 
ISCHANGED(StageName), 
ISPICKVAL(StageName,&quot;Identify&quot;), 
OR(ISPICKVAL(PRIORVALUE(StageName),&quot;Pipeline&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Upside&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Strong Upside&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Commit&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;PO received&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Closed Won&quot;))), 
AND( 
OR(ISCHANGED(StageName), 
ISCHANGED(Probability), 
ISCHANGED(Amount), 
ISCHANGED(CloseDate)), 
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;), 
ISPICKVAL(StageName,&quot;Closed Lost&quot;)))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opp wfr%2Fea 1%2E1%2Ed - Opp changes US Enterprise - East 1</fullName>
        <actions>
            <name>Opp_stage_change_alert_Enterprise_East</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_Z_s_to_Email_Update_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Send notification email when opportunity is modified</description>
        <formula>AND( 
Account.Name&lt;&gt;&quot;Rotondi Masonry&quot;,
TEXT(Owner_Team__c)=&quot;Enterprise East 1&quot;,
NOT(ISPICKVAL(Type,&quot;Maintenance Renewal&quot;)),
RIGHT(Email_Update_Stamp__c,3)&lt;&gt;&quot;ZZZ&quot;, 

OR( 
AND( 
ISNEW(), 
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;), 
ISPICKVAL(StageName,&quot;Closed Lost&quot;))), 
AND( 
ISCHANGED(StageName), 
ISPICKVAL(StageName,&quot;Identify&quot;), 
OR(ISPICKVAL(PRIORVALUE(StageName),&quot;Pipeline&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Upside&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Strong Upside&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Commit&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;PO received&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Closed Won&quot;))), 
AND( 
OR(ISCHANGED(StageName), 
ISCHANGED(Probability), 
ISCHANGED(Amount), 
ISCHANGED(CloseDate)), 
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;), 
ISPICKVAL(StageName,&quot;Closed Lost&quot;)))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opp wfr%2Fea 1%2E1%2Ee - Opp changes US Enterprise - East 2</fullName>
        <actions>
            <name>Opp_stage_change_alert_Tri_State</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_Z_s_to_Email_Update_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Send notification email when opportunity is modified</description>
        <formula>AND( 
Account.Name&lt;&gt;&quot;Rotondi Masonry&quot;,
TEXT(Owner_Team__c)=&quot;Enterprise East 2&quot;,
NOT(ISPICKVAL(Type,&quot;Maintenance Renewal&quot;)),
RIGHT(Email_Update_Stamp__c,3)&lt;&gt;&quot;ZZZ&quot;, 

OR( 
AND( 
ISNEW(), 
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;), 
ISPICKVAL(StageName,&quot;Closed Lost&quot;))), 
AND( 
ISCHANGED(StageName), 
ISPICKVAL(StageName,&quot;Identify&quot;), 
OR(ISPICKVAL(PRIORVALUE(StageName),&quot;Pipeline&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Upside&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Strong Upside&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Commit&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;PO received&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Closed Won&quot;))), 
AND( 
OR(ISCHANGED(StageName), 
ISCHANGED(Probability), 
ISCHANGED(Amount), 
ISCHANGED(CloseDate)), 
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;), 
ISPICKVAL(StageName,&quot;Closed Lost&quot;)))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opp wfr%2Fea 1%2E1%2Ef - Opp changes US Enterprise - East 3</fullName>
        <actions>
            <name>Opp_stage_change_alert_Enterprise_East_3</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_Z_s_to_Email_Update_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Send notification email when opportunity is modified</description>
        <formula>AND( 
Account.Name&lt;&gt;&quot;Rotondi Masonry&quot;,
TEXT(Owner_Team__c)=&quot;Enterprise East 3&quot;,
NOT(ISPICKVAL(Type,&quot;Maintenance Renewal&quot;)),
RIGHT(Email_Update_Stamp__c,3)&lt;&gt;&quot;ZZZ&quot;, 

OR( 
AND( 
ISNEW(), 
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;), 
ISPICKVAL(StageName,&quot;Closed Lost&quot;))), 
AND( 
ISCHANGED(StageName), 
ISPICKVAL(StageName,&quot;Identify&quot;), 
OR(ISPICKVAL(PRIORVALUE(StageName),&quot;Pipeline&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Upside&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Strong Upside&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Commit&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;PO received&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Closed Won&quot;))), 
AND( 
OR(ISCHANGED(StageName), 
ISCHANGED(Probability), 
ISCHANGED(Amount), 
ISCHANGED(CloseDate)), 
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;), 
ISPICKVAL(StageName,&quot;Closed Lost&quot;)))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opp wfr%2Fea 1%2E1%2Eg - Opp changes Enterprise East</fullName>
        <actions>
            <name>Opp_stage_change_alert_East_Enterprise</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_Z_s_to_Email_Update_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Send notification email when opportunity is modified</description>
        <formula>AND(
OR(
ISPICKVAL(Owner_Team__c,&quot;Enterprise East&quot;)
),
Account.Name&lt;&gt;&quot;Rotondi Masonry&quot;,
RIGHT(Email_Update_Stamp__c,3)&lt;&gt;&quot;ZZZ&quot;,

OR(
AND( 
ISNEW(), 
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;), 
ISPICKVAL(StageName,&quot;Closed Lost&quot;))), 
AND(
ISCHANGED(StageName),
ISPICKVAL(StageName,&quot;Identify&quot;),
OR(ISPICKVAL(PRIORVALUE(StageName),&quot;Pipeline&quot;),
ISPICKVAL(PRIORVALUE(StageName),&quot;Upside&quot;),
ISPICKVAL(PRIORVALUE(StageName),&quot;Strong Upside&quot;),
ISPICKVAL(PRIORVALUE(StageName),&quot;Commit&quot;),
ISPICKVAL(PRIORVALUE(StageName),&quot;PO received&quot;),
ISPICKVAL(PRIORVALUE(StageName),&quot;Closed Won&quot;))),
AND(
OR(ISCHANGED(StageName),
ISCHANGED(Probability),
ISCHANGED(Amount),
ISCHANGED(CloseDate)),
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;),
ISPICKVAL(StageName,&quot;Upside&quot;),
ISPICKVAL(StageName,&quot;Strong Upside&quot;),
ISPICKVAL(StageName,&quot;Commit&quot;),
ISPICKVAL(StageName,&quot;PO received&quot;),
ISPICKVAL(StageName,&quot;Closed Won&quot;),
ISPICKVAL(StageName,&quot;Closed Lost&quot;)))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opp wfr%2Fea 1%2E1%2Eh - Opp changes US Enterprise - West 1</fullName>
        <actions>
            <name>Opp_stage_change_alert_Enterprise_PacNW</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_Z_s_to_Email_Update_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Send notification email when opportunity is modified</description>
        <formula>AND( 
Account.Name&lt;&gt;&quot;Rotondi Masonry&quot;,
TEXT(Owner_Team__c)=&quot;Enterprise West 1&quot;,
NOT(ISPICKVAL(Type,&quot;Maintenance Renewal&quot;)),
RIGHT(Email_Update_Stamp__c,3)&lt;&gt;&quot;ZZZ&quot;, 

OR( 
AND( 
ISNEW(), 
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;), 
ISPICKVAL(StageName,&quot;Closed Lost&quot;))), 
AND( 
ISCHANGED(StageName), 
ISPICKVAL(StageName,&quot;Identify&quot;), 
OR(ISPICKVAL(PRIORVALUE(StageName),&quot;Pipeline&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Upside&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Strong Upside&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Commit&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;PO received&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Closed Won&quot;))), 
AND( 
OR(ISCHANGED(StageName), 
ISCHANGED(Probability), 
ISCHANGED(Amount), 
ISCHANGED(CloseDate)), 
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;), 
ISPICKVAL(StageName,&quot;Closed Lost&quot;)))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opp wfr%2Fea 1%2E1%2Ei - Opp changes US Enterprise - West 2</fullName>
        <actions>
            <name>Opp_stage_change_alert_Enterprise_Southwest</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_Z_s_to_Email_Update_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Send notification email when opportunity is modified</description>
        <formula>AND( 
Account.Name&lt;&gt;&quot;Rotondi Masonry&quot;,
TEXT(Owner_Team__c)=&quot;Enterprise West 2&quot;,
NOT(ISPICKVAL(Type,&quot;Maintenance Renewal&quot;)),
RIGHT(Email_Update_Stamp__c,3)&lt;&gt;&quot;ZZZ&quot;, 

OR( 
AND( 
ISNEW(), 
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;), 
ISPICKVAL(StageName,&quot;Closed Lost&quot;))), 
AND( 
ISCHANGED(StageName), 
ISPICKVAL(StageName,&quot;Identify&quot;), 
OR(ISPICKVAL(PRIORVALUE(StageName),&quot;Pipeline&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Upside&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Strong Upside&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Commit&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;PO received&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Closed Won&quot;))), 
AND( 
OR(ISCHANGED(StageName), 
ISCHANGED(Probability), 
ISCHANGED(Amount), 
ISCHANGED(CloseDate)), 
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;), 
ISPICKVAL(StageName,&quot;Closed Lost&quot;)))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opp wfr%2Fea 1%2E1%2Ej - Opp changes US Commercial</fullName>
        <actions>
            <name>Opp_stage_change_alert_Velocity</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_Z_s_to_Email_Update_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Send notification email when opportunity is modified</description>
        <formula>AND( 
Account.Name&lt;&gt;&quot;Rotondi Masonry&quot;,
Owner_Team_Group_Buckets__c=&quot;US Velocity&quot;,
NOT(ISPICKVAL(Type,&quot;Maintenance Renewal&quot;)),
RIGHT(Email_Update_Stamp__c,3)&lt;&gt;&quot;ZZZ&quot;, 

OR( 
AND( 
ISNEW(), 
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;), 
ISPICKVAL(StageName,&quot;Closed Lost&quot;))), 
AND( 
ISCHANGED(StageName), 
ISPICKVAL(StageName,&quot;Identify&quot;), 
OR(ISPICKVAL(PRIORVALUE(StageName),&quot;Pipeline&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Upside&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Strong Upside&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Commit&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;PO received&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Closed Won&quot;))), 
AND( 
OR(ISCHANGED(StageName), 
ISCHANGED(Probability), 
ISCHANGED(Amount), 
ISCHANGED(CloseDate)), 
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;), 
ISPICKVAL(StageName,&quot;Closed Lost&quot;)))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opp wfr%2Fea 1%2E1%2Ek - Opp changes Maintenance Renewals</fullName>
        <actions>
            <name>Opp_stage_change_alert_Maintenance_Renewal</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_Z_s_to_Email_Update_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Send notification email when opportunity is modified</description>
        <formula>AND( 
Account.Name&lt;&gt;&quot;Rotondi Masonry&quot;,
ISPICKVAL(Type,&quot;Maintenance Renewal&quot;),
RIGHT(Email_Update_Stamp__c,3)&lt;&gt;&quot;ZZZ&quot;, 

OR( 
AND( 
ISNEW(), 
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;), 
ISPICKVAL(StageName,&quot;Closed Lost&quot;))), 
AND( 
ISCHANGED(StageName), 
ISPICKVAL(StageName,&quot;Identify&quot;), 
OR(ISPICKVAL(PRIORVALUE(StageName),&quot;Pipeline&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Upside&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Strong Upside&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Commit&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;PO received&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Closed Won&quot;))), 
AND( 
OR(ISCHANGED(StageName), 
ISCHANGED(Probability), 
ISCHANGED(Amount),
ISCHANGED(Max_Potential_Opportunity_Amount__c),  
ISCHANGED(CloseDate)), 
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;), 
ISPICKVAL(StageName,&quot;Closed Lost&quot;)))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opp wfr%2Fea 1%2E1%2El - Opp changes Exec Team Alert</fullName>
        <actions>
            <name>Opp_stage_change_alert_for_Exec_Team</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Send notification email when opportunity is modified</description>
        <formula>AND( 
Account.Name&lt;&gt;&quot;Rotondi Masonry&quot;, 
RIGHT(Email_Update_Stamp__c,3)&lt;&gt;&quot;ZZZ&quot;, 

OR( 
AND( 
ISNEW(), 
OR(
AND(ISPICKVAL(StageName,&quot;Upside&quot;),Amount &gt; 150000),
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;), 
ISPICKVAL(StageName,&quot;Closed Lost&quot;))), 
AND( 
ISCHANGED(StageName), 
ISPICKVAL(StageName,&quot;Identify&quot;), 
OR(ISPICKVAL(PRIORVALUE(StageName),&quot;Pipeline&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Upside&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Strong Upside&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Commit&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;PO received&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Closed Won&quot;))), 
AND( 
OR(ISCHANGED(StageName), 
ISCHANGED(Probability), 
ISCHANGED(Amount), 
ISCHANGED(CloseDate)), 
OR( 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;), 
ISPICKVAL(StageName,&quot;Closed Lost&quot;)))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opp wfr%2Fea 1%2E1%2Em - Opp changes Finance</fullName>
        <actions>
            <name>Opp_stage_change_alert_Finance</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_Z_s_to_Email_Update_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Send notification email when opportunity is modified</description>
        <formula>AND(
OR(ISPICKVAL(Owner_Team__c,&quot;Finance&quot;),ISPICKVAL(Owner_Team__c,&quot;Candy Time&quot;)),
Account.Name&lt;&gt;&quot;Rotondi Masonry&quot;,
RIGHT(Email_Update_Stamp__c,3)&lt;&gt;&quot;ZZZ&quot;,

OR(
AND( 
ISNEW(), 
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;), 
ISPICKVAL(StageName,&quot;Closed Lost&quot;))), 
AND(
ISCHANGED(StageName),
ISPICKVAL(StageName,&quot;Identify&quot;),
OR(ISPICKVAL(PRIORVALUE(StageName),&quot;Pipeline&quot;),
ISPICKVAL(PRIORVALUE(StageName),&quot;Upside&quot;),
ISPICKVAL(PRIORVALUE(StageName),&quot;Strong Upside&quot;),
ISPICKVAL(PRIORVALUE(StageName),&quot;Commit&quot;),
ISPICKVAL(PRIORVALUE(StageName),&quot;PO received&quot;),
ISPICKVAL(PRIORVALUE(StageName),&quot;Closed Won&quot;))),
AND(
OR(ISCHANGED(StageName),
ISCHANGED(Probability),
ISCHANGED(Amount),
ISCHANGED(CloseDate)),
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;),
ISPICKVAL(StageName,&quot;Upside&quot;),
ISPICKVAL(StageName,&quot;Strong Upside&quot;),
ISPICKVAL(StageName,&quot;Commit&quot;),
ISPICKVAL(StageName,&quot;PO received&quot;),
ISPICKVAL(StageName,&quot;Closed Won&quot;),
ISPICKVAL(StageName,&quot;Closed Lost&quot;)))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opp won %28for support team%29 - New and Upsell</fullName>
        <actions>
            <name>Alert_CX_Team_of_Closed_Won</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Creates task/email for support team when opportunity is Closed Won</description>
        <formula>AND(ISPICKVAL(StageName,&quot;Closed Won&quot;),NOT(ISPICKVAL(Type,&quot;Renewal&quot;)))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opp won %28for support team%29 - Renewal</fullName>
        <actions>
            <name>Opportunity_Won_excluding_Paige</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Sends email for support team when renewal is Closed Won</description>
        <formula>ISPICKVAL(StageName,&quot;Closed Won&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Creation</fullName>
        <active>false</active>
        <description>Sends email alert when opportunity is created</description>
        <formula>OR(ispickval(Type,&quot;New&quot;),ispickval(Type,&quot;Upsell&quot;))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Expiration Rule</fullName>
        <actions>
            <name>Registration_field_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>Registration_Expiration__c &lt;= TODAY()</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Expiration_reminder_email</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Opportunity.Registration_Expiration__c</offsetFromField>
            <timeLength>-10</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Populating Partner Account for Deal Reg</fullName>
        <active>false</active>
        <formula>NOT(ISBLANK(wi__Associated_Partner__c))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Reg Expiration</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Registration_Status_Stamp__c</field>
            <operation>equals</operation>
            <value>Approved</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>set_expiration_status_2</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>90</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Renewal Closed Lost notification</fullName>
        <actions>
            <name>Renewal_opp_lost</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Send notification email when renewal opportunity is Closed Lost</description>
        <formula>AND(CONTAINS(TEXT(Type),&quot;Renewal&quot;),
ISPICKVAL(StageName,&quot;Closed Lost&quot;))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Send opp ID email to BDR managers</fullName>
        <active>false</active>
        <formula>AND(
ISCHANGED(StageName),
ISPICKVAL(PRIORVALUE(StageName),&quot;Identify&quot;),
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;)),
CONTAINS(Identified_By_Role_Static__c,&quot;Business Development Rep&quot;),
NOT(CONTAINS(Identified_By_Role_Static__c,&quot;Key Account&quot;)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Send opp ID email to Central managers</fullName>
        <actions>
            <name>Pipeline_Add_for_Central</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>AND(
ISCHANGED(StageName),
ISPICKVAL(PRIORVALUE(StageName),&quot;Identify&quot;),
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;)),
OR(CONTAINS(Identified_By_Team_Static__c,&quot;SEC&quot;), CONTAINS(Identified_By_Team_Static__c,&quot;Beast Coast&quot;),CONTAINS(Identified_By_Team_Static__c,&quot;The Foundation&quot;)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Send opp ID email to East managers</fullName>
        <active>false</active>
        <formula>AND(
ISCHANGED(StageName),
ISPICKVAL(PRIORVALUE(StageName),&quot;Identify&quot;),
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;)),
OR(CONTAINS(Identified_By_Team_Static__c,&quot;Closers Club&quot;), CONTAINS(Identified_By_Team_Static__c,&quot;The Green Monsters&quot;),CONTAINS(Identified_By_Team_Static__c,&quot;Spartans&quot;)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Send opp ID email to West managers</fullName>
        <actions>
            <name>Pipeline_Add_for_West</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>AND(
ISCHANGED(StageName),
ISPICKVAL(PRIORVALUE(StageName),&quot;Identify&quot;),
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;)),
OR(CONTAINS(Identified_By_Team_Static__c,&quot;Peak Performers&quot;), CONTAINS(Identified_By_Team_Static__c,&quot;The Green Flash&quot;),CONTAINS(Identified_By_Team_Static__c,&quot;The Pack&quot;) ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Services Engagement Email Alert EMEA%2FAPAC</fullName>
        <actions>
            <name>Customer_Services_Coordination_Email_Alert_EMEA</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND(
Tech_Win_Established__c,
OR(CONTAINS(TEXT(Owner_Team__c),&quot;EMEA&quot;),
CONTAINS(TEXT(Owner_Team__c),&quot;Ganas iOS&quot;),
CONTAINS(TEXT(Owner_Team__c),&quot;APAC&quot;)),
OR(TEXT(Type)=&quot;New&quot;,TEXT(Type)=&quot;Upsell&quot;))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Services Engagement Email Alert LATAM</fullName>
        <actions>
            <name>Customer_Services_Coordination_Email_Alert_LATAM</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND(
Tech_Win_Established__c,
OR(
TEXT(Owner_Team__c)=&quot;Los Conquistadores&quot;,
TEXT(Owner_Team__c)=&quot;LATAM&quot;
),
OR(TEXT(Type)=&quot;New&quot;,TEXT(Type)=&quot;Upsell&quot;))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Services Engagement Email Alert US</fullName>
        <actions>
            <name>Customer_Services_Coordination_Email_Alert_US</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND(
Tech_Win_Established__c,
NOT(CONTAINS(TEXT(Owner_Team__c),&quot;EMEA&quot;)),
NOT(CONTAINS(TEXT(Owner_Team__c),&quot;Los Conquistadores&quot;)),
NOT(CONTAINS(TEXT(Owner_Team__c),&quot;Ganas iOS&quot;)),
OR(TEXT(Type)=&quot;New&quot;,TEXT(Type)=&quot;Upsell&quot;))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Default Cisco Royalty Status</fullName>
        <actions>
            <name>Set_Default_Cisco_Royalty_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Sets Cisco Royalty Status to default to &quot;Not Received&quot; when deal reaches PO Received.</description>
        <formula>AND(
OR(
ISNEW(),
ISCHANGED(StageName)
),
OR(
ISPICKVAL(StageName,&quot;PO Received&quot;),
ISPICKVAL(StageName,&quot;Closed Won&quot;)
),
ISPICKVAL(Cisco_Royalty_Status__c,&quot;&quot;),
Cisco_Opportunity__c
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Sales Stage to Agreement</fullName>
        <actions>
            <name>Set_Sales_Stage_to_Agreement</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>TEXT(StageName)=&quot;Strong Upside&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Sales Stage to Business Need</fullName>
        <actions>
            <name>Set_Sales_Stage_to_Business_Need</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>TEXT(StageName)=&quot;Identify&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Sales Stage to Close</fullName>
        <actions>
            <name>Set_Sales_Stage_to_Close</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>TEXT(StageName)=&quot;Commit&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Sales Stage to Closed Lost</fullName>
        <actions>
            <name>Set_Sales_Stage_to_Closed_Lost</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>TEXT(StageName)=&quot;Closed Lost&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Sales Stage to Closed Won</fullName>
        <actions>
            <name>Set_Sales_Stage_to_Closed_Won</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(TEXT(StageName)=&quot;Closed Won&quot;,TEXT(StageName)=&quot;PO Received&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Sales Stage to Proof of Value</fullName>
        <actions>
            <name>Set_Sales_Stage_to_Proof_of_Value</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>TEXT(StageName)=&quot;Upside&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Sales Stage to The Pact</fullName>
        <actions>
            <name>Set_Sales_Stage_to_The_Pact</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>TEXT(StageName)=&quot;Pipeline&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Sales Stage to Unqualified</fullName>
        <actions>
            <name>Set_Sales_Stage_to_Unqualified</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>TEXT(StageName)=&quot;Unqualified&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set booking date</fullName>
        <actions>
            <name>Set_booking_date_equal_to_close_date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(ISPICKVAL(StageName,&quot;PO received&quot;),ISPICKVAL(StageName,&quot;Renewal&quot;))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stage change</fullName>
        <actions>
            <name>Risk_Projection_50_EFJ_Field_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Risk_Projection_75_EFJ_Field_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Risk_Projection_90_EFJ_Field_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>TRUE</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stage change date</fullName>
        <actions>
            <name>Stage_change_date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(StageName)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stage or Close Date change date</fullName>
        <actions>
            <name>Stamp_Stage_Close_Date_Change_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>OR(ISCHANGED(StageName),ISCHANGED(CloseDate))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Account Owner</fullName>
        <active>false</active>
        <formula>TRUE</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Advocate and Blockers Last Updated</fullName>
        <actions>
            <name>Stamp_Advocates_and_Blockers_last_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(Our_Advocates_Blockers__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Agreement on Contract Terms %26 Close Last Updated</fullName>
        <actions>
            <name>Stamp_Agreement_on_Contract_Terms_Clos</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Agreement_on_Contract_Terms__c</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp BIP Completed Last Updated</fullName>
        <actions>
            <name>Stamp_BIP_Completed_Last_Updated</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>BIP_Completed__c</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Began Eval Last Updated</fullName>
        <actions>
            <name>Stamp_Began_Eval_Last_Updated</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Began_Eval__c</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp CX%2FCoE Introduced Last Updated</fullName>
        <actions>
            <name>Stamp_CX_CoE_Introduced_Last_Updated</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>CX_CoE_Introduced__c</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Cloud Partner Influencer Date</fullName>
        <actions>
            <name>Stamp_Cloud_Partner_Influencer_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Stamps the date the cloud partner influencer was first set on the opportunity.</description>
        <formula>AND(
NOT(ISBLANK(TEXT(Cloud_Partner_Influencer__c))),
OR(
ISNEW(),
AND(
ISCHANGED(Cloud_Partner_Influencer__c),
ISBLANK(TEXT(PRIORVALUE(Cloud_Partner_Influencer__c)))
)
)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Compelling Reason To Buy Now Last Updated</fullName>
        <active>false</active>
        <formula>Compelling_Reason_to_Buy_Now__c</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Core Change Date</fullName>
        <actions>
            <name>Stamp_Core_Change_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(of_Cores__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp DQ Alternatives %26 Status Quo Date</fullName>
        <actions>
            <name>Stamp_DQ_Alternatives_Status_Quo_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>Disqualified_Alternatives_Status_Quo__c</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Date of MSFT Approval Submission</fullName>
        <actions>
            <name>Stamp_Date_of_MSFT_Approval</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Status_MSFT__c</field>
            <operation>equals</operation>
            <value>Pending Approval - MSFT</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Date_Submitted_for_MSFT_Approval_MSFT__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>A capture of the Date of MSFT Approval Submission</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Date of MSFT Customer Approval Submission</fullName>
        <actions>
            <name>Stamp_Date_of_MSFT_Customer_Approval</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Status_MSFT__c</field>
            <operation>equals</operation>
            <value>Pending Approval - Customer</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Date_Submitted_for_Customer_Approval__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Stamp Date of MSFT Customer Approval Submission</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Deal Type Last Modified Fields</fullName>
        <actions>
            <name>Stamp_Deal_Type_Last_Modified_By</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Deal_Type_Last_Modified_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(Deal_Type__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Deployed in Customer Environment Date</fullName>
        <actions>
            <name>Stamp_Deployed_in_Customer_Environment</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Stamps date for Turbonomic Deployment in Customer Environment</description>
        <formula>AND(
OR(
ISNEW(),
ISCHANGED(Deployed_in_Customer_Environment__c)
),
Deployed_in_Customer_Environment__c=true
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Email Update Stamp</fullName>
        <actions>
            <name>Email_Update_Stamp_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>For opp updates (so we can track prior stage).  All Prior Stage Stamps should have &quot;ZZZ&quot; as the three rightmost letters at all times (the Z&apos;s are added by the opp update WF rules).</description>
        <formula>AND(
Team_Match_for_Email_Alerts__c=&quot;Match&quot;, 

OR( 
AND( 
ISNEW(), 
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;), 
ISPICKVAL(StageName,&quot;Closed Lost&quot;))), 
AND( 
ISCHANGED(StageName), 
ISPICKVAL(StageName,&quot;Identify&quot;), 
OR(ISPICKVAL(PRIORVALUE(StageName),&quot;Pipeline&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Upside&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Strong Upside&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Commit&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;PO received&quot;), 
ISPICKVAL(PRIORVALUE(StageName),&quot;Closed Won&quot;))), 
AND( 
OR(ISCHANGED(StageName), 
ISCHANGED(Probability), 
ISCHANGED(Amount), 
ISCHANGED(CloseDate)), 
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;), 
ISPICKVAL(StageName,&quot;Upside&quot;), 
ISPICKVAL(StageName,&quot;Strong Upside&quot;), 
ISPICKVAL(StageName,&quot;Commit&quot;), 
ISPICKVAL(StageName,&quot;PO received&quot;), 
ISPICKVAL(StageName,&quot;Closed Won&quot;), 
ISPICKVAL(StageName,&quot;Closed Lost&quot;)))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Engagement with Cisco Rep on Deployment</fullName>
        <actions>
            <name>Stamp_Engaged_with_Cisco_Rep_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Stamps date for Engagement with Cisco Rep on Deployment</description>
        <formula>AND(
OR(
ISNEW(),
ISCHANGED(Engaged_with_Cisco_Rep_on_Deployment__c)
),
Engaged_with_Cisco_Rep_on_Deployment__c=true
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Eval Completion Date</fullName>
        <actions>
            <name>Stamp_Eval_Completion_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Eval_Period_Concluded__c &amp;&amp; ISCHANGED(Eval_Period_Concluded__c) &amp;&amp; ISBLANK(Eval_Completion_Date__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Eval Criteria Last Documented</fullName>
        <actions>
            <name>Stamp_Eval_Criteria_Last_Documented</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Exec_Sponsors_Eval_Criteria_Documented__c</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Eval Period Concluded Last Updated</fullName>
        <actions>
            <name>Stamp_Eval_Period_Concluded_Last_Updated</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Eval_Period_Concluded__c</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Eval Start Date</fullName>
        <actions>
            <name>Stamp_Eval_Start_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Began_Eval__c &amp;&amp; ISCHANGED(Began_Eval__c) &amp;&amp; ISBLANK(Eval_Start_Date__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Exec Buy In on BIP Last Updated</fullName>
        <actions>
            <name>Stamp_Exec_Buy_In_On_BIP_Last_Updated</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Exec_Buy_In_on_BIP__c</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Exec Sponsor Need %26 Timing</fullName>
        <actions>
            <name>Stamp_Exec_Sponsor_Need_Timing_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Exec_Sponsor_Need_Timing__c</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp First Close Date on Account</fullName>
        <actions>
            <name>Update_First_Close_Date_on_Account</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(ISPICKVAL(Type,&quot;New&quot;),
    ISPICKVAL(StageName,&quot;Closed Won&quot;)
    )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Funding Approved Last Updated</fullName>
        <actions>
            <name>Stamp_Funding_Approved_Last_Updated</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Funding_Approved__c</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Identified By Role and Team</fullName>
        <actions>
            <name>Update_Identified_By_Role</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Identified_By_Team</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(ISNEW(),ISCHANGED(Identified_By__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Joint Post-Sales Call Completed Date</fullName>
        <actions>
            <name>Stamp_Joint_Post_Sales_Call_Completed_Da</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Stamps date for Cisco Joint Post-Sales Call with Customer</description>
        <formula>AND(
OR(
ISNEW(),
ISCHANGED(Completed_Joint_Post_Sales_Call_w_Cust__c)
),
Completed_Joint_Post_Sales_Call_w_Cust__c=true
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Last Expected License Value Date</fullName>
        <actions>
            <name>Update_LELVUD</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(Expected_License_Value__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Last Highest Level Engaged Date</fullName>
        <actions>
            <name>Stamp_Last_Highest_Level_Engaged</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(Highest_Level_Last_Engaged_Date__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Manager Email</fullName>
        <actions>
            <name>Stamp_Manager_s_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(
ISCHANGED(OwnerId),
ISBLANK(Manager_Email__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Max Deal Amount on Maintenance Loss</fullName>
        <actions>
            <name>Clear_Max_Deal_Amount</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
OR(TEXT(StageName)=&quot;Closed Lost&quot;,TEXT(StageName)=&quot;Unqualified&quot;),
TEXT(Type)=&quot;Maintenance Renewal&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Max Deal Amount on Maintenance Win</fullName>
        <actions>
            <name>Stamp_Max_Deal_Amount_on_Maintenance_Win</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
OR(TEXT(StageName)=&quot;PO Received&quot;,TEXT(StageName)=&quot;Closed Won&quot;),
TEXT(Type)=&quot;Maintenance Renewal&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Most Recent Outcome%2FChange Modified</fullName>
        <actions>
            <name>Stamp_Most_Recent_Outcome_Change_Modifie</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(Most_Recent_Outcome_Change__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Move to Strong Upside</fullName>
        <actions>
            <name>Stamp_Move_to_Strong_Upside_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
TEXT(Type)&lt;&gt;&quot;Maintenance Renewal&quot;,
TEXT(Type)&lt;&gt;&quot;Forecast&quot;,
TEXT(Type)&lt;&gt;&quot;Quota&quot;,
ISBLANK(Move_to_Strong_Upside_Date__c),
OR(
TEXT(StageName)=&quot;Strong Upside&quot;,
TEXT(StageName)=&quot;Commit&quot;,
TEXT(StageName)=&quot;PO Received&quot;,
TEXT(StageName)=&quot;Closed Won&quot;))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Move to Upside</fullName>
        <actions>
            <name>Stamp_Move_to_Upside</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
   TEXT(Type)&lt;&gt;&quot;Maintenance Renewal&quot;,
   TEXT(Type)&lt;&gt;&quot;Forecast&quot;,
   TEXT(Type)&lt;&gt;&quot;Quota&quot;,
  ISBLANK(Move_to_Upside_Date__c),
   OR(
      TEXT(StageName)=&quot;Upside&quot;,
      TEXT(StageName)=&quot;Strong Upside&quot;,
      TEXT(StageName)=&quot;Commit&quot;,
      TEXT(StageName)=&quot;PO Received&quot;,
      TEXT(StageName)=&quot;Closed Won&quot;)
    )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Opportunity ID Date</fullName>
        <actions>
            <name>Opp_start_date_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Stamp the date when an opportunity moves to Pipeline or above</description>
        <formula>OR(

AND(
ISBLANK(Opportunity_ID_Date__c),
OR(ISPICKVAL(StageName,&quot;Pipeline&quot;),
ISPICKVAL(StageName,&quot;Upside&quot;),
ISPICKVAL(StageName,&quot;Strong Upside&quot;),
ISPICKVAL(StageName,&quot;Commit&quot;),
ISPICKVAL(StageName,&quot;PO received&quot;),
ISPICKVAL(StageName,&quot;Closed Won&quot;)),
TEXT(Type)&lt;&gt;&quot;Quota&quot;,
TEXT(Type)&lt;&gt;&quot;Maintenance Renewal&quot;),

AND(ISNEW(),NOT(ISBLANK(Opportunity_ID_Date__c))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp PBOs %26 Metrics Last Updated</fullName>
        <actions>
            <name>Stamp_PBOs_Metrics_Last_Updated</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(
ISCHANGED(Expected_PBOs_Metrics__c),
AND(
ISNEW(),Expected_PBOs_Metrics__c&lt;&gt;&quot;&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp PO received date and time</fullName>
        <actions>
            <name>Fill_of_Licensed_Cores_if_New_Deal</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Fill_of_Licensed_Sockets_if_New_Deal</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_PO_received_date_tim</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>To allow for accurate customer counts</description>
        <formula>OR(

AND(ISCHANGED(StageName),ISPICKVAL(StageName,&quot;PO received&quot;), NOT(ISPICKVAL(PRIORVALUE(StageName),&quot;Closed Won&quot;))),

AND(ISCHANGED(StageName),ISPICKVAL(StageName,&quot;Closed Won&quot;), ISBLANK(PO_Received_Date_Time__c)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp POV Planning Date</fullName>
        <actions>
            <name>Stamp_POV_Planning_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>POV_Planning__c &amp;&amp; ISCHANGED(POV_Planning__c) &amp;&amp; ISBLANK(POV_Planning_Date__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Partner Committed Date</fullName>
        <actions>
            <name>Stamp_Partner_Committed_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
RecordType.DeveloperName=&quot;Partner Onboarding Opportunity&quot;,
Partner_Agreement_Attached__c=TRUE,
OR(TEXT(StageName)=&quot;Upside&quot;,TEXT(StageName)=&quot;Fully Onboarded&quot;)
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Quote %26 Contract In Place Last Updated</fullName>
        <actions>
            <name>Stamp_Quote_Contract_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>Quote_and_Contract_Vehicle_in_Place__c</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Reason for Change Last Modified Date</fullName>
        <actions>
            <name>Stamp_Reason_For_Change_Last_Modified</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(Reason_for_Change__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Renewal Due Amount</fullName>
        <actions>
            <name>Stamp_Renewal_Due_Amount</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
TEXT(Type)=&quot;Maintenance Renewal&quot;,
NOT(ISBLANK(Amount)))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Socket Change Date</fullName>
        <actions>
            <name>Stamp_Socket_Update_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(of_CPU_Sockets__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Steps To Close Last Updated</fullName>
        <actions>
            <name>Stamp_Steps_to_Close_Last_Updated</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(Steps_to_Close__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Tech Need for Perf%2FCap Mgmt SW Last Updated</fullName>
        <actions>
            <name>Stamp_Tech_Need_for_Perf_Cap_Mgmt_SW_Las</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>Tech_Need_for_Perf_Cap_Mgmt_SW_Defined__c</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Tech Win Established Last Updated</fullName>
        <actions>
            <name>Stamp_Tech_Win_Established_Last_Updated</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>Tech_Win_Established__c</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp VM Update Date</fullName>
        <actions>
            <name>VM_Update_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(of_Virtual_Machines__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp VMT score change date</fullName>
        <actions>
            <name>Stamp_VMT_score_change_date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(
AND(ISNEW(),VMT_Opportunity_Score__c&gt;0),
PRIORVALUE(VMT_Opportunity_Score__c)&lt;&gt;VMT_Opportunity_Score__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Warm Account on Opp Create</fullName>
        <actions>
            <name>Stamp_Warm_Account</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Stamp the Warm Account field at Opportunity creation</description>
        <formula>Account.Warm_Account__c</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Stamp customer deal structure as Channel</fullName>
        <actions>
            <name>Stamp_customer_deal_structure_as_Channel</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
TEXT(Type)&lt;&gt;&quot;Maintenance Renewal&quot;,
TEXT(Deal_structure__c)=&quot;Channel&quot;,
OR(
AND(ISCHANGED(StageName),TEXT(StageName)=&quot;Closed Won&quot;),
AND(TEXT(StageName)=&quot;Closed Won&quot;,ISCHANGED(Deal_structure__c))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp customer deal structure as Direct</fullName>
        <actions>
            <name>Stamp_customer_deal_structure_as_Direct</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
TEXT(Type)&lt;&gt;&quot;Maintenance Renewal&quot;,
TEXT(Deal_structure__c)=&quot;Direct&quot;,
TEXT(Account.Customer_Deal_Structure__c)&lt;&gt;&quot;Channel&quot;,
OR(
AND(ISCHANGED(StageName),TEXT(StageName)=&quot;Closed Won&quot;),
AND(TEXT(StageName)=&quot;Closed Won&quot;,ISCHANGED(Deal_structure__c))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp highest stage reached</fullName>
        <actions>
            <name>Update_highest_stage_reached</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Fill in Highest Stage Reached field</description>
        <formula>OR(ISNEW(),ISCHANGED(StageName))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp opp lost%2Funqual date</fullName>
        <actions>
            <name>Clear_Forecast_Opportunity</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Opp_lost_unqual_date_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Stamp the date when an opportunity moves to Closed Lost or Unqualified</description>
        <formula>OR(ISPICKVAL(StageName,&quot;Closed Lost&quot;),ISPICKVAL(StageName,&quot;Unqualified&quot;))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Tech Win Workflow</fullName>
        <actions>
            <name>Stamp_Eval_Period_Concluded</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>Tech_Win_Established__c &amp;&amp; ISCHANGED(Tech_Win_Established__c) &amp;&amp; !Eval_Period_Concluded__c</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update In Quarter VP Forecast - Closed Won</fullName>
        <actions>
            <name>Update_In_Quarter_VP_Forecast_Closed_W</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Update In Quarter VP Forecast to &quot;Closed Won&quot; if Opportunity is PO Received or Closed Won</description>
        <formula>AND(
NOT(ISPICKVAL(In_Quarter_VP_Forecast__c,&quot;Closed Won&quot;)),
OR(
ISCHANGED(StageName),
ISNEW()),
OR(
ISPICKVAL(StageName,&quot;PO Received&quot;),
ISPICKVAL(StageName,&quot;Closed Won&quot;)
)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Marketing Attribution</fullName>
        <active>false</active>
        <description>No actions attached</description>
        <formula>AND(
INCLUDES(Identified_Projects_Problems__c,&quot;VDI Rollout&quot;),
NOT(INCLUDES(PRIORVALUE(Identified_Projects_Problems__c),&quot;VDI Rollout&quot;)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Next Steps Last Updated</fullName>
        <actions>
            <name>Update_Next_Steps_Last_Updated</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>Next_Steps__c &lt;&gt; PRIORVALUE(Next_Steps__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update VDI Marketing Attribution</fullName>
        <actions>
            <name>Update_Marketing_Attribution</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(
INCLUDES(Identified_Projects_Problems__c,&quot;VDI Rollout&quot;),
NOT(INCLUDES(PRIORVALUE(Identified_Projects_Problems__c),&quot;VDI Rollout&quot;)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <tasks>
        <fullName>Follow_up_on_Closed_Lost_opportunity</fullName>
        <assignedToType>accountOwner</assignedToType>
        <description>This opportunity was Closed Lost a few months ago.  Please check in with the account on or around the task due date.</description>
        <dueDateOffset>120</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Follow up on Closed Lost opportunity</subject>
    </tasks>
</Workflow>
