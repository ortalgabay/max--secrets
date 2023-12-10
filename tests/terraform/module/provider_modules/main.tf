module "project-factory" {
  source  = "terraform-google-modules/project-factory/google"
  version = "11.0.0"
  labels = {
    test      = "true"
    yor_trace = "3a9a6c15-dff1-4cfc-ba77-825db8f6a3a3"
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.2.0"
  tags = {
    test      = "true"
    yor_trace = "713ac2cf-9008-4190-9014-6742440a0a9b"
  }
}

module "project-factory_github" {
  source = "github.com/terraform-google-modules/terraform-google-project-factory"
  labels = {
    test      = "true"
    yor_trace = "b0b5cc82-2f84-42f6-a7af-1a1564dc31d0"
  }
}

module "project-factory_git" {
  source = "git@github.com:terraform-google-modules/terraform-google-project-factory.git"
  labels = {
    test      = "true"
    yor_trace = "2165880f-0132-4ab1-b310-0a8366be542c"
  }
}

module "caf" {
  source = "aztfmod/caf/azurerm"
  tags = {
    test      = "true"
    yor_trace = "3994fa3b-47cf-4564-a60a-c2a3f9a7ea0c"
  }
}

module "caf" {
  source = "git@github.com:aztfmod/terraform-azurerm-caf.git"
  tags = {
    test      = "true"
    yor_trace = "3994fa3b-47cf-4564-a60a-c2a3f9a7ea0c"
  }
}

module "bastion" {
  source = "oracle-terraform-modules/bastion/oci"
  freeform_tags = {
    test      = "true"
    yor_trace = "fdac3db6-27a5-4688-8482-091be7074eb5"
  }
}

module "run-common_logs" {
  // Tags attribute is extra_tags
  source  = "claranet/run-common/azurerm//modules/logs"
  version = "3.0.0"
  extra_tags = {
    test      = "true"
    yor_trace = "18041af9-b68b-401e-aa8c-35316d10a676"
  }
}