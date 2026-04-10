# create ec2 from our vpc
resource "aws_instance" "test_vpc_ec2" {
  ami           = "ami-0f559c3642608c138"
  instance_type = "t2.micro"

  key_name                    = "mumbai-key-new"
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.tf-server-sg.id]
  associate_public_ip_address = true

  tags = {
    Name : "nginx-server"
    env : "test"
  }

  # Simple user data to install web server
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum amazon-linux-extras install nginx1 -y
    sudo systemctl start nginx
    sudo systemctl enable nginx
  EOF

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
    tags = {
      Name = "test-server-root-volume"
    }
  }
}