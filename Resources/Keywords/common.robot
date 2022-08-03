*** Settings ***
Documentation    Common Keyword Library
Library          ../../Libraries/commonLib.py
Variables        ../Variables/veosLeaf01.yaml



*** Variables ***
${devType}         ${virtualBox}[vmType]
${ipAddr}          ${virtualBox}[vmManagement][hostIp]
${port}            ${virtualBox}[vmManagement][hostPort]
${username}        ${virtualBox}[vmManagement][username]
${password}        ${virtualBox}[vmManagement][password]


*** Keywords ***
Open Connection
    ${connect}                Connect To Device    ${ipAddr}    ${port}    ${username}    ${password}    ${devType}
    Set Global Variable       ${connect}   

Close Connection
    Disconnect From Device    ${connect}