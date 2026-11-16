resource "google_compute_firewall" "http" {
  name          = "${var.name}-allow-http"
  project       = var.project_id
  network       = var.network_self_link
  direction     = "INGRESS"
  source_ranges = var.http_source_ranges
  target_tags   = var.target_tags
  allow {
    protocol = "tcp"
    ports    = [tostring(var.http_port)]
  }
}
resource "google_compute_firewall" "health_checks" {
  name          = "${var.name}-allow-health-check"
  project       = var.project_id
  network       = var.network_self_link
  direction     = "INGRESS"
  source_ranges = var.health_check_source_ranges
  target_tags   = var.target_tags
  allow {
    protocol = "tcp"
    ports    = [tostring(var.http_port)]
  }
}
resource "google_compute_firewall" "ssh" {
  count         = length(var.ssh_source_ranges) > 0 ? 1 : 0
  name          = "${var.name}-allow-ssh"
  project       = var.project_id
  network       = var.network_self_link
  direction     = "INGRESS"
  source_ranges = var.ssh_source_ranges
  target_tags   = var.target_tags
  allow {
    protocol = "tcp"
    ports    = [tostring(var.ssh_port)]
  }
}
