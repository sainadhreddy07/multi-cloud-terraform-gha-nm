aws_region = "ap-south-1"

name = "multicloud-aws"

vpc_cidr            = "10.20.0.0/16"
public_subnet_cidrs = ["10.20.1.0/24", "10.20.2.0/24"]

instance_type     = "t3.micro"
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
