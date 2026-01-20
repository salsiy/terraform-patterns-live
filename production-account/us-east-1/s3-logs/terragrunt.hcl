# The Child Configuration

terraform {
  source = "git::https://github.com/salsiy/terraform-patterns-modules.git//s3-private?ref=s3-private-v0.1.0"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "envcommon" {
  path = "${dirname(find_in_parent_folders("root.hcl"))}/_envcommon/s3-logs.hcl"
}

inputs = {
  bucket_name = "my-company-prod-logs"
}
