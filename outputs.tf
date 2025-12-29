############################
# VPC Outputs
############################
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

############################
# Security Group
############################
output "security_group_id" {
  value = module.web_sg.sg_id
}

############################
# Load Balancer
############################
output "alb_target_group_arn" {
  value = module.alb.target_group_arn
}

############################
# Auto Scaling
############################
output "asg_name" {
  value = module.asg.name
}

############################
# S3
############################
output "s3_bucket_name" {
  value = module.s3.bucket_name
}

############################
# EC2 (Optional)
############################
output "ec2_instance_id" {
  value       = try(module.ec2[0].instance_id, null)
  description = "Standalone EC2 instance ID"
}
output "ec2_public_ip" {
  value       = try(module.ec2[0].public_ip, null)
  description = "Standalone EC2 instance Public IP"
}