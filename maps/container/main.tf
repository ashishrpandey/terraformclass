terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "2.11.0"
    }
  }
}


# Start the Container
resource "docker_container" "container_id" {
  name  = "${var.name}"
  image = "${var.image}"

  ports {
    internal = "${var.int_port}"
    external = "${var.ext_port}"
  }
}
