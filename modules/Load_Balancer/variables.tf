variable "name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the ALB will be created"
  type        = string
}

variable "subnets" {
  description = "List of public subnet IDs for the ALB"
  type        = list(string)
}

variable "security_groups" {
  description = "Security Group IDs attached to the ALB"
  type        = list(string)
}

variable "listener_port" {
  description = "Port on which ALB listens (HTTP)"
  type        = number
  default     = 80
}

variable "target_port" {
  description = "Port on which targets receive traffic"
  type        = number
  default     = 80
}

variable "target_protocol" {
  description = "Protocol used by target group"
  type        = string
  default     = "HTTP"
}
