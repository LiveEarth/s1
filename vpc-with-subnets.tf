# VPC with optimized CIDR block that is large enough to accommodate the desired number of resources, but not too large to waste IP addresses.
# Here we have assigned a pool of 512 IP addresses
resource "aws_vpc" "myapp_vpc" {
  cidr_block = "10.0.0.0/23"
  tags = {
    Name = "myapp-vpc"
  }
}

# Creating 1st public subnet with 32 IPs
resource "aws_subnet" "public_subnet_1a" {
  vpc_id                  = aws_vpc.myapp_vpc.id
  cidr_block              = "10.0.0.0/27"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
}

# Creating 2nd public subnet with 32 IPs
resource "aws_subnet" "public_subnet_1b" {
  vpc_id                  = aws_vpc.myapp_vpc.id
  cidr_block              = "10.0.0.32/27"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"
}

# Creating 1st private subnet with 32 IPs
resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.myapp_vpc.id
  cidr_block              = "10.0.1.0/27"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1b"
}