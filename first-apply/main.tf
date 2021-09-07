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
  name = "nginx:latest"
}

#resource "docker_container" "nginx_ibm_container" {
#  name  = "nginxcontainer"
#  image = "nginx:latest"
#  image =  docker_image.nginx_ibm_image.latest


# in master branch 

#}


