terraform {
  # source = "git::https://github.com/YOUR_ORG/terraform-patterns-modules.git//s3-logs?ref=v1.0.0"
  source = "../../../../terraform-patterns-modules//s3-private"
}

inputs = {
  versioning = true
}
