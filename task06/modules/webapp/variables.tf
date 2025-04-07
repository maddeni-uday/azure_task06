variable "resource_group_name" {
  description = "The name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure location for the Web App resource"
  type        = string
}

variable "asp_name" {
  description = "App Service Plan name for the Web App"
  type        = string
}

variable "app_name" {
  description = "Name of the Linux Web App"
  type        = string
}

variable "sql_connection_string" {
  description = "Sensitive SQL Connection String passed to the Web App"
  type        = string
  sensitive   = true # Mark this variable as sensitive
}

variable "tags" {
  description = "Tags applied to resources"
  type        = map(string)
}
