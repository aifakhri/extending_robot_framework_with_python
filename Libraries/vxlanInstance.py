import json



def vxlan_status(connect, vxlanInt):
    responses =  connect.send_command(f"show interface {vxlanInt} | json")
    response = json.loads(responses)
    vxlan_status = response['interfaces'][vxlanInt]['lineProtocolStatus']
    return vxlan_status

def vxlan_vni_mapping(connect, vxlanInt, vlanId):
    responses =  connect.send_command(f"show interface {vxlanInt} | json")
    response = json.loads(responses)
    mapping = response['interfaces'][vxlanInt]['vlanToVniMap'][vlanId]['vni']
    return mapping