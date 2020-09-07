# Causes crash currently with 0.13.1
# Workaround: Use vars instead of data
# data "azurerm_resource_group" "network" {
#   name = var.resource_group_name
# } 

resource "azurerm_virtual_network" "vnet" {
  resource_group_name = var.resource_group_name
  location            = var.location
  name                = var.name
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  tags                = var.tags
}

resource "azurerm_subnet" "subnet" {
  for_each = { for object in var.subnets : object.subnet_name => object }

  depends_on = [azurerm_virtual_network.vnet]

  resource_group_name = var.resource_group_name

  virtual_network_name = var.name
  name                 = each.value.subnet_name
  address_prefixes     = each.value.address_prefixes
}
