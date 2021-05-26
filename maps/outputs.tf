#Output the IP Address of the Container
output "IPAddress" {
  value = module.container.ip
}

output "ContainerName" {
  value = module.container.container_name
}
