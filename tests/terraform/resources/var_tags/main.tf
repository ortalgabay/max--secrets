provider "aws" {
  region  = "us-east-1"
  profile = "dev2"
  version = "3.27"
}

resource "aws_s3_bucket" "bucket_with_var" {
  bucket = "tf-test-bucket-destination-12345"
  acl    = "private"
  versioning {
    enabled = false
  }

  tags = merge(var.bucket_tags, {
    yor_trace = "2cdb560a-2963-4759-a677-14039b50dfa1"
  })
}
