# The Child Configuration

include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "envcommon" {
  path = "${dirname(find_in_parent_folders("root.hcl"))}/_envcommon/alb.hcl"
}

# VPC Dependency Removed - Using Default VPC
# dependency "vpc" {
#   config_path = "../vpc"
# }

dependency "security_group" {
  config_path = "../security-group"

  mock_outputs = {
    security_group_id = "sg-mock-12345678"
  }
}

inputs = {
  name            = "main-alb"
  # REPLACE WITH YOUR DEFAULT VPC ID
  vpc_id          = "vpc-xxxx (Default VPC)"
  # REPLACE WITH YOUR DEFAULT SUBNET IDS
  subnets         = ["subnet-xxxx", "subnet-yyyy"]
  
  security_groups = [dependency.security_group.outputs.security_group_id]
}
