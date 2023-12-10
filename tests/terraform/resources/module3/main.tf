resource "aws_s3_bucket" "bucket_module3" {
  bucket = "tf-test-bucket3"
  acl    = "public_read"
  versioning {
    enabled = false
  }

  tags = {
    "Name"    = "bucket3"
    yor_trace = "fe52ff24-5132-47f7-90bb-5b17559c1cdc"
  }
}
