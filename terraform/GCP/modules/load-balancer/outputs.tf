output "http_url" { value = "http://${google_compute_global_forwarding_rule.this.ip_address}" }
output "ip_address" { value = google_compute_global_forwarding_rule.this.ip_address }
