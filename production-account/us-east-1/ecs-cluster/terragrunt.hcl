include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "envcommon" {
  path = "${dirname(find_in_parent_folders("root.hcl"))}/_envcommon/ecs-cluster.hcl"
}

inputs = {
  env_name     = "production"

  services = {
    app-service = {
      cpu    = 256
      memory = 512

      # Container Definition
      container_definitions = {
        app = {
          cpu       = 256
          memory    = 512
          essential = true
          image     = "nginx:latest"
          port_mappings = [
            {
              name          = "http"
              containerPort = 80
              protocol      = "tcp"
            }
          ]
        }
      }

      subnet_ids = [] # Replace with actual subnets
      
      # Network Configuration
      network_mode = "awsvpc"
      launch_type  = "FARGATE"
    }
  }
}
