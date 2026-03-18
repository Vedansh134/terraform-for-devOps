# currently state trackking is local, but in production we should use remote state management like S3 
# or Terraform Cloud, so put them this file remotely so anyone can access it and works easily.

# create a unique name for the bucket using random_id resource
resource "random_id" "s3_unique_name" {
  byte_length = 4
}

# Creates an s3 bucket
resource "aws_s3_bucket" "tf_bucket" {
  bucket = "my-sample-bucket-${random_id.s3_unique_name.hex}"

  # Prevent accidental deletion
  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = "My First S3 Bucket"
    Environment = "learning"
  }
}

# Block public access (security best practice)
resource "aws_s3_bucket_public_access_block" "bucket_policy" {
  bucket = aws_s3_bucket.tf_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# enable versioning
resource "aws_s3_bucket_versioning" "tf_s3_version" {
  bucket = aws_s3_bucket.tf_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

