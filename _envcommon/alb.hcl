terraform {
  source = "git::https://github.com/salsiy/terraform-patterns-modules.git//alb?ref=alb-v0.1.0"
}

inputs = {
  name = "main-alb"
}
