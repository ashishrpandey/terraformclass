terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "2.11.0"
    }
  }
}

# Download the Docker Image
resource "docker_image" "image_id" {
  name = "${var.image}"
}
