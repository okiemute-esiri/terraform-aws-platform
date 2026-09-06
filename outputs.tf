output "vpc_id" {
  description = "ID of the platform VPC."
  value       = module.network.vpc_id
}

output "load_balancer_dns_name" {
  description = "DNS name of the application load balancer."
  value       = module.compute.load_balancer_dns_name
}

output "autoscaling_group_name" {
  description = "Name of the application Auto Scaling Group."
  value       = module.compute.autoscaling_group_name
}
