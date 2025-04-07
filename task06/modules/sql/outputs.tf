output "sql_server_fqdn" {
  description = "The fully qualified domain name of the SQL Server"
  value       = azurerm_sql_server.sql_server.fully_qualified_domain_name
}

output "connection_string" {
  description = "SQL Database connection string for the Web App"
  sensitive   = true
  value       = "Server=${azurerm_sql_server.sql_server.fully_qualified_domain_name};Database=${azurerm_sql_database.sql_db.name};User Id=${var.admin_username};Password=${random_password.admin_password.result};"
}
