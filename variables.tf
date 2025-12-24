variable "region" {
  default = "ap-south-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "db_password" {
  description = "Database password"
  sensitive   = true
}
