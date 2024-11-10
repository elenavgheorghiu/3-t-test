# TODO What to do if cluster datastore?
data "vsphere_datastore" "datastore" {
  name          = var.datastore_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

