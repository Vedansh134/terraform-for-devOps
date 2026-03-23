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
resource "aws_instance" "testing_server" {
  #ami           = "ami-0f559c3642608c138"
  ami           = var.ami
  instance_type = var.instance_type

  # key_name = aws_key_pair.mumbai_key.key_name
  # OR if you're not creating the key in Terraform, use:
  key_name = "mumbai-key-new"

  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.tf-server-sg.id]
  user_data                   = local.user_data_script

  tags = merge(var.additional_tags, {
      Name = "testing-server-tf-apsouth" # This is the EC2 instance name in AWS
  })

root_block_device {
    volume_size = var.ec2_root_block_config.var_size
    volume_type = var.ec2_root_block_config.var_type
    delete_on_termination = true
    tags = {
      Name = "test-server-root-volume"
    }
  }
}
