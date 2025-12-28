terraform {
  # source = "git::https://github.com/YOUR_ORG/terraform-patterns-modules.git//security-group?ref=v1.0.0"
  source = "../../../../terraform-patterns-modules//security-group"
}

inputs = {
  name = "alb-sg"
  ingress_rules = ["http-80-tcp", "https-443-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
}
