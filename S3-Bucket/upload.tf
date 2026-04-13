# upload a object to s3 bucket
resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.tf_bucket.id
  key    = "index.html"
  source = "C:\\Users\\kumar.vedansh\\Desktop\\terraform-for-devOps\\S3-Bucket\\personal.txt"
}