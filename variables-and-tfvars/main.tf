terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "2.11.0"
    }
  }
}
# Download the latest Image
resource "docker_image" "image_id" {
  name = "${var.image[var.env]}"
}
# Start the Container
resource "docker_container" "container_id" {
  name  = "${var.container_name[var.env]}"
  image = "${docker_image.image_id.latest}"
  ports {
    internal = "${var.int_port[var.env]}"
    external = "${var.ext_port[var.env]}"
  }
}
#Output the IP Address and Container name
output "IP-Address" {
  value = "${docker_container.container_id.ip_address}"
}
output "container_name" {
  value = "${docker_container.container_id.name}"
}

