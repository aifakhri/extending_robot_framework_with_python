*** Settings ***
Documentation       Extending Robot Framework Test Case
Variables           Resources/Variables/${DEVICE}.yaml
Library             Libraries/vxlanInstance.py
Library             Libraries/commonLib.py
Test Setup          Open Connection
Test Teardown       Close Connection


*** Variables ***
${devType}         ${virtualBox}[vmType]
${ipAddr}          ${virtualBox}[vmManagement][hostIp]
${port}            ${virtualBox}[vmManagement][hostPort]
${username}        ${virtualBox}[vmManagement][username]
${password}        ${virtualBox}[vmManagement][password]
${vxlanIntf}       ${vxlans}[interface][intName]
@{vniList}         @{vxlans}[vnis]


*** Keywords ***
Open Connection
    ${connect}                Connect To Device    ${ipAddr}    ${port}    ${username}    ${password}    ${devType}
    Set Global Variable       ${connect}   

Close Connection
    Disconnect From Device    ${connect}


*** Test Case ***
[Documentation] Step 1: Verify VXLAN Interface Status
    ${interfaceStatus}        VXLAN Status            ${connect}    ${vxlanIntf}
    Should Be Equal           "${interfaceStatus}"    "up"             

[Documentation] Step 2: Verify VXLAN VNI to VLAN Mapping
    FOR    ${expected}    IN    @{vniList}
        ${actualVni}       VXLAN VNI Mapping       ${connect}    ${vxlanIntf}    ${expected}[mappedVlan]
        Should Be Equal    "${actualVni}"          "${expected}[vniId]"
    END