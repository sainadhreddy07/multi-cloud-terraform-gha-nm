variable "name" {
  type = string
}

variable "ami_ssm_parameter" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "key_name" {
  type = string
}

variable "root_disk_size_gb" {
  type    = number
  default = 128
}

variable "root_disk_type" {
  type    = string
  default = "gp3"
}

variable "data_disk_count" {
  type    = number
  default = 0
}

variable "data_disk_size_gb" {
  type    = number
  default = 32
}

variable "data_disk_type" {
  type    = string
  default = "gp3"
}

variable "tags" {
  type    = map(string)
  default = {}
}