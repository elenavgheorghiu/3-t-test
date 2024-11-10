
variable "vsphere_user" {
  description = "vSphere user name"
  sensitive   = true
}

variable "vsphere_password" {
  description = "vSphere password"
  sensitive   = true
}

variable "vsphere_vcenter" {
  description = "vCenter server FQDN or IP"
}

variable "vsphere_unverified_ssl" {
  description = "Is the vCenter using a self signed certificate (true/false)"
  default     = true
}

variable "datastore_name" {
    description = "Datastore name"
}

variable "datacenter_name" {
    description = "Datacenter name"
}

variable "resource_pool_name" {
    description = "Resource pool name"
}

variable "network_name" {
    description = "Network name"
}

variable "folder_path" {
    description = "Folder path"
}

variable "ip_esxi" {
  description = "IP address to ESXI"
}

variable "virtual_machines_linux" {
    type        = map(object({
        num_cpus                = number
        num_cores_per_socket    = number
        memory                  = number
        memory_reservation      = number

        instance_name           = string
        template_name           = string

        fixed_ip                = string
        gateway_ip              = string
        disks                   = list(map(string))
    }))

}
variable "virtual_machines_windows" {
  type        = map(object({
      num_cpus                = number
      num_cores_per_socket    = number
      memory                  = number
      memory_reservation      = number

      instance_name           = string
      template_name           = string

      fixed_ip                = string
      gateway_ip              = string
      disks                   = list(map(string))
  }))
}