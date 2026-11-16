resource "azurerm_public_ip" "this" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
}
resource "azurerm_lb" "this" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  frontend_ip_configuration {
    name                 = var.frontend_name
    public_ip_address_id = azurerm_public_ip.this.id
  }
  tags = var.tags
}
resource "azurerm_lb_backend_address_pool" "this" {
  name            = var.backend_pool_name
  loadbalancer_id = azurerm_lb.this.id
}
resource "azurerm_lb_probe" "this" {
  name                = var.probe_name
  loadbalancer_id     = azurerm_lb.this.id
  protocol            = "Http"
  port                = var.backend_port
  request_path        = var.probe_path
  interval_in_seconds = var.probe_interval
  number_of_probes    = var.probe_count
}
resource "azurerm_lb_rule" "this" {
  name                           = var.rule_name
  loadbalancer_id                = azurerm_lb.this.id
  protocol                       = "Tcp"
  frontend_port                  = var.frontend_port
  backend_port                   = var.backend_port
  frontend_ip_configuration_name = var.frontend_name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.this.id]
  probe_id                       = azurerm_lb_probe.this.id
  disable_outbound_snat          = true
}
resource "azurerm_lb_outbound_rule" "this" {
  name                     = var.outbound_rule_name
  loadbalancer_id          = azurerm_lb.this.id
  protocol                 = "All"
  backend_address_pool_id  = azurerm_lb_backend_address_pool.this.id
  allocated_outbound_ports = var.outbound_ports
  frontend_ip_configuration { name = var.frontend_name }
}
resource "azurerm_network_interface_backend_address_pool_association" "this" {
  network_interface_id    = var.nic_id
  ip_configuration_name   = var.nic_ip_configuration_name
  backend_address_pool_id = azurerm_lb_backend_address_pool.this.id
}
