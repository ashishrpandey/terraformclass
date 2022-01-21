variable "env" {
#  description = "env: dev or prod"
}


variable "container_name" {
  description = "Name of container"
  type        = map(string)

}

variable "image" {
  description = "image for container"
  type        = map(string)
}

variable "int_port" {
  description = "internal port for container"
  type        = map(string)
}

variable "ext_port" {
  description = "external port for container"
  type        = map(string)
}
