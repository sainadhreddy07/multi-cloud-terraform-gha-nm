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
