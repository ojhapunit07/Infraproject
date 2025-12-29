module "rgmodule" {
  source                 = "../azurerm_resource_group"
  azurerm_resource_group = var.resource_group
}

module "vnetmodule" {
  depends_on = [module.rgmodule]
  source     = "../azurerm_virtual_network"
  testvnet   = var.azurerm_virtual_network
}
module "prodsubnet" {
  depends_on = [module.vnetmodule]
  source     = "../azurerm_subnet"
  subnet     = var.prodsubnet
}
module "prodnic" {
  depends_on = [module.prodsubnet]
  source     = "../azurerm_network_interface"

  prodnic = var.prodnic
  prodsubnet = var.prodsubnet
  prodpip = var.prodpip

}
module "pipmodule" {
  depends_on = [module.rgmodule]
  source     = "../azurerm_public_ip"
  pip        = var.prodpip
}
module "vmmodule" {
  depends_on = [module.prodnic]
  source     = "../azurerm_virtual_machine"
  prodvm     = var.vm
  prodnic = var.prodnic
}

module "mysqlserver" {
  depends_on = [module.vmmodule]
  source = "../azurerm_sql_server"
  sqlserver = var.sqlserver
}

module "sqldatabase" {
  depends_on = [ module.mysqlserver ]
  source = "../azurerm_sqldata_base"
  mysqldatabase = var.mysqldatabase
}