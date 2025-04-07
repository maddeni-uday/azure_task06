locals {
  name_prefix = "cmaz-93253787-mod6"

  rg_name                  = format("%s-%s", local.name_prefix, "rg")
  sql_server_name          = format("%s-%s", local.name_prefix, "sql")
  sql_db_name              = format("%s-%s", local.name_prefix, "sql-db")
  asp_name                 = format("%s-%s", local.name_prefix, "asp")
  app_name                 = format("%s-%s", local.name_prefix, "app")
  key_vault_name           = format("%s-%s", local.name_prefix, "kv")
  sql_admin_secret_name    = format("%s-%s", local.name_prefix, "sql-admin-name")
  sql_password_secret_name = format("%s-%s", local.name_prefix, "sql-admin-password")
}
