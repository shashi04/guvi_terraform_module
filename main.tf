############################
# VPC
############################
module "vpc" {
  source = "../../modules/vpc"

  name           = var.vpc_name
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
  azs            = var.azs
}

############################
# Security Group
############################
module "web_sg" {
  source = "../../modules/security-group"

  name   = var.sg_name
  vpc_id = module.vpc.vpc_id

  ingress_rules = var.ingress_rules
}

############################
# S3
############################
module "s3" {
  source = "../../modules/s3"

  bucket_name   = var.bucket_name
  versioning    = var.s3_versioning
  force_destroy = var.s3_force_destroy
  tags          = var.common_tags
}

############################
# Load Balancer (ALB)
############################
module "alb" {
  source = "../../modules/alb"

  name            = var.alb_name
  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.public_subnet_ids
  security_groups = [module.web_sg.sg_id]
}

############################
# Auto Scaling Group
############################
module "asg" {
  source = "../../modules/autoscaling"

  name              = var.asg_name
  ami               = var.ami
  instance_type     = var.instance_type
  key_name          = var.key_name
  security_groups   = [module.web_sg.sg_id]
  subnets           = module.vpc.public_subnet_ids
  desired           = var.asg_desired
  min               = var.asg_min
  max               = var.asg_max
  target_group_arn = module.alb.target_group_arn
}

############################
# Optional Standalone EC2
############################
module "ec2" {
  source = "../../modules/ec2"
  count  = var.create_standalone_ec2 ? 1 : 0

  name            = var.ec2_name
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = module.vpc.public_subnet_ids[0]
  security_groups = [module.web_sg.sg_id]
  key_name        = var.key_name
}
############################