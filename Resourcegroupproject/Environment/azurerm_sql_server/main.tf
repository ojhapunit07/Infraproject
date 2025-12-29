resource "azurerm_mssql_server" "sqlserverblock" {
    for_each = var.sqlserver
  name                         = each.value.sqlservername
  resource_group_name          = each.value.rgname
  location                     = each.value.sqllocation
  version                      = "12.0"
  administrator_login          = each.value.sqlserver_admin
  administrator_login_password = each.value.sqlserver_password
 
  minimum_tls_version          = "1.2"

}

resource "azurerm_mssql_firewall_rule" "firewallsqlblock" {
  for_each = var.sqlserver
  name             = each.value.mssql_firewall_rule
  server_id        = azurerm_mssql_server.sqlserverblock[each.key].id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}