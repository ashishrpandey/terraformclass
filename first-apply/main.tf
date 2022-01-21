terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "2.13.0"
    }
  }
}

# Download the ghost:latest docker_image "image_id" to the system using a Terraform resource

resource "docker_image" "nginx_ibm_image" {
  name = "nginx:1.20"
}

resource "docker_image" "ubuntu_image" {
  name = "ubuntu:latest"
}


resource "docker_container" "ubuntu" {
  name  = "foo"
  image = docker_image.ubuntu_image.latest 
  command = ["bash"]
  tty = true
  stdin_open = true
}


