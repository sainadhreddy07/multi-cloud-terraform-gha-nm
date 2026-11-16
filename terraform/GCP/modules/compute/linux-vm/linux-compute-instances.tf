resource "google_compute_instance" "this" {
  name         = "${var.name}-web"
  project      = var.project_id
  zone         = var.zone
  machine_type = var.machine_type
  tags         = var.network_tags
  boot_disk {
    initialize_params {
      image = var.boot_disk_image
      size  = var.boot_disk_size_gb
      type  = var.boot_disk_type
    }
  }
  network_interface {
    subnetwork = var.subnet_self_link
    dynamic "access_config" {
      for_each = var.assign_public_ip ? [1] : []
      content {}
    }
  }
  metadata_startup_script = templatefile("${path.module}/startup.sh", { web_page_title = var.web_page_title, vm_name = var.name })
}
