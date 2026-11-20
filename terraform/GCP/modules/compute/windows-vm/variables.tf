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
    condition     = var.boot_disk_size_gb >= 50 && floor(var.boot_disk_size_gb) == var.boot_disk_size_gb
    error_message = "boot_disk_size_gb must be a whole number of at least 50 GB."
  }
}

variable "boot_disk_type" { type = string }

variable "data_disk_count" {
  type    = number
  default = 1

  validation {
    condition     = var.data_disk_count >= 0 && var.data_disk_count <= 15 && floor(var.data_disk_count) == var.data_disk_count
    error_message = "data_disk_count must be a whole number from 0 through 15."
  }
}

variable "data_disk_size_gb" {
  type    = number
  default = 20

  validation {
    condition     = var.data_disk_size_gb >= 10 && floor(var.data_disk_size_gb) == var.data_disk_size_gb
    error_message = "data_disk_size_gb must be a whole number of at least 10 GB."
  }
}
variable "data_disk_type" {
  type    = string
  default = "pd-balanced"
}

variable "assign_public_ip" { type = bool }
