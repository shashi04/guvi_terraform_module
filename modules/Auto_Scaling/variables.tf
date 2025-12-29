variable "name" {
  description = "Name prefix for Auto Scaling resources"
  type        = string
}

variable "ami" {
  description = "AMI ID for EC2 instances"
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

variable "security_groups" {
  description = "Security Group IDs for EC2 instances"
  type        = list(string)
}

variable "subnets" {
  description = "Subnet IDs where instances will be launched"
  type        = list(string)
}

variable "desired" {
  description = "Desired number of instances"
  type        = number
}

variable "min" {
  description = "Minimum number of instances"
  type        = number
}

variable "max" {
  description = "Maximum number of instances"
  type        = number
}

variable "target_group_arn" {
  description = "ALB Target Group ARN"
  type        = string
}
