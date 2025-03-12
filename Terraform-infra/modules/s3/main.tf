resource "aws_s3_bucket" "static_content" {
  bucket = var.bucket_name
  acl    = "private"
}
