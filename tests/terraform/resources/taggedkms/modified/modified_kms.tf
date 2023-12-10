resource "aws_kms_key" "logs_key" {
  # key does not have rotation enabled
  description = "modified_description"

  deletion_window_in_days = 7
  tags = {
    yor_trace = "31561a20-a79c-4943-a5df-8192c3103465"
  }
}

resource "aws_kms_alias" "logs_key_alias" {
  name          = "alias/${local.resource_prefix.value}-logs-bucket-key"
  target_key_id = "${aws_kms_key.logs_key.key_id}"
}
