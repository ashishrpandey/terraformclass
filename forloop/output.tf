output "upper_names" {
  value = [for name in var.names : upper(name)]
}

# upper_names[0] = "NEO"


output "short_upper_names" {
  value = [for name in var.names : upper(name) if length(name) < 5]
}

#length(string) = no of charecters in string
#length(list) = no of items in the list
#length(map) = no of key-value pairs in the map
#length(set) = no of items in the set 

output "bios" {
  value = { for name, role in var.hero_thousand_faces : "${name}" => "${name} is the ${role}" }
}

output "upper_roles" {
  value = { for name, role in var.hero_thousand_faces : upper(name) => upper(role) }
}
