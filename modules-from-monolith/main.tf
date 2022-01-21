
# Start the Container
module "container" {
   source   = "github.com/hariprasath2603/terraformclass/modules-from-monolith/container"
 # source   = "./container"
  image    = module.image.image_out
  name     = var.container_name
  int_port = var.int_port
  ext_port = var.ext_port
}

# Download the latest nginx Imagei
module "image" {
  source = "./image"

  image1  = var.image
}



