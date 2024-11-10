Scenario: Create VMs on vCenter based on templates






In order to provision Virtual machines from templates on VMWare infrastructure automatically, the following are needed:

1. DNS server (prereq for vCenter)
2. vCenter server
3. VM templates for Linux/Windows
4. Network configuration
5. Storage configuration (zoning, volumes)

There are limitations using terraform to provision infrastructure in VMWare:

Impossible to change the size of the OS drive (important to size all VMs with the same size OS drive).
Impossible to use RDM drives with Terraform (LUN mapping directly to VMs, very specific to certain projects).
Impossible to shrink the size of a drive (only increase)


PS: In progress …

