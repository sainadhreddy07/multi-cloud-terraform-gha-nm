resource "google_compute_network" "this" {
  name                    = "${var.name}-vpc"
  project                 = var.project_id
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "this" {
  name          = "${var.name}-subnet"
  project       = var.project_id
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.this.id
}
