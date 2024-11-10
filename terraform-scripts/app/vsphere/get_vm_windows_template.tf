data "vsphere_virtual_machine" "windows_tmpl" {

  for_each = var.virtual_machines_windows

  name          = each.value.template_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}
