data "azurerm_client_config" "key_vault" {}

resource "azurerm_key_vault" "key_vault" {
  for_each                    = var.todokey
  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.key_vault.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name                    = each.value.sku_name

  access_policy {
    tenant_id = data.azurerm_client_config.key_vault.tenant_id
    object_id = data.azurerm_client_config.key_vault.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}
