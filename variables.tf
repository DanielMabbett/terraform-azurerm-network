variable "vnets" {
  description = "(Required) A list of objects describing the virtual network resources required."

  type = list(object({
    name          = string
    address_space = list(string)
    dns_servers   = list(string)
  }))
}

variable "subnets" {
  description = "(Required) A list of objects describing the subnet resources required."
  type = list(object({
    vnet_name        = string
    name             = string
    address_prefixes = list(string)
  }))
}


variable "resource_group_name" {
  description = "(Required) A pre-existing resource group for deploying the resources."
}

variable "location" {
  description = "(Required) A location for deploying the resources."
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)

  default = {}
}
