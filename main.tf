provider "aws" {
  region = var.region
}

locals {
  env = terraform.workspace
}

# DynmoDB Table for State Locking
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

# Refeerencing the VPC module
module "vpc" {
  source = "./modules/vpc"
  env    = local.env
}

# Referencing the EC2 module with conditional instance type

module "ec2" {  
  source        = "./modules/ec2"
  env           = local.env
  subnet_id     = module.vpc.public_subnet_id
  ami_id        = var.ami_id
  instance_type = local.env == "prod" ? "t3.large" : var.instance_type
}
