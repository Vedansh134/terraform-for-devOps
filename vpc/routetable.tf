# define route table
resource "aws_route_table" "vpc_test_rt" {
  vpc_id = aws_vpc.vpc_test.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test_igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

# public subnet - route table association
resource "aws_route_table_association" "public_rt_ass" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.vpc_test_rt.id
}

# # gateway - route table association
# resource "aws_route_table_association" "gtw_rt_ass" {
#   gateway_id = aws_internet_gateway.test_igw.id
#   route_table_id = aws_route_table.vpc_test_rt.id
# }