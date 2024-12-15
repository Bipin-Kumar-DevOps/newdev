resource "azurerm_virtual_network" "vnets" {
  for_each = var.vnets
  name = each.value.vnet_name
  location = each.value.location
  resource_group_name = each.value.rg_name
  address_space = each.value.address_space  #[10.0.0.0/16]
  tags = each.value.tags
}