resource "azurerm_service_plan" "asp" {
  name                = var.asp_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "P0v3" # Pricing Tier (task-specific)
}

resource "azurerm_linux_web_app" "app" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    always_on = true # App remains active during inactivity
  }

  # Securely pass SQL connection string to app settings
  app_settings = {
    "SQL_CONNECTION_STRING" = var.sql_connection_string # Marked as sensitive in variables.tf
    "DOTNET_VERSION"        = "8.0"                     # Runtime version (task-specific)
  }

  tags = var.tags
}
