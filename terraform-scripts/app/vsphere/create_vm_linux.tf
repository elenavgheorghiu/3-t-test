resource "vsphere_virtual_machine" "instance_linux" {

  for_each = var.virtual_machines_linux

  name                   = each.value.instance_name
  datastore_id           = data.vsphere_datastore.datastore.id
  resource_pool_id       = data.vsphere_resource_pool.rc_pool.id


  firmware               = data.vsphere_virtual_machine.linux_tmpl[each.key].firmware
  scsi_type              = data.vsphere_virtual_machine.linux_tmpl[each.key].scsi_type

  num_cpus               = each.value.num_cpus
  num_cores_per_socket   = each.value.num_cores_per_socket
  memory                 = each.value.memory
  memory_reservation     = each.value.memory_reservation

  cpu_hot_add_enabled    = true
  cpu_hot_remove_enabled = true
  memory_hot_add_enabled = true

  guest_id               = data.vsphere_virtual_machine.linux_tmpl[each.key].guest_id

  network_interface {
    network_id           = data.vsphere_network.network_VLAN.id
    adapter_type         = data.vsphere_virtual_machine.linux_tmpl[each.key].network_interface_types[0]
  }

  folder = replace(data.vsphere_folder.folder.path, "/.*\\/vm/", "")

  disk {
    label                = "TERRAFORM.vmdk"
    unit_number          = 0
    size                 = data.vsphere_virtual_machine.linux_tmpl[each.key].disks.0.size
    eagerly_scrub        = data.vsphere_virtual_machine.linux_tmpl[each.key].disks.0.eagerly_scrub
    thin_provisioned     = data.vsphere_virtual_machine.linux_tmpl[each.key].disks.0.thin_provisioned
  }

  dynamic "disk" {

    for_each = each.value.disks

    content {
      label            = disk.value.label
      unit_number      = disk.key + 1
      size             = disk.value.size

      eagerly_scrub    = data.vsphere_virtual_machine.linux_tmpl[each.key].disks.0.eagerly_scrub
      thin_provisioned = data.vsphere_virtual_machine.linux_tmpl[each.key].disks.0.thin_provisioned
    }
  }

  clone {

    template_uuid        = data.vsphere_virtual_machine.linux_tmpl[each.key].id
    linked_clone         = false
    timeout = "120"

    customize {
      timeout            = "60"
      linux_options {
        host_name        = replace(each.value.instance_name, "_", "-")
        domain           = ""
        time_zone        = "UTC"
      }
      network_interface {
        ipv4_address     = each.value.fixed_ip
        ipv4_netmask     = "22"
      }
      ipv4_gateway       = each.value.gateway_ip

    }
  }

  enable_disk_uuid       = true
}

