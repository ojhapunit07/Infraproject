resource "azurerm_network_interface" "nic" {
  for_each = var.prodnic
  name                = each.value.nicname
  location            = each.value.niclocation
  resource_group_name = each.value.rgname

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.datasubnet[
      each.value.subnetkey
    ].id

    private_ip_address_allocation = "Dynamic"

    public_ip_address_id = data.azurerm_public_ip.datapip[
      each.value.pipkey
    ].id
  }
}
data "azurerm_subnet" "datasubnet" {
  for_each = var.prodsubnet

  name                 = each.value.subnetname
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "datapip" {
  for_each = var.prodpip

  name                = each.value.pipname
  resource_group_name = each.value.piprgname
}