include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "envcommon" {
  path = "${dirname(find_in_parent_folders("root.hcl"))}/_envcommon/alb.hcl"
}

dependency "security_group" {
  config_path = "../security-group"

  mock_outputs = {
    security_group_id = "sg-mock-12345678"
  }
}

inputs = {
  name            = "main-alb"
  vpc_id          = "vpc-xxxx (Default VPC)"
  subnets         = ["subnet-xxxx", "subnet-yyyy"]
  security_groups = [dependency.security_group.outputs.security_group_id]
}
