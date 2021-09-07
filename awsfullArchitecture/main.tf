



provider "aws" {
  region = "${var.aws_region}"
}
#provider "azurerm" {
#  features {}
#}



# Deploy Storage Resource
#module "storage" {
#  source       = "./storage"
#  project_name = "${var.project_name}"
#}




# Deploy Networking Resources

module "networking" {
  source       = "./networking"
  vpc_cidr     = "${var.vpc_cidr}"
  public_cidrs = "${var.public_cidrs}"
  accessip     = "${var.accessip}"
}

# Deploy Compute Resources
#module "windowsservers" {
#  source              = "Azure/compute/azurerm"
#  resource_group_name =  "example-resources"
#  is_windows_image    = true
#  vm_hostname         = "mywinvm" // line can be removed if only one VM module per resource group
#  admin_password      = "ComplxP@ssw0rd!"
#  vm_os_simple        = "WindowsServer"
#  public_ip_dns       = ["ashish-ibm-tf"] // change to a unique name per datacenter region
#  vnet_subnet_id      = "10.0.2.0/24"
#  vnet_subnet_id      = "/subscriptions/31a3b3f4-d197-4843-8d21-086ed5cc0616/resourceGroups/example-resources/providers/Microsoft.Network/virtualNetworks/example-network/subnets/internal"

#}

module "compute" {
  source          = "./compute"
  instance_count  = "${var.instance_count}"
  key_name        = "${var.key_name}"
  public_key_path = "${var.public_key_path}"
  instance_type   = "${var.server_instance_type}"
  #subnets         = "${module.networking.public_subnet}"
  subnets         = ["${module.networking.public_subnet}","${module.networking.private_subnet}"]
  security_group  = "${module.networking.public_sg}"
  subnet_ips      = "${var.public_cidrs}"
}
