module "network" {
  source      = "./modules/network/vpc"
  name        = var.name
  project_id  = var.project_id
  subnet_cidr = var.subnet_cidr
  region      = var.region
}
module "security" {
  source                     = "./modules/security"
  name                       = var.name
  project_id                 = var.project_id
  network_self_link          = module.network.network_self_link
  http_source_ranges         = var.http_source_ranges
  health_check_source_ranges = var.health_check_source_ranges
  ssh_source_ranges          = var.ssh_source_ranges
  windows_rdp_source_ranges  = var.windows_rdp_source_ranges
  windows_target_tag         = var.windows_network_tag
  target_tags                = var.network_tags
  http_port                  = var.http_port
  ssh_port                   = var.ssh_port
}
module "compute" {
  source            = "./modules/compute/linux-vm"
  name              = var.name
  project_id        = var.project_id
  zone              = var.zone
  machine_type      = var.machine_type
  subnet_self_link  = module.network.subnet_self_link
  network_tags      = var.network_tags
  boot_disk_image   = var.boot_disk_image
  boot_disk_size_gb = var.boot_disk_size_gb
  boot_disk_type    = var.boot_disk_type
  assign_public_ip  = var.assign_public_ip
  web_page_title    = var.web_page_title
}
module "load_balancer" {
  source             = "./modules/load-balancer"
  name               = var.name
  project_id         = var.project_id
  zone               = var.zone
  instance_self_link = module.compute.instance_self_link
  backend_port_name  = var.lb_backend_port_name
  backend_port       = var.lb_backend_port
  frontend_port      = var.lb_frontend_port
  health_check_path  = var.lb_health_check_path
}


module "windows_vm" {
  source              = "./modules/compute/windows-vm"
  name                = var.name
  project_id          = var.project_id
  zone                = var.zone
  machine_type        = var.windows_machine_type
  subnet_self_link    = module.network.subnet_self_link
  network_tags        = concat(var.network_tags, [var.windows_network_tag])
  boot_disk_image     = var.windows_boot_disk_image
  boot_disk_size_gb   = var.windows_boot_disk_size_gb
  boot_disk_type      = var.windows_boot_disk_type
  data_disk_count     = var.windows_data_disk_count
  data_disk_size_gb   = var.windows_data_disk_size_gb
  data_disk_type      = var.windows_data_disk_type
  assign_public_ip    = var.windows_assign_public_ip
}
