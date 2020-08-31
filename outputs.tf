output "vnet_names" {
  value = [
    for vnet in azurerm_virtual_network.vnet :
    vnet.name
  ]
}

output "vnet_ids" {
  value = [
    for vnet in azurerm_virtual_network.vnet :
    vnet.name
  ]
}

output "vnet_address_spaces" {
  value = [
    for vnet in azurerm_virtual_network.vnet :
    vnet.address_space
  ]
}
# 
# output "subnet_names" {
#   value = {
#     for subnet in azurerm_subnet.subnet :
#     subnet.name => subnet.id
#   }
# }
# 
# output "subnet_ids" {
#   value = {
#     for subnet in azurerm_subnet.subnet :
#     subnet.id => subnet.id
#   }
# }
# 