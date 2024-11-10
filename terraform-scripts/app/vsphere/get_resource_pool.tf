data "vsphere_resource_pool" "rc_pool" {
  name          = var.resource_pool_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

