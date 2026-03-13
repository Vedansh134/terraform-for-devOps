# define outputs
output "public_ip" {
  description = "public ip of ec2"
  value       = aws_instance.testing-server.public_ip
}

# Output the URL to access Nginx
output "nginx_url" {
  description = "URL to access Nginx"
  value       = "http://${aws_instance.testing-server.public_ip}"
}