resource "azurerm_service_plan" "asp" {
  name                = var.asp_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "P0v3" # Pricing Tier from Task Parameters
}

resource "azurerm_linux_web_app" "app" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    always_on = true # Keep Web App active even when idle
  }

  # Inject SQL connection string securely into app settings
  app_settings = {
    "SQL_CONNECTION_STRING" = var.sql_connection_string # Sensitive variable passed here
    "DOTNET_VERSION"        = "8.0"                     # Task-specified .NET version
  }

  tags = var.tags
}
