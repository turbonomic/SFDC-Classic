<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Change_mailing_state_abbreviations</fullName>
        <field>MailingState</field>
        <formula>CASE(upper(MailingState), 
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
MailingState)</formula>
        <name>Change mailing state abbreviations</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_status_to_Actively_Prospecting</fullName>
        <field>Contact_Status__c</field>
        <literalValue>Actively Prospecting</literalValue>
        <name>Change status to Actively Prospecting</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
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
        <fullName>Cont_VisitTrack_Stamp_First_Campaign</fullName>
        <field>VisitTrack_First_Campaign__c</field>
        <formula>LEFT( 
MID(Visit_Track_Original_Visit__c, 
MAX(FIND(&quot;&lt;tslp_campaign&gt;&quot;, Visit_Track_Original_Visit__c) + LEN(&quot;&lt;tslp_campaign&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/tslp_campaign&gt;&quot;, Visit_Track_Original_Visit__c) - FIND(&quot;&lt;tslp_campaign&gt;&quot;, Visit_Track_Original_Visit__c) -LEN(&quot;&lt;tslp_campaign&gt;&quot;),0) ), 80)</formula>
        <name>Cont - VisitTrack - Stamp First Campaign</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cont_VisitTrack_Stamp_First_LP</fullName>
        <field>VisitTrack_First_Landing_Page__c</field>
        <formula>LEFT(MID(Visit_Track_Original_Visit__c, 
MAX(FIND(&quot;&lt;tslp&gt;&quot;, Visit_Track_Original_Visit__c) + LEN(&quot;&lt;tslp&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/tslp&gt;&quot;, Visit_Track_Original_Visit__c) - FIND(&quot;&lt;tslp&gt;&quot;, Visit_Track_Original_Visit__c) -LEN(&quot;&lt;tslp&gt;&quot;),0) ),200)</formula>
        <name>Cont - VisitTrack - Stamp First LP</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cont_VisitTrack_Stamp_First_Medium</fullName>
        <field>VisitTrack_First_Medium__c</field>
        <formula>LEFT(MID(Visit_Track_Original_Visit__c, 
MAX(FIND(&quot;&lt;tslp_medium&gt;&quot;, Visit_Track_Original_Visit__c) + LEN(&quot;&lt;tslp_medium&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/tslp_medium&gt;&quot;, Visit_Track_Original_Visit__c) - FIND(&quot;&lt;tslp_medium&gt;&quot;, Visit_Track_Original_Visit__c) -LEN(&quot;&lt;tslp_medium&gt;&quot;),0) ), 80)</formula>
        <name>Cont - VisitTrack - Stamp First Medium</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cont_VisitTrack_Stamp_First_Referrer</fullName>
        <field>VisitTrack_First_Referrer__c</field>
        <formula>LEFT(MID(Visit_Track_Original_Visit__c, 
MAX(FIND(&quot;&lt;tsr&gt;&quot;, Visit_Track_Original_Visit__c) + LEN(&quot;&lt;tsr&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/tsr&gt;&quot;, Visit_Track_Original_Visit__c) - FIND(&quot;&lt;tsr&gt;&quot;, Visit_Track_Original_Visit__c) -LEN(&quot;&lt;tsr&gt;&quot;),0) ), 200)</formula>
        <name>Cont - VisitTrack - Stamp First Referrer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cont_VisitTrack_Stamp_First_Source</fullName>
        <field>VisitTrack_First_Source__c</field>
        <formula>LEFT(MID(Visit_Track_Original_Visit__c, 
MAX(FIND(&quot;&lt;tslp_source&gt;&quot;, Visit_Track_Original_Visit__c) + LEN(&quot;&lt;tslp_source&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/tslp_source&gt;&quot;, Visit_Track_Original_Visit__c) - FIND(&quot;&lt;tslp_source&gt;&quot;, Visit_Track_Original_Visit__c) -LEN(&quot;&lt;tslp_source&gt;&quot;),0) ),80)</formula>
        <name>Cont - VisitTrack - Stamp First Source</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cont_VisitTrack_Stamp_First_Term</fullName>
        <field>VisitTrack_First_Term__c</field>
        <formula>LEFT(MID(Visit_Track_Most_Recent_Visit__c, 
MAX(FIND(&quot;&lt;tslp_term&gt;&quot;, Visit_Track_Most_Recent_Visit__c) + LEN(&quot;&lt;tslp_term&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/tslp_term&gt;&quot;, Visit_Track_Most_Recent_Visit__c) - FIND(&quot;&lt;tslp_term&gt;&quot;, Visit_Track_Most_Recent_Visit__c) -LEN(&quot;&lt;tslp_term&gt;&quot;),0) ),80)</formula>
        <name>Cont - VisitTrack - Stamp First Term</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cont_VisitTrack_Stamp_MR_Campaign</fullName>
        <field>VisitTrack_Most_Recent_Campaign__c</field>
        <formula>LEFT(MID(Visit_Track_Most_Recent_Visit__c, 
MAX(FIND(&quot;&lt;tslp_campaign&gt;&quot;, Visit_Track_Most_Recent_Visit__c) + LEN(&quot;&lt;tslp_campaign&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/tslp_campaign&gt;&quot;, Visit_Track_Most_Recent_Visit__c) - FIND(&quot;&lt;tslp_campaign&gt;&quot;, Visit_Track_Most_Recent_Visit__c) -LEN(&quot;&lt;tslp_campaign&gt;&quot;),0) ),80)</formula>
        <name>Cont - VisitTrack - Stamp MR Campaign</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cont_VisitTrack_Stamp_MR_LP</fullName>
        <field>VisitTrack_Most_Recent_Landing_Page__c</field>
        <formula>LEFT(MID(Visit_Track_Most_Recent_Visit__c, 
MAX(FIND(&quot;&lt;tslp&gt;&quot;, Visit_Track_Most_Recent_Visit__c) + LEN(&quot;&lt;tslp&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/tslp&gt;&quot;, Visit_Track_Most_Recent_Visit__c) - FIND(&quot;&lt;tslp&gt;&quot;, Visit_Track_Most_Recent_Visit__c) -LEN(&quot;&lt;tslp&gt;&quot;),0) ), 200)</formula>
        <name>Cont - VisitTrack - Stamp MR LP</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cont_VisitTrack_Stamp_MR_Medium</fullName>
        <field>VisitTrack_Most_Recent_Medium__c</field>
        <formula>LEFT(MID(Visit_Track_Most_Recent_Visit__c, 
MAX(FIND(&quot;&lt;tslp_medium&gt;&quot;, Visit_Track_Most_Recent_Visit__c) + LEN(&quot;&lt;tslp_medium&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/tslp_medium&gt;&quot;, Visit_Track_Most_Recent_Visit__c) - FIND(&quot;&lt;tslp_medium&gt;&quot;, Visit_Track_Most_Recent_Visit__c) -LEN(&quot;&lt;tslp_medium&gt;&quot;),0) ),80)</formula>
        <name>Cont - VisitTrack - Stamp MR Medium</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cont_VisitTrack_Stamp_MR_Referrer</fullName>
        <field>VisitTrack_Most_Recent_Referrer__c</field>
        <formula>LEFT(MID(Visit_Track_Most_Recent_Visit__c, 
MAX(FIND(&quot;&lt;tsr&gt;&quot;, Visit_Track_Most_Recent_Visit__c) + LEN(&quot;&lt;tsr&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/tsr&gt;&quot;, Visit_Track_Most_Recent_Visit__c) - FIND(&quot;&lt;tsr&gt;&quot;, Visit_Track_Most_Recent_Visit__c) -LEN(&quot;&lt;tsr&gt;&quot;),0) ),200)</formula>
        <name>Cont - VisitTrack - Stamp MR Referrer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cont_VisitTrack_Stamp_MR_Source</fullName>
        <field>VisitTrack_Most_Recent_Source__c</field>
        <formula>LEFT(MID(Visit_Track_Most_Recent_Visit__c, 
MAX(FIND(&quot;&lt;tslp_source&gt;&quot;, Visit_Track_Most_Recent_Visit__c) + LEN(&quot;&lt;tslp_source&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/tslp_source&gt;&quot;, Visit_Track_Most_Recent_Visit__c) - FIND(&quot;&lt;tslp_source&gt;&quot;, Visit_Track_Most_Recent_Visit__c) -LEN(&quot;&lt;tslp_source&gt;&quot;),0) ), 80)</formula>
        <name>Cont - VisitTrack - Stamp MR Source</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cont_VisitTrack_Stamp_MR_Term</fullName>
        <field>VisitTrack_Most_Recent_Term__c</field>
        <formula>LEFT(MID(Visit_Track_Most_Recent_Visit__c, 
MAX(FIND(&quot;&lt;tslp_term&gt;&quot;, Visit_Track_Most_Recent_Visit__c) + LEN(&quot;&lt;tslp_term&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/tslp_term&gt;&quot;, Visit_Track_Most_Recent_Visit__c) - FIND(&quot;&lt;tslp_term&gt;&quot;, Visit_Track_Most_Recent_Visit__c) -LEN(&quot;&lt;tslp_term&gt;&quot;),0) ), 80)</formula>
        <name>Cont - VisitTrack - Stamp MR Term</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cont_VisitTrack_Stamp_Orig_Campaign</fullName>
        <field>VisitTrack_Original_Campaign__c</field>
        <formula>LEFT(MID(Visit_Track_Most_Recent_Visit__c, 
MAX(FIND(&quot;&lt;oslp_campaign&gt;&quot;, Visit_Track_Most_Recent_Visit__c) + LEN(&quot;&lt;oslp_campaign&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/oslp_campaign&gt;&quot;, Visit_Track_Most_Recent_Visit__c) - FIND(&quot;&lt;oslp_campaign&gt;&quot;, Visit_Track_Most_Recent_Visit__c) -LEN(&quot;&lt;oslp_campaign&gt;&quot;),0) ), 80)</formula>
        <name>Cont - VisitTrack - Stamp Orig Campaign</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cont_VisitTrack_Stamp_Orig_LP</fullName>
        <field>VisitTrack_Original_Landing_Page__c</field>
        <formula>LEFT(MID(Visit_Track_Most_Recent_Visit__c, 
MAX(FIND(&quot;&lt;oslp&gt;&quot;, Visit_Track_Most_Recent_Visit__c) + LEN(&quot;&lt;oslp&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/oslp&gt;&quot;, Visit_Track_Most_Recent_Visit__c) - FIND(&quot;&lt;oslp&gt;&quot;, Visit_Track_Most_Recent_Visit__c) -LEN(&quot;&lt;oslp&gt;&quot;),0) ), 200)</formula>
        <name>Cont - VisitTrack - Stamp Orig LP</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cont_VisitTrack_Stamp_Orig_Medium</fullName>
        <field>VisitTrack_Original_Medium__c</field>
        <formula>LEFT(MID(Visit_Track_Most_Recent_Visit__c, 
MAX(FIND(&quot;&lt;oslp_medium&gt;&quot;, Visit_Track_Most_Recent_Visit__c) + LEN(&quot;&lt;oslp_medium&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/oslp_medium&gt;&quot;, Visit_Track_Most_Recent_Visit__c) - FIND(&quot;&lt;oslp_medium&gt;&quot;, Visit_Track_Most_Recent_Visit__c) -LEN(&quot;&lt;oslp_medium&gt;&quot;),0) ),80)</formula>
        <name>Cont - VisitTrack - Stamp Orig Medium</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cont_VisitTrack_Stamp_Orig_Referrer</fullName>
        <field>VisitTrack_Original_Referrer__c</field>
        <formula>LEFT(MID(Visit_Track_Most_Recent_Visit__c, 
MAX(FIND(&quot;&lt;osr&gt;&quot;, Visit_Track_Most_Recent_Visit__c) + LEN(&quot;&lt;osr&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/osr&gt;&quot;, Visit_Track_Most_Recent_Visit__c) - FIND(&quot;&lt;osr&gt;&quot;, Visit_Track_Most_Recent_Visit__c) -LEN(&quot;&lt;osr&gt;&quot;),0) ), 200)</formula>
        <name>Cont - VisitTrack - Stamp Orig Referrer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cont_VisitTrack_Stamp_Orig_Source</fullName>
        <field>VisitTrack_Original_Source__c</field>
        <formula>LEFT(MID(Visit_Track_Most_Recent_Visit__c, 
MAX(FIND(&quot;&lt;oslp_source&gt;&quot;, Visit_Track_Most_Recent_Visit__c) + LEN(&quot;&lt;oslp_source&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/oslp_source&gt;&quot;, Visit_Track_Most_Recent_Visit__c) - FIND(&quot;&lt;oslp_source&gt;&quot;, Visit_Track_Most_Recent_Visit__c) -LEN(&quot;&lt;oslp_source&gt;&quot;),0) ), 80)</formula>
        <name>Cont - VisitTrack - Stamp Orig Source</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cont_VisitTrack_Stamp_Orig_Term</fullName>
        <field>VisitTrack_Original_Term__c</field>
        <formula>LEFT(MID(Visit_Track_Most_Recent_Visit__c, 
MAX(FIND(&quot;&lt;oslp_term&gt;&quot;, Visit_Track_Most_Recent_Visit__c) + LEN(&quot;&lt;oslp_term&gt;&quot;),1), 
MAX(FIND(&quot;&lt;/oslp_term&gt;&quot;, Visit_Track_Most_Recent_Visit__c) - FIND(&quot;&lt;oslp_term&gt;&quot;, Visit_Track_Most_Recent_Visit__c) -LEN(&quot;&lt;oslp_term&gt;&quot;),0) ), 80)</formula>
        <name>Cont - VisitTrack - Stamp Orig Term</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cont_VisitTrack_Stamp_Original_Visit</fullName>
        <description>Save original visit information upon first form fill.</description>
        <field>Visit_Track_Original_Visit__c</field>
        <formula>Visit_Track_Most_Recent_Visit__c</formula>
        <name>Cont - VisitTrack - Stamp Original Visit</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Contact_Region_Country_1</fullName>
        <field>Contact_Region_Country_1__c</field>
        <formula>CASE(UPPER(MailingCountry), 
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
        <name>Contact Region (Country 1)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Contact_Region_Country_2</fullName>
        <field>Contact_Region_Country_2__c</field>
        <formula>CASE(UPPER(MailingCountry), 
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
        <name>Contact Region (Country 2)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Contact_Region_State</fullName>
        <field>Contact_Region_State__c</field>
        <formula>CASE(UPPER(MailingState), 
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
        <name>Contact Region (State)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Contact_mobile_plus_sign</fullName>
        <field>MobilePhone</field>
        <formula>&quot;+&quot;&amp;MobilePhone</formula>
        <name>Contact mobile plus sign</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Contact_phone_plus_sign</fullName>
        <field>Phone</field>
        <formula>&quot;+&quot;&amp;Phone</formula>
        <name>Contact phone plus sign</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Contact_stamp_first_form_fill_date</fullName>
        <field>First_Web_Form_Fill_Date__c</field>
        <formula>now()</formula>
        <name>Contact stamp first form fill date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Contact_stamp_first_free_activation_date</fullName>
        <field>First_Free_Version_Activation_Date__c</field>
        <formula>NOW()</formula>
        <name>Contact stamp first free activation date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Contact_stamp_first_free_download_date</fullName>
        <field>First_Free_Version_Download_Date__c</field>
        <formula>NOW()</formula>
        <name>Contact stamp first free download date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Contact_stamp_first_full_activation_date</fullName>
        <field>First_Full_Version_Activation_Date__c</field>
        <formula>NOW()</formula>
        <name>Contact stamp first full activation date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Contact_stamp_first_full_download_date</fullName>
        <field>First_Full_Version_Download_Date__c</field>
        <formula>NOW()</formula>
        <name>Contact stamp first full download date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Contact_stamp_latest_form_fill</fullName>
        <field>Latest_Web_Form_Fill__c</field>
        <formula>TEXT(Recent_Download__c)</formula>
        <name>Contact stamp latest form fill</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Contact_stamp_latest_form_fill_date</fullName>
        <field>Latest_Web_Form_Fill_Date__c</field>
        <formula>Now()</formula>
        <name>Contact stamp latest form fill date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
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
        <fullName>Download_date_stamp</fullName>
        <field>First_Web_Form_Fill_Date__c</field>
        <formula>NOW()</formula>
        <name>Download date stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Email_Bounce_Update</fullName>
        <field>Email_Bounce__c</field>
        <literalValue>No</literalValue>
        <name>Email Bounce Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_in_Customer_References</fullName>
        <field>Customer_References__c</field>
        <formula>Account.Customer_References__c</formula>
        <name>Fill in Customer References</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_in_Diamond_Add_Date</fullName>
        <field>Diamond_Add_Date__c</field>
        <formula>TODAY()</formula>
        <name>Fill in Diamond Add Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_in_Use_Cases</fullName>
        <field>Use_Cases__c</field>
        <formula>Account.Use_Cases_Customers__c</formula>
        <name>Fill in Use Cases</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
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
        <fullName>Original_Source_Info_Summary</fullName>
        <field>Original_Source_Info_Summary__c</field>
        <formula>LEFT(mkto71_Original_Source_Info__c,255)</formula>
        <name>Original Source Info Summary</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
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
        <fullName>Remove_Flags_from_Dispositioned_Contacts</fullName>
        <field>Flag__c</field>
        <literalValue>0</literalValue>
        <name>Remove Flags from Dispositioned Contacts</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Status_to_Suspect</fullName>
        <field>Contact_Status__c</field>
        <literalValue>Suspect</literalValue>
        <name>Set Status to Suspect</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Source_equals_CCL_ZoomInfo</fullName>
        <field>LeadSource</field>
        <literalValue>CCL: ZoomInfo</literalValue>
        <name>Source equals &quot;CCL: ZoomInfo&quot;</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Source_equals_PRO_DiscoverOrg</fullName>
        <field>LeadSource</field>
        <literalValue>PRO: DiscoverOrg</literalValue>
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
        <fullName>Stamp_Account_Safe_ID</fullName>
        <field>Stamped_Account_Safe_ID__c</field>
        <formula>Account.Account_Safe_ID__c</formula>
        <name>Stamp Account Safe ID</name>
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
        <fullName>Stamp_MQL_date_time_contacts</fullName>
        <field>MQL_Date_Time__c</field>
        <formula>NOW()</formula>
        <name>Stamp MQL date/time contacts</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_rejuvenated_date_time_contacts</fullName>
        <field>Rejuvenated_Date_Time__c</field>
        <formula>NOW()</formula>
        <name>Stamp rejuvenated date/time contacts</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_Reason_blank</fullName>
        <field>Status_Reason__c</field>
        <name>Status Reason = blank</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Take_off_flag_contact</fullName>
        <field>Flag__c</field>
        <literalValue>0</literalValue>
        <name>Take off flag (contact)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Title_Score_update</fullName>
        <description>MAKE SURE YOU UPDATE THE LEAD TITLE SCORE FIELD UPDATE TOO</description>
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
        <fullName>Update_mailing_country</fullName>
        <field>MailingCountry</field>
        <formula>case(upper(MailingCountry),
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
MailingCountry)</formula>
        <name>Update mailing country</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>stamp_download_date</fullName>
        <field>First_Web_Form_Fill_Date__c</field>
        <formula>NOW()</formula>
        <name>stamp download date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_lead_source_to_discoverorg</fullName>
        <field>LeadSource</field>
        <literalValue>Prospecting - DiscoverOrg</literalValue>
        <name>update lead source to discoverorg</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Add plus sign to international mobile</fullName>
        <actions>
            <name>Contact_mobile_plus_sign</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(NOT(ISBLANK(MobilePhone)),LEFT(MobilePhone,1)&lt;&gt;&quot;+&quot;, 
OR(MailingCountry=&quot;Belgium&quot;, 
MailingCountry=&quot;Denmark&quot;, 
MailingCountry=&quot;Finland&quot;, 
MailingCountry=&quot;France&quot;, 
MailingCountry=&quot;Iceland&quot;, 
MailingCountry=&quot;Ireland&quot;, 
MailingCountry=&quot;Luxembourg&quot;, 
MailingCountry=&quot;Netherlands&quot;, 
MailingCountry=&quot;Norway&quot;, 
MailingCountry=&quot;South Africa&quot;, 
MailingCountry=&quot;Sweden&quot;, 
MailingCountry=&quot;Turkey&quot;, 
MailingCountry=&quot;United Kingdom&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Add plus sign to international phone</fullName>
        <actions>
            <name>Contact_phone_plus_sign</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(NOT(ISBLANK(Phone)),LEFT(Phone,1)&lt;&gt;&quot;+&quot;, 
OR(MailingCountry=&quot;Belgium&quot;, 
MailingCountry=&quot;Denmark&quot;, 
MailingCountry=&quot;Finland&quot;, 
MailingCountry=&quot;France&quot;, 
MailingCountry=&quot;Iceland&quot;, 
MailingCountry=&quot;Ireland&quot;, 
MailingCountry=&quot;Luxembourg&quot;, 
MailingCountry=&quot;Netherlands&quot;, 
MailingCountry=&quot;Norway&quot;, 
MailingCountry=&quot;South Africa&quot;, 
MailingCountry=&quot;Sweden&quot;, 
MailingCountry=&quot;Turkey&quot;, 
MailingCountry=&quot;United Kingdom&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Append date%2Ftime to LWFF stamp</fullName>
        <actions>
            <name>Lead_LWFF_stamp_date_time_append</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(ISCHANGED(Latest_Web_Form_Fill_Stamp__c),NOT(ISBLANK(Latest_Web_Form_Fill_Stamp__c)),RIGHT(Latest_Web_Form_Fill_Stamp__c,1)&lt;&gt;&quot;Z&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Clean mailing country</fullName>
        <actions>
            <name>Update_mailing_country</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>User.IsActive</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Clean United States and United Kingdom country entries to make them consistent</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Clean mailing state</fullName>
        <actions>
            <name>Change_mailing_state_abbreviations</name>
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
        <fullName>Clear Status Reason</fullName>
        <actions>
            <name>Status_Reason_blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Contact_Status__c</field>
            <operation>notEqual</operation>
            <value>Closed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Status_Reason__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>When Contact status is not &apos;Closed&apos; and Status Reason is not blank - set Status Reason to blank.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Contact</fullName>
        <actions>
            <name>Email_Bounce_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( ISCHANGED(Email),ISPICKVAL( Email_Bounce__c ,&quot;Yes&quot;))</formula>
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
            <name>Fill_in_Diamond_Add_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(ISCHANGED(Diamond_Add_Date__c),Diamond__c=TRUE)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Fill in Use Cases</fullName>
        <actions>
            <name>Fill_in_Use_Cases</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
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
        <fullName>Original Source Info Summary</fullName>
        <actions>
            <name>Original_Source_Info_Summary</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>NOT(ISBLANK(mkto71_Original_Source_Info__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Re-sync to Marketo</fullName>
        <actions>
            <name>Re_sync_to_Marketo</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(Active_Lookup__c&lt;&gt;&quot;&quot;,!Sync_To_Marketo__c)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Remove Flags from Dispositioned Contacts</fullName>
        <actions>
            <name>Remove_Flags_from_Dispositioned_Contacts</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND( 
OR( 
IF(ISPICKVAL(PRIORVALUE(Contact_Status__c),&quot;Prospect&quot;),TRUE,FALSE), 
IF(ISPICKVAL(PRIORVALUE(Contact_Status__c),&quot;Suspect&quot;),TRUE,FALSE) 
), 
OR( 
IF(ISPICKVAL(Contact_Status__c,&quot;Not a stakeholder&quot;),TRUE,FALSE), 
IF(ISPICKVAL(Contact_Status__c,&quot;No Fit with VMT&quot;),TRUE,FALSE), 
IF(ISPICKVAL(Contact_Status__c,&quot;Do Not Call&quot;),TRUE,FALSE), 
IF(ISPICKVAL(Contact_Status__c,&quot;Bad Data&quot;),TRUE,FALSE), 
IF(ISPICKVAL(Contact_Status__c,&quot;Language Barrier&quot;),TRUE,FALSE) 
), 
Flag__c=TRUE 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Remove flag</fullName>
        <actions>
            <name>Take_off_flag_contact</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>JC added an improved version</description>
        <formula>AND(ISCHANGED(Contact_Status__c), 
NOT(ISPICKVAL(Contact_Status__c,&quot;Actively Prospecting&quot;)))</formula>
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
            <field>Contact.Remove_from_Marketo__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Default Status</fullName>
        <actions>
            <name>Set_Status_to_Suspect</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Contact_Status__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Do Not Call</fullName>
        <actions>
            <name>Do_Not_Call_True</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.Status_Reason__c</field>
            <operation>equals</operation>
            <value>Do Not Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.DoNotCall</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>when a contact status reason is Do Not Call - set Do Not Call checkbox</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Account Safe ID</fullName>
        <actions>
            <name>Stamp_Account_Safe_ID</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>NOT(ISBLANK(AccountId))</formula>
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
        <fullName>Stamp EULA Acceptance Date</fullName>
        <actions>
            <name>Update_EULA_Acceptance_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>When coming in from Marketo, will restamp the EULA Acceptance Date to the current day.</description>
        <formula>AND(YEAR(DATEVALUE(EULA_Acceptance_Date__c))&lt;2000,NOT(ISBLANK(EULA_Acceptance_Date__c)))</formula>
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
        <formula>AND(NOT(ISNEW()),ISCHANGED(Latest_Web_Form_Fill_Stamp__c),RIGHT(Latest_Web_Form_Fill_Stamp__c,1)=&quot;Z&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp LWFF and date %28update status to Actively Prospecting%29</fullName>
        <actions>
            <name>Change_status_to_Actively_Prospecting</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Leave Disabled (10.2.2015)</description>
        <formula>AND(NOT(ISNEW()),ISCHANGED(Latest_Web_Form_Fill_Stamp__c),
RIGHT(Latest_Web_Form_Fill_Stamp__c,1)=&quot;Z&quot;,
NOT(ISPICKVAL(Contact_Status__c,&quot;Language Barrier&quot;)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp MQL date%2Ftime</fullName>
        <actions>
            <name>Stamp_MQL_date_time_contacts</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(ISBLANK(MQL_Date_Time__c),mkto71_Lead_Score__c&gt;225)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Region Fields %28Contacts%29</fullName>
        <actions>
            <name>Contact_Region_Country_1</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Contact_Region_Country_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Contact_Region_State</name>
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
            <name>Cont_VisitTrack_Stamp_First_Campaign</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Cont_VisitTrack_Stamp_First_LP</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Cont_VisitTrack_Stamp_First_Medium</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Cont_VisitTrack_Stamp_First_Referrer</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Cont_VisitTrack_Stamp_First_Source</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Cont_VisitTrack_Stamp_First_Term</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Visit_Track_Original_Visit__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.VisitTrack_First_Landing_Page__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Stamps source of first form fill visit.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp VisitTrack Most Recent Info</fullName>
        <actions>
            <name>Cont_VisitTrack_Stamp_MR_Campaign</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Cont_VisitTrack_Stamp_MR_LP</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Cont_VisitTrack_Stamp_MR_Medium</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Cont_VisitTrack_Stamp_MR_Referrer</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Cont_VisitTrack_Stamp_MR_Source</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Cont_VisitTrack_Stamp_MR_Term</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Visit_Track_Most_Recent_Visit__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Stamps source of most recent form fill visit</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp VisitTrack Original Info</fullName>
        <actions>
            <name>Cont_VisitTrack_Stamp_Orig_Campaign</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Cont_VisitTrack_Stamp_Orig_LP</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Cont_VisitTrack_Stamp_Orig_Medium</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Cont_VisitTrack_Stamp_Orig_Referrer</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Cont_VisitTrack_Stamp_Orig_Source</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Cont_VisitTrack_Stamp_Orig_Term</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Cont_VisitTrack_Stamp_Original_Visit</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Visit_Track_Most_Recent_Visit__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Visit_Track_Original_Visit__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Stamps source of original visit.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp first form fill date</fullName>
        <actions>
            <name>Contact_stamp_first_form_fill_date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.First_Web_Form_Fill__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.First_Web_Form_Fill_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp free version activation date</fullName>
        <actions>
            <name>Contact_stamp_first_free_activation_date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Stamps the first activation date of the free version</description>
        <formula>AND(NOT(ISNEW()),TEXT(PRIORVALUE(First_Free_Version_Activation_Date__c))=&quot;&quot;, TEXT(First_Free_Version_Activation_Date__c)&lt;&gt;&quot;&quot;, $User.FirstName&amp;&quot; &quot;&amp;$User.LastName&lt;&gt;&quot;Tim Daniels&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp free version download date</fullName>
        <actions>
            <name>Contact_stamp_first_free_download_date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Stamps the first download date of the free version</description>
        <formula>AND(NOT(ISNEW()),TEXT(PRIORVALUE(First_Free_Version_Download_Date__c))=&quot;&quot;, TEXT(First_Free_Version_Download_Date__c)&lt;&gt;&quot;&quot;, $User.FirstName&amp;&quot; &quot;&amp;$User.LastName&lt;&gt;&quot;Tim Daniels&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp full version activation date</fullName>
        <actions>
            <name>Contact_stamp_first_full_activation_date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Stamps the first activation date of the full version</description>
        <formula>AND(NOT(ISNEW()),TEXT(PRIORVALUE(First_Full_Version_Activation_Date__c))=&quot;&quot;, TEXT(First_Full_Version_Activation_Date__c)&lt;&gt;&quot;&quot;, $User.FirstName&amp;&quot; &quot;&amp;$User.LastName&lt;&gt;&quot;Tim Daniels&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp full version download date</fullName>
        <actions>
            <name>Contact_stamp_first_full_download_date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Stamps the first download date of the full version</description>
        <formula>AND(NOT(ISNEW()),TEXT(PRIORVALUE(First_Full_Version_Download_Date__c))=&quot;&quot;, TEXT(First_Full_Version_Download_Date__c)&lt;&gt;&quot;&quot;, $User.FirstName&amp;&quot; &quot;&amp;$User.LastName&lt;&gt;&quot;Tim Daniels&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp latest form fill and date</fullName>
        <actions>
            <name>Change_status_to_Actively_Prospecting</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Contact_stamp_latest_form_fill</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Contact_stamp_latest_form_fill_date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.Recent_Download__c</field>
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
        <fullName>Stamp rejuvenated date%2Ftime</fullName>
        <actions>
            <name>Stamp_rejuvenated_date_time_contacts</name>
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
        <fullName>Update ZoomInfo lead source</fullName>
        <actions>
            <name>Source_equals_CCL_ZoomInfo</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>ISPICKVAL(LeadSource,&quot;ZoomInfo&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update discoverorg lead source</fullName>
        <actions>
            <name>Source_equals_PRO_DiscoverOrg</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>ISPICKVAL(LeadSource,&quot;discoverorg&quot;)</formula>
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
        <description>Updates the title score for contact scoring</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>update Contact LeadSource</fullName>
        <actions>
            <name>update_lead_source_to_discoverorg</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>Lower(TEXT(LeadSource))=&quot;discoverorg&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>Web_form_fill_follow_up</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Website form fill follow-up</subject>
    </tasks>
</Workflow>
