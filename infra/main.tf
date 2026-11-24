terraform { required_version = ">= 1.5" }

variable "release" { default = "dev" }

resource "local_file" "app_config" {
  filename = "${path.module}/out/app-config.json"
  content  = jsonencode({ release = var.release, replicas = 3 })
}

resource "null_resource" "deploy_marker" {
  triggers = { release = var.release }
}
