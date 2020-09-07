provider "azurerm" {
  features {}
}

resource "random_id" "rg_name" {
  byte_length = 8
}

variable "location" {
  default = "north europe"
}

resource "azurerm_resource_group" "test" {
  name     = "acct-${random_id.rg_name.hex}"
  location = var.location
}

module "network" {
  source = "../.."

  depends_on = [azurerm_resource_group.test]

  name                = "1stacctvnet"
  address_space       = ["10.0.0.0/16"]
  resource_group_name = azurerm_resource_group.test.name
  location            = azurerm_resource_group.test.location

  subnets = [
    {
      subnet_name      = "management"
      address_prefixes = ["10.0.1.0/24"]
    },
  ]
}

output "vnet_id" {
  value = module.network.vnet_id
}

output "vnet_name" {
  value = module.network.vnet_name
}

output "subnet_ids" {
  value = module.network.subnet_ids
}