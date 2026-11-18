output "vm_id" { value = azurerm_windows_virtual_machine.this.id }
output "vm_name" { value = azurerm_windows_virtual_machine.this.name }
output "nic_id" { value = azurerm_network_interface.this.id }
output "private_ip" { value = azurerm_network_interface.this.private_ip_address }
output "nic_ip_configuration_name" { value = var.nic_ip_configuration_name }
output "data_disk_ids" { value = azurerm_managed_disk.data[*].id }
