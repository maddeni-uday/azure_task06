resource "azurerm_service_plan" "asp" {
  name                = var.asp_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux" # Specify Linux OS
  sku_name            = "P1v3"  # Specify "tier and size" in one attribute
}

resource "azurerm_linux_web_app" "app" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    always_on        = true # Enable app to stay "always on"
    app_command_line = null # Leave command line null, can be used for startup scripts
  }

  app_settings = {
    "SQL_CONNECTION_STRING" = var.sql_connection_string # Inject SQL Connection String into the Web App
  }

  tags = var.tags
}
