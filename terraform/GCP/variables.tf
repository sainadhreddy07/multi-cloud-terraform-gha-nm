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
