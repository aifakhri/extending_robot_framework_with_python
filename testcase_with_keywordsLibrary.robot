*** Settings ***
Documentation    Test Case With Keyword
Resource         Resources/Keywords/common.robot
Resource         Resources/Keywords/vxlanInstance.robot
Test Setup       Open Connection
Test Teardown    Close Connection



*** Test Cases ***
[Documentation] Step 1: Verify VXLAN Interface Status
    VXLAN Interface Status


[Documentation] Step 2: Verify VXLAN VNI to VLAN Mapping
    VXLAN VNI to VLAN Mapping