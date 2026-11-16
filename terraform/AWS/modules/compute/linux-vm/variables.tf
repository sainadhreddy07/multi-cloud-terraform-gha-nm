variable "name" { type = string }
variable "ami_id" {
  type    = string
  default = null
}
variable "ami_ssm_parameter" { type = string }
variable "instance_type" { type = string }
variable "subnet_id" { type = string }
variable "security_group_id" { type = string }
variable "key_name" {
  type    = string
  default = null
}
variable "web_page_title" { type = string }
variable "tags" {
  type    = map(string)
  default = {}
}
