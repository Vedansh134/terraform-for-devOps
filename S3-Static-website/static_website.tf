# define static website
resource "aws_s3_bucket_website_configuration" "static_website" {
  bucket = aws_s3_bucket.my_static_website_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}