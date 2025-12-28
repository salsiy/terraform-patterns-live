# Terraform Patterns Live

This repository contains the live infrastructure configurations, managed by **Terragrunt**.

## Directory Structure

- **root.hcl**: The parent configuration. Generates provider and backend configuration.
- **tags.yaml**: Global tags applied to all resources.
- **_envcommon/**: DRY configurations. Contains the module source and common inputs for every stack.
- **[account-name]/[region]/[env]/**: The live environments.

## How to Add a New Environment

1. Create the directory structure (e.g., `staging-account/us-east-1/stage`).
2. Copy the `terragrunt.hcl` files from an existing environment.
3. Update specific inputs (like `env_name`, `vpc_id` placeholders).
4. Run `terragrunt apply`.

## DRY Pattern

We use the `_envcommon` pattern.
Child `terragrunt.hcl` files look like this:

```hcl
include "root" {
  path = find_in_parent_folders("root.hcl")
}

# Inherit module source and common variables
include "envcommon" {
  path = "${dirname(find_in_parent_folders("root.hcl"))}/_envcommon/ecs-cluster.hcl"
}

inputs = {
  # Only override what is different for this environment
  env_name = "production"
}
```