resource "azurerm_mssql_database" "sqldatabaseblock" {
    for_each = var.mysqldatabase
  name         = each.value.mysql_database_name
  server_id    = data.azurerm_mssql_server.sqldata[each.key].id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"


  # prevent the possibility of accidental data loss
 
}
data "azurerm_mssql_server" "sqldata" {
  for_each = var.mysqldatabase
  name                = each.value.sqlservername
  resource_group_name = each.value.rgname
}
