module "network" {
  source              = "./modules/network/vpc"
  name                = var.name
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  tags                = var.tags
}

module "security" {
  source            = "./modules/security"
  name              = var.name
  vpc_id            = module.network.vpc_id
  http_port         = var.http_port
  ssh_port          = var.ssh_port
  alb_ingress_cidrs = var.alb_ingress_cidrs
  allowed_ssh_cidrs = var.allowed_ssh_cidrs
  windows_rdp_cidrs = var.windows_rdp_cidrs
  tags              = var.tags
}


module "compute" {
  source            = "./modules/compute/linux-vm"
  name              = var.name
  ami_id            = var.ami_id
  ami_ssm_parameter = var.ami_ssm_parameter
  instance_type     = var.instance_type
  subnet_id         = module.network.public_subnet_ids[0]
  security_group_id = module.security.instance_sg_id
  key_name          = var.key_name
  web_page_title    = var.web_page_title
  tags              = var.tags
}


module "load_balancer" {
  source               = "./modules/load-balancer"
  name                 = var.name
  vpc_id               = module.network.vpc_id
  subnet_ids           = module.network.public_subnet_ids
  security_group_ids   = [module.security.alb_sg_id]
  target_id            = module.compute.instance_id
  internal             = var.alb_internal
  listener_port        = var.alb_listener_port
  backend_port         = var.alb_backend_port
  health_check_path    = var.alb_health_check_path
  health_check_matcher = var.alb_health_check_matcher
  tags                 = var.tags
}


module "windows_vm" {
  source            = "./modules/compute/windows-vm"
  name              = var.name
  ami_ssm_parameter = var.windows_ami_ssm_parameter
  instance_type     = var.windows_instance_type
  subnet_id         = module.network.public_subnet_ids[0]
  security_group_id = module.security.windows_instance_sg_id
  key_name          = var.windows_key_name

  root_disk_size_gb = var.windows_root_disk_size_gb
  root_disk_type    = var.windows_root_disk_type

  data_disk_count   = var.windows_data_disk_count
  data_disk_size_gb = var.windows_data_disk_size_gb
  data_disk_type    = var.windows_data_disk_type
  tags              = var.tags
}
