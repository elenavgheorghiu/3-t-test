terraform {
  required_version = ">= 0.14"
  required_providers {
    vsphere = {
      version   = "1.24.0"
    }
  }
}

provider "vsphere" {
  vsphere_server        = var.vsphere_vcenter
  user                  = var.vsphere_user
  password              = var.vsphere_password
  allow_unverified_ssl  = var.vsphere_unverified_ssl
}

