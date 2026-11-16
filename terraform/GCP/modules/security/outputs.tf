output "http_firewall_name" { value = google_compute_firewall.http.name }
output "health_check_firewall_name" { value = google_compute_firewall.health_checks.name }
output "ssh_firewall_name" { value = try(google_compute_firewall.ssh[0].name, null) }
