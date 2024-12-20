resource "azurerm_network_interface" "nic" {
    for_each = var.nic
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.data_subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = data.azurerm.public_ip.pip[each.key].id
  }
}


data "azurerm_subnet" "data_subnet" {
    for_each = var.nic
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
data "azurerm_public_ip" "data-pip" {
    for_each = var.nic
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}