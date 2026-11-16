module "network" {
  source                  = "./modules/network/vnet"
  resource_group_name     = azurerm_resource_group.this.name
  vnet_name               = var.vnet_name
  location                = var.location
  vnet_address_space      = var.vnet_address_space
  subnet_name             = var.subnet_name
  subnet_address_prefixes = var.subnet_address_prefixes
  tags                    = var.tags
}


resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}


module "security" {
  source              = "./modules/security"
  nsg_name            = var.nsg_name
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  security_rules      = var.security_rules
  tags                = var.tags
}


module "compute" {
  source                    = "./modules/compute/linux-vm"
  nic_name                  = var.nic_name
  nic_ip_configuration_name = var.nic_ip_configuration_name
  location                  = var.location
  resource_group_name       = azurerm_resource_group.this.name
  subnet_id                 = module.network.subnet_id
  nsg_id                    = module.security.nsg_id
  vm_name                   = var.vm_name
  vm_size                   = var.vm_size
  admin_username            = var.admin_username
  admin_ssh_public_key      = var.admin_ssh_public_key
  os_disk_caching           = var.os_disk_caching
  os_disk_storage_type      = var.os_disk_storage_type
  os_disk_size_gb           = var.os_disk_size_gb
  image_publisher           = var.image_publisher
  image_offer               = var.image_offer
  image_sku                 = var.image_sku
  image_version             = var.image_version
  web_page_title            = var.web_page_title
  data_disk_count           = var.data_disk_count
  data_disk_size_gb         = var.data_disk_size_gb
  data_disk_storage_type    = var.data_disk_storage_type
  data_disk_caching         = var.data_disk_caching
  tags                      = var.tags
}


module "load_balancer" {
  source                    = "./modules/load-balancer"
  resource_group_name       = azurerm_resource_group.this.name
  location                  = var.location
  lb_name                   = var.load_balancer_name
  public_ip_name            = var.load_balancer_public_ip_name
  frontend_name             = var.lb_frontend_name
  backend_pool_name         = var.lb_backend_pool_name
  probe_name                = var.lb_probe_name
  rule_name                 = var.lb_rule_name
  outbound_rule_name        = var.lb_outbound_rule_name
  nic_id                    = module.compute.nic_id
  nic_ip_configuration_name = module.compute.nic_ip_configuration_name
  frontend_port             = var.lb_frontend_port
  backend_port              = var.lb_backend_port
  probe_path                = var.lb_probe_path
  probe_interval            = var.lb_probe_interval
  probe_count               = var.lb_probe_count
  outbound_ports            = var.lb_outbound_ports
  tags                      = var.tags
}
