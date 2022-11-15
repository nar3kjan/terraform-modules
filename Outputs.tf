
/*
output "aws_private_subnet1_id" {
  value = aws_subnet.private_subnet[0].id
}

output "aws_private_subnet2_id" {
  value = aws_subnet.private_subnet[1].id
}

output "aws_public_subnet1_id" {
  value = aws_subnet.public_subnet[0].id
}

output "aws_public_subnet2_id" {
  value = aws_subnet.public_subnet[1].id
}


output "vpc_id" {
    value = aws_vpc.main.id
}

output "aws_vpc_cidrs" {
    value = aws_vpc.main.cidr_block
} 

output "certificate_id" {
  value = aws_acm_certificate.cert.id
}

output "elb-id" {
  value = aws_lb.web.id
}

output "elb_zone_id" {
  value = aws_lb.web.zone_id
}

output "elb_dns_name" {
  value = aws_lb.web.dns_name
}
*/

output "lb_id" {
  description = "The ID and ARN of the load balancer we created."
  value       = module.alb.lb_id
}

output "lb_arn" {
  description = "The ID and ARN of the load balancer we created."
  value       = module.alb.lb_arn
}

output "lb_dns_name" {
  description = "The DNS name of the load balancer."
  value       = module.alb.lb_dns_name
}

output "lb_arn_suffix" {
  description = "ARN suffix of our load balancer - can be used with CloudWatch."
  value       = module.alb.lb_arn_suffix
}

output "lb_zone_id" {
  description = "The zone_id of the load balancer to assist with creating DNS records."
  value       = module.alb.lb_zone_id
}

output "http_tcp_listener_arns" {
  description = "The ARN of the TCP and HTTP load balancer listeners created."
  value       = module.alb.http_tcp_listener_arns
}

output "http_tcp_listener_ids" {
  description = "The IDs of the TCP and HTTP load balancer listeners created."
  value       = module.alb.http_tcp_listener_ids
}

output "https_listener_arns" {
  description = "The ARNs of the HTTPS load balancer listeners created."
  value       = module.alb.https_listener_arns
}

output "https_listener_ids" {
  description = "The IDs of the load balancer listeners created."
  value       = module.alb.https_listener_ids
}

output "target_group_arns" {
  description = "ARNs of the target groups. Useful for passing to your Auto Scaling group."
  value       = module.alb.target_group_arns
}

output "target_group_arn_suffixes" {
  description = "ARN suffixes of our target groups - can be used with CloudWatch."
  value       = module.alb.target_group_arn_suffixes
}

output "target_group_names" {
  description = "Name of the target group. Useful for passing to your CodeDeploy Deployment Group."
  value       = module.alb.target_group_names
}

output "target_group_attachments" {
  description = "ARNs of the target group attachment IDs."
  value       = module.alb.target_group_attachments
}

#-------------------------------------------------------------------------------------------------------------
output "autoscaling_group_id" {
  description = "The autoscaling group id"
  value       = try(aws_autoscaling_group.this[0].id, aws_autoscaling_group.idc[0].id, "")
}

output "autoscaling_group_name" {
  description = "The autoscaling group name"
  value       = try(aws_autoscaling_group.this[0].name, aws_autoscaling_group.idc[0].name, "")
}

output "autoscaling_group_arn" {
  description = "The ARN for this AutoScaling Group"
  value       = try(aws_autoscaling_group.this[0].arn, aws_autoscaling_group.idc[0].arn, "")
}

output "autoscaling_group_min_size" {
  description = "The minimum size of the autoscale group"
  value       = try(aws_autoscaling_group.this[0].min_size, aws_autoscaling_group.idc[0].min_size, "")
}

output "autoscaling_group_max_size" {
  description = "The maximum size of the autoscale group"
  value       = try(aws_autoscaling_group.this[0].max_size, aws_autoscaling_group.idc[0].max_size, "")
}

output "autoscaling_group_desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the group"
  value       = try(aws_autoscaling_group.this[0].desired_capacity, aws_autoscaling_group.idc[0].desired_capacity, "")
}

output "autoscaling_group_default_cooldown" {
  description = "Time between a scaling activity and the succeeding scaling activity"
  value       = try(aws_autoscaling_group.this[0].default_cooldown, aws_autoscaling_group.idc[0].default_cooldown, "")
}

output "autoscaling_group_health_check_grace_period" {
  description = "Time after instance comes into service before checking health"
  value       = try(aws_autoscaling_group.this[0].health_check_grace_period, aws_autoscaling_group.idc[0].health_check_grace_period, "")
}

output "autoscaling_group_health_check_type" {
  description = "EC2 or ELB. Controls how health checking is done"
  value       = try(aws_autoscaling_group.this[0].health_check_type, aws_autoscaling_group.idc[0].health_check_type, "")
}

output "autoscaling_group_availability_zones" {
  description = "The availability zones of the autoscale group"
  value       = try(aws_autoscaling_group.this[0].availability_zones, aws_autoscaling_group.idc[0].availability_zones, [])
}

output "autoscaling_group_vpc_zone_identifier" {
  description = "The VPC zone identifier"
  value       = try(aws_autoscaling_group.this[0].vpc_zone_identifier, aws_autoscaling_group.idc[0].vpc_zone_identifier, [])
}

output "autoscaling_group_load_balancers" {
  description = "The load balancer names associated with the autoscaling group"
  value       = try(aws_autoscaling_group.this[0].load_balancers, aws_autoscaling_group.idc[0].load_balancers, [])
}

output "autoscaling_group_target_group_arns" {
  description = "List of Target Group ARNs that apply to this AutoScaling Group"
  value       = try(aws_autoscaling_group.this[0].target_group_arns, aws_autoscaling_group.idc[0].target_group_arns, [])
}

output "autoscaling_group_enabled_metrics" {
  description = "List of metrics enabled for collection"
  value       = try(aws_autoscaling_group.this[0].enabled_metrics, aws_autoscaling_group.idc[0].enabled_metrics, [])
}
#--------------------------------------------------------------------------------------
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = module.vpc.vpc_arn
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "private_subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = module.vpc.private_subnet_arns
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = module.vpc.private_subnets_cidr_blocks
}

output "private_subnets_ipv6_cidr_blocks" {
  description = "List of IPv6 cidr_blocks of private subnets in an IPv6 enabled VPC"
  value       = module.vpc.private_subnets_ipv6_cidr_blocks
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "public_subnet_arns" {
  description = "List of ARNs of public subnets"
  value       = module.vpc.public_subnet_arns
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = module.vpc.public_subnets_cidr_blocks
}

output "public_subnets_ipv6_cidr_blocks" {
  description = "List of IPv6 cidr_blocks of public subnets in an IPv6 enabled VPC"
  value       = module.vpc.public_subnets_ipv6_cidr_blocks
}
