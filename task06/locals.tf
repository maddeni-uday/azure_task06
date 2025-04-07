locals {
  name_prefix              = "cmaz-93253787-mod6"
  rg_name                  = "${local.name_prefix}-rg"
  sql_server_name          = "${local.name_prefix}-sql"
  sql_db_name              = "${local.name_prefix}-sql-db"
  asp_name                 = "${local.name_prefix}-asp"
  app_name                 = "${local.name_prefix}-app"
  key_vault_name           = "cmaz-93253787-mod6-kv"
  sql_admin_secret_name    = "sql-admin-name"
  sql_password_secret_name = "sql-admin-password"
}
