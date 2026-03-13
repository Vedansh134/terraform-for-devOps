# Get the default VPC
data "aws_vpc" "default" {
  default = true # fetch default vpc automatically
}

# User data script
locals {
  user_data_script = <<-EOF
  #!/bin/bash
  apt update -y
  apt install nginx -y
  systemctl start nginx
  systemctl enable nginx
  EOF  
}

# Create a ec2 instance
resource "aws_instance" "testing-server" {
  ami           = "ami-019715e0d74f695be"
  instance_type = "t2.micro"

  # key_name = aws_key_pair.mumbai_key.key_name
  # OR if you're not creating the key in Terraform, use:
  key_name = "mumbai-key-new"

  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.tf-server-sg.id]
  user_data = local.user_data_script

  tags = {
    Name = "testing-server-tf-apsouth" # This is the EC2 instance name in AWS
    app  = "test-server"
  }

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
    tags = {
      Name = "test-server-root-volume"
    }
  }
}
