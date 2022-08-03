*** Settings ***
Documentation   VXLAN Instance Keyword Library
Library         ../../Libraries/vxlanInstance.py
Variables       ../Variables/veosLeaf01.yaml


*** Variables ***
${vxlanIntf}       ${vxlans}[interface][intName]
@{vniList}         @{vxlans}[vnis]


*** Keywords ***
VXLAN Interface Status
[Documentation] Getting VXLAN Interface Status
    ${interfaceStatus}        VXLAN Status            ${connect}    ${vxlanIntf}
    Should Be Equal           "${interfaceStatus}"      "up"             

VXLAN VNI to VLAN Mapping
[Documentation] Getting VNI to VLAN Mapping
    FOR    ${expected}    IN    @{vniList}
        ${actualVni}       VXLAN VNI Mapping       ${connect}    ${vxlanIntf}    ${expected}[mappedVlan]
        Should Be Equal    "${actualVni}"          "${expected}[vniId]"
    END