resource "aws_s3_bucket" "bucket_module1" {
  bucket = "tf-test-bucket-destination-12345"
  acl    = "private"
  versioning {
    enabled = false
  }
  tags = {
    yor_trace = "6dbbffcb-04cf-4464-be2a-b5abd0091f7b"
  }
}

module "moduleRef" {
  source = "../module2"
}
