output "app_hostname" {
  description = "The hostname of the Linux Web App"
  value       = azurerm_linux_web_app.app.default_hostname
}
