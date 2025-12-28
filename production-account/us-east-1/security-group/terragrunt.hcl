# The Child Configuration

include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "envcommon" {
  path = "${dirname(find_in_parent_folders("account.hcl"))}/_envcommon/security-group.hcl"
}

inputs = {
  # REPLACE WITH YOUR DEFAULT VPC ID
  vpc_id = "vpc-xxxx (Default VPC)"
}
