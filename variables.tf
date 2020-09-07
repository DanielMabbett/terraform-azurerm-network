variable "name" {
  description = "(Required) The name for the virtual network."
  type        = string
}

variable "address_space" {
  description = "(Required) The assigned address spaces in CIDR for the virtual network."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "dns_servers" {
  description = "(Optional) The ip addresses in list format for the custom dns servers."
  type        = list(string)
  default     = []
}

variable "subnets" {
  description = "(Required) A list of objects describing the subnet resources required."
  type = list(object({
    subnet_name      = string
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
