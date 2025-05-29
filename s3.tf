resource "random_id" "bucket_name" {
  byte_length = 4
}

resource "aws_s3_bucket" "static_website_bucket" {
  bucket = "my-static-website-bucket-${random_id.bucket_name.hex}"
}

resource "aws_s3_bucket_public_access_block" "static_website" {
  bucket = aws_s3_bucket.static_website_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "static_website_public_read" {
  bucket = aws_s3_bucket.static_website_bucket.id

  # This is the policy that allows public read access to the objects in the S3 bucket.
  # The function jsonencode is used to convert the policy into a JSON string.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.static_website_bucket.arn}/*"
      }
    ]
  })
}

resource "aws_s3_bucket_website_configuration" "my_static_website" {
  bucket = aws_s3_bucket.static_website_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}
resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.static_website_bucket.id
  key          = "index.html"
  source       = "build/index.html"
  etag         = filemd5("build/index.html")
  content_type = "text/html"
}
resource "aws_s3_object" "error_html" {
  bucket       = aws_s3_bucket.static_website_bucket.id
  key          = "error.html"
  source       = "build/error.html"
  etag         = filemd5("build/error.html")
  content_type = "text/html"
}