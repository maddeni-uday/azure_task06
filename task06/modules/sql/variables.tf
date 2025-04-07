variable "resource_group_name" {
  description = "The name of the Resource Group where the SQL resources will be created."
  type        = string
}

variable "location" {
  description = "The Azure location where resources will be created."
  type        = string
}

variable "sql_server_name" {
  description = "The name of the SQL Server resource."
  type        = string
}

variable "sql_db_name" {
  description = "The name of the SQL Database resource."
  type        = string
}

variable "key_vault_id" {
  description = "The ID of the Azure Key Vault where secrets will be stored."
  type        = string
}

variable "sql_admin_secret_name" {
  description = "The name of the Key Vault secret to store the SQL admin username."
  type        = string
}

variable "sql_password_secret_name" {
  description = "The name of the Key Vault secret to store the SQL admin password."
  type        = string
}

variable "allowed_ip_address" {
  description = "The IP address to allow access to the SQL Server."
  type        = string
}

variable "admin_username" {
  description = "The username for the SQL Server administrator."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resources."
  type        = map(string)
}
