<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_email_when_Personnel_Transition_form_is_created</fullName>
        <description>Send email when Personnel Transition form is created</description>
        <protected>false</protected>
        <recipients>
            <recipient>charmian.mcintyre@vmturbo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Personnel_Transition</template>
    </alerts>
    <rules>
        <fullName>Alert Ops of Transition</fullName>
        <actions>
            <name>Send_email_when_Personnel_Transition_form_is_created</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>TRUE</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
