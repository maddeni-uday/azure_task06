# Create Resource Group
resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.region
  tags     = var.tags
}

# Access Existing Key Vault
data "azurerm_key_vault" "kv" {
  name                = local.key_vault_name
  resource_group_name = "cmaz-93253787-mod6-kv-rg"
}

# SQL Module
module "sql" {
  source                   = "./modules/sql"
  resource_group_name      = azurerm_resource_group.rg.name # Pass the resource group name from the RG resource
  location                 = var.region                     # Pass the location (region)
  sql_server_name          = local.sql_server_name          # Local variable for SQL server name
  sql_db_name              = local.sql_db_name              # Local variable for SQL database name
  key_vault_id             = data.azurerm_key_vault.kv.id   # Access the Key Vault ID from the data block
  sql_admin_secret_name    = local.sql_admin_secret_name    # Local variable for SQL admin secret name
  sql_password_secret_name = local.sql_password_secret_name # Local variable for SQL password secret name
  allowed_ip_address       = var.allowed_ip_address         # IP address to allow for SQL access
  admin_username           = "sqladminuser"                 # Add missing admin username as a hardcoded example (better to use a variable)
  tags                     = var.tags                       # Tags to apply to resources
}

# Web App Module
module "webapp" {
  source                = "./modules/webapp"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = var.region # Pass the region as a variable
  asp_name              = local.asp_name
  app_name              = local.app_name
  sql_connection_string = module.sql.connection_string
  tags                  = var.tags
}
