terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "2.11.0"
    }
  }
}


# Download the latest nginx Imagei
module "image" {
  source = "./image"
  image  = "${var.image}"
}

# Start the Container
module "container" {
  source   = "./container"
  image    = "${module.image.image_out}"
  name     = "${var.container_name}"
  int_port = "${var.int_port}"
  ext_port = "${var.ext_port}"
}


