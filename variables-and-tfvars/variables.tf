variable "container_name" {
  description = "Name of container"
   default = "nginx_container"
}
variable "image" {
  description = "image used in container"
}
variable "int_port" {
  description = "internal port for container"
}
variable "ext_port" {
  description = "external port where nginx is published for the world"
}

