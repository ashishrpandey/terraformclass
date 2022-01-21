#Output the IP Address and Container name
output "IP-Address" {
  value = docker_container.container_id.ip_address
}
output "container_name" {
  value = docker_container.container_id.name
}

