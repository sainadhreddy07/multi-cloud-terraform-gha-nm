variable "name" { type = string }

variable "project_id" { type = string }

variable "zone" { type = string }

variable "machine_type" { type = string }

variable "subnet_self_link" { type = string }

variable "network_tags" { type = list(string) }

variable "boot_disk_image" { type = string }

variable "boot_disk_size_gb" {
  type = number

  validation {
    condition     = var.boot_disk_size_gb >= 10 && floor(var.boot_disk_size_gb) == var.boot_disk_size_gb
    error_message = "boot_disk_size_gb must be a whole number of at least 10 GB."
  }
}

variable "boot_disk_type" { type = string }

variable "assign_public_ip" { type = bool }

variable "web_page_title" { type = string }
