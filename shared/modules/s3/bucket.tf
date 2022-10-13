resource "aws_s3_bucket" "main" {
  bucket = var.bucket.name
}

resource "aws_s3_bucket_policy" "main" {
  count  = var.bucket.policy == "" ? 0 : 1
  bucket = aws_s3_bucket.main.id

  policy = var.bucket.policy
}

resource "aws_s3_bucket_acl" "main" {
  bucket = aws_s3_bucket.main.id

  acl = var.bucket.acl
}

resource "aws_s3_bucket_public_access_block" "main" {
  bucket = aws_s3_bucket.main.id

  block_public_acls       = var.bucket.acl != "public-read"
  block_public_policy     = var.bucket.acl != "public-read"
  ignore_public_acls      = var.bucket.acl != "public-read"
  restrict_public_buckets = var.bucket.acl != "public-read"
}

resource "aws_s3_bucket_versioning" "main" {
  bucket = aws_s3_bucket.main.id

  versioning_configuration {
    status = var.bucket.versioning_status
  }
}

resource "aws_s3_bucket_notification" "main" {
  bucket      = aws_s3_bucket.main.id
  eventbridge = var.bucket.notify_eventbridge
}

resource "aws_s3_bucket_lifecycle_configuration" "main" {
  count  = var.bucket.lifecycle != null ? 1 : 0
  bucket = aws_s3_bucket.main.id

  rule {
    id = var.bucket.lifecycle.name
    filter {
      prefix = var.bucket.lifecycle.prefix
    }
    expiration {
      days = var.bucket.lifecycle.expiration_days
    }
    status = "Enabled"
  }
}
