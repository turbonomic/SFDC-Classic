<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Alert_Channel_Team_of_New_Registration</fullName>
        <description>Alert Channel Team of New Registration</description>
        <protected>false</protected>
        <recipients>
            <recipient>Director_of_Channels</recipient>
            <type>roleSubordinatesInternal</type>
        </recipients>
        <recipients>
            <recipient>luis.dasilva@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Registration_Creation_Alert</template>
    </alerts>
    <alerts>
        <fullName>Alert_Registration_Booking</fullName>
        <description>Alert Registration Booking</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_15_Day_Expiration_Notice</fullName>
        <description>Channel Registration 15 Day Expiration Notice</description>
        <protected>false</protected>
        <recipients>
            <recipient>Director_of_Channels</recipient>
            <type>roleSubordinatesInternal</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>unfiled$public/Channel_Registration_15_day_Expiration_Notice</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Expiration_Notice</fullName>
        <description>Channel Registration Expiration Notice</description>
        <protected>false</protected>
        <recipients>
            <recipient>Director_of_Channels</recipient>
            <type>roleSubordinatesInternal</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>unfiled$public/Channel_Registration_Expiration_Notice</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Approval_Email_BC</fullName>
        <description>Channel Registration Sales Approval Email BC</description>
        <protected>false</protected>
        <recipients>
            <recipient>Director_of_Channels</recipient>
            <type>roleSubordinatesInternal</type>
        </recipients>
        <recipients>
            <recipient>steve.corndell@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Approval_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Approval_Email_BnC</fullName>
        <description>Channel Registration Sales Approval Email BnC</description>
        <protected>false</protected>
        <recipients>
            <recipient>Director_of_Channels</recipient>
            <type>roleSubordinatesInternal</type>
        </recipients>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jake.chinery@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>perry.forbes@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Approval_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Approval_Email_CC</fullName>
        <description>Channel Registration Sales Approval Email CC</description>
        <protected>false</protected>
        <recipients>
            <recipient>Director_of_Channels</recipient>
            <type>roleSubordinatesInternal</type>
        </recipients>
        <recipients>
            <recipient>cody.carlson@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Approval_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Approval_Email_CCorporate</fullName>
        <description>Channel Registration Sales Approval Email CCorporate</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>emilio.siman@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jeff.irvin@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Approval_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Approval_Email_ECorporate</fullName>
        <description>Channel Registration Sales Approval Email ECorporate</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>yotam.yemini@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Approval_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Approval_Email_EU</fullName>
        <description>Channel Registration Sales Approval Email EU</description>
        <protected>false</protected>
        <recipients>
            <recipient>Director_of_Channels</recipient>
            <type>roleSubordinatesInternal</type>
        </recipients>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>will.blench@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Approval_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Approval_Email_East</fullName>
        <description>Channel Registration Sales Approval Email East</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>cody.carlson@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jeff.irvin@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Approval_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Approval_Email_Ent</fullName>
        <description>Channel Registration Sales Approval Email Ent East</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dave.kranowitz@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jr.butler@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Approval_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Approval_Email_Ent_Central</fullName>
        <description>Channel Registration Sales Approval Email Ent Central</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>brian.polick@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>danny.luong@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dave.kranowitz@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jon.leiter@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>marty.rauchwerger@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Approval_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Approval_Email_Ent_East_3</fullName>
        <description>Channel Registration Sales Approval Email Ent East 3</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dave.kranowitz@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>matt.nolan@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Approval_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Approval_Email_Ent_East_Tri_State</fullName>
        <description>Channel Registration Sales Approval Email Ent East 2</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dave.kranowitz@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>richard.balch@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Approval_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Approval_Email_Ent_South_East</fullName>
        <description>Channel Registration Sales Approval Email Ent South East</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>brian.polick@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dave.kranowitz@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>steve.corndell@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Approval_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Approval_Email_Ent_West</fullName>
        <description>Channel Registration Sales Approval Email Ent West</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>brock.alston@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dave.kranowitz@vmturbo.com</recipient>
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
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Approval_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Approval_Email_GF</fullName>
        <description>Channel Registration Sales Approval Email GF</description>
        <protected>false</protected>
        <recipients>
            <recipient>Director_of_Channels</recipient>
            <type>roleSubordinatesInternal</type>
        </recipients>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>grant.hornung@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>matt.obrien@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Approval_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Approval_Email_OCorporate</fullName>
        <description>Channel Registration Sales Approval Email OCorporate</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>brock.alston@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dave.kranowitz@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>judi.feeley@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>oved.lourie@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>randy.bartlewski@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Approval_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Approval_Email_SEC</fullName>
        <description>Channel Registration Sales Approval Email SEC</description>
        <protected>false</protected>
        <recipients>
            <recipient>Director_of_Channels</recipient>
            <type>roleSubordinatesInternal</type>
        </recipients>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>emilio.siman@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>steve.corndell@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Approval_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Approval_Email_TK</fullName>
        <description>Channel Registration Sales Approval Email TK</description>
        <protected>false</protected>
        <recipients>
            <recipient>Director_of_Channels</recipient>
            <type>roleSubordinatesInternal</type>
        </recipients>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>neil.creahan@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>steve.corndell@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Approval_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Approval_Email_WCorporate</fullName>
        <description>Channel Registration Sales Approval Email WCorporate</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>gerry.sengendo@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>grant.hornung@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>susie.custer@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Approval_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Approval_Email_WD</fullName>
        <description>Channel Registration Sales Approval Email WD</description>
        <protected>false</protected>
        <recipients>
            <recipient>andrew.bohac@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Approval_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Approval_Email_WW</fullName>
        <description>Channel Registration Sales Approval Email WW</description>
        <protected>false</protected>
        <recipients>
            <recipient>Director_of_Channels</recipient>
            <type>roleSubordinatesInternal</type>
        </recipients>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kevin.frechette@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>matt.obrien@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Approval_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Approve_Email_GM</fullName>
        <description>Channel Registration Sales Approve Email GM</description>
        <protected>false</protected>
        <recipients>
            <recipient>Director_of_Channels</recipient>
            <type>roleSubordinatesInternal</type>
        </recipients>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jr.butler@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>yotam.yemini@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Approval_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Approved_Email_Alert</fullName>
        <description>Channel Registration Sales Approved Email Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>Director_of_Channels</recipient>
            <type>roleSubordinatesInternal</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Approved_Alert_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Denied_Email</fullName>
        <description>Channel Registration Sales Denied Email</description>
        <protected>false</protected>
        <recipients>
            <recipient>Director_of_Channels</recipient>
            <type>roleSubordinatesInternal</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Denied_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Denied_Email_Oved</fullName>
        <description>Channel Registration Sales Denied Email Oved</description>
        <protected>false</protected>
        <recipients>
            <recipient>dave.kranowitz@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>oved.lourie@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>randy.bartlewski@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Denied_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Approval_Email</fullName>
        <description>Channel Registration Sales Ops Approval Email</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>justin.chang@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Approval_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Approved_Email_BC</fullName>
        <description>Channel Registration Sales Ops Approved Email BC</description>
        <protected>false</protected>
        <recipients>
            <recipient>dan.dipalma@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>steve.corndell@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Approved_Alert_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Approved_Email_CC</fullName>
        <description>Channel Registration Sales Ops Approved Email CC</description>
        <protected>false</protected>
        <recipients>
            <recipient>cody.carlson@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>yotam.yemini@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Approved_Alert_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Approved_Email_CCorporate</fullName>
        <description>Channel Registration Sales Ops Approved Email CCorporate</description>
        <protected>false</protected>
        <recipients>
            <recipient>aj.ferrera@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
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
            <recipient>neil.creahan@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>steve.corndell@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Approved_Alert_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Approved_Email_ECorporate</fullName>
        <description>Channel Registration Sales Ops Approved Email ECorporate</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>yotam.yemini@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Approved_Alert_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Approved_Email_EMEA</fullName>
        <description>Channel Registration Sales Ops Approved Email EMEA</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>gerry.sengendo@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Approved_Alert_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Approved_Email_East</fullName>
        <description>Channel Registration Sales Ops Approved Email East</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>cody.carlson@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jr.butler@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>michael.iannotti@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tom.strachan@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Approved_Alert_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Approved_Email_Ent_Central</fullName>
        <description>Channel Registration Sales Ops Approved Email Ent Central</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dave.kranowitz@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Approved_Alert_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Approved_Email_Ent_East</fullName>
        <description>Channel Registration Sales Ops Approved Email Ent East</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dave.kranowitz@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jr.butler@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Approved_Alert_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Approved_Email_Ent_East_3</fullName>
        <description>Channel Registration Sales Ops Approved Email Ent East 3</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dave.kranowitz@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Approved_Alert_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Approved_Email_Ent_East_Tri_State</fullName>
        <description>Channel Registration Sales Ops Approved Email Ent East 2</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dave.kranowitz@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>richard.balch@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Approved_Alert_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Approved_Email_Ent_South_East</fullName>
        <description>Channel Registration Sales Ops Approved Email Ent South East</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>brian.polick@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dave.kranowitz@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>steve.corndell@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Approved_Alert_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Approved_Email_Ent_West</fullName>
        <description>Channel Registration Sales Ops Approved Email Ent West</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dave.kranowitz@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ian.knight@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Approved_Alert_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Approved_Email_GM</fullName>
        <description>Channel Registration Sales Ops Approved Email GM</description>
        <protected>false</protected>
        <recipients>
            <recipient>jr.butler@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>yotam.yemini@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Approved_Alert_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Approved_Email_Oved</fullName>
        <description>Channel Registration Sales Ops Approved Email Oved</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dave.kranowitz@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>oved.lourie@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>randy.bartlewski@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Approved_Alert_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Approved_Email_SEC</fullName>
        <description>Channel Registration Sales Ops Approved Email SEC</description>
        <protected>false</protected>
        <recipients>
            <recipient>emilio.siman@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>steve.corndell@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Approved_Alert_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Approved_Email_SMB</fullName>
        <description>Channel Registration Sales Ops Approved Email SMB</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dan.hatch@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>joe.donato@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>shane.meth@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Approved_Alert_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Approved_Email_TK</fullName>
        <description>Channel Registration Sales Ops Approved Email TK</description>
        <protected>false</protected>
        <recipients>
            <recipient>neil.creahan@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>steve.corndell@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Approved_Alert_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Approved_Email_WCorporate</fullName>
        <description>Channel Registration Sales Ops Approved Email WCorporate</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
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
            <recipient>grant.hornung@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>susie.custer@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Approved_Alert_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Denied_Email_Central</fullName>
        <description>Channel Registration Sales Ops Denied Email Central</description>
        <protected>false</protected>
        <recipients>
            <recipient>aj.ferrera@vmturbo.com</recipient>
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
            <recipient>neil.creahan@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>steve.corndell@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Denied_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Denied_Email_ECorporate</fullName>
        <description>Channel Registration Sales Ops Denied Email ECorporate</description>
        <protected>false</protected>
        <recipients>
            <recipient>yotam.yemini@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Denied_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Denied_Email_EMEA</fullName>
        <description>Channel Registration Sales Ops Denied Email EMEA</description>
        <protected>false</protected>
        <recipients>
            <recipient>brady.lenahan@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>will.blench@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Denied_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Denied_Email_East</fullName>
        <description>Channel Registration Sales Ops Denied Email East</description>
        <protected>false</protected>
        <recipients>
            <recipient>cody.carlson@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jr.butler@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>michael.iannotti@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tom.strachan@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Denied_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Denied_Email_Ent_Central</fullName>
        <description>Channel Registration Sales Ops Denied Email Ent Central</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dave.kranowitz@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Denied_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Denied_Email_Ent_East</fullName>
        <description>Channel Registration Sales Ops Denied Email Ent East</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dave.kranowitz@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jr.butler@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Denied_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Denied_Email_Ent_East_3</fullName>
        <description>Channel Registration Sales Ops Denied Email Ent East 3</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dave.kranowitz@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Denied_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Denied_Email_Ent_East_Tri_State</fullName>
        <description>Channel Registration Sales Ops Denied Email Ent East 2</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dave.kranowitz@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>richard.balch@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Denied_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Denied_Email_Ent_South_East</fullName>
        <description>Channel Registration Sales Ops Denied Email Ent South East</description>
        <protected>false</protected>
        <recipients>
            <recipient>angus.kennedy@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>brian.polick@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dave.kranowitz@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>steve.corndell@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sungwoo.chon@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Denied_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Denied_Email_Ent_West</fullName>
        <description>Channel Registration Sales Ops Denied Email Ent West</description>
        <protected>false</protected>
        <recipients>
            <recipient>ben.waller@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dave.kranowitz@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ian.knight@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Denied_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Denied_Email_SMB</fullName>
        <description>Channel Registration Sales Ops Denied Email SMB</description>
        <protected>false</protected>
        <recipients>
            <recipient>kevin.amarucci@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>scott.essler@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Denied_Email</template>
    </alerts>
    <alerts>
        <fullName>Channel_Registration_Sales_Ops_Denied_Email_West</fullName>
        <description>Channel Registration Sales Ops Denied Email West</description>
        <protected>false</protected>
        <recipients>
            <recipient>gerry.sengendo@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>grant.hornung@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>susie.custer@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Channel_Registration_Sales_Ops_Denied_Email</template>
    </alerts>
    <alerts>
        <fullName>Registration_Expired</fullName>
        <description>Registration Expired</description>
        <protected>false</protected>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Registration_Expired</template>
    </alerts>
    <alerts>
        <fullName>VartopiaDRS__Deal_Registration_Approval_Email</fullName>
        <description>Deal Registration Approval Email</description>
        <protected>false</protected>
        <recipients>
            <field>VartopiaDRS__Primary_Salesrep_Email_New__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Submitted_By_Email_New__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>VartopiaDRS__Vartopia/VartopiaDRS__Deal_Registration_Approval_Email</template>
    </alerts>
    <alerts>
        <fullName>VartopiaDRS__Deal_Registration_Denial_Email</fullName>
        <description>Deal Registration Denial Email</description>
        <protected>false</protected>
        <recipients>
            <field>VartopiaDRS__Primary_Salesrep_Email_New__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Submitted_By_Email_New__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>VartopiaDRS__Vartopia/VartopiaDRS__Deal_Registration_Denial_Email</template>
    </alerts>
    <alerts>
        <fullName>VartopiaDRS__Deal_Registration_Expiration_Email</fullName>
        <description>Deal Registration Expiration Email</description>
        <protected>false</protected>
        <recipients>
            <field>VartopiaDRS__Primary_Salesrep_Email_New__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Submitted_By_Email_New__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>VartopiaDRS__Vartopia/VartopiaDRS__Deal_Registration_Expiration_Email</template>
    </alerts>
    <alerts>
        <fullName>VartopiaDRS__Deal_Registration_Returned_Email</fullName>
        <description>Deal Registration Returned Email</description>
        <protected>false</protected>
        <recipients>
            <field>VartopiaDRS__Primary_Salesrep_Email_New__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Submitted_By_Email_New__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>VartopiaDRS__Vartopia/VartopiaDRS__Deal_Registration_Returned_Email</template>
    </alerts>
    <alerts>
        <fullName>VartopiaDRS__Deal_Registration_Submission_Email</fullName>
        <description>Deal Registration Submission Email</description>
        <protected>false</protected>
        <recipients>
            <field>VartopiaDRS__Primary_Salesrep_Email_New__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>VartopiaDRS__Submitted_By_Email_New__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>VartopiaDRS__Vartopia/VartopiaDRS__Deal_Registration_Submission_Email</template>
    </alerts>
    <fieldUpdates>
        <fullName>Approve_Reg</fullName>
        <field>VartopiaDRS__Vendor_Status__c</field>
        <literalValue>Approved</literalValue>
        <name>Approve Reg</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approved_By_Stamp</fullName>
        <field>Approved_By__c</field>
        <formula>$User.Full_Name__c</formula>
        <name>Approved By Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reg_Approval</fullName>
        <field>VartopiaDRS__Vendor_Status__c</field>
        <literalValue>Approved</literalValue>
        <name>Reg Approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reg_Denial</fullName>
        <field>VartopiaDRS__Vendor_Status__c</field>
        <literalValue>Denied</literalValue>
        <name>Reg Denial</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Vendor_Status_to_Expired</fullName>
        <field>VartopiaDRS__Vendor_Status__c</field>
        <literalValue>Expired</literalValue>
        <name>Set Vendor Status to Expired</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Approval_Date</fullName>
        <field>VartopiaDRS__Approved_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Approval Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Opportunity_Stage</fullName>
        <field>Opportunity_Stage_at_Approval__c</field>
        <formula>TEXT(VartopiaDRS__Opportunity__r.StageName)</formula>
        <name>Stamp Opportunity Stage</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Original_Partner_Manager</fullName>
        <field>Original_Partner_Manager_Static__c</field>
        <formula>Partner_Manager__r.Full_Name__c</formula>
        <name>Stamp Original Partner Manager</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Partner_Manager_Role</fullName>
        <description>on Reg</description>
        <field>Partner_Manager_Role_Stamped__c</field>
        <formula>Partner_Manager__r.UserRole.Name</formula>
        <name>Stamp Partner Manager Role</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Reg_ID_By</fullName>
        <field>Reg_Identified_By_Static__c</field>
        <formula>IF( ISBLANK(Reg_Identified_By_Manual__c )=TRUE, Partner_Manager__r.Full_Name__c ,
Reg_Identified_By_Manual__r.Full_Name__c)</formula>
        <name>Stamp Reg ID By</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Reg_ID_By2</fullName>
        <field>Reg_Identified_By_Static__c</field>
        <formula>IF( ISBLANK(Reg_Identified_By_Manual__c )=FALSE, 
Reg_Identified_By_Manual__r.Full_Name__c,
Partner_Manager__r.Full_Name__c)</formula>
        <name>Stamp Reg ID By</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Vendor_Status_Closed_Won</fullName>
        <field>VartopiaDRS__Vendor_Status__c</field>
        <literalValue>Closed-Won</literalValue>
        <name>Stamp Vendor Status Closed Won</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Alert Registration Booking</fullName>
        <actions>
            <name>Alert_Registration_Booking</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>TEXT(VartopiaDRS__Opportunity__r.StageName) = &quot;Closed Won&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Approval Email BnC</fullName>
        <actions>
            <name>Channel_Registration_Sales_Approval_Email_BnC</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>EMEA</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Bangers n Cash&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;E-Unit&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;EMEA Commercial&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Ganas iOS&quot;),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Submitted&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Approval Email Central</fullName>
        <actions>
            <name>Channel_Registration_Sales_Approval_Email_CCorporate</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Central Region</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Central Corporate&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;SEC&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Shake n Bake&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;The Kitchen&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Beast Coast&quot;
),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Submitted&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Approval Email ECorporate</fullName>
        <actions>
            <name>Channel_Registration_Sales_Approval_Email_ECorporate</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>East Corporate</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;East Corporate&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Federal&quot;),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Submitted&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Approval Email East</fullName>
        <actions>
            <name>Channel_Registration_Sales_Approval_Email_East</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>East Region</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;The Green Monsters&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Green Berets&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Notti By Nature&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Closers Club&quot;),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Submitted&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Approval Email Enterprise Central</fullName>
        <actions>
            <name>Channel_Registration_Sales_Approval_Email_Ent_Central</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Enterprise Central</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise Central&quot;,   
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise Central Midwest&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise Central TOLA 1&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise Central 1&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise Central 2&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise Central 3&quot;

),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Submitted&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Approval Email Enterprise East 1</fullName>
        <actions>
            <name>Channel_Registration_Sales_Approval_Email_Ent</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Enterprise East</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise East&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Federal&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise East 1&quot;

),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Submitted&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Approval Email Enterprise East 2</fullName>
        <actions>
            <name>Channel_Registration_Sales_Approval_Email_Ent_East_Tri_State</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Enterprise East Tri-State</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise East Tri-State&quot;,
TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise East 2&quot;
),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Submitted&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Approval Email Enterprise East 3</fullName>
        <actions>
            <name>Channel_Registration_Sales_Approval_Email_Ent_East_3</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise East 3&quot;,
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Submitted&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Approval Email Enterprise South East</fullName>
        <actions>
            <name>Channel_Registration_Sales_Approval_Email_Ent_South_East</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Enterprise South East</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise South East&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise South East Ohio Valley&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise South East ATL&quot;

),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Submitted&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Approval Email Enterprise West</fullName>
        <actions>
            <name>Channel_Registration_Sales_Approval_Email_Ent_West</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Enterprise West</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise South Central&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise West&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise West Ian&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise West 1&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise West 2&quot;
),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Submitted&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Approval Email Oved</fullName>
        <actions>
            <name>Channel_Registration_Sales_Approval_Email_OCorporate</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>West Corporate</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;West Corporate&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Oved Corporate&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise North Central&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise West Oved &quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise West PacNW&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise West Southwest&quot;
),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Submitted&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Approval Email SMB</fullName>
        <actions>
            <name>Channel_Registration_Sales_Approval_Email_WD</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Wheelers n Dealers</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Wheelers and Dealers&quot;,
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Submitted&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Approval Email West</fullName>
        <actions>
            <name>Channel_Registration_Sales_Approval_Email_WCorporate</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>West Corporate</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;The Hunchbacks&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;The Titans&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;The Green Flash&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;The Wild West&quot;
),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Submitted&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Ops Approval Email</fullName>
        <actions>
            <name>Channel_Registration_Sales_Ops_Approval_Email</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>EMEA</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Approved&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Ops Approved Email Central</fullName>
        <actions>
            <name>Channel_Registration_Sales_Ops_Approved_Email_CCorporate</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Central Region</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Central Corporate&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;SEC&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Beast Coast&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Shake n Bake&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;The Kitchen&quot;
),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Approved&quot;,
TEXT(Deal_Type__c)&lt;&gt;&quot;&quot;,
TEXT(Sales_Ops_Audit__c)=&quot;Approved&quot;
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Ops Approved Email ECorporate</fullName>
        <actions>
            <name>Channel_Registration_Sales_Ops_Approved_Email_ECorporate</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>East Region</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;East Corporate&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Federal&quot;
),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Approved&quot;,
TEXT(Deal_Type__c)&lt;&gt;&quot;&quot;,
TEXT(Sales_Ops_Audit__c)=&quot;Approved&quot;
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Ops Approved Email EMEA</fullName>
        <actions>
            <name>Channel_Registration_Sales_Ops_Approved_Email_EMEA</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>EMEA</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Bangers n Cash&quot;,
TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;EMEA Commercial&quot;,
TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Ganas iOS&quot;,
TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;E-Unit&quot;),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Approved&quot;,
TEXT(Deal_Type__c)&lt;&gt;&quot;&quot;,
TEXT(Sales_Ops_Audit__c)=&quot;Approved&quot;
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Ops Approved Email East</fullName>
        <actions>
            <name>Channel_Registration_Sales_Ops_Approved_Email_East</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>East Region</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;The Green Monsters&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Green Berets&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Notti By Nature&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Closers Club&quot;
),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Approved&quot;,
TEXT(Deal_Type__c)&lt;&gt;&quot;&quot;,
TEXT(Sales_Ops_Audit__c)=&quot;Approved&quot;
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Ops Approved Email Enterprise Central</fullName>
        <actions>
            <name>Channel_Registration_Sales_Ops_Approved_Email_Ent_Central</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Enterprise Central</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise&quot;,
TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise Central&quot;,   
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise Central Midwest&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise Central TOLA 1&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise Central 1&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise Central 2&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise Central 3&quot;
),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Approved&quot;,
TEXT(Deal_Type__c)&lt;&gt;&quot;&quot;,
TEXT(Sales_Ops_Audit__c)=&quot;Approved&quot;
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Ops Approved Email Enterprise East 1</fullName>
        <actions>
            <name>Channel_Registration_Sales_Ops_Approved_Email_Ent_East</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Enterprise</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise&quot;,
TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise East&quot;,
TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Federal&quot;, 
TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise East 1&quot;
),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Approved&quot;,
TEXT(Deal_Type__c)&lt;&gt;&quot;&quot;,
TEXT(Sales_Ops_Audit__c)=&quot;Approved&quot;
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Ops Approved Email Enterprise East 2</fullName>
        <actions>
            <name>Channel_Registration_Sales_Ops_Approved_Email_Ent_East_Tri_State</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Enterprise East Tri-State</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise East Tri-State&quot;,
TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise East 2&quot;
),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Approved&quot;,
TEXT(Deal_Type__c)&lt;&gt;&quot;&quot;,
TEXT(Sales_Ops_Audit__c)=&quot;Approved&quot;
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Ops Approved Email Enterprise East 3</fullName>
        <actions>
            <name>Channel_Registration_Sales_Ops_Approved_Email_Ent_East_3</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise East 3&quot;,
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Approved&quot;,
TEXT(Deal_Type__c)&lt;&gt;&quot;&quot;,
TEXT(Sales_Ops_Audit__c)=&quot;Approved&quot;
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Ops Approved Email Enterprise South East</fullName>
        <actions>
            <name>Channel_Registration_Sales_Ops_Approved_Email_Ent_South_East</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Enterprise South East</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
 TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise South East&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise South East Ohio Valley&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise South East ATL&quot;
),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Approved&quot;,
TEXT(Deal_Type__c)&lt;&gt;&quot;&quot;,
TEXT(Sales_Ops_Audit__c)=&quot;Approved&quot;
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Ops Approved Email Enterprise West</fullName>
        <actions>
            <name>Channel_Registration_Sales_Ops_Approved_Email_Ent_West</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Enterprise West</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise&quot;,
TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise South Central&quot;,
TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise West&quot;,
TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise West Ian&quot;,
TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise West 1&quot;, 
TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise West 2&quot; 
),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Approved&quot;,
TEXT(Deal_Type__c)&lt;&gt;&quot;&quot;,
TEXT(Sales_Ops_Audit__c)=&quot;Approved&quot;
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Ops Approved Email Oved</fullName>
        <actions>
            <name>Channel_Registration_Sales_Ops_Approved_Email_Oved</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Oved Region</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;West Corporate&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Oved Corporate&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise West Oved &quot; ,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise West PacNW&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise West Southwest&quot;
),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Approved&quot;,
TEXT(Deal_Type__c)&lt;&gt;&quot;&quot;,
TEXT(Sales_Ops_Audit__c)=&quot;Approved&quot;
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Ops Approved Email SMB</fullName>
        <actions>
            <name>Channel_Registration_Sales_Ops_Approved_Email_SMB</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>SMB</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Wheelers and Dealers&quot;,
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Approved&quot;,
TEXT(Deal_Type__c)&lt;&gt;&quot;&quot;,
TEXT(Sales_Ops_Audit__c)=&quot;Approved&quot;
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Ops Approved Email West</fullName>
        <actions>
            <name>Channel_Registration_Sales_Ops_Approved_Email_WCorporate</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>West Region</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;The Hunchbacks&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;The Titans&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;The Green Flash&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;The Wild West&quot;
),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Approved&quot;,
TEXT(Deal_Type__c)&lt;&gt;&quot;&quot;,
TEXT(Sales_Ops_Audit__c)=&quot;Approved&quot;
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Ops Denied Email Central</fullName>
        <actions>
            <name>Channel_Registration_Sales_Ops_Denied_Email_Central</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Central Region</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Central Corporate&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;SEC&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Beast Coast&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Shake n Bake&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;The Kitchen&quot;
),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Approved&quot;,
TEXT(Deal_Type__c)&lt;&gt;&quot;&quot;,
TEXT(Sales_Ops_Audit__c)=&quot;Denied&quot;
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Ops Denied Email ECorporate</fullName>
        <actions>
            <name>Channel_Registration_Sales_Ops_Denied_Email_ECorporate</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>East Region</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;East Corporate&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Federal&quot;
),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Approved&quot;,
TEXT(Deal_Type__c)&lt;&gt;&quot;&quot;,
TEXT(Sales_Ops_Audit__c)=&quot;Denied&quot;
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Ops Denied Email EMEA</fullName>
        <actions>
            <name>Channel_Registration_Sales_Ops_Denied_Email_EMEA</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>EMEA</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Bangers n Cash&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;E-Unit&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Ganas iOS&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;EMEA Commercial&quot;
),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Approved&quot;,
TEXT(Deal_Type__c)&lt;&gt;&quot;&quot;,
TEXT(Sales_Ops_Audit__c)=&quot;Denied&quot;
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Ops Denied Email East</fullName>
        <actions>
            <name>Channel_Registration_Sales_Ops_Denied_Email_East</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>East Region</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;The Green Monsters&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Green Berets&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Notti By Nature&quot;, 
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Closers Club&quot;
),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Approved&quot;,
TEXT(Deal_Type__c)&lt;&gt;&quot;&quot;,
TEXT(Sales_Ops_Audit__c)=&quot;Denied&quot;
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Ops Denied Email Enterprise Central</fullName>
        <actions>
            <name>Channel_Registration_Sales_Ops_Denied_Email_Ent_Central</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Enterprise East</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise Central&quot;,   
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise Central Midwest&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise Central TOLA 1&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise Central 1&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise Central 2&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise Central 3&quot;
),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Approved&quot;,
TEXT(Deal_Type__c)&lt;&gt;&quot;&quot;,
TEXT(Sales_Ops_Audit__c)=&quot;Denied&quot;
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Ops Denied Email Enterprise East 1</fullName>
        <actions>
            <name>Channel_Registration_Sales_Ops_Denied_Email_Ent_East</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Enterprise East</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise East&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Federal&quot;, 
TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise East 1&quot;
),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Approved&quot;,
TEXT(Deal_Type__c)&lt;&gt;&quot;&quot;,
TEXT(Sales_Ops_Audit__c)=&quot;Denied&quot;
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Ops Denied Email Enterprise East 2</fullName>
        <actions>
            <name>Channel_Registration_Sales_Ops_Denied_Email_Ent_East_Tri_State</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Enterprise East Tri-State</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise East Tri-State&quot;,
TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise East 2&quot;
),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Approved&quot;,
TEXT(Deal_Type__c)&lt;&gt;&quot;&quot;,
TEXT(Sales_Ops_Audit__c)=&quot;Denied&quot;
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Ops Denied Email Enterprise East 3</fullName>
        <actions>
            <name>Channel_Registration_Sales_Ops_Denied_Email_Ent_East_3</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Enterprise East Tri-State</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise East 3&quot;,
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Approved&quot;,
TEXT(Deal_Type__c)&lt;&gt;&quot;&quot;,
TEXT(Sales_Ops_Audit__c)=&quot;Denied&quot;
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Ops Denied Email Enterprise South East</fullName>
        <actions>
            <name>Channel_Registration_Sales_Ops_Denied_Email_Ent_South_East</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Enterprise South East</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise South East&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise South East Ohio Valley&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise South East ATL&quot;
),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Approved&quot;,
TEXT(Deal_Type__c)&lt;&gt;&quot;&quot;,
TEXT(Sales_Ops_Audit__c)=&quot;Denied&quot;
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Ops Denied Email Enterprise West</fullName>
        <actions>
            <name>Channel_Registration_Sales_Ops_Denied_Email_Ent_West</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Enterprise West</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise South Central&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise West&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise West Ian&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise West 1&quot;, 
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise West 2&quot; 
),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Approved&quot;,
TEXT(Deal_Type__c)&lt;&gt;&quot;&quot;,
TEXT(Sales_Ops_Audit__c)=&quot;Denied&quot;
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Ops Denied Email Oved</fullName>
        <actions>
            <name>Channel_Registration_Sales_Denied_Email_Oved</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>West Region</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;West Corporate&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Oved Corporate&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise West Oved &quot; ,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise West PacNW&quot;,
   TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Enterprise West Southwest&quot;
),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Approved&quot;,
TEXT(Deal_Type__c)&lt;&gt;&quot;&quot;,
TEXT(Sales_Ops_Audit__c)=&quot;Denied&quot;
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Ops Denied Email SMB</fullName>
        <actions>
            <name>Channel_Registration_Sales_Ops_Denied_Email_SMB</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>SMB</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;Wheelers and Dealers&quot;
),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Approved&quot;,
TEXT(Deal_Type__c)&lt;&gt;&quot;&quot;,
TEXT(Sales_Ops_Audit__c)=&quot;Denied&quot;
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Registration Sales Ops Denied Email West</fullName>
        <actions>
            <name>Channel_Registration_Sales_Ops_Denied_Email_West</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>West Region</description>
        <formula>AND(
VartopiaDRS__Customer__c&lt;&gt;&quot;001D000000ev464IAA&quot;,
VartopiaDRS__Opportunity__c&lt;&gt;&quot;006D000000GvUcfIAF&quot;,
OR(
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;The Hunchbacks&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;The Titans&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;The Green Flash&quot;,
  TEXT(VartopiaDRS__Opportunity__r.Owner_Team__c)=&quot;The Wild West&quot;
),
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Approved&quot;,
TEXT(Deal_Type__c)&lt;&gt;&quot;&quot;,
TEXT(Sales_Ops_Audit__c)=&quot;Denied&quot;
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Mark Registration Closed Won</fullName>
        <actions>
            <name>Stamp_Vendor_Status_Closed_Won</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(
TEXT(VartopiaDRS__Opportunity__r.StageName)=&quot;Closed Won&quot;,
TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Approved&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>New Registration</fullName>
        <actions>
            <name>Alert_Channel_Team_of_New_Registration</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>VartopiaDRS__Registration__c.CreatedDate</field>
            <operation>greaterOrEqual</operation>
            <value>7/13/2014</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Registration Expired</fullName>
        <actions>
            <name>Registration_Expired</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>TEXT(VartopiaDRS__Vendor_Status__c)=&quot;Expired&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Approved By</fullName>
        <actions>
            <name>Approved_By_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>VartopiaDRS__Registration__c.VartopiaDRS__Vendor_Status__c</field>
            <operation>equals</operation>
            <value>Approved</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Opportunity Stage At Approval Date</fullName>
        <actions>
            <name>Stamp_Opportunity_Stage</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>NOT(ISBLANK(VartopiaDRS__Approved_Date__c))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Original Partner Manager</fullName>
        <actions>
            <name>Stamp_Original_Partner_Manager</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(
AND(
ISNEW(),
NOT(ISBLANK(Partner_Manager__c))
),
AND(
ISCHANGED(Partner_Manager__c),
ISBLANK(PRIORVALUE(Partner_Manager__c))

))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Partner Manager Role</fullName>
        <actions>
            <name>Stamp_Partner_Manager_Role</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISBLANK(Partner_Manager_Role_Stamped__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Reg ID By</fullName>
        <actions>
            <name>Stamp_Reg_ID_By</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>VartopiaDRS__Registration__c.Reg_Identified_By_Static__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>VartopiaDRS__Registration__c.Partner_Manager__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Reg ID By2</fullName>
        <actions>
            <name>Stamp_Reg_ID_By2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>VartopiaDRS__Registration__c.Reg_Identified_By_Manual__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>VartopiaDRS__Deal Registration Approval Email</fullName>
        <actions>
            <name>VartopiaDRS__Deal_Registration_Approval_Email</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>VartopiaDRS__Registration__c.VartopiaDRS__Vendor_Status__c</field>
            <operation>equals</operation>
            <value>Approved</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>VartopiaDRS__Deal Registration Denial Email</fullName>
        <actions>
            <name>VartopiaDRS__Deal_Registration_Denial_Email</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>VartopiaDRS__Registration__c.VartopiaDRS__Vendor_Status__c</field>
            <operation>equals</operation>
            <value>Denied</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>VartopiaDRS__Deal Registration Expiration Email</fullName>
        <actions>
            <name>VartopiaDRS__Deal_Registration_Expiration_Email</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>VartopiaDRS__Registration__c.VartopiaDRS__Vendor_Status__c</field>
            <operation>equals</operation>
            <value>Expired</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>VartopiaDRS__Deal Registration Expiration Notice</fullName>
        <active>false</active>
        <formula>!ISBLANK(VartopiaDRS__Expiration_Date__c)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>VartopiaDRS__Deal Registration Returned Email</fullName>
        <actions>
            <name>VartopiaDRS__Deal_Registration_Returned_Email</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>VartopiaDRS__Registration__c.VartopiaDRS__Vendor_Status__c</field>
            <operation>equals</operation>
            <value>Returned</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>VartopiaDRS__Deal Registration Submission Email</fullName>
        <actions>
            <name>VartopiaDRS__Deal_Registration_Submission_Email</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>VartopiaDRS__Registration__c.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
