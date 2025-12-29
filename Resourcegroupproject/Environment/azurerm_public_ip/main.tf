resource "azurerm_public_ip" "example" {
  for_each = var.pip
  name                = each.value.pipname
  resource_group_name = each.value.piprgname
  location            = each.value.piplocation
  allocation_method   = "Static"
}
