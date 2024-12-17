variable "sqlserver" {
  
}


# resource "azurerm_user_assigned_identity" "example" {
#   name                = "example-admin"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
# }

resource "azurerm_mssql_server" "sqlserver" {
    for_each = var.sqlserver
  name                         = each.value.server_name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          =  each.value.administrator_login                      # 4dm1n157r470r
  administrator_login_password =   each.value.administrator_login_password                     # 4-v3ry-53cr37-p455w0rd
}

resource "azurerm_mssql_database" "sqldb" {
    for_each = var.sqlserver
  name           = each.value.sqldb_name
  server_id      = data.azurerm_mssql_server.sqlserver[each.key].id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = "2"
  read_scale     = true
  sku_name       = "S0"
  zone_redundant = false
  enclave_type   = "VBS"
depends_on = [ azurerm_mssql_server.sqlserver ]

#   identity {
#     type         = "UserAssigned"
#     identity_ids = [azurerm_user_assigned_identity.example.id]
#   }


  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}
data "azurerm_mssql_server" "sqlserver" {
  for_each = var.sqlserver  
  name                = each.value.sqlserver_name
  resource_group_name = each.value.resource_group_name
  depends_on = [ azurerm_mssql_server.sqlserver ]
}
