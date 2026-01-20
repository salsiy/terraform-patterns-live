# The Child Configuration

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
  # REPLACE WITH YOUR DEFAULT VPC ID
  vpc_id = "vpc-xxxx (Default VPC)"
}
