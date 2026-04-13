# Show bucket information after creation
output "bucket_name" {
  description = "show bucket name"
  value       = aws_s3_bucket.tf_bucket.id
}

# Show bucket arn
output "bucket_arn" {
  description = "show bucket arn"
  value       = aws_s3_bucket.tf_bucket.arn
}

# Show bucket domain
output "bucket_domain" {
  description = "shown bucket domain name"
  value       = aws_s3_bucket.tf_bucket.bucket_domain_name
}

# Get dynamodb
# output "dynamo_table_name" {
#   value = aws_dynamodb_table.terraform_locks.name
# }