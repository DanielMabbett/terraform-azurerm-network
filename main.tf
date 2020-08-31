# Causes crash currently with 0.13.1
# Workaround: Use vars instead of data
# data "azurerm_resource_group" "network" {
#   name = var.resource_group_name
# } 

resource "azurerm_virtual_network" "vnet" {
  for_each = { for object in var.vnets : object.name => object }

  resource_group_name = var.resource_group_name
  location            = var.location

  name          = each.value.name
  address_space = each.value.address_space
  dns_servers   = each.value.dns_servers

  tags = var.tags
}

resource "azurerm_subnet" "subnet" {
  for_each = { for object in var.subnets : object.name => object }

  depends_on = [azurerm_virtual_network.vnet]

  resource_group_name = var.resource_group_name

  virtual_network_name = each.value.vnet_name
  name                 = each.value.name
  address_prefixes     = each.value.address_prefixes
}
