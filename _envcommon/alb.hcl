terraform {
  # source = "git::https://github.com/YOUR_ORG/terraform-patterns-modules.git//alb?ref=v1.0.0"
  source = "../../../../terraform-patterns-modules//alb"
}

inputs = {
  name = "main-alb"
}
