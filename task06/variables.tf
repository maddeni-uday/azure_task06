variable "region" {
  description = "The Azure region where resources will be created."
  type        = string
}

variable "allowed_ip_address" {
  description = "The IP address to allow access to SQL Server."
  type        = string
}

variable "key_vault_rg_name" {
  description = "The name of the Resource Group in which the existing Key Vault resides."
  type        = string
}

variable "key_vault_name" {
  description = "The name of the existing Key Vault."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resources."
  type        = map(string)
}
