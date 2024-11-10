data "vsphere_virtual_machine" "linux_tmpl" {

  for_each = var.virtual_machines_linux

  name          = each.value.template_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

