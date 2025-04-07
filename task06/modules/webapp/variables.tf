variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "asp_name" {
  description = "App Service Plan name"
  type        = string
}

variable "app_name" {
  description = "Web App name"
  type        = string
}

variable "sql_connection_string" {
  description = "Connection string for SQL Database"
  type        = string
}

variable "tags" {
  description = "Tags for Web App resources"
  type        = map(string)
}
