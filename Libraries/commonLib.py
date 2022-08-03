from netmiko import ConnectHandler



def connect_to_device(ipAddr, port, usernm, passwd, device):
    device = {
        "host": ipAddr,
        "port": port,
        "username": usernm,
        "password": passwd,
        "device_type": device,
        "global_delay_factor": 1.5,
    }

    return ConnectHandler(**device)

def disconnect_from_device(connect):
    return connect.disconnect()