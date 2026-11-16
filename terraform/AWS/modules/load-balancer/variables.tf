variable "name" { type = string }
variable "vpc_id" { type = string }
variable "subnet_ids" { type = list(string) }
variable "security_group_ids" { type = list(string) }
variable "target_id" { type = string }
variable "internal" { type = bool }
variable "listener_port" { type = number }
variable "backend_port" { type = number }
variable "health_check_path" { type = string }
variable "health_check_matcher" { type = string }
variable "tags" {
  type    = map(string)
  default = {}
}
