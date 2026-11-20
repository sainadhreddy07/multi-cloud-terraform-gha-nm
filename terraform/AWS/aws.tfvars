aws_region = "ap-south-1"

name = "aws-tflab"

vpc_cidr            = "10.20.0.0/16"
public_subnet_cidrs = ["10.20.1.0/24", "10.20.2.0/24"]

instance_type     = "t3.medium"
ami_id            = null
ami_ssm_parameter = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"

key_name = null

allowed_ssh_cidrs = []
alb_ingress_cidrs = ["0.0.0.0/0"]

http_port = 80
ssh_port  = 22

web_page_title = "AWS backend"

alb_internal             = false
alb_listener_port        = 80
alb_backend_port         = 80
alb_health_check_path    = "/"
alb_health_check_matcher = "200-399"

tags = { environment = "lab", managed_by = "terraform" }

# Windows Server EC2
windows_ami_ssm_parameter = "/aws/service/ami-windows-latest/Windows_Server-2022-English-Full-Base"

windows_instance_type = "t3.large"

windows_key_name = "aws-key-pair"

windows_root_disk_size_gb = 128
windows_root_disk_type    = "gp3"

windows_rdp_cidrs = ["175.101.153.82/32"]

windows_data_disk_count   = 0
windows_data_disk_size_gb = 32
windows_data_disk_type    = "gp3"