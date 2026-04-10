# define vpc
resource "aws_vpc" "vpc_test" {
  cidr_block           = "10.0.0.0/16" # 65,536 IP addresses
  enable_dns_hostnames = true          # Give instances DNS names
  enable_dns_support   = true          # Enable DNS resolution

  tags = {
    Name = "vpc-test"
    env  = "test"
  }
}

# define internet gateway
resource "aws_internet_gateway" "test_igw" {
  vpc_id = aws_vpc.vpc_test.id

  tags = {
    Name = "vpc-igw-test"
    env  = "test"
  }
}