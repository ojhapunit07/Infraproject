resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.prodvm
  name                = each.value.vmname
  resource_group_name = each.value.rgname
  location            = each.value.rglocation
  size                = "Standard_D2s_v3"
  admin_username      = data.azurerm_key_vault_secret.vm_username.value
  admin_password = data.azurerm_key_vault_secret.vm_password.value
  disable_password_authentication = false
  network_interface_ids = [
    data.azurerm_network_interface.datanic[each.value.nickey].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}
variable "prodnic" {
  
}
data "azurerm_network_interface" "datanic" {
  for_each = var.prodnic
  name                = each.value.nicname
  resource_group_name = each.value.rgname
}

data "azurerm_key_vault" "kv" {
  name                = "prodkeyvault007"
  resource_group_name = "Daksh2"
}

data "azurerm_key_vault_secret" "vm_username" {
  name         = "vmusername"
  key_vault_id = data.azurerm_key_vault.kv.id
}
data "azurerm_key_vault_secret" "vm_password" {
  name         = "vmpassword"
  key_vault_id = data.azurerm_key_vault.kv.id
}
