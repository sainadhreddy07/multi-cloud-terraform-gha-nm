output "alb_sg_id" {
  description = "Security Group ID for ALB"
  value       = aws_security_group.alb.id
}

output "instance_sg_id" {
  description = "Security Group ID for Linux EC2 instances"
  value       = aws_security_group.instance.id
}

output "windows_instance_sg_id" {
  description = "Security Group ID for Windows EC2 instances"
  value       = aws_security_group.windows_instance.id
}
