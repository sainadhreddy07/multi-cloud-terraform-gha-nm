variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "vnet_name" { type = string }
variable "vnet_address_space" { type = list(string) }
variable "subnet_name" { type = string }
variable "subnet_address_prefixes" { type = list(string) }
variable "nsg_name" { type = string }

variable "security_rules" {
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}

# Linux VM inputs - retained.
variable "nic_name" { type = string }
variable "nic_ip_configuration_name" { type = string }
variable "vm_name" { type = string }
variable "vm_size" { type = string }
variable "admin_username" { type = string }
variable "admin_ssh_public_key" {
  type      = string
  sensitive = true
}
variable "os_disk_caching" { type = string }
variable "os_disk_storage_type" { type = string }
variable "os_disk_size_gb" { type = number }
variable "image_publisher" { type = string }
variable "image_offer" { type = string }
variable "image_sku" { type = string }
variable "image_version" { type = string }
variable "web_page_title" { type = string }

variable "data_disk_count" { 
  type = number
  default = 0 
}

variable "data_disk_size_gb" { 
  type = number
  default = 10 
}

variable "data_disk_storage_type" { 
  type = string
  default = "StandardSSD_LRS" 
}

variable "data_disk_caching" { 
  type = string
  default = "ReadWrite" 
}

# Windows VM inputs - deliberately separate from Linux inputs.
variable "windows_nic_name" { type = string }
variable "windows_nic_ip_configuration_name" { type = string }
variable "windows_vm_name" { type = string }
variable "windows_vm_size" { type = string }
variable "windows_admin_username" { type = string }
variable "admin_password" {
  type      = string
  sensitive = true
}
variable "windows_os_disk_caching" { type = string }
variable "windows_os_disk_storage_type" { type = string }
variable "windows_os_disk_size_gb" { type = number }
variable "windows_image_publisher" { type = string }
variable "windows_image_offer" { type = string }
variable "windows_image_sku" { type = string }
variable "windows_image_version" { type = string }

variable "windows_data_disk_count" { 
  type = number
  default = 0 
}

variable "windows_data_disk_size_gb" { 
  type = number
  default = 32
}

variable "windows_data_disk_storage_type" { 
  type = string
  default = "StandardSSD_LRS" 
}

variable "windows_data_disk_caching" { 
  type = string
  default = "ReadWrite" 
}

# Load balancer inputs.
variable "load_balancer_name" { type = string }
variable "load_balancer_public_ip_name" { type = string }
variable "lb_frontend_name" { type = string }
variable "lb_backend_pool_name" { type = string }
variable "lb_probe_name" { type = string }
variable "lb_rule_name" { type = string }
variable "lb_outbound_rule_name" { type = string }
variable "lb_frontend_port" { type = number }
variable "lb_backend_port" { type = number }
variable "lb_probe_path" { type = string }
variable "lb_probe_interval" { type = number }
variable "lb_probe_count" { type = number }
variable "lb_outbound_ports" { type = number }

variable "tags" {
  type    = map(string)
  default = {}
}
