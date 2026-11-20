output "instance_id" { value = aws_instance.this.id }
output "instance_arn" { value = aws_instance.this.arn }
output "private_ip" { value = aws_instance.this.private_ip }
output "public_ip" { value = aws_instance.this.public_ip }
output "public_dns" { value = aws_instance.this.public_dns }
output "encrypted_password_data" {
  description = "Encrypted Windows Administrator password data; decrypt locally with the matching private key."
  value       = aws_instance.this.password_data
  sensitive   = true
}
output "data_disk_ids" { value = aws_ebs_volume.data[*].id }
