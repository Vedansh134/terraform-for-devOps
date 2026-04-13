# bucket name
output "bucket_name" {
  description = "s3 bucket name"
  value       = aws_s3_bucket.my_static_website_bucket.id
}

# bucket arn
output "bucket_arn" {
  description = "s3 bucket arn"
  value       = aws_s3_bucket.my_static_website_bucket.arn
}

# static website endpoint
output "website_url" {
  description = "s3 bucket static website endpoint"
  value       = "http://${aws_s3_bucket_website_configuration.static_website.website_endpoint}"
}
