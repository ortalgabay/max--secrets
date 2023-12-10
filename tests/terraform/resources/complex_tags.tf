resource "aws_instance" "many_instance_tags" {
  ami           = ""
  instance_type = ""
  tags = merge({ "Name" = "tag-for-instance", "Environment" = "prod" },
    { "Owner" = "bridgecrew"
    },
    { "yor_trace" = "4329587194",
  "git_org" = "bana" })
}

resource "aws_alb" "alb_with_merged_tags" {
  tags = merge({ "Name" = "tag-for-alb", "Environment" = "prod" },
    { "yor_trace" = "4329587194",
  "git_org" = "bana" })
}

resource "aws_vpc" "vpc_tags_one_line" {
  cidr_block = ""
  tags = { "Name" = "tag-for-s3", "Environment" = "prod"
    yor_trace = "8f308906-9922-4edb-835f-ede771a965a2"
  }
}

resource "aws_s3_bucket" "bucket_var_tags" {
  tags = merge(var.tags, {
    yor_trace = "004e7187-f4a2-4cb0-a58a-a437524980e9"
  })
}

variable "tags" {
  default = {
    "Name"        = "tag-for-s3"
    "Environment" = "prod"
  }
}

resource "aws_instance" "instance_merged_var" {
  ami           = ""
  instance_type = ""
  tags = merge(var.tags,
    { "yor_trace" = "4329587194",
  "git_org" = "bana" })
}

variable "new_env_tag" {
  default = {
    "Environment" = "old_env"
  }
}

resource "aws_instance" "instance_merged_override" {
  ami           = ""
  instance_type = ""
  tags = merge(var.new_env_tag, { "Environment" = "new_env" }, {
    yor_trace = "e6ca55c1-661f-4d23-9975-c8dfd4a487cb"
  })
}

resource "aws_instance" "instance_empty_tag" {
  ami           = ""
  instance_type = ""
  tags = {
    yor_trace = "9ddbf0fe-5fc4-4299-b4f4-48fe3ec68b77"
  }
}

resource "aws_instance" "instance_no_tags" {
  ami           = ""
  instance_type = ""
  tags = {
    yor_trace = "286704c4-b66d-4ae0-a0fa-ddd57e5675ca"
  }
}

resource "aws_instance" "instance_null_tags" {
  ami           = ""
  instance_type = ""
  tags = {
    yor_trace = "cda8f803-9c27-47b4-a794-8aa898b3e6aa"
  }
}

resource "aws_autoscaling_group" "autoscaling_group_tagged" {
  // This resource should not be tagged
  tag {
    key                 = "Name"
    propagate_at_launch = false
    value               = "Mine"
  }
  max_size = 0
  min_size = 0
}

resource "aws_autoscaling_group" "autoscaling_group" {
  // This resource should not be tagged as well
  max_size = 0
  min_size = 0
}