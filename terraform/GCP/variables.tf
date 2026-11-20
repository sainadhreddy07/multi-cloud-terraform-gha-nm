variable "project_id" { type = string }
variable "region" { type = string }
variable "zone" { type = string }
variable "name" { type = string }
variable "subnet_cidr" { type = string }
variable "machine_type" { type = string }
variable "network_tags" { type = list(string) }
variable "boot_disk_image" { type = string }
variable "boot_disk_size_gb" { type = number }
variable "boot_disk_type" { type = string }
variable "assign_public_ip" { type = bool }
variable "web_page_title" { type = string }
variable "http_source_ranges" { type = list(string) }
variable "health_check_source_ranges" { type = list(string) }
variable "ssh_source_ranges" {
  type    = list(string)
  default = []
}
variable "http_port" { type = number }
variable "ssh_port" { type = number }
variable "lb_backend_port_name" { type = string }
variable "lb_backend_port" { type = number }
variable "lb_frontend_port" { type = number }
variable "lb_health_check_path" { type = string }


# Windows Compute Engine inputs
variable "windows_machine_type" {
  type    = string
  default = "e2-standard-2"
}
variable "windows_boot_disk_image" {
  type    = string
  default = "windows-cloud/windows-2022"
}
variable "windows_boot_disk_size_gb" {
  type    = number
  default = 50
}
variable "windows_boot_disk_type" {
  type    = string
  default = "pd-balanced"
}
variable "windows_data_disk_count" {
  type    = number
  default = 1
  validation {
    condition     = var.windows_data_disk_count >= 0 && var.windows_data_disk_count <= 15 && floor(var.windows_data_disk_count) == var.windows_data_disk_count
    error_message = "windows_data_disk_count must be a whole number from 0 through 15."
  }
}
variable "windows_data_disk_size_gb" {
  type    = number
  default = 20
}
variable "windows_data_disk_type" {
  type    = string
  default = "pd-balanced"
}
variable "windows_assign_public_ip" {
  type    = bool
  default = true
}
variable "windows_network_tag" {
  type    = string
  default = "multicloud-gcp-windows"
}
variable "windows_rdp_source_ranges" {
  type        = list(string)
  description = "IPv4 CIDRs allowed to RDP to Windows VMs. Empty disables inbound RDP."
  default     = []
}
