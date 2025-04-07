variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Location of the Web App resources"
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
  description = "Sensitive SQL Connection String for the Web App to connect to the SQL Database"
  type        = string
  sensitive   = true # Mark as sensitive input
}

variable "tags" {
  description = "Tags applied to all resources"
  type        = map(string)
}
