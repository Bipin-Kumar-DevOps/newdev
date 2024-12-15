
variable "keyvault" {}

data "azurerm_client_config" "dev" {}


resource "azurerm_key_vault" "keyvaults" {
    for_each = var.keyvault
  name                        = each.value.keyvault_name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.dev.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.dev.tenant_id
    object_id = data.azurerm_client_config.dev.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = ["Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore Set",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}