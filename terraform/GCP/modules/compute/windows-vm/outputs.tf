output "instance_name" { value = google_compute_instance.this.name }
output "instance_id" { value = google_compute_instance.this.id }
output "internal_ip" { value = google_compute_instance.this.network_interface[0].network_ip }
output "external_ip" { value = try(google_compute_instance.this.network_interface[0].access_config[0].nat_ip, null) }
output "instance_self_link" { value = google_compute_instance.this.self_link }
output "data_disk_ids" { value = google_compute_disk.data[*].id }
