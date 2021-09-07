#----root/outputs.tf-----

#----storage outputs------

#output "BucketName" {
#  value = "${module.storage.bucketname}"
#}

#---Networking Outputs -----

output "PublicSubnets" {
  value = "${module.networking.public_subnet}"
}

output "SubnetIPs" {
  value = "${module.networking.subnet_ips}"
}

output "PublicSecurityGroup" {
  value = "${module.networking.public_sg}"
}

#---Compute Outputs ------

output "PublicInstanceIDs" {
  value = "${module.compute.server_id}"
}

output "PublicInstanceIPs" {
  value = "${module.compute.server_ip}"
}
