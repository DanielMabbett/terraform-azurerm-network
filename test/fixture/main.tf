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

# Notes: Must use "= null" for objects until https://github.com/hashicorp/terraform/issues/19898 resolved
module "network" {
  source = "../.."

  depends_on = [azurerm_resource_group.test]

  resource_group_name = azurerm_resource_group.test.name
  location = azurerm_resource_group.test.location

  vnets = [
    {
      name          = "1stacctvnet"
      address_space = ["10.0.0.0/16"]
      dns_servers   = []
    },
    {
      name          = "2ndacctvnet"
      address_space = ["10.1.0.0/16"]
      dns_servers   = []
    },
  ]

  subnets = [
    {
      vnet_name        = "1stacctvnet"
      name             = "management"
      address_prefixes = ["10.0.1.0/24"]
    },
    {
      vnet_name        = "2ndacctvnet"
      name             = "frontend"
      address_prefixes = ["10.1.1.0/24"]
    },
    {
      vnet_name        = "2ndacctvnet"
      name             = "backend"
      address_prefixes = ["10.1.2.0/24"]
    },
  ]
}

output "vnet_ids" {
  value = module.network.vnet_ids
}

output "vnet_names" {
  value = module.network.vnet_names
}