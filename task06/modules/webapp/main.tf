resource "azurerm_linux_web_app" "app" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    always_on        = true # Keep the web app always active
    app_command_line = null # Placeholder for app startup commands
  }

  # Sensitive SQL connection string injected into the app settings
  app_settings = {
    "SQL_CONNECTION_STRING" = var.sql_connection_string
  }

  tags = var.tags
}
