provider "aws" {

}

resource "aws_s3_bucket" "financials" {
  # bucket is not encrypted
  # bucket does not have access logs
  # bucket does not have versioning
  bucket        = "yor-test-1"
  acl           = "private"
  force_destroy = true

  tags = {
    yor_trace = "6d3b0f61-33a8-46a2-8545-3be8ad671fdd"
  }
}