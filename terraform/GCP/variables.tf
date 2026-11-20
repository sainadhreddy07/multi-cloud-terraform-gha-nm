variable "project_id" {
  type        = string
  description = "Google Cloud project ID."

  validation {
    condition     = length(var.project_id) >= 6 && length(var.project_id) <= 30 && can(regex("^[a-z][a-z0-9-]*[a-z0-9]$", var.project_id))
    error_message = "project_id must be 6-30 characters, start with a lowercase letter, and contain lowercase letters, digits, or hyphens."
  }
}

variable "region" { type = string }
variable "zone" { type = string }

variable "name" {
  type        = string
  description = "Base name used for GCP resources."

  validation {
    condition     = length(var.name) > 0 && length(var.name) <= 35 && can(regex("^[a-z][a-z0-9-]*$", var.name))
    error_message = "name must be 1-35 lowercase letters, digits, or hyphens and start with a letter."
  }
}

variable "subnet_cidr" {
  type        = string
  description = "IPv4 CIDR for the custom subnet."

  validation {
    condition     = can(cidrhost(var.subnet_cidr, 0))
    error_message = "subnet_cidr must be a valid IPv4 CIDR."
  }
}

variable "machine_type" { type = string }
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
variable "http_source_ranges" { type = list(string) }
variable "health_check_source_ranges" { type = list(string) }

variable "ssh_source_ranges" {
  type        = list(string)
  description = "CIDRs allowed to connect to Linux SSH. Empty disables SSH ingress."
  default     = []
}

variable "http_port" { type = number }
variable "ssh_port" { type = number }
variable "lb_backend_port_name" { type = string }
variable "lb_backend_port" { type = number }
variable "lb_frontend_port" { type = number }
variable "lb_health_check_path" { type = string }


# Windows Compute Engine inputs
variable "windows_machine_type" {
  type        = string
  description = "Machine type for the Windows VM."
  default     = "e2-standard-2"
}

variable "windows_boot_disk_image" {
  type        = string
  description = "Windows Server image family or image."
  default     = "windows-cloud/windows-2022"
}

variable "windows_boot_disk_size_gb" {
  type    = number
  default = 50

  validation {
    condition     = var.windows_boot_disk_size_gb >= 50 && floor(var.windows_boot_disk_size_gb) == var.windows_boot_disk_size_gb
    error_message = "windows_boot_disk_size_gb must be a whole number of at least 50 GB."
  }
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

  validation {
    condition     = var.windows_data_disk_size_gb >= 10 && floor(var.windows_data_disk_size_gb) == var.windows_data_disk_size_gb
    error_message = "windows_data_disk_size_gb must be a whole number of at least 10 GB."
  }
}

variable "windows_data_disk_type" {
  type    = string
  default = "pd-balanced"
}

variable "windows_assign_public_ip" {
  type        = bool
  description = "Whether to assign a public IP address to the Windows VM."
  default     = true
}

variable "windows_network_tag" {
  type        = string
  description = "Network tag applied to the Windows VM and used by its RDP firewall rule."
  default     = "multicloud-gcp-windows"
}

variable "windows_rdp_source_ranges" {
  type        = list(string)
  description = "IPv4 CIDRs allowed to RDP to Windows. Empty disables inbound RDP. Use your public IP with /32 for this lab."
  default     = []
}
