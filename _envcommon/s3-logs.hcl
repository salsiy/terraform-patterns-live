terraform {
  source = "git::https://github.com/salsiy/terraform-patterns-modules.git//s3-private?ref=s3-private-v0.1.0"
}

inputs = {
  versioning = true
}
