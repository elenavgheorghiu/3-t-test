vsphere_vcenter = "%VSPHERE_CENTER%"
vsphere_user    = "%VSPHERE_USER%"
vsphere_password = "%VSPHERE_PASSWORD%"

datastore_name = "%DATASTORE_NAME%"
datacenter_name = "%DATACENTER_NAME%"
network_name = "VM Network"
ip_esxi = "%ESXI_IP%"
resource_pool_name = "%RC_POOL%"
folder_path = "%VM_FOLDER%"

virtual_machines_linux = {}

virtual_machines_windows = {
    frontend = {
        template_name = "Windows10Pro_Frontend_Template"
        instance_name = "%INSTANCE_NAME%"
        fixed_ip = "%FIXED_IP%"
        gateway_ip = "%GATEWAY_IP%"
        num_cpus = "4"
        num_cores_per_socket = "2"
        memory = "8192"
        memory_reservation = "0"
        disks= []
    }
}