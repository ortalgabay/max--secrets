


resource "aws_s3_bucket" "f2" {
  # bucket is not encrypted
  # bucket does not have access logs
  # bucket does not have versioning
  bucket = "yor-test-2"
  acl = "private"
  force_destroy = true

}

resource "aws_s3_bucket" "f2_log_bucket" {
  bucket = "f2-log-bucket"
}

resource "aws_s3_bucket_logging" "f2" {
  bucket = aws_s3_bucket.f2.id

  target_bucket = aws_s3_bucket.f2_log_bucket.id
  target_prefix = "log/"
}