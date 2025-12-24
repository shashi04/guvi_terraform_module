provider "aws" {
  region = var.region
}

locals {
  env = terraform.workspace
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

module "vpc" {
  source = "./modules/vpc"
  env    = local.env
}

module "ec2" {
  source        = "./modules/ec2"
  env           = local.env
  subnet_id     = module.vpc.public_subnet_id
  instance_type = local.env == "prod" ? "t3.large" : var.instance_type
}
