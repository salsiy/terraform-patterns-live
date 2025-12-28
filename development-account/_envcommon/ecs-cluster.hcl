terraform {
  source = "git::https://github.com/salsiy/terraform-patterns-modules.git//ecs-cluster?ref=v0.1.0"
}

inputs = {
  # These are placeholders for the example logic.
  # In a real scenario, these might come from dependency outputs or specific child configs.
  service_name = "example-service"
  cluster_arn  = "arn:aws:ecs:us-east-1:123456789012:cluster/main"
  
  container_definitions = {
    main = {
      image  = "nginx:latest"
      cpu    = 256
      memory = 512
      portMappings = [{
        containerPort = 80
        hostPort      = 80
        protocol      = "tcp"
      }]
    }
  }

  subnet_ids = ["subnet-mock-1", "subnet-mock-2"]
}
