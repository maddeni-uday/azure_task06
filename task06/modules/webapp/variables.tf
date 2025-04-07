variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure location for the web app resource"
  type        = string
}

variable "asp_name" {
  description = "Name of the App Service Plan"
  type        = string
}

variable "app_name" {
  description = "Name of the Linux Web App"
  type        = string
}

variable "sql_connection_string" {
  description = "Sensitive SQL Connection String passed to the web app"
  type        = string
  sensitive   = true # Ensure this variable is treated as sensitive
}

variable "tags" {
  description = "Tags applied to all resources"
  type        = map(string)
}
