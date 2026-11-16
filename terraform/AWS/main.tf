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
