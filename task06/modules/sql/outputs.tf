output "sql_server_fqdn" {
  description = "Fully qualified domain name of the SQL Server"
  value       = azurerm_sql_server.sql_server.fully_qualified_domain_name
}

output "connection_string" {
  description = "Sensitive SQL connection string for the SQL Database"
  sensitive   = true # Mark the output as sensitive
  value = format(
    "Server=%s;Database=%s;User Id=%s;Password=%s;",
    azurerm_sql_server.sql_server.fully_qualified_domain_name,
    azurerm_sql_database.sql_db.name,
    var.admin_username,                   # Admin username passed to the module
    random_password.admin_password.result # Admin password generated dynamically
  )
}
