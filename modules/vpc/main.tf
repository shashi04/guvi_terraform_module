resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "${var.env}-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.env}-public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = "10.0.10.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.env}-private-subnet"
  }
}
