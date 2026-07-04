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

  validation {
    condition = contains(["t2.micro", "t2.small", "t2.medium", "t3.micro", "t3.small", "t3.medium"], var.instance_type)
    error_message = "Invalid instance type. Allowed values are: t2.micro, t2.small, t2.medium, t3.micro, t3.small, t3.medium"
  }
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

variable "ec2_count" {
  description = "Number of standalone EC2 instances to create"
  type        = number
  default     = 1
}

variable "ec2_name" {
  type    = string
  default = "standalone-ec2"
}
