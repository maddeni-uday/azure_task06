# Create Resource Group
resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.region
  tags     = var.tags
}

# Access Existing Key Vault
data "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  resource_group_name = var.key_vault_rg_name
}

# SQL Module
module "sql" {
  source                   = "./modules/sql"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.region
  sql_server_name          = local.sql_server_name
  sql_db_name              = local.sql_db_name
  key_vault_id             = data.azurerm_key_vault.kv.id
  sql_admin_secret_name    = local.sql_admin_secret_name
  sql_password_secret_name = local.sql_password_secret_name
  allowed_ip_address       = var.allowed_ip_address
  admin_username           = "sqladminuser"
  tags                     = var.tags
}

# Web App Module
module "webapp" {
  source                = "./modules/webapp"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = var.region
  asp_name              = local.asp_name
  app_name              = local.app_name
  sql_connection_string = module.sql.connection_string
  tags                  = var.tags
}


