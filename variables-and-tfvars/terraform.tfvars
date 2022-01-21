
# map is a list of key value pairs 
# it is like dictionary data structure map_variable_name["key"]= "value"
container_name = {
  prod = "prod_blog"
  dev  = "dev_blog"
}
# env= "prod"
#var.container_name[var.env] = "prod_blog" 
# env = "dev"
#var.container_name[var.env] = "dev_blog" 


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

