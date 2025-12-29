resource "azurerm_virtual_network" "example" {
    for_each = var.testvnet
  name                = each.value.vnetname
  location            = each.value.vnetlocation
  resource_group_name = each.value.vnetresource_group_name
  address_space       = each.value.vnetaddress_space
}