variable "region" {
  default = "ap-south-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-0f5ee92e2d63afc18"  # Example AMI ID, replace as needed
}

variable "db_password" {
  description = "Database password"
  sensitive   = true
}
