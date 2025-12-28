# The Child Configuration

include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "envcommon" {
  path = "${dirname(find_in_parent_folders("root.hcl"))}/_envcommon/s3-logs.hcl"
}

inputs = {
  bucket_name = "my-company-prod-logs"
}
