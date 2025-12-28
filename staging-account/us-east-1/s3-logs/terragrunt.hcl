# The Child Configuration

# 1. Inherit settings from root
include "root" {
  path = find_in_parent_folders("root.hcl")
}

# 2. Point to the specific Module Version
include "envcommon" {
  path = "${dirname(find_in_parent_folders("root.hcl"))}/_envcommon/s3-logs.hcl"
}

# 3. Pass in Environment-Specific Variables
inputs = {
  bucket_name = "my-company-prod-logs"
  versioning  = true
}
