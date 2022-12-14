from netmiko import ConnectHandler



def connect_to_device(ipAddr, port, usernm, passwd, device):
    device = {
        "host": ipAddr,
        "port": port,
        "username": usernm,
        "password": passwd,
        "device_type": device,
    }

    return ConnectHandler(**device)

def disconnect_from_device(connect):
    return connect.disconnect()