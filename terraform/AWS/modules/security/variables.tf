variable "name" { type = string }
variable "vpc_id" { type = string }
variable "http_port" { type = number }
variable "ssh_port" { type = number }
variable "alb_ingress_cidrs" { type = list(string) }
variable "allowed_ssh_cidrs" { type = list(string) }

variable "tags" {
  type    = map(string)
  default = {}
}
