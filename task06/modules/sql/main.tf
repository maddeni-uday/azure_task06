resource "azurerm_sql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.admin_username
  administrator_login_password = random_password.admin_password.result
  tags                         = var.tags
}

resource "azurerm_sql_database" "sql_db" {
  name                = var.sql_db_name
  resource_group_name = var.resource_group_name
  location            = var.location
  server_name         = azurerm_sql_server.sql_server.name
  sku_name            = "S2"
  tags                = var.tags
}

resource "azurerm_sql_firewall_rule" "allow_azure_ip" {
  name                = "AllowAzure"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_sql_server.sql_server.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

resource "azurerm_sql_firewall_rule" "allow_verification_ip" {
  name                = "AllowVerificationIP"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_sql_server.sql_server.name
  start_ip_address    = var.allowed_ip_address
  end_ip_address      = var.allowed_ip_address
}

resource "random_password" "admin_password" {
  length  = 16
  special = true
}

resource "azurerm_key_vault_secret" "sql_admin" {
  name         = var.sql_admin_secret_name
  value        = var.admin_username
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "sql_password" {
  name         = var.sql_password_secret_name
  value        = random_password.admin_password.result
  key_vault_id = var.key_vault_id
}
