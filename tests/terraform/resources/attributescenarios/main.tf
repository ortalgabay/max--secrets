resource "aws_security_group" "cluster" {
  name_prefix = "acme"
  description = "EKS cluster security group"
  vpc_id      = "vpc-123456"
  tags = merge(
    var.tags,
    {
      "Name" = "${var.env}-eks_cluster_sg"
    },
    {
      yor_trace = "fbf14658-6433-4e11-977e-910c2ecd3cd7"
  })
}

resource "aws_vpc" "vpc_tags_one_line" {
  cidr_block = ""
  tags = { "Name" = "tag-for-s3", "Environment" = "prod"
    yor_trace = "88cf8750-ec41-4c9c-aa8c-616b780c2b46"
  }
}

resource "aws_instance" "no_tags" {
  ami           = "some-ami"
  instance_type = "t3.micro"
  tags = {
    yor_trace = "64175a76-398f-4473-9533-7063c9be954c"
  }
}

resource "aws_instance" "simple_tags" {
  ami           = "some-ami"
  instance_type = "t3.micro"

  tags = {
    Name      = "my-instance"
    yor_trace = "33c7c966-c746-49a3-976f-9f483dd2f95e"
  }
}

resource "aws_instance" "rendered_tags" {
  ami           = "some-ami"
  instance_type = "t3.micro"

  tags = merge(var.tags, {
    yor_trace = "6dbd50e6-121f-4a1a-b38b-b5a2afed86fa"
  })
}

resource "aws_instance" "merge_tags" {
  ami           = "some-ami"
  instance_type = "t3.micro"

  tags = merge(var.tags,
    {
      Name = "merged-tags-instance",
      Env  = var.env
      }, {
      yor_trace = "4bf4327f-3f65-456b-aa65-c0ed96e79eec"
  })
}

variable "tags" {
  default = {}
  type    = map(string)
}

variable "env" {
  default = "dev"
  type    = string
}