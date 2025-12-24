output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "environment" {
  value = terraform.workspace
}
