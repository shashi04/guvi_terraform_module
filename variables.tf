variable "region" {
  default = "ap-south-1"
}

variable "instance_type" {
  description = "EC2 instance type for non-production environments"
  default = "t2.micro"

  validation {
    condition = can(regex("t3|t2", var.instance_type))
    error_message = "Instance type must be either t2 or t3 family."
  }
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-0f5ee92e2d63afc18"  # Example AMI ID, replace as needed
}

variable "db_password" {
  description = "Database password"
  sensitive   = true
}
