data "vsphere_network" "network_VLAN" {
  name          = var.network_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}
