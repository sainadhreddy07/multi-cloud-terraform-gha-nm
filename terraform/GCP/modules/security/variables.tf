variable "name" { type = string }
variable "project_id" { type = string }
variable "network_self_link" { type = string }
variable "http_source_ranges" { type = list(string) }
variable "health_check_source_ranges" { type = list(string) }
variable "ssh_source_ranges" {
  type    = list(string)
  default = []
}
variable "target_tags" { type = list(string) }
variable "http_port" { type = number }
variable "ssh_port" { type = number }
