data "vsphere_host" "host" {
  name          = var.ip_esxi
  datacenter_id = data.vsphere_datacenter.datacenter.id
}
