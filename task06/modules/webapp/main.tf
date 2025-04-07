resource "azurerm_linux_web_app" "app" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    always_on        = true # Keep the app always active
    app_command_line = null # Startup script command (optional)
  }

  app_settings = {
    "SQL_CONNECTION_STRING" = var.sql_connection_string # Pass the sensitive SQL connection string
  }

  tags = var.tags
}

output "app_hostname" {
  description = "Hostname of the Linux Web App"
  value       = azurerm_linux_web_app.app.default_hostname
}
