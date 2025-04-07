output "sql_server_fqdn" {
  description = "The fully qualified domain name of the SQL Server"
  value       = azurerm_sql_server.sql_server.fully_qualified_domain_name
}

output "connection_string" {
  description = "SQL Database connection string for the web app"
  sensitive   = true # Mark connection string as sensitive
  value = format(
    "Server=%s;Database=%s;User Id=%s;Password=%s;",
    azurerm_sql_server.sql_server.fully_qualified_domain_name,
    azurerm_sql_database.sql_db.name,
    var.admin_username,                   # SQL admin username passed as input
    random_password.admin_password.result # SQL admin password generated by the random provider
  )
}
