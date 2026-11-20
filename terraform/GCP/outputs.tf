output "vm_name" { value = module.compute.instance_name }
output "vm_internal_ip" { value = module.compute.internal_ip }
output "vm_external_ip" { value = module.compute.external_ip }
output "http_url" { value = module.load_balancer.http_url }
output "network_name" { value = module.network.network_name }

output "windows_vm_name" { value = module.windows_vm.instance_name }
output "windows_vm_id" { value = module.windows_vm.instance_id }
output "windows_vm_internal_ip" { value = module.windows_vm.internal_ip }
output "windows_vm_external_ip" { value = module.windows_vm.external_ip }
output "windows_vm_data_disk_ids" { value = module.windows_vm.data_disk_ids }
