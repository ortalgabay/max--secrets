resource aws_s3_bucket "test-bucket" {
  name = "test-bucket"
  tags = {
    yor_trace = "49c23913-238c-44c1-a4bf-ee6551f99409"
  }
}

resource tls_private_key "pem" {
  algorithm = "some-algo"
}