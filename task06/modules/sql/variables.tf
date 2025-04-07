variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure location for SQL resources"
  type        = string
}

variable "sql_server_name" {
  description = "Name of the SQL Server"
  type        = string
}

variable "sql_db_name" {
  description = "Name of the SQL Database"
  type        = string
}

variable "key_vault_id" {
  description = "Azure Key Vault ID"
  type        = string
}

variable "sql_admin_secret_name" {
  description = "Key Vault secret name for the SQL admin username"
  type        = string
}

variable "sql_password_secret_name" {
  description = "Key Vault secret name for the SQL admin password"
  type        = string
}

variable "allowed_ip_address" {
  description = "IP address for SQL firewall rule"
  type        = string
}

variable "admin_username" {
  description = "SQL Server administrator username"
  type        = string
}

variable "tags" {
  description = "Tags for SQL resources"
  type        = map(string)
}
