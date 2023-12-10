module "tfe_module" {
  source = "app.terraform.io/path/to/module/aws"
  tags = {
    Application = "application"
    Env         = var.env
    yor_trace   = "0c0dcbae-198a-47e6-afa1-3347dd4ffaca"
  }
}