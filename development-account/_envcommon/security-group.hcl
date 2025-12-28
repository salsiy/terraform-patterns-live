terraform {
  source = "git::https://github.com/salsiy/terraform-patterns-modules.git//security-group?ref=v0.1.0"
}

inputs = {
  name = "alb-sg"
  ingress_rules = ["http-80-tcp", "https-443-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
}
