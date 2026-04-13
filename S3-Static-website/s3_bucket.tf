# create a unique name for the bucket using random_id resource
resource "random_id" "s3_unique_name" {
  byte_length = 4
}

# Creates an s3 bucket
resource "aws_s3_bucket" "my_static_website_bucket" {
  bucket = "web-bucket-${random_id.s3_unique_name.hex}"

  tags = {
    name        = "my-static-website-bucket"
    environment = "learning"
  }
}

# Enable public access (for static website hosting)
resource "aws_s3_bucket_public_access_block" "static_website_policy" {
  bucket = aws_s3_bucket.my_static_website_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}