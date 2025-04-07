# Create App Service Plan (ASP)
resource "azurerm_service_plan" "main" {
  name                = var.asp_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "S1"
  tags                = var.tags
}

# Create Web App
resource "azurerm_linux_web_app" "main" {
  name                = var.app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.main.id

  site_config {
    # Add any specific site configurations here if needed, like:
    # linux_fx_version = "NODE|14-lts"  # Example for Node.js
  }

  app_settings = {
    "SQL_CONNECTION_STRING"    = var.sql_connection_string
    "WEBSITE_RUN_FROM_PACKAGE" = "1" # Added as in the first example
  }

  connection_string {
    name  = "DatabaseConnectionString"
    type  = "SQLAzure"
    value = var.sql_connection_string
  }

  tags = var.tags
}
