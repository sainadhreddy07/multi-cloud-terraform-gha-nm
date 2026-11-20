variable "name" { type = string }
variable "project_id" { type = string }
variable "zone" { type = string }
variable "machine_type" { type = string }
variable "subnet_self_link" { type = string }
variable "network_tags" { type = list(string) }
variable "boot_disk_image" { type = string }
variable "boot_disk_size_gb" { type = number }
variable "boot_disk_type" { type = string }
variable "data_disk_count" {
  type    = number
  default = 1
}
variable "data_disk_size_gb" {
  type    = number
  default = 20
}
variable "data_disk_type" {
  type    = string
  default = "pd-balanced"
}
variable "assign_public_ip" { type = bool }
