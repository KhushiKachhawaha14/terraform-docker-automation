# --- Configure the Docker Provider ---
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1" 
    }
  }
}

provider "docker" {}

# 1. Pull the Nginx image
resource "docker_image" "nginx_image" {
  name         = "nginx:latest"
  keep_locally = false # Changed to false so your machine stays clean after destroy
}

# 2. Create and run the Nginx container
resource "docker_container" "web_container" {
  name  = "terraform-nginx-web-server"
  image = docker_image.nginx_image.image_id # Better practice to use image_id
  
  ports {
    internal = 80
    external = 8082 # Accessible via http://localhost:8082
  }

  restart = "always"
}

# --- Output the accessible URL ---
output "web_server_url" {
  description = "The URL to access the Nginx web server"
  value       = "http://localhost:${docker_container.web_container.ports[0].external}"
}
