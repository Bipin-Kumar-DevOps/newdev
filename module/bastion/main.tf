variable "bastion_host" {

}

resource "azurerm_bastion_host" "bastion_host" {
  for_each = var.bastion_host
  name                = each.value.bastion_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.data-subnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.data-pip[each.key].id
  }
}

data "azurerm_subnet" "data-subnet" {
    for_each = var.bastion_host
  name                 = each.value.bastion_subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "data-pip" {
    for_each = var.bastion_host
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}