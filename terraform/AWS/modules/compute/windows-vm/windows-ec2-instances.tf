data "aws_ssm_parameter" "windows_ami" {
  name = var.ami_ssm_parameter
}

resource "aws_instance" "this" {
  ami                         = data.aws_ssm_parameter.windows_ami.value
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  key_name                    = var.key_name
  get_password_data           = true
  associate_public_ip_address = true

  root_block_device {
    volume_type           = var.root_disk_type
    volume_size           = var.root_disk_size_gb
    encrypted             = true
    delete_on_termination = true
  }

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  tags = merge(var.tags, {
    Name = "${var.name}-windows"
  })

  lifecycle {
    precondition {
      condition     = trimspace(var.key_name) != ""
      error_message = "windows_key_name must identify an existing EC2 key pair."
    }
  }
}

resource "aws_ebs_volume" "data" {
  count             = var.data_disk_count
  availability_zone = aws_instance.this.availability_zone
  size              = var.data_disk_size_gb
  type              = var.data_disk_type
  encrypted         = true

  tags = merge(var.tags, {
    Name = "${var.name}-windows-data-${count.index + 1}"
  })
}

resource "aws_volume_attachment" "data" {
  count = var.data_disk_count
  device_name = format(
    "/dev/sd%s",
    element(["f", "g", "h", "i", "j", "k", "l", "m"], count.index)
  )
  volume_id   = aws_ebs_volume.data[count.index].id
  instance_id = aws_instance.this.id
}