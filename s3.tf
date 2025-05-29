resource "random_id" "bucket_name" {
  byte_length = 4
}

resource "aws_s3_bucket" "static_website_bucket" {
  bucket = "my-static-website-bucket-${random_id.bucket_name.hex}"
}