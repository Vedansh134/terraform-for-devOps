# get vpc id
output "vpc_id" {
  description = "vpc id"
  value       = aws_vpc.vpc_test.id
}

# get public subnet id
output "public_subnet" {
  description = "public subnet id"
  value       = aws_subnet.public_subnet.id
}

# get private subnet ip
output "private_subnet_id" {
  description = "private subnet ip"
  value       = aws_subnet.private_subnet.id
}

# get server public link
output "ec2_server_link" {
  description = "get ec2 server nginx link"
  value       = "http://${aws_instance.test_vpc_ec2.public_ip}"
}