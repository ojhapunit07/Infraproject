resource "azurerm_resource_group" "rg" {
    for_each = var.azurerm_resource_group
  name = each.value.resource_group_name
  location = each.value.resource_group_name_location
}