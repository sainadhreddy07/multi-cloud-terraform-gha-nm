variable "nic_name" { type = string }
variable "nic_ip_configuration_name" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "subnet_id" { type = string }
variable "nsg_id" { type = string }
variable "vm_name" { type = string }
variable "vm_size" { type = string }
variable "admin_username" { type = string }
variable "admin_password" {
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

variable "data_disk_count" { 
  type = number
  default = 0 
}

variable "data_disk_size_gb" { 
  type = number
  default = 32 
}

variable "data_disk_storage_type" { 
  type = string
  default = "StandardSSD_LRS" 
}

variable "data_disk_caching" { 
  type = string
  default = "ReadWrite" 
}

variable "tags" { 
  type = map(string)
  default = {} 
}
