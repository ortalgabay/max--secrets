resource "aws_s3_bucket" "bucket_module2" {
  bucket = "tf-test-bucket2"
  acl    = "public_read"
  versioning {
    enabled = false
  }

  tags = {
    "Name"    = "bucket2"
    yor_trace = "59e65e7f-0ac3-485c-aee3-4fc4fdd18f52"
  }
}

module "moduleRef2" {
  source = "../module3"
}
