resource "google_compute_instance_group" "this" {
  name      = "${var.name}-ig"
  project   = var.project_id
  zone      = var.zone
  instances = [var.instance_self_link]
  named_port {
    name = var.backend_port_name
    port = var.backend_port
  }
}
resource "google_compute_health_check" "this" {
  name    = "${var.name}-hc"
  project = var.project_id
  http_health_check {
    port         = var.backend_port
    request_path = var.health_check_path
  }
}
resource "google_compute_backend_service" "this" {
  name                  = "${var.name}-backend"
  project               = var.project_id
  protocol              = "HTTP"
  port_name             = var.backend_port_name
  load_balancing_scheme = "EXTERNAL"
  health_checks         = [google_compute_health_check.this.id]
  backend { group = google_compute_instance_group.this.self_link }
}
resource "google_compute_url_map" "this" {
  name            = "${var.name}-urlmap"
  project         = var.project_id
  default_service = google_compute_backend_service.this.id
}
resource "google_compute_target_http_proxy" "this" {
  name    = "${var.name}-proxy"
  project = var.project_id
  url_map = google_compute_url_map.this.id
}
resource "google_compute_global_forwarding_rule" "this" {
  name                  = "${var.name}-forwarding"
  project               = var.project_id
  target                = google_compute_target_http_proxy.this.id
  port_range            = tostring(var.frontend_port)
  load_balancing_scheme = "EXTERNAL"
}
