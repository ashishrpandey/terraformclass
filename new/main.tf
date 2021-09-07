terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "2.12.0"
    }
  }
}

# Download the ghost:latest docker_image "image_id" to the system using a Terraform resource

resource "docker_image" "nginx_ibm_image" {
  name = "ubuntu:latest"
}

resource "docker_container" "nginx_ibm_container" {
  name  = "ubuntucontainer"
  image =  docker_image.nginx_ibm_image.latest
command = ["sleep 100"]
 
}
