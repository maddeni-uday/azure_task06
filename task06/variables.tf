variable "region" {
  description = "The Azure region where resources will be created."
  type        = string
}

variable "allowed_ip_address" {
  description = "The IP address to allow access to SQL Server."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resources."
  type        = map(string)
}
