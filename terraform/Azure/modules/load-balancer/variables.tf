variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "lb_name" { type = string }
variable "public_ip_name" { type = string }
variable "frontend_name" { type = string }
variable "backend_pool_name" { type = string }
variable "probe_name" { type = string }
variable "rule_name" { type = string }
variable "outbound_rule_name" { type = string }
variable "nic_id" { type = string }
variable "nic_ip_configuration_name" { type = string }
variable "frontend_port" { type = number }
variable "backend_port" { type = number }
variable "probe_path" { type = string }
variable "probe_interval" { type = number }
variable "probe_count" { type = number }
variable "outbound_ports" { type = number }
variable "tags" {
  type    = map(string)
  default = {}
}
