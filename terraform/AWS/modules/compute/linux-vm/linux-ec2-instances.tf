data "aws_ssm_parameter" "ami" {
  name = var.ami_ssm_parameter
}


resource "aws_instance" "this" {
  ami                    = var.ami_id != null ? var.ami_id : data.aws_ssm_parameter.ami.value
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = (var.key_name != null && trimspace(var.key_name) != "") ? var.key_name : null
  user_data              = templatefile("${path.module}/user-data.sh", { vm_name = var.name, web_page_title = var.web_page_title })

  tags = merge(var.tags, {
    Name = "${var.name}-web"
  })
}
