output "sql_server_fqdn" {
  description = "Fully qualified domain name of the SQL Server"
  value       = azurerm_mssql_server.sql_server.fully_qualified_domain_name
}

output "connection_string" {
  description = "Sensitive SQL connection string for Web App"
  sensitive   = true # Ensure the output is marked as sensitive
  value = format(
    "Server=tcp:%s,1433;Initial Catalog=%s;Persist Security Info=False;User ID=%s;Password=%s;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;",
    azurerm_mssql_server.sql_server.fully_qualified_domain_name, # FQDN of SQL Server
    azurerm_mssql_database.sql_db.name,                          # SQL Database name
    var.admin_username,                                          # SQL admin username
    random_password.admin_password.result                        # SQL admin password
  )
}
