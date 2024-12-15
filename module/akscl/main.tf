variable "akscl" {
  
}

resource "azurerm_kubernetes_cluster" "aks" {
    for_each = var.akscl
  name                = each.value.aks_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
network_profile {
  network_plugin = "azure"
  network_policy = "calico"
}

}