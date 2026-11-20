variable "aws_region" { type = string }
variable "name" { type = string }
variable "vpc_cidr" { type = string }
variable "public_subnet_cidrs" { type = list(string) }
variable "instance_type" { type = string }
variable "ami_id" {
  type    = string
  default = null
}
variable "ami_ssm_parameter" { type = string }
variable "key_name" {
  type    = string
  default = null
}
variable "allowed_ssh_cidrs" {
  type    = list(string)
  default = []
}
variable "alb_ingress_cidrs" { type = list(string) }
variable "http_port" { type = number }
variable "ssh_port" { type = number }
variable "web_page_title" { type = string }
variable "alb_internal" { type = bool }
variable "alb_listener_port" { type = number }
variable "alb_backend_port" { type = number }
variable "alb_health_check_path" { type = string }
variable "alb_health_check_matcher" { type = string }
variable "tags" {
  type    = map(string)
  default = {}
}


# Windows EC2 inputs
variable "windows_ami_ssm_parameter" {
  type        = string
  description = "Regional public SSM parameter resolving the latest Windows Server AMI."
  default     = "/aws/service/ami-windows-latest/Windows_Server-2022-English-Full-Base"
}

variable "windows_instance_type" {
  type    = string
  default = "t3.medium"
}

variable "windows_root_disk_size_gb" {
  type        = number
  description = "Windows EC2 root EBS volume size in GB."
  default     = 128

  validation {
    condition     = var.windows_root_disk_size_gb >= 30 && floor(var.windows_root_disk_size_gb) == var.windows_root_disk_size_gb
    error_message = "Windows root disk size must be a whole number of at least 30 GB."
  }
}

variable "windows_root_disk_type" {
  type        = string
  description = "Windows EC2 root EBS volume type."
  default     = "gp3"

  validation {
    condition     = contains(["gp3", "gp2", "io1", "io2", "st1", "sc1"], var.windows_root_disk_type)
    error_message = "Unsupported EBS volume type."
  }
}

variable "windows_key_name" {
  type        = string
  description = "Existing EC2 key pair name; required to decrypt the generated Windows Administrator password."
}

variable "windows_rdp_cidrs" {
  type        = list(string)
  description = "IPv4 CIDRs allowed to RDP to the Windows EC2 instance. Empty disables inbound RDP."
  default     = []
}

variable "windows_data_disk_count" {
  type    = number
  default = 1
  validation {
    condition     = var.windows_data_disk_count >= 0 && var.windows_data_disk_count <= 8 && floor(var.windows_data_disk_count) == var.windows_data_disk_count
    error_message = "windows_data_disk_count must be a whole number from 0 through 8."
  }
}

variable "windows_data_disk_size_gb" {
  type    = number
  default = 20
}

variable "windows_data_disk_type" {
  type    = string
  default = "gp3"
}
