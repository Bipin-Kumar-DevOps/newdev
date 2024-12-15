
resource "azurerm_linux_virtual_machine" "linux_vms" {
    for_each = var.linux_vms
  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size      #"Standard_B2s"
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password
  disable_password_authentication= false
  network_interface_ids = [
    data.azurerm_network_interface.dat_nic[each.key].id,
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}