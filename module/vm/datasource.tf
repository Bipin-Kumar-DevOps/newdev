
data "azurerm_network_interface" "dat_nic" {
    for_each = var.linux_vms
  name                = each.value.network_interface_name
  resource_group_name = each.value.resource_group_name
}