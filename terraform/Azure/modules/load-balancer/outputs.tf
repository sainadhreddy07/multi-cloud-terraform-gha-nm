output "public_ip" { value = azurerm_public_ip.this.ip_address }
output "public_ip_id" { value = azurerm_public_ip.this.id }
output "lb_id" { value = azurerm_lb.this.id }
output "backend_pool_id" { value = azurerm_lb_backend_address_pool.this.id }
