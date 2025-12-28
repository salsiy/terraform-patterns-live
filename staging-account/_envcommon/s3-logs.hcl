terraform {
  source = "git::https://github.com/salsiy/terraform-patterns-modules.git//s3-private?ref=v0.1.0"
}

inputs = {
  versioning = true
}
