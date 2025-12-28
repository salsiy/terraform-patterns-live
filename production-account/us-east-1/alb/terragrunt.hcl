# The Child Configuration

include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "envcommon" {
  path = "${dirname(find_in_parent_folders("root.hcl"))}/_envcommon/alb.hcl"
}

dependency "security_group" {
  config_path = "../security-group"
}

inputs = {
  # REPLACE WITH YOUR DEFAULT VPC ID
  vpc_id          = "vpc-xxxx (Default VPC)"
  # REPLACE WITH YOUR DEFAULT SUBNET IDS
  subnets         = ["subnet-xxxx", "subnet-yyyy"]
  
  security_groups = [dependency.security_group.outputs.security_group_id]
}
