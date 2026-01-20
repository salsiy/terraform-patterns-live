terraform {
  source = "git::https://github.com/salsiy/terraform-patterns-modules.git//security-group?ref=security-group-v0.1.0"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "envcommon" {
  path = "${dirname(find_in_parent_folders("root.hcl"))}/_envcommon/security-group.hcl"
}

inputs = {
  name   = "alb-sg"
  vpc_id = "vpc-xxxx (Default VPC)"
  
  ingress_rules = ["http-80-tcp", "https-443-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
}
