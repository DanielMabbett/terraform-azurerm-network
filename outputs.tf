output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "vnet_address_space" {
  value = azurerm_virtual_network.vnet.address_space
}

output "subnet_names" {
  value = [
    for subnet in azurerm_subnet.subnet :
    subnet.name
  ]
}

output "subnet_ids" {
  value = [
    for subnet in azurerm_subnet.subnet :
    subnet.id
  ]
}
