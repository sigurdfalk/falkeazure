data "azuread_user" "main" {
  user_principal_name = "sigurd.falk@gmail.com"
}

data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

data "azurerm_client_config" "main" {}

resource "azurerm_key_vault" "falkeredet_kv" {
  name                        = var.name
  location                    = data.azurerm_resource_group.main.location
  resource_group_name         = data.azurerm_resource_group.main.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.main.tenant_id

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.main.tenant_id
    object_id = data.azuread_user.main.object_id

    key_permissions = [
      "get",
      "create",
      "list",
    ]

    secret_permissions = [
      "get",
      "set",
      "list",
    ]

    storage_permissions = [
      "get",
      "list",
    ]
  }
}