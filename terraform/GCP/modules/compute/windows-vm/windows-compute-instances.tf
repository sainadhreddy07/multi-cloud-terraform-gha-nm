resource "google_compute_instance" "this" {
  name         = "${var.name}-windows"
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

  dynamic "attached_disk" {
    for_each = google_compute_disk.data
    content {
      source      = attached_disk.value.self_link
      device_name = attached_disk.value.name
      mode        = "READ_WRITE"
    }
  }

  network_interface {
    subnetwork = var.subnet_self_link
    dynamic "access_config" {
      for_each = var.assign_public_ip ? [1] : []
      content {}
    }
  }

  metadata = {
    windows-startup-script-ps1 = "Write-Output 'Windows Server provisioned by Terraform'"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }
}

resource "google_compute_disk" "data" {
  count   = var.data_disk_count
  project = var.project_id
  name    = "${var.name}-windows-data-${count.index + 1}"
  zone    = var.zone
  type    = var.data_disk_type
  size    = var.data_disk_size_gb
}
