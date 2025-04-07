# Random Password for SQL Admin
resource "random_password" "admin_password" {
  length  = 16
  special = true
}

# SQL Server Resource
resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  administrator_login          = var.admin_username
  administrator_login_password = random_password.admin_password.result

  version = "12.0" # Specify SQL Server version for compatibility
  tags    = var.tags
}

# SQL Database Resource
resource "azurerm_mssql_database" "sql_db" {
  name      = var.sql_db_name
  server_id = azurerm_mssql_server.sql_server.id

  sku_name = "S2" # Task-specified service model for Azure SQL Database
  tags     = var.tags
}

# Firewall Rule: Allow Azure Services
resource "azurerm_sql_firewall_rule" "allow_azure_ip" {
  name             = "AllowAzure" # Allow Azure Services to access the SQL Server
  server_name      = azurerm_mssql_server.sql_server.name
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

# Firewall Rule: Allow Verification IP
resource "azurerm_sql_firewall_rule" "allow_verification_ip" {
  name             = "AllowVerificationIP" # Rule for specific IP access
  server_name      = azurerm_mssql_server.sql_server.name
  start_ip_address = var.allowed_ip_address # Verification agent IP passed as input
  end_ip_address   = var.allowed_ip_address
}

# Store SQL Admin Username in Azure Key Vault
resource "azurerm_key_vault_secret" "sql_admin" {
  name         = var.sql_admin_secret_name # Secret name for admin username
  value        = var.admin_username        # Admin username passed as variable
  key_vault_id = var.key_vault_id          # Key Vault ID retrieved via data block
}

# Store SQL Admin Password in Azure Key Vault
resource "azurerm_key_vault_secret" "sql_password" {
  name         = var.sql_password_secret_name          # Secret name for admin password
  value        = random_password.admin_password.result # Randomly generated password
  key_vault_id = var.key_vault_id
}
