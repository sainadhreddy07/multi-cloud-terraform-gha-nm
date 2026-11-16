output "alb_dns_name" { value = module.load_balancer.dns_name }
output "http_url" { value = "http://${module.load_balancer.dns_name}" }
output "ec2_instance_id" { value = module.compute.instance_id }
output "ec2_private_ip" { value = module.compute.private_ip }
output "ec2_public_ip" { value = module.compute.public_ip }
output "vpc_id" { value = module.network.vpc_id }
