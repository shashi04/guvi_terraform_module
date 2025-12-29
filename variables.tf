############################
# General
############################

variable "aws_region" {
  description = "AWS region for resource deployment"
  type        = string
}
variable "common_tags" {
  type        = map(string)
  default     = {}
}

variable "ami" {
  description = "AMI ID for EC2/ASG"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

############################
# VPC
############################
variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "azs" {
  type = list(string)
}

############################
# Security Group
############################
variable "sg_name" {
  type = string
}

variable "ingress_rules" {
  type = list(object({
    from     = number
    to       = number
    protocol = string
    cidr     = list(string)
  }))
}

############################
# S3
############################
variable "bucket_name" {
  type = string
}

variable "s3_versioning" {
  type    = bool
  default = true
}

variable "s3_force_destroy" {
  type    = bool
  default = false
}

############################
# ALB
############################
variable "alb_name" {
  type = string
}

############################
# Auto Scaling
############################
variable "asg_name" {
  type = string
}

variable "asg_desired" {
  type = number
}

variable "asg_min" {
  type = number
}

variable "asg_max" {
  type = number
}

############################
# EC2 (Optional)
############################
variable "create_standalone_ec2" {
  description = "Whether to create a standalone EC2"
  type        = bool
  default     = false
}

variable "ec2_name" {
  type    = string
  default = "standalone-ec2"
}
