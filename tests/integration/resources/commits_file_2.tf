


resource "aws_s3_bucket" "f2" {
  # bucket is not encrypted
  # bucket does not have access logs
  # bucket does not have versioning
  bucket        = "yor-test-2"
  acl           = "private"
  force_destroy = true

  tags = {
    yor_trace = "f69aa5b7-4ee3-46d8-b3a4-bb241405ebf2"
  }
}