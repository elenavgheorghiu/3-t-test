data "vsphere_folder" "folder" {
  path = "${var.datacenter_name}/vm${var.folder_path}"
}