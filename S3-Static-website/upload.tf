# Upload a html file to s3 bucket
resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.my_static_website_bucket.id
  key          = "index.html"
  source       = "C:\\Users\\kumar.vedansh\\Desktop\\terraform-for-devOps\\S3-Static-website\\static_website\\index.html"
  content_type = "text/html"
}

# Upload a css file to s3 bucket
resource "aws_s3_object" "style_css" {
  bucket       = aws_s3_bucket.my_static_website_bucket.id
  key          = "style.css"
  source       = "C:\\Users\\kumar.vedansh\\Desktop\\terraform-for-devOps\\S3-Static-website\\static_website\\style.css"
  content_type = "text/css"
}