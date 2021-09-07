variable "container_name" {
  description = "Name of container"
  default = "def_container"
  type = string 
}
variable "image" {
  description = "image for container"
  default = "nginx:latest"
}
variable "int_port" {
  description = "internal port for container"
}
variable "ext_port" {
  description = "external port for container"
}

