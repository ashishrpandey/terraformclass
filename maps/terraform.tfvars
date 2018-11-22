container_name = {
  prod = "prod_blog"
  dev  = "dev_blog"
}
image = {
  prod = "nginx:alpine"
  dev  = "nginx:latest"
}
int_port = {
  prod = "80"
  dev  = "80"
}
ext_port = {
  prod = "80"
  dev  = "8080"
}

