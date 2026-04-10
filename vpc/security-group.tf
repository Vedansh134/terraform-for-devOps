# create a security group
resource "aws_security_group" "tf-server-sg" {
  name        = "terraform-sg"
  description = "This allows http and ssh access"
  vpc_id      = aws_vpc.vpc_test.id

  # Inbound rule : allow SSH from anywhere (0.0.0.0/0)
  ingress {
    description = "ssh from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Inbound rule : allow http access
  ingress {
    description = "allow http to your server"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rule: allow all traffic to anywhere (required for the instance to reach the internet)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    server = "testing"
  }
}
