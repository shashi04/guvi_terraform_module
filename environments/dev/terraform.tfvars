aws_region = "ap-south-1"

vpc_name = "dev-vpc"
vpc_cidr = "10.0.0.0/16"

public_subnets = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

azs = [
  "ap-south-1a",
  "ap-south-1b"
]

ami           = "ami-0abcdef12345"
instance_type = "t3.micro"
key_name      = "dev-key"

asg_name    = "dev-asg"
asg_min     = 1
asg_max     = 2
asg_desired = 1

alb_name = "dev-alb"

bucket_name = "dev-terraform-demo-bucket-123"

sg_name = "dev-web-sg"

ingress_rules = [
  {
    from     = 80
    to       = 80
    protocol = "tcp"
    cidr     = ["0.0.0.0/0"]
  }
]
