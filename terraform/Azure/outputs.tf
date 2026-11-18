output "resource_group_name" { value = azurerm_resource_group.this.name }

# Linux VM outputs - original outputs preserved.
output "vm_name" { value = module.compute.vm_name }
output "vm_id" { value = module.compute.vm_id }
output "vm_private_ip" { value = module.compute.private_ip }

# Windows VM outputs.
output "windows_vm_name" { value = module.windows_vm.vm_name }
output "windows_vm_id" { value = module.windows_vm.vm_id }
output "windows_vm_private_ip" { value = module.windows_vm.private_ip }

output "load_balancer_public_ip" { value = module.load_balancer.public_ip }
output "load_balancer_url" { value = "http://${module.load_balancer.public_ip}" }
