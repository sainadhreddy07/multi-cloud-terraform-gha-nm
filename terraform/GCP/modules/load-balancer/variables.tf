variable "name" { type = string }
variable "project_id" { type = string }
variable "zone" { type = string }
variable "instance_self_link" { type = string }
variable "backend_port_name" { type = string }
variable "backend_port" { type = number }
variable "frontend_port" { type = number }
variable "health_check_path" { type = string }
