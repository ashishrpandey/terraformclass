terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "2.13.0"
    }
  }
}

# Download the latest Ghost image
resource "docker_image" "image_id" {
  name = "ghost:alpine"
}

# Start the Container
resource "docker_container" "container_id" {
  name  = "blog"
  #image = "${docker_image.image_id.latest}"
 #  image = docker_image.image_id.latest
   image = "nginx:latest"
  ports {
    internal = "2368"
    external = "80"
  }
}

