# public subnet
resource "aws_subnet" "public_subnet" {
  cidr_block              = "10.0.1.0/24"
  vpc_id                  = aws_vpc.vpc_test.id
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true # Auto-assign public IPs

  tags = {
    Name = "public-subnet"
    env  = "test"
  }
}

# private subnet
resource "aws_subnet" "private_subnet" {
  cidr_block        = "10.0.2.0/24"
  vpc_id            = aws_vpc.vpc_test.id
  availability_zone = "ap-south-1b" # Different AZ for high availability

  tags = {
    Name = "private-subnet"
    env  = "test"
  }
}